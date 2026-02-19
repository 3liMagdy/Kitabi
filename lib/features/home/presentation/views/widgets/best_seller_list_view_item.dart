import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitabi/constant.dart';
import 'package:kitabi/core/utils/app_router.dart';
import 'package:kitabi/core/utils/assets.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/data/models/book_model.dart';
import 'package:kitabi/features/home/presentation/views/widgets/book_rating.dart';
import 'package:kitabi/features/home/presentation/views/widgets/custom_book_item.dart';

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
           CustomBookImage(
                bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(bookModel.volumeInfo.authors![0], style: Styles.textStyle14),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(rating: bookModel.volumeInfo.averageRating??0, count: bookModel.volumeInfo.ratingsCount??0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
