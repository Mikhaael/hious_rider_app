import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hious_rider_app/components/spacers.dart';
// import 'package:hious_rider_app/utils/designs/dimens.dart';
import 'package:hious_rider_app/utils/designs/styles.dart';
import 'package:hious_rider_app/utils/res/res_profile.dart';

import '../utils/designs/colors.dart';
import 'buttons.dart';
// import 'package:hious_rider_app/utils/res/res_profile.dart';


@immutable
class TextFieldState {
  final TextEditingController? controller;
  final Function()? onClick;
  final String label;
  final Widget? icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool isInputUnderline;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool expands;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;


  const TextFieldState({
    this.controller,
    this.onClick,
    this.label = '',
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.isInputUnderline = true,
    this.maxLines,
    this.expands = false,
    this.textInputAction,
    this.validator,
    this.textAlign = TextAlign.start,
});

  TextFieldState copyWith({
    TextEditingController? controller,
    Function()? onClick,
    String? label,
    Widget? icon,
    TextInputType? keyboardType,
    bool? obscureText,
    bool? readOnly,
    bool? isInputUnderline,
    int? maxLines,
    bool? expands,
    TextInputAction? textInputAction,
    TextAlign? textAlign,
    String? Function(String?)? validator,
}) =>
      TextFieldState(
        controller: controller ?? this.controller,
        onClick: onClick ?? this.onClick,
        label: label ?? this.label,
        icon: icon ?? this.icon,
        keyboardType: keyboardType?? this.keyboardType,
        obscureText: obscureText ?? this.obscureText,
        readOnly: readOnly ?? this.readOnly,
        isInputUnderline: isInputUnderline ?? this.isInputUnderline,
        maxLines: maxLines ?? this.maxLines,
        expands: expands ?? this.expands,
        textInputAction: textInputAction ?? this.textInputAction,
        textAlign: textAlign ?? this.textAlign,
        validator: validator ?? this.validator
      );
}

class EmailField extends StatelessWidget {
  final TextFieldState state;
  const EmailField({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      textAlign: state.textAlign,
      controller: state.controller,
      expands: state.expands,
      readOnly: state.readOnly,
      cursorColor: theme.colorScheme.primary,
      textInputAction: state.textInputAction,
      keyboardType: state.keyboardType,
      obscureText: state.obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: state.label,
        // prefixIcon: const Icon(Icons.email, size: 20.0,),
        hintStyle: sHintTextStyle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20.8,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13)
          ),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
          borderSide: BorderSide(
            color: Colors.transparent, width: 3.0
          ),
        ),
        suffixIcon: state.icon,
      ),
      maxLength: state.maxLines,
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextFieldState state;

  const PasswordField({Key? key, required this.state}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return EmailField(
      state: state.copyWith(
        label: (state.label.isEmpty) ? ResLoginScreen.password : state.label,
        obscureText: _obscured,
        keyboardType: TextInputType.visiblePassword,
        icon: GestureDetector(
          onTap: () {
            _obscured = _obscured ? false : true;
            setState(() {});
          },
          child: Icon(
            _obscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}


class OtpInput extends StatelessWidget {
  final TextEditingController controller;

  const OtpInput(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.0,
      width: 58.0,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: sLoginScreenText1.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(8.5)
            ),
            borderSide: BorderSide(color: Color(0xFF9FA8DA), width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.5),
            ),
            borderSide: BorderSide(
                color: Color(0xFF9FA8DA), width: 1.2
            ),
          ),
          counterText: '',
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

class OtpFieldInput extends StatefulWidget {
  const OtpFieldInput({Key? key}) : super(key: key);

  @override
  State<OtpFieldInput> createState() => _OtpFieldInputState();
}

const double space = 18;
class _OtpFieldInputState extends State<OtpFieldInput> {

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String? _otp;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpInput(_fieldOne), // auto focus
        hSpace(space * 1.2),
        OtpInput(_fieldTwo,),
        hSpace(space * 1.2),
        OtpInput(_fieldThree),
        hSpace(space * 1.2),
        OtpInput(_fieldFour),
        hSpace(space * 1.2),
      ],
    );
  }
}

