import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'featured_books_list_view_bloc_builder.dart';

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
          FeaturedBookListViewBlocBuilder(),
          SizedBox(height: 20),
          Text('Best Seller', style: Styles.textStyle20),
          SizedBox(height: 20),
          BestSellerListView(),
        ],
      ),
    );
  }
}
