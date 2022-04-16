import 'package:flutter/material.dart';
import 'package:movie_app/Movie.dart';
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie.poster.toString()),
          const SizedBox(
            width: 16,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}
class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(poster),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.indigo,
          ),
        ),
        Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        Text.rich(TextSpan(
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            children: [
              TextSpan(text: movie.plot),
              TextSpan(
                  text: "More...",
                  style: TextStyle(color: Colors.indigoAccent.shade400))
            ]))
      ],
    );
  }
}