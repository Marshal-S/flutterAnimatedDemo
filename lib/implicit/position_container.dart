import 'package:flutter/material.dart';

class PositionWidget extends StatefulWidget {
  const PositionWidget({Key? key}) : super(key: key);

  @override
  State<PositionWidget> createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<PositionWidget> {
  double top = 0;
  double left = 0;

  double width = 80;
  double height = 80;

  Color color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("位移大小动画"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //可以看到隐式动画，都是根据基础组件来的，更改属性有限，且里面的属性基本都支持动画
          //如果打开Animated开头会发现很多类似组件，例如：Padding等，这里面Container也改变了颜色等属性，也都支持
          //根据名字对应基础组件就知道动画是干什么的，很简单，就不多介绍了
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            left: left,
            top: top,
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              color: color,
              width: width,
              height: height,
              child: TextButton(
                onPressed: () {
                  if (left > 0) {
                    setState(() {
                      color = Colors.green;
                      left = 0;
                      top = 0;
                      width = 80;
                      height = 80;
                    });
                  } else {
                    setState(() {
                      color = Colors.yellow;
                      left = 160;
                      top = 400;
                      width = 160;
                      height = 160;
                    });
                  }
                },
                child: const Text(
                  '位移大小动画',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
