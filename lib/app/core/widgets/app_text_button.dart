import 'package:flutter/material.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final EdgeInsets padding;
  final Function onPressed;
  final String lable;
  final TextStyle textStyle;
  final AppColors lableColor;

  const AppTextButton({
    Key key,
    this.lable,
    this.onPressed,
    this.padding,
    this.lableColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        child: Text(
          lable,
          style: textStyle ??
              AppTextStyle.h6(
                color: lableColor ?? AppColors.grey110,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        onTap: onPressed,
      ),
    );
  }
}
