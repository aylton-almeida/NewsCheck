import 'package:flutter/material.dart';

// * TextField decorado com borda

class OutlinedTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final Function validator;
  final TextEditingController controller;
  final bool autocorrect;
  final TextInputType keyboardType;
  final Widget suffixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final Function onChanged;
  final Icon prefixIcon;
  final int maxLines;

  OutlinedTextField({
    Key key,
    @required this.hintText,
    this.labelText,
    @required this.validator,
    @required this.controller,
    this.autocorrect,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    this.textCapitalization,
    this.onChanged,
    this.prefixIcon,
    this.maxLines,
  }) : super(key: key);

  _OutlinedTextFieldState createState() => _OutlinedTextFieldState();
}

class _OutlinedTextFieldState extends State<OutlinedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      autocorrect: widget.autocorrect ?? true,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
      ),
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: widget.obscureText ?? false,
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      onChanged: widget.onChanged,
    );
  }
}
