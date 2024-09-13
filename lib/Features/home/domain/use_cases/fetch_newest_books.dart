import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../entities/book_entity.dart';
import '../repos/home_repo.dart';
import 'fetch_featured_books_use_case.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
