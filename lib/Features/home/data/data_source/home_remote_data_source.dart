import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/utils/api_services.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/functions/save_box.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
}
