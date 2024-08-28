import 'package:flutter/cupertino.dart';

class Slide1 extends StatelessWidget {
  const Slide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/slideImg1.png'),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text("Book appoinment and view trends of your health",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
