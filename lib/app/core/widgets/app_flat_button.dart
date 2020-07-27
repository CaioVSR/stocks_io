import 'package:flutter/material.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppFlatButton extends StatelessWidget {
  final Color color;
  final Color lableColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onPressed;
  final String lable;
  final TextStyle textStyle;
  final double height;
  final double width;

  const AppFlatButton({
    Key key,
    this.color,
    this.height,
    this.lable,
    this.lableColor,
    this.margin,
    this.onPressed,
    this.padding,
    this.textStyle,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      height: height,
      width: width,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorBrightness: Brightness.dark,
        shape: StadiumBorder(),
        color: color ?? AppColors.tiber,
        onPressed: onPressed,
        child: Text(
          lable,
          style: textStyle ??
              AppTextStyle.h6(
                color: lableColor ?? AppColors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
