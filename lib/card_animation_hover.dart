library card_animation_hover;

import 'dart:async';
import 'dart:math';

import 'package:card_animation_hover/src/widget/card-widget.dart';
import 'package:flutter/material.dart';

/// A widget that displays a card with hover animation.
///
/// Example:
///
/// ```dart
/// CardAnimationHover(
///   card: {
///     image': imageUrls[index],
///      'header': 'Canyons',
///     'content': 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
///   },
///   onTap: () {
///     navigator.push('/canyons');
///   },
///   showAnimation: true,
///   height: 320.0,
///   width: 240.0,
/// )
/// ```
///
/// [card]: A map containing the card data (e.g., image, header, content,). It is required.
///
/// [onTap]: A callback function that is triggered when the card is tapped. It is optional.
///
/// [showAnimation]: A boolean value to enable or disable the hover animation. Defaults to `true`.
///
/// [height]: The height of the card. Defaults to `320.0`.
///
/// [width]: The width of the card. Defaults to `240.0`.
///
/// [CardAnimationHover] is a widget that animates a card when hovered over, providing an interactive 3D tilt effect. It is useful for web and desktop applications built with Flutter.
class CardAnimationHover extends StatefulWidget {
  /// A map containing the card data (e.g., title, subtitle, etc.).
  final Map<String, String> card;

  /// A callback function that is triggered when the card is tapped.
  final void Function()? onTap;

  /// A boolean value to enable or disable the hover animation.
  final bool showAnimation;

  /// The height of the card.
  final double height;

  /// The width of the card.
  final double width;

  /// Creates a [CardAnimationHover] widget.
  ///
  /// The [card] parameter is required. The [onTap], [showAnimation], [height], and [width] parameters are optional.
  const CardAnimationHover({
    super.key,
    required this.card,
    this.onTap,
    this.showAnimation = true,
    this.height = 320.0,
    this.width = 240.0,
  });

  @override
  State<CardAnimationHover> createState() => _CardAnimationHoverState();
}

class _CardAnimationHoverState extends State<CardAnimationHover>
    with SingleTickerProviderStateMixin {
  double _angleX = 0;
  double _angleY = 0;
  bool _isHovered = false;
  Timer? _hoverTimer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.addListener(() {
      setState(() {
        _angleX = _controller.value * 15;
        _angleY = _controller.value * 15;
      });
    });
  }

  void _onHover(PointerEvent event, Size cardSize) {
    final x = event.localPosition.dx;
    final y = event.localPosition.dy;

    final dx = (x - cardSize.width / 2) / (cardSize.width / 2);
    final dy = (y - cardSize.height / 2) / (cardSize.height / 2);

    setState(() {
      _angleY = dx * 15;
      _angleX = dy * -15;
      _isHovered = true;
    });

    _hoverTimer?.cancel();
  }

  void _onExit(PointerEvent event) {
    _hoverTimer = Timer(const Duration(seconds: 3), () {
      _controller.reverse(from: 1.0);
      setState(() {
        _isHovered = false;
      });
    });
  }

  @override
  void dispose() {
    _hoverTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => _onHover(event, const Size(240, 320)),
      onExit: _onExit,
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return widget.showAnimation
                ? Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.002)
                      ..rotateX(_angleX * pi / 180)
                      ..rotateY(_angleY * pi / 180),
                    alignment: FractionalOffset.center,
                    child: CardWidget(
                      card: widget.card,
                      isHovered: _isHovered,
                      widget: widget,
                    ),
                  )
                : CardWidget(
                    card: widget.card, isHovered: _isHovered, widget: widget);
          },
          child: CardWidget(
            card: widget.card,
            isHovered: _isHovered,
            widget: widget,
          ),
        ),
      ),
    );
  }
}
