
import 'package:flutter/material.dart';

class ScaleWdiget extends StatefulWidget {
  const ScaleWdiget({Key? key}) : super(key: key);

  @override
  State<ScaleWdiget> createState() => _ScaleWdigetState();
}

class _ScaleWdigetState extends State<ScaleWdiget> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("旋转动画"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //可以看到隐式动画，都是根据基础组件来的，更改属性有限
          Positioned(
            left: 150,
            top: 100,
            child: AnimatedScale(
              duration: const Duration(seconds: 2),
              scale: scale,
              child: Container(
                color: Colors.green,
                width: 80,
                height: 80,
                child: TextButton(
                  onPressed: () {
                    if (scale > 1) {
                      setState(() {
                        scale = 1;
                      });
                    }else {
                      setState(() {
                        scale = 2;
                      });
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
