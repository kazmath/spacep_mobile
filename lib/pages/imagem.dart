import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_spacep/pages/imagem_full.dart';
import 'package:mobile_spacep/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageDesc extends StatefulWidget {
  final DateTime data;

  const ImageDesc({required DateTime this.data, super.key});

  @override
  State<ImageDesc> createState() => _ImageDescState();
}

class _ImageDescState extends State<ImageDesc> {
  //String linkImage = 'https://placehold.co/2000x1000.png';

  @override
  void initState() {
    super.initState();
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
                      onPressed: () async {
                        maybeOpenImage(
                          await SharedPreferences.getInstance(),
                          context,
                          widget.data.subtract(
                            Duration(days: 1),
                          ),
                          true,
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
                      onPressed: () async {
                        maybeOpenImage(
                          await SharedPreferences.getInstance(),
                          context,
                          widget.data.add(
                            Duration(days: 1),
                          ),
                          true,
                        );
                      },
                    ),
                  ],
                ),
                Center(
                  child: FutureBuilder(
                      future: SharedPreferences.getInstance().then((prefs) {
                        return prefs.getString(
                            DateFormat('yyyy-MM-dd').format(widget.data));
                      }),
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data != null
                              ? jsonDecode(snapshot.data!)["title"]
                              : "loading",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        );
                      }),
                ),
                FutureBuilder(
                    future: SharedPreferences.getInstance().then((prefs) {
                      return prefs.getString(
                          DateFormat('yyyy-MM-dd').format(widget.data));
                    }),
                    builder: (context, snapshot) {
                      return GestureDetector(
                        onTap: () {
                          if (snapshot.data == null) return;
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => ImageFull(
                                link: switch (
                                    jsonDecode(snapshot.data!)["media_type"]) {
                                  "video" =>
                                    jsonDecode(snapshot.data!)["thumbnail_url"],
                                  _ =>
                                    jsonDecode(snapshot.data!)["image"]["hdurl"]
                                },
                              ),
                            ),
                          );
                        },
                        child: snapshot.data != null
                            ? Image.network(
                                switch (
                                    jsonDecode(snapshot.data!)["media_type"]) {
                                  "video" =>
                                    jsonDecode(snapshot.data!)["thumbnail_url"],
                                  _ =>
                                    jsonDecode(snapshot.data!)["url"]
                                },
                                height:
                                    MediaQuery.of(context).size.height * .60)
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .60,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 150,
                                      bottom: 150,
                                      left: 60,
                                      right: 60),
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      );
                    }),
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
                          FutureBuilder(
                              future:
                                  SharedPreferences.getInstance().then((prefs) {
                                return prefs.getString(DateFormat('yyyy-MM-dd')
                                    .format(widget.data));
                              }),
                              builder: (context, snapshot) {
                                return Text(
                                    snapshot.data != null
                                        ? jsonDecode(
                                            snapshot.data!)["explanation"]
                                        : "loading",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18));
                              }),
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
