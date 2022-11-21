
import 'package:flutter/material.dart';

class ScaleTransitionWidget extends StatefulWidget {
  const ScaleTransitionWidget({Key? key}) : super(key: key);

  @override
  State<ScaleTransitionWidget> createState() => _ScaleTransitionWidgetState();
}

class _ScaleTransitionWidgetState extends State<ScaleTransitionWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //控制动画
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    //设置补间
    _animation = Tween<double>(
      begin: 1,
      end:  4,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("缩放动画"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 150,
            top: 200,
            child: ScaleTransition(
              scale: _animation,
              child: Container(
                color: Colors.green,
                width: 80,
                height: 80,
                child: TextButton(
                  onPressed: () {
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    }else {
                      _controller.forward();
                    }
                  },
                  child: const Text(
                    '缩放动画',
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
