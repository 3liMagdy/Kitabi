import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitabi/constant.dart';
import 'package:kitabi/core/utils/app_router.dart';
import 'package:kitabi/core/utils/assets.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/presentation/views/widgets/book_rating.dart';

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key});

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
            SizedBox(
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(AssetsData.test_image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      'Harry Potter and the Goblet of Fire',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text('J.K. Rowing', style: Styles.textStyle14),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '€99.99',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(rating: 4.8, count: 2457),
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
