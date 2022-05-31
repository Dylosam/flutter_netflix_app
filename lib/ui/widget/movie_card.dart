import 'package:flutter/widgets.dart';
import 'package:netflix_app/models/movie.dart';

class movie_card extends StatelessWidget {
  final Movie movie;
  const movie_card({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      ImageUrl:movie.posterUrl(),
      fit: BoxFit.cover,
      ErrorWidget(context)
    ),
  }
}