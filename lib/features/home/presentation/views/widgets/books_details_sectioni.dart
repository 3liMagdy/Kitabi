import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/presentation/views/widgets/book_rating.dart';
import 'package:kitabi/features/home/presentation/views/widgets/books_action.dart';
import 'package:kitabi/features/home/presentation/views/widgets/custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2,),
          child: Container(
              color: Colors.red,
              child: CustomBookImage()),
        ),
        const SizedBox(height: 43),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling'
            '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: 4.8,
          count: 4596,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(),
      ],
    );
  }
}
