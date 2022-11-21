
import 'package:flutter/material.dart';

class OpacityWidget extends StatefulWidget {
  const OpacityWidget({Key? key}) : super(key: key);

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {
  double opacity = 1;

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
            left: 100,
            top: 100,
            child: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: opacity,
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    if (opacity < 1) {
                      setState(() {
                        opacity = 1;
                      });
                    }else {
                      setState(() {
                        opacity = 0.1;
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
