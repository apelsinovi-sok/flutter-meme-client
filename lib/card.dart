import 'package:flutter/cupertino.dart';

class MyCard extends StatefulWidget {
  late int i;

  MyCard(this.i, {Key? key}) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState(i);
}

class _MyCardState extends State<MyCard> {
  late int i;

  _MyCardState(this.i);

  double? height = 140;
  double? weight = 100;
  double marginBottom = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          if (flag == true) {
            // height = height! * 4;
            // weight = weight! * 4;
            marginBottom += 60;
            flag = false;
          } else {
            // height = height! / 4;
            // weight = weight! / 4;
            marginBottom -= 60;
            flag = true;
          }
        });
        // Random random = new Random();
        // int randomNumber = random.nextInt(100);
        // debugPrint(randomNumber.toString());
      },
      child: Container(
          height: height,
          width: weight,
          margin: EdgeInsets.only(bottom: marginBottom),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0),
            // color: Colors.red,
            image: DecorationImage(image: AssetImage("images/$i.png")),
          )),
    );
  }
}
