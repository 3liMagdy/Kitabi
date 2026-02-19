

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitabi/core/utils/styles.dart';
import 'package:kitabi/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}