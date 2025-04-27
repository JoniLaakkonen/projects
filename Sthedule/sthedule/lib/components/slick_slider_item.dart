import 'package:flutter/material.dart';
import 'package:sthedule/models/quick_entry.dart';

class SlickSliderItem extends StatelessWidget {
  final Color txtColorDark;
  final Color txtColorLight;
  final Color boxColor;
  final IconData boxIxon;
  final QuickEntry item;

  const SlickSliderItem({
    super.key,
    required this.txtColorDark,
    required this.txtColorLight,
    required this.boxColor,
    required this.boxIxon,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return(
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
        padding: const EdgeInsets.fromLTRB(16.0, 10.0, 10.0, 7.0 ),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(7.0),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            Icon(
              item.getIcon(),
              color: txtColorLight,
              size: 45.0,
            ),
            const SizedBox(height: 10.0),
            Text(item.getProject(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(item.getTask(),
              style: TextStyle(
                fontSize: 14,
                color: txtColorLight,
                fontWeight: FontWeight.w400
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: IconButton(
                onPressed: () => {},
                icon: Icon(Icons.play_circle_outline,
                  size: 45.0,
                  color: txtColorLight,
                ),
              ),
            ),
          ]
        )
      )
    );
  }
}