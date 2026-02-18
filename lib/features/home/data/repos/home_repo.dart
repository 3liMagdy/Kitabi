
import 'package:dartz/dartz.dart';
import 'package:kitabi/core/errors/failures.dart';
import 'package:kitabi/features/home/data/models/.book_moedl.dart';

abstract class HomeRepo {
Future<Either<Failure,List<BookMoedl>>> fetchBestSellerdBooks();
Future<Either<Failure,List<BookMoedl>>> fetchfeaturedBooks();
}
