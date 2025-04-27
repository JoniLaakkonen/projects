import 'package:flutter/material.dart';

class FullwidthBtn extends StatelessWidget{
  final VoidCallback btnCallBack;
  final Color txtColor;
  final IconData? btnIcon;
  final Color btnColor;
  final String btnText;
  
  const FullwidthBtn ({
    super.key,
    required this.btnCallBack,
    required this.btnColor,
    required this.txtColor,
    this.btnIcon,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return(
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            padding: const EdgeInsets.symmetric(vertical:16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
          onPressed: btnCallBack,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center-align items
            children: [
              if (btnIcon != null)
                Icon(
                  btnIcon,
                  color: txtColor,
                  size: 24.0,
                ),
              if (btnIcon != null)
                const SizedBox(width: 10.0),
              Text(
                btnText,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: txtColor,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}