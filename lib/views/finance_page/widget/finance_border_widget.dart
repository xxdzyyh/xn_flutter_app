import 'package:flutter/material.dart';

class FinanceBorderWidget extends StatefulWidget {
  final Widget child;
  FinanceBorderWidget({Key key, @required this.child,}): super(key: key);

  @override
  _FinanceBorderWidgetState createState() => _FinanceBorderWidgetState();
}

class _FinanceBorderWidgetState extends State<FinanceBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(1.0, 1.0),
                      blurRadius: 5.0)
                ]),
            child: widget.child,
          );
  }
}