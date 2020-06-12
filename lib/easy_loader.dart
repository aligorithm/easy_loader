library easy_loader;

import 'package:flutter/material.dart';

class EasyLoader extends StatefulWidget {
  const EasyLoader({Key key, this.backgroundColor, this.animation, this.image, this.iconSize}) : super(key: key);
  final Color backgroundColor;
  final Animation<Offset> animation;
  final ImageProvider image;
  final double iconSize;

  @override
  _EasyLoaderState createState() => _EasyLoaderState();
}

class _EasyLoaderState extends State<EasyLoader> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Color _backgroundColor = Colors.black;
  ImageProvider _image;
  double _iconSize;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = widget.animation ?? Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -0.3),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
    _backgroundColor = widget.backgroundColor ?? Colors.black;
    _image = widget.image ?? AssetImage('assets/loading.png');
    _iconSize = widget.iconSize ?? 120.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: _backgroundColor.withAlpha(100),
        ),
        Center(
            child: SlideTransition(
          position: _offsetAnimation,
          child: ImageIcon(
            _image,
            size: _iconSize,
          ),
        ))
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
