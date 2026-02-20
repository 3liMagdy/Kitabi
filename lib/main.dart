import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kitabi/constant.dart';
import 'package:kitabi/core/utils/app_router.dart';
import 'package:kitabi/core/utils/service_locator.dart';
import 'package:kitabi/features/home/data/repos/home_repo.dart';
import 'package:kitabi/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:kitabi/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  setupServiceLocator();
  runApp(const Kitabi());
}

class Kitabi extends StatelessWidget {
  const Kitabi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt<HomeRepo>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(
            getIt<HomeRepo>(),
          )..fetchNewsetBooks(),
        ),
       
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
      
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
      
    
  }
}
