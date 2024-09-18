import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_book_list_view.dart';

class FeaturedBookListViewBlocBuilder extends StatelessWidget {
  const FeaturedBookListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSucces) {
        return const FeaturedBookListView();
      } else if (state is FeaturedBooksFailure) {
        return Text(state.message);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

//return FeaturedBookListView();
