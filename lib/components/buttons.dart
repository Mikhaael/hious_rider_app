import 'package:flutter/material.dart';
// import 'package:hious_rider_app/utils/designs/colors.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';
import 'package:hovering/hovering.dart';

primaryButton(
        {required String text,
        required VoidCallback onClick,
        required Color fillColor,
        required Color textColor,
        double borderRadius = 8,
        MainAxisAlignment viewAlignment = MainAxisAlignment.center,
        TextStyle? textStyle,
        FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      onTap: onClick,
      child: Container(
          width: 154.0,
          height: 60.0,
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

secondaryButton(
    {required String text,
      required VoidCallback onClick,
      required Color fillColor,
      required Color textColor,
      double borderRadius = 8,
      MainAxisAlignment viewAlignment = MainAxisAlignment.center,
      TextStyle? textStyle,
      FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      onTap: onClick,
      child: Container(
        height: 60.0,
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

registerButton(
    {required String text,
      required VoidCallback onClick,
      required Color fillColor,
      required Color textColor,
      required bool isLoading,
      double borderRadius = 8,
      MainAxisAlignment viewAlignment = MainAxisAlignment.center,
      TextStyle? textStyle,
      FontWeight fontWeight = FontWeight.w400}) =>
    InkWell(
      onTap: onClick,
        child: Container(
          width: 154.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Row(
            mainAxisAlignment: viewAlignment,
            children: [
              Text(
                isLoading ? 'please wait...' : text,
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

socialButton({required String image, required VoidCallback? onClick}) =>
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
