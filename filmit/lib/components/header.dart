import 'package:flutter/material.dart';
import 'package:filmit/provider/colorprovider.dart';
import 'package:provider/provider.dart';

class HeaderSpace extends StatelessWidget {
  final String headerText;

  const HeaderSpace({
    super.key,
    required this.headerText,
  });
  

@override
Widget build(BuildContext context) {
  final colors = Provider.of<ColorProvider>(context);
  return
    SizedBox(
      height: 200.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 26.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200.0), bottomRight: Radius.circular(200.0)),
              color: colors.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Text(
            headerText,
            style: TextStyle(
              color: colors.textColorLight,
              fontWeight: FontWeight.w800,
              fontSize: 40.0,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.grey.withValues(alpha: 0.5),
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 8.0,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}