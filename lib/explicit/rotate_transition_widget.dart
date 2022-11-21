
import 'package:flutter/material.dart';

class RotateTransitionWidget extends StatefulWidget {
  const RotateTransitionWidget({Key? key}) : super(key: key);

  @override
  State<RotateTransitionWidget> createState() => _RotateTransitionWidgetState();
}

class _RotateTransitionWidgetState extends State<RotateTransitionWidget>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //控制动画
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    //设置补间
    _animation = Tween<double>(
      begin: 0,
      end:  0.25,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("旋转动画"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 120,
            top: 200,
            child: RotationTransition(
              turns: _animation,
              child: Container(
                color: Colors.green,
                width: 120,
                height: 120,
                child: TextButton(
                  onPressed: () {
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    }else {
                      _controller.forward();
                    }
                  },
                  child: const Text(
                    '旋转动画',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
