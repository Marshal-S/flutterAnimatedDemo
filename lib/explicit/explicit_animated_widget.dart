import 'package:flutter/material.dart';
import 'package:flutter_animated_demo/explicit/rotate_transition_widget.dart';
import 'package:flutter_animated_demo/explicit/scale_transition_widget.dart';
import 'combin_animated_widget.dart';
import 'opacity_transition_widget.dart';

//显式动画
class ExplicitAnimatedWidget extends StatefulWidget {
  const ExplicitAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimatedWidget> createState() => _ExplicitAnimatedWidget();
}

class _ExplicitAnimatedWidget extends State<ExplicitAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("显式动画"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RotateTransitionWidget()));
              },
              child: const Text("旋转动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScaleTransitionWidget()));
              },
              child: const Text("缩放动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OpacityTransitonWidget()));
              },
              child: const Text("fade动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CombinAnimatedWidget()));
              },
              child: const Text("组合动画"),
            ),
          ],
        ),
      ),
    );
  }
}
