import 'package:flutter/material.dart';
import 'package:flutter_etude/extensions/color_extension.dart';

class ContentsContainer extends StatelessWidget {
  const ContentsContainer({
    super.key,
    required Color shadowColor,
    required double padding,
    double? width,
    required Widget child,
  })  : _shadowColor = shadowColor,
        _padding = padding,
        _width = width,
        _child = child;

  final Color _shadowColor;
  final double? _width;
  final double _padding;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.customWhite,
        borderRadius: BorderRadius.circular(
          16,
        ),
        boxShadow: [
          BoxShadow(
            color: _shadowColor,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      width: _width,
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: _child,
      ),
    );
  }
}
