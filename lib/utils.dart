import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_spacep/pages/erro.dart';
import 'package:mobile_spacep/pages/imagem.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

Future<File> fromAsset(String asset, String filename) async {
  // To open from assets, you can copy them to the app storage folder, and the access them "locally"
  Completer<File> completer = Completer();

  try {
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/$filename");
    var data = await rootBundle.load(asset);
    var bytes = data.buffer.asUint8List();
    await file.writeAsBytes(bytes, flush: true);
    completer.complete(file);
  } catch (e) {
    throw Exception('Error parsing asset file!');
  }

  return completer.future;
}

class Constantes {
  static const String baseUrl = 'localhost:9999';
}

void maybeOpenImage(
  SharedPreferences prefs,
  BuildContext context,
  DateTime focusedDay,
  bool willReplace,
) {
  String diahoje = DateFormat('yyyy-MM-dd').format(focusedDay);
  if (prefs.getString(diahoje) != null) {
    (!willReplace ? Navigator.push : Navigator.pushReplacement)(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => ImageDesc(data: focusedDay),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => DialgErro(),
    );
  }
}
