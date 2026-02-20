
import 'package:dartz/dartz.dart';

import 'package:kitabi/core/errors/failures.dart';
import 'package:kitabi/features/home/data/models/book_model.dart';


abstract class HomeRepo {
 Future<Either<Failure, List<BookModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
