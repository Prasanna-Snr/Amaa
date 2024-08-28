import 'package:flutter/cupertino.dart';

class TxtComp extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool? isBold;


  const TxtComp({super.key, required this.text, this.color, this.size, this.isBold});

  @override
  Widget build(BuildContext context) {
    return Text(text,textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: isBold == true?FontWeight.bold:FontWeight.normal,
    ),);
  }
}
