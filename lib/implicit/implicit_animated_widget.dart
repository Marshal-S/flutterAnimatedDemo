import 'package:flutter/material.dart';
import 'package:flutter_animated_demo/implicit/opacity_widget.dart';
import 'package:flutter_animated_demo/implicit/position_container.dart';
import 'package:flutter_animated_demo/implicit/rotate_widget.dart';
import 'package:flutter_animated_demo/implicit/scale_widget.dart';


//隐式动画
class ImplicitAnimatedWidget extends StatefulWidget {
  const ImplicitAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimatedWidget> createState() => _ImplicitAnimatedWidgetState();
}

class _ImplicitAnimatedWidgetState extends State<ImplicitAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("隐式动画"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PositionWidget()));
              },
              child: const Text("位移大小动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RotateWidget()));
              },
              child: const Text("旋转动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScaleWdiget()));
              },
              child: const Text("缩放动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OpacityWidget()));
              },
              child: const Text("opacity动画"),
            ),
          ],
        ),
      ),
    );
  }
}
