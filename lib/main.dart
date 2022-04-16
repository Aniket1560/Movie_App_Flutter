import 'package:flutter/material.dart';
import 'package:movie_app/Movie.dart';
import 'package:movie_app/horizontal_line.dart';
import 'package:movie_app/movie_details_poster.dart';
import 'package:movie_app/movie_thumbnails_with_play_button.dart';
import 'package:movie_app/movie_cast.dart';
import 'package:movie_app/extra_images.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MovieListView());
  }
}

class MovieListView extends StatelessWidget {
  MovieListView({Key? key}) : super(key: key);
  final List<Movie> movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(top: 10, child: movieImage(movieList[index].poster)),
            ]);
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 35),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 54.0, right: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                      Text("Rating:${movie.imdbRating}/10",
                          style: maintextstyle())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Released:${movie.released}",
                          style: maintextstyle()),
                      Text(movie.runtime, style: maintextstyle()),
                      Text(movie.rated, style: maintextstyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  TextStyle maintextstyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey.shade700);
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover)),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[1],),
          MovieDetailsHeaderWithPoster(movie: movie),
          const HorizontalLine(),
          MovieDetailsCast(movie: movie),
          const HorizontalLine(),
          MovieExtraImages(images: movie.images),
        ],
      ),
    );
  }
}
