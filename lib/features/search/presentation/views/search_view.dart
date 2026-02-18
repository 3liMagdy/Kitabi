


import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:kitabi/features/search/presentation/views/widgets/search_view_body.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}