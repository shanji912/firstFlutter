import 'package:flutter/material.dart';

/// 带图标的输入框
class SaintInputWidget extends StatefulWidget {
  final bool obscureText;

  final String? hintText;

  final IconData? iconData;

  final ValueChanged<String>? onChanged;

  final TextStyle? textStyle;

  final TextEditingController? controller;

  SaintInputWidget(
      {Key? super.key,
      this.hintText,
      this.iconData,
      this.onChanged,
      this.textStyle,
      this.controller,
      this.obscureText = false});

  @override
  _SaintInputWidgetState createState() => _SaintInputWidgetState();
}

/// State for [SaintInputWidget] widgets.
class _SaintInputWidgetState extends State<SaintInputWidget> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : Icon(widget.iconData),
      ),
    );
  }
}
