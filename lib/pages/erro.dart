import 'package:flutter/material.dart';

class DialgErro extends StatelessWidget {
  const DialgErro({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: Colors.white,),
              
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis id est malesuada dui pharetra scelerisque. Nulla porta lobortis nisl, ac porttitor mi tincidunt nec. Quisque tempus leo erat, quis lacinia justo condimentum eu. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas feugiat tempor finibus. Vivamus eget tempus mi, sit amet mollis leo. Quisque convallis dolor vitae dolor condimentum, ac varius tellus vulputate. Ut eget massa tincidunt, tincidunt sem nec, sollicitudin tellus. Morbi ornare tortor arcu, sit amet auctor magna volutpat in. Sed eget sagittis erat.",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: Color(0xFF4E4E4E),
    );
  }
}
