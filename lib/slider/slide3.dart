import 'package:flutter/cupertino.dart';

class Slide3 extends StatelessWidget {
  const Slide3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image.asset('assets/images/logo.png',width: 200,height: 200,),
        SizedBox(height: 180,),
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
