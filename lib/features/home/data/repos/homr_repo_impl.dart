import 'package:dartz/dartz.dart';

import 'package:kitabi/core/errors/failures.dart';
import 'package:kitabi/core/utils/api/api_consumer.dart';
import 'package:kitabi/core/utils/api/end_ponits.dart';
import 'package:kitabi/features/home/data/models/book_model.dart';
import 'package:kitabi/features/home/data/repos/home_repo.dart';

class HomrRepoImpl extends HomeRepo {
   final ApiConsumer api;

  HomrRepoImpl({required this.api});
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async{
       
     try{
      final response = await api.get(EndPonits.fetch_books);
        List<BookModel> books = [];
       for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }
       
      return right(books);
     } on Failure catch (failure) {
      return Left(failure);
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async{
       
     try{
      final response = await api.get(EndPonits.newset_books);
        List<BookModel> books = [];
      for (var item in response['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
       
      return right(books);
     } on Failure catch (failure) {
      return Left(failure);
    }
  }

    @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      final response = await api.get(EndPonits.newset_books);
      List<BookModel> books = [];
      for (var item in response['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    }on Failure catch (failure) {
      return Left(failure);
    }
  }
   
}