import 'package:flutter/material.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppTextFormField extends StatefulWidget {
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final String validatorText;
  final bool obscureText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final EdgeInsets padding;

  const AppTextFormField({
    Key key,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    @required this.focusNode,
    @required this.onFieldSubmitted,
    @required this.controller,
    @required this.textInputType,
    @required this.labelText,
    @required this.validatorText,
    this.obscureText,
  }) : super(key: key);
  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Theme(
        data: Theme.of(context).copyWith(
          cursorColor: AppColors.irisBlue,
          primaryColor: AppColors.irisBlue,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: AppTextStyle.p(color: AppColors.grey110),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.irisBlue)),
            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.alizarin)),
            focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.irisBlue)),
          ),
        ),
        child: TextFormField(
          obscureText: widget.obscureText ?? false,
          focusNode: widget.focusNode,
          onFieldSubmitted: (value) => widget.onFieldSubmitted,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
              labelText: widget.labelText,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              labelStyle: AppTextStyle.p(color: AppColors.grey110)),
          validator: (value) => value.isEmpty ? widget.validatorText : null,
          style: AppTextStyle.p(color: AppColors.black50),
        ),
      ),
    );
  }
}
