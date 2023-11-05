import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_spacep/pages/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaAjuda extends StatelessWidget {
  const TelaAjuda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                    future: fromAsset("assets/MANUAL_DO_USUARIO_SPACE_P.pdf",
                        "MANUAL_DO_USUARIO_SPACE_P.pdf"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 20, right: 20, top: 60),
                            child: PDFView(
                              filePath: snapshot.data?.path,
                              fitPolicy: FitPolicy.BOTH,
                            ),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        await launchUrl(Uri.https("api.nasa.gov"));
                      },
                      child: Text(
                        "SITE DA NASA",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(180, 50)),
                        backgroundColor: MaterialStateProperty.all(
                          Color(
                            0xff3a6d8e,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
