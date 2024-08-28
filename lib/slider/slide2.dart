import 'package:flutter/cupertino.dart';

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/slideImg2.png'),
        SizedBox(height: 55,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text("Personalize plan for your treatment",
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
