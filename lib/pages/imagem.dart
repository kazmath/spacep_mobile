import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_spacep/pages/imagem_full.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageDesc extends StatefulWidget {
  final DateTime data;

  const ImageDesc({required DateTime this.data, super.key});

  @override
  State<ImageDesc> createState() => _ImageDescState();
}

class _ImageDescState extends State<ImageDesc> {
  late SharedPreferences prefs;
  //String linkImage = 'https://placehold.co/2000x1000.png';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }

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
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return CircularProgressIndicator();
                      }
                      return Image.network(jsonDecode(snapshot.data!)[],
                          height: MediaQuery.of(context).size.height * .60);
                    },
                    future: SharedPreferences.getInstance().then((value) {
                      return value.getString(
                          DateFormat('yyyy-MM-dd').format(widget.data));
                    }),
                  ),
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
