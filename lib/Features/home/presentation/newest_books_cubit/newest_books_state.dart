import '../../domain/entities/book_entity.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;
  NewestBooksFailure(this.errorMessage);
}

class NewestBooksSucces extends NewestBooksState {
  List<BookEntity> books;
  NewestBooksSucces(this.books);
}
