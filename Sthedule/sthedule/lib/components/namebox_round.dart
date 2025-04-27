import 'package:flutter/material.dart';
import 'package:sthedule/models/user.dart';

class NameboxRound extends StatelessWidget {
  final Color txtColor;
  final Color boxColor;
  final User user;

  const NameboxRound ({
    super.key,
    required this.txtColor,
    required this.boxColor,
    required this.user,

  });

  @override
  Widget build(BuildContext context) {
    return(
      Container(//--------NAME BOX--------
        alignment: Alignment.center,
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          user.shortenedName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontWeight: FontWeight.w900,
            fontSize: 16.0,
            fontFamily: 'Roboto',
          ),
        ),
      )
    );
  }
}