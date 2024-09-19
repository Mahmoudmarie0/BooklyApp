import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';
import 'featured_book_list_view.dart';

class FeaturedBookListViewBlocBuilder extends StatefulWidget {
  const FeaturedBookListViewBlocBuilder({
    super.key,
  });

  @override
  State<FeaturedBookListViewBlocBuilder> createState() =>
      _FeaturedBookListViewBlocBuilderState();
}

class _FeaturedBookListViewBlocBuilderState
    extends State<FeaturedBookListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSucces) {
        books.addAll(state.book);
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSucces ||
          state is FeaturedBooksPaginationLoading) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.message);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

//return FeaturedBookListView();
