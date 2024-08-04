// ignore_for_file: file_names

import 'package:card_animation_hover/card_animation_hover.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  /// [widget]: A widget that displays a card with hover animation.
  final CardAnimationHover widget;

  /// [card]: A map containing the card data (e.g., image, header, content,). It is required.
  final Map<String, String> card;

  ///  [isHovered]: A boolean value to check if the card is hovered.
  final bool isHovered;

  const CardWidget(
      {super.key,
      required this.widget,
      required this.card,
      required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: isHovered
            ? [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 40,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.66),
                  spreadRadius: 30,
                  blurRadius: 60,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                ),
                const BoxShadow(
                  color: Colors.white,
                  spreadRadius: 6,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.66),
                  spreadRadius: 30,
                  blurRadius: 60,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 6,
                ),
              ],
      ),
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: isHovered ? 0.8 : 0.5,
            duration: const Duration(milliseconds: 600),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(card['image']!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              padding: const EdgeInsets.all(20.0),
              transform: Matrix4.translationValues(0, isHovered ? 0 : 40, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    card['header']!,
                    style: TextStyle(
                      fontFamily: 'Playfair Display',
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  AnimatedOpacity(
                    opacity: isHovered ? 1 : 0,
                    duration: const Duration(milliseconds: 600),
                    child: Text(
                      card['content']!,
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
