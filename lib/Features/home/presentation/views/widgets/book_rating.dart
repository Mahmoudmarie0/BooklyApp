import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(width: 5),
        Text(
          "4.8",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 5),
        ),
        SizedBox(width: 2),
        Text(
          "(2390)",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 5),
        ),
      ],
    );
  }
}
