import 'package:flutter/material.dart';

class ImageDesc extends StatefulWidget {
  const ImageDesc({super.key});

  @override
  State<ImageDesc> createState() => _ImageDescState();
}

class _ImageDescState extends State<ImageDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://media.discordapp.net/attachments/444606048373047307/1168270986471293039/image.png",
              ),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(color: Colors.white, Icons.arrow_back),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(100, 255, 255, 255)),
                        ),
                        onPressed: () {},
                        child: Text("02/11/23")),
                    Icon(color: Colors.white, Icons.arrow_forward),
                  ],
                ),
                Center(child: Text("data", style: TextStyle(color: Colors.white, fontSize: 25))),
                Image.network("http://placehold.co/400x600.png", height: MediaQuery.of(context).size.height * .60),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5,right: 5, top: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(75, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("696969", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
