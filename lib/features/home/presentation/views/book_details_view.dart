import 'package:flutter/material.dart';
import 'package:kitabi/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:kitabi/features/home/presentation/views/widgets/similar_books_section.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: BookDetailsViewBody()));
  }
}
