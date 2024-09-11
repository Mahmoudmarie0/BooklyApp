import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(children: [
        AspectRatio(
          aspectRatio: 2.5 / 4,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage(AssetsApp.test),
                  fit: BoxFit.fill,
                )),
          ),
        ),
        const SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text('Harry Potter and the Goblet of Fire',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(height: 3),
            const Text(
              "J.K. Rowling",
              style: TextStyle(
                fontSize: 6,
              ),
            ),
            const Row(
              children: [
                Text(
                  "19.99 €",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
