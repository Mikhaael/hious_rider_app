import 'package:flutter/material.dart';
import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';

primaryButton(
        {required String text,
        required GestureTapCallback onPressed,
        required Color fillColor,
        required Color textColor,
        double leftPadding = 0,
        double rightPadding = 0,
        double bottomPadding = 6,
        double topPadding = 6,
        double borderRadius = 8,
        MainAxisAlignment viewAlignment = MainAxisAlignment.center,
        TextStyle? textStyle,
        FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      child: Container(
        width: 154.0,
        height: 60.0,
        padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding,
        ),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(13.0),
        ),
        child: Row(
          mainAxisAlignment: viewAlignment,
          children: [
            Text(
              text,
              style: textStyle ??
                  sPrimaryTextStyle.copyWith(
                    color: textColor,
                    fontWeight: fontWeight,
                    fontSize: 16.0,
                  ),
            ),
          ],
        ),
      ),
    );
