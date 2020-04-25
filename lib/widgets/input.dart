import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home_iot/utils/constants.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final double height;
  final Widget prefix;
  final Widget suffix;
  final String labelText;
  final bool obscureText;
  final String initialValue;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool multiline;
  final String Function(String) validator;
  final void Function(String, bool) onChanged;

  const Input({
    Key key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.height = FORM_ELEMENT_HEIGHT,
    this.prefix,
    this.suffix,
    this.labelText,
    this.obscureText = false,
    this.initialValue,
    this.keyboardType,
    TextInputAction textInputAction,
    this.multiline = false,
    this.validator,
    this.onChanged,
  })  : textInputAction = textInputAction ?? (nextFocus != null ? TextInputAction.next : TextInputAction.done),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController _controller;
  String _error;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = widget.initialValue;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  void onChanged(String value) {
    if (widget.validator != null) {
      setState(() {
        _error = widget.validator(value);
        widget.onChanged(value, _error == null);
      });
    } else {
      widget.onChanged(value, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    const _border = OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    List<Widget> children = [
      TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: _border,
          focusedBorder: _border,
          errorBorder: _border,
          enabledBorder: _border,
          disabledBorder: _border,
          focusedErrorBorder: _border,
          hintText: widget.labelText,
          hintStyle: subTitleStyle,
          contentPadding: EdgeInsets.zero,
          icon: widget.prefix != null ? Container(width: 24.0, child: widget.prefix) : null,
          suffixIcon: widget.suffix,
        ),
        maxLines: widget.multiline ? 10 : 1,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        style: subTitleStyleDark,
        onChanged: onChanged,
        onEditingComplete: () {
          if (widget.focusNode != null) {
            widget.focusNode.unfocus();
          }
          FocusScope.of(context).requestFocus(widget.nextFocus ?? FocusNode());
        },
      ),
    ];

    if (_error != null && _error.isNotEmpty) {
      children.add(
        Positioned(
          left: 48.0,
          right: 48.0,
          bottom: 4.0,
          child: Text(
            _error,
            style: captionStyle.merge(t(color: errorColor)),
          ),
        ),
      );
    }

    EdgeInsetsGeometry _padding = EdgeInsets.only(left: 12.0);
    if (widget.suffix == null) {
      _padding = _padding.add(EdgeInsets.only(right: 12.0));
    }

    return Container(
      height: widget.height,
      padding: _padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(children: children),
    );
  }
}
