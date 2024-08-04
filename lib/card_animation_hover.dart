library card_animation_hover;

import 'dart:async';
import 'dart:math';

import 'package:card_animation_hover/src/widget/card-widget.dart';
import 'package:flutter/material.dart';

class CardAnimationHover extends StatefulWidget {
  final Map<String, String> card;
  final void Function()? onTap;
  final bool showAnimation;

  const CardAnimationHover(
      {super.key, required this.card, this.onTap, this.showAnimation = true});

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
                    child: CardWidget(card: widget.card, isHovered: _isHovered),
                  )
                : CardWidget(card: widget.card, isHovered: _isHovered);
          },
          child: CardWidget(card: widget.card, isHovered: _isHovered),
        ),
      ),
    );
  }
}
