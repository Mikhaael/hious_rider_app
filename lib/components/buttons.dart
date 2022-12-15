import 'package:flutter/material.dart';
// import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';
import 'package:hovering/hovering.dart';

primaryButton(
        {required String text,
        required GestureTapCallback onClick,
        required Color fillColor,
        required Color textColor,
        // double leftPadding = 0,
        // double rightPadding = 0,
        // double bottomPadding = 6,
        // double topPadding = 6,
        double borderRadius = 8,
        MainAxisAlignment viewAlignment = MainAxisAlignment.center,
        TextStyle? textStyle,
        FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      onTap: onClick,
      child: HoverContainer(
        hoverColor: Colors.grey[100],
        width: 154.0,
        height: 60.0,
      child: Container(
          // padding: EdgeInsets.only(
          //   // left: leftPadding,
          //   // right: rightPadding,
          //   // top: topPadding,
          //   // bottom: bottomPadding,
          // ),
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
      ),
    );

socialButton({required String image, required GestureTapCallback? onClick}) =>
    InkWell(
      onTap: onClick,
      child: Material(
        child: HoverContainer(
          hoverColor: Colors.grey[50],
          child: Container(
            height: 45.0,
            width: 45.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.72),
              color: Colors.grey[100],
            ),
            child: Image(
              image: AssetImage(image),
              width: 17.0,
              height: 14.0,
            ),
          ),
        ),
      ),
    );
