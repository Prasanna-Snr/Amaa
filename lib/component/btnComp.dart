import 'package:aamaa/uiColor/uiColor.dart';
import 'package:flutter/material.dart';

class Btncomp extends StatefulWidget {
final String text;
final VoidCallback? onclick;
final Color? textcolor;
final double? width;
final Color? backgroundColor;
  const Btncomp({super.key, required this.text, this.onclick, this.textcolor, this.width, this.backgroundColor});

  @override
  State<Btncomp> createState() => _BtncompState();
}

class _BtncompState extends State<Btncomp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: widget.width,
      child: ElevatedButton(onPressed: widget.onclick,
          child: Text(widget.text,style: TextStyle(
            color: widget.textcolor
          ),),
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7)
        )
      ),),
    );
  }
}
