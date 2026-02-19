import 'package:flutter/material.dart';
import 'package:kitabi/features/home/presentation/views/widgets/custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage("https://www.google.com/imgres?q=image%20flutter&imgurl=https%3A%2F%2Fopensource.google%2Fstatic%2Fimages%2Fprojects%2Fos-projects-flutter.svg&imgrefurl=https%3A%2F%2Fopensource.google%2Fprojects%2Fflutter&docid=PPg_UwLTAFMAKM&tbnid=F86oq0XEEnrp2M&vet=12ahUKEwiYm8rVuOSSAxUn3gIHHRk5KyQQnPAOegQIJhAB..i&w=800&h=450&hcb=2&ved=2ahUKEwiYm8rVuOSSAxUn3gIHHRk5KyQQnPAOegQIJhAB"),
          );
        },
      ),
    );
  }
}
