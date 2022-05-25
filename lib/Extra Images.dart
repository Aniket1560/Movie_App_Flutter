import 'package:flutter/material.dart';

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
          style: TextStyle(
            fontSize: 14,
            color: Colors.black26,
          ),
        ),
        Container(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index) =>SizedBox(width: 8,),
              itemCount: images.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width /4,
                  height: 160,
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
