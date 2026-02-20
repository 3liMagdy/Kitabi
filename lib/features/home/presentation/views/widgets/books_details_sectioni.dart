import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/data/models/book_model.dart';
import 'package:kitabi/features/home/presentation/views/widgets/book_rating.dart';
import 'package:kitabi/features/home/presentation/views/widgets/books_action.dart';
import 'package:kitabi/features/home/presentation/views/widgets/custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
     
  
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: Container(color: Colors.red, 
          child: CustomBookImage(book.volumeInfo.imageLinks?.thumbnail ?? '')),
        ),
        const SizedBox(height: 43),
        Text(
            book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
           rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(),
      ],
    );
  }
}
