import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_spacep/pages/imagem_full.dart';

class ImageDesc extends StatefulWidget {
  final DateTime data;

  const ImageDesc({required DateTime this.data, super.key});

  @override
  State<ImageDesc> createState() => _ImageDescState();
}

class _ImageDescState extends State<ImageDesc> {
  String linkImage = "http://placehold.co/400x600.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background.png"), fit: BoxFit.cover),
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
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ImageDesc(
                              data: widget.data.subtract(
                                Duration(days: 1),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(150)),
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(100, 255, 255, 255)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          DateFormat("dd/MM/yyyy").format(widget.data),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ImageDesc(
                              data: widget.data.add(
                                Duration(days: 1),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Center(
                    child: Text("data",
                        style: TextStyle(color: Colors.white, fontSize: 25))),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ImageFull(
                          link: linkImage,
                        ),
                      ),
                    );
                  },
                  child: Image.network(linkImage,
                      height: MediaQuery.of(context).size.height * .60),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(75, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          Text("696969",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ],
                      ),
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
