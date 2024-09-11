import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(width: 5),
        Text(
          "4.8",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 5),
        ),
        Text(
          "(2390)",
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 5),
        ),
      ],
    );
  }
}
