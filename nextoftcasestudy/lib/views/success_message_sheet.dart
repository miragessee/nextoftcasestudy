import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class SuccessMessageSheet extends StatelessWidget {
  final String message;
  final SvgPicture icon;
  final Color textColor;

  SuccessMessageSheet(
      {required this.message,
      required this.icon,
      this.textColor = AppColors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: AppColors.page_color,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, -6),
            blurRadius: 40.1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 31),
          Row(
            children: [
              icon,
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                      color: AppColors.green,
                      fontFamily: 'Nunito',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 31),
        ],
      ),
    );
  }
}
