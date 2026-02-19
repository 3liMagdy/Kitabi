import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitabi/core/widgets/custom_error_widget.dart';
import 'package:kitabi/core/widgets/custom_loading_indicator.dart';
import 'package:kitabi/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:kitabi/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:kitabi/features/home/presentation/views/widgets/best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});
    
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess){
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount:  state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BestSallerListViewItem(bookModel: state.books[index],),
            );
          },
        );
        }else if (state is NewsetBooksFailure) {
          return Column(
            children: [
              CustomErrorWidget(errMessage: state.errMessage),
                  const SizedBox(height: 12),
            ElevatedButton(
          onPressed: () {
            context.read<NewsetBooksCubit>().fetchNewsetBooks();
            context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
          },
          child: const Text("Retry"),
        ),
            ],
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
