import 'package:flutter/material.dart';

class CombinAnimatedWidget extends StatefulWidget {
  const CombinAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<CombinAnimatedWidget> createState() => _CombinAnimatedWidgetState();
}

class _CombinAnimatedWidgetState extends State<CombinAnimatedWidget>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<BorderRadius> _borderRadiusAnimation;
  late Animation<double> _borderWidthAnimation;

  @override
  void initState() {
    super.initState();
    //控制动画
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    //设置补间
    _widthAnimation = Tween<double>(
      begin: 100,
      end:  240,
    ).animate(_controller);
    _opacityAnimation = Tween<double>(
      begin: 1,
      end:  0.6,
    ).animate(_controller);
    _borderRadiusAnimation = Tween<BorderRadius>(
      begin: const BorderRadius.all(Radius.circular(0)),
      end:  const BorderRadius.all(Radius.circular(120)),
    ).animate(_controller);
    _borderWidthAnimation = Tween<double>(
      begin: 1,
      end:  20,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组合动画"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            }else {
              _controller.forward();
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: _widthAnimation.value,
                  height: _widthAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: _borderRadiusAnimation.value,
                    border: Border.all(
                        width: _borderWidthAnimation.value,
                        color: Colors.cyanAccent
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
