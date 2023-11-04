import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageFull extends StatelessWidget {
   final String link;

  const ImageFull({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(link),
            backgroundDecoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    "https://media.discordapp.net/attachments/444606048373047307/1168270986471293039/image.png",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(100, 255, 255, 255),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
