// import 'package:avunja/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:size_config/utils/size_config.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxline;
  final bool editable;
  final Function()? onPress;
  final Function(String value) onChanged;
  final TextInputType inputType;
  final Widget? suffixIconWidget;
  final Size suffixIconSize;
  final double fontSize;
  TextEditingController? controller;
  Color? color;
  List<TextInputFormatter> inputFormatters;

  CustomTextField(
    this.hint, {
    Key? key,
    this.maxline = 1,
    this.editable = true,
    this.onPress,
    this.suffixIconWidget,
    this.suffixIconSize = const Size(0, 0),
    this.controller,
    this.color,
    required this.onChanged,
    this.fontSize = 16,
    this.inputFormatters = const [],
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (color == null) color = AppTheme.plRedColor;
    return InkWell(
      onTap: onPress,
      child: controller != null
          ? TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              controller: controller,
              keyboardType: inputType,
              style: valueStyle(fontSize: fontSize),
              onChanged: (String value) => onChanged(value),
              inputFormatters: inputFormatters,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: hintStyle(),
                border: borderWidget(Color(0xfff2f2f2)),
                disabledBorder: borderWidget(Color(0xfff2f2f2)),
                enabledBorder: borderWidget(Color(0xfff2f2f2)),
                focusedBorder: borderWidget(Color(0xfff2f2f2)),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon: suffixIconWidget ?? Container(),
                alignLabelWithHint: true,
                labelStyle: labelStyle(),
              ),
            )
          : TextFormField(
              enabled: editable,
              maxLines: maxline == 0 ? null : maxline,
              keyboardType: inputType,
              style: valueStyle(fontSize: fontSize),
              inputFormatters: inputFormatters,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: hint,
                hintStyle: hintStyle(),
                isDense: true,
                border: borderWidget(Color(0xfff2f2f2)),
                disabledBorder: borderWidget(Color(0xfff2f2f2)),
                enabledBorder: borderWidget(Color(0xfff2f2f2)),
                focusedBorder: borderWidget(Color(0xfff2f2f2)),
                suffixIconConstraints: BoxConstraints.tight(suffixIconSize),
                suffixIcon: suffixIconWidget ?? Container(),
                alignLabelWithHint: true,
                labelStyle: labelStyle(),
              ),
            ),
    );
  }

  TextStyle labelStyle() {
    return TextStyle(
      fontSize: SizeConfig.setSp(13).toDouble(),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  TextStyle hintStyle() {
    return TextStyle(
      color: Color(0xff5a5a5a),
      fontSize: SizeConfig.setSp(13).toDouble(),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }

  TextStyle valueStyle({required double fontSize}) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize).toDouble(),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      letterSpacing: 0,
    );
  }
}

UnderlineInputBorder borderWidget(Color color) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1,
    ),
  );
}
