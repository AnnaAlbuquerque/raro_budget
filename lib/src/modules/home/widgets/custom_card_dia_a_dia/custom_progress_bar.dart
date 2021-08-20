import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class CustomProgressBar extends StatefulWidget {
  final int currentValue;
  final Color? progressColor;

  CustomProgressBar({
    Key? key,
    this.currentValue = 50,
    this.progressColor,
  }) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  double _currentBegin = 0;
  double _currentEnd = 0;
  int _maxValue = 100;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
        .animate(_controller);

    startAnimation();
    super.initState();
  }

  void startAnimation() {
    setState(() {
      _currentBegin = _animation.value;

      if (widget.currentValue == 0 || _maxValue == 0) {
        _currentEnd = 0;
      } else {
        _currentEnd = widget.currentValue / _maxValue;
      }

      _animation = Tween<double>(begin: _currentBegin, end: _currentEnd)
          .animate(_controller);
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedProgressBar(
        animation: _animation,
        widget: widget,
      );
}

class AnimatedProgressBar extends AnimatedWidget {
  final CustomProgressBar widget;
  final Animation<double> animation;

  AnimatedProgressBar({
    Key? key,
    required this.widget,
    required this.animation,
  }) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: size.width,
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Flex(
          direction: Axis.horizontal,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              flex: (animation.value * 100).toInt(),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: widget.progressColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 100 - (animation.value * 100).toInt(),
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
