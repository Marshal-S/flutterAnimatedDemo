import 'dart:math';

import 'package:flutter/material.dart';

class RotateWidget extends StatefulWidget {
  const RotateWidget({Key? key}) : super(key: key);

  @override
  State<RotateWidget> createState() => _RotateWidgetState();
}

class _RotateWidgetState extends State<RotateWidget> {
  double turns = 0; //旋转角度占一圈的百分比

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
            top: 200,
            child: AnimatedRotation(
              //旋转占一圈的百分比，360°就是1，半圈就是 0.5，很奇怪是吧，哈哈，公式是这样的😂
              //即：旋转 90°，就是 1/4 圈，即 0.25圈
              turns: turns, //旋转占一圈的百分比
              duration: const Duration(seconds: 2),
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    if (turns > 0) {
                      setState(() {
                        turns = 0;
                      });
                    } else {
                      setState(() {
                        //旋转 90°，就是 1/4 圈，即 0.25圈
                        turns =  0.25;
                      });
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
