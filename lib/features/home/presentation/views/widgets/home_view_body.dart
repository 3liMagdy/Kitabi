import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:kitabi/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:kitabi/features/home/presentation/views/widgets/featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Best Saller', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BestSallerListViewItem(),
              ),
              childCount: 10,
            ),
          ),
        ),
      ],
    );
  }
}
