
import 'package:flutter/material.dart';

class OpacityTransitonWidget extends StatefulWidget {
  const OpacityTransitonWidget({Key? key}) : super(key: key);

  @override
  State<OpacityTransitonWidget> createState() => _OpacityTransitonWidgetState();
}

class _OpacityTransitonWidgetState extends State<OpacityTransitonWidget> with SingleTickerProviderStateMixin {
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
      end:  0.1,
    ).animate(_controller);
    // .animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fade动画(Opacity)"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 150,
            top: 200,
            child: FadeTransition(
              opacity: _animation,
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
                    'fade动画',
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
