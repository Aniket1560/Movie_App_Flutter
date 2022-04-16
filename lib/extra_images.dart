import 'package:flutter/material.dart';
import 'package:movie_app/horizontal_line.dart';

class MovieExtraImages extends StatelessWidget {
  final List<String> images;

  const MovieExtraImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Movie Images".toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black26,
          ),
        ),
        const HorizontalLine(),
        SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                 // separatorBuilder: (context,index) =>SizedBox(width: 8,),
                  itemCount: images.length,
                  itemBuilder:(context, index) => ClipRRect(
                   borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Container(
                      width: MediaQuery.of(context).size.width /4,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(images[index]),
                            fit: BoxFit.cover,
                         )
                      ),
                    ),
                  ),
              )
            )
      ],
    );
  }
}
