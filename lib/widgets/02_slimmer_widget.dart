import 'dart:math';

import 'package:flutter/material.dart';

class ShimmerWidget extends StatefulWidget {
  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const ShimmerWidget({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
    this.duration = const Duration(milliseconds: 1500),
  }) : super(key: key);

  @override
  _ShimmerWidgetState createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.repeat(min: 0, max: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final gradient = LinearGradient(
          colors: [
            widget.baseColor,
            widget.highlightColor,
            widget.baseColor,
          ],
          stops: [
            max(0.0, _controller.value - 0.4),
            _controller.value,
            min(1.0, _controller.value + 0.4),
          ],
          begin: const Alignment(-2.5, -0.5),
          end: const Alignment(2.5, 0.5),
        );
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(gradient: gradient),
        );
      },
    );
  }
}
