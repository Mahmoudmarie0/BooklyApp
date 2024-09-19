import '../../domain/entities/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;

  FeaturedBooksFailure(this.message);
}

class FeaturedBooksSucces extends FeaturedBooksState {
  List<BookEntity> book;

  FeaturedBooksSucces(this.book);
}
