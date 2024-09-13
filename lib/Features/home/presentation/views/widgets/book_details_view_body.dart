import 'package:bookly/Features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SafeArea(child: CustomBookDetailsAppBar()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .2),
                  child: const CustomBookImage(),
                ),
                const SizedBox(height: 43),
                const Text(
                  "The Jungle Book",
                  style: Styles.textStyle10,
                ),
                const SizedBox(height: 4),
                const Opacity(
                    opacity: 0.6,
                    child: Text(
                      "Rudyard Kipling",
                      style: TextStyle(fontSize: 7),
                    )),
                const SizedBox(height: 18),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(height: 20),
                const BooksAction(),
                const Expanded(child: SizedBox(height: 25)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "You can also like",
                      style:
                          TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 16),
                const SimilarBookListView(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
