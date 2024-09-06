import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/material.dart';

class TextfieldComp extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final bool? hide;
  final TextInputType? keyboardType; // Optional keyboard type
  final String? Function(String?)? validator; // Optional validator

  const TextfieldComp({
    Key? key,
    this.controller,
    this.hint,
    this.label,
    this.hide,
    this.keyboardType, // Include keyboardType as optional
    this.validator, // Validator remains optional
  }) : super(key: key);

  @override
  State<TextfieldComp> createState() => _TextfieldCompState();
}

class _TextfieldCompState extends State<TextfieldComp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: widget.hide ?? false,
        controller: widget.controller,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: bgColor.withOpacity(0.2),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          filled: true,
          fillColor: Colors.white70,
        ),
        validator: widget.validator,
      ),
    );
  }
}
