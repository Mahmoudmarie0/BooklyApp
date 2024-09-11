import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBookListView(),
          SizedBox(height: 20),
          Text('Best Seller', style: Styles.textStyle10),
          SizedBox(height: 20),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
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
          ],
        ),
      ]),
    );
  }
}
