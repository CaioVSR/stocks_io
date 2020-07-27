import 'package:flutter/material.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  const AppFloatingActionButton({Key key, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: AppColors.tiber,
      icon: Icon(
        Icons.add,
        color: AppColors.irisBlue,
        size: 24.sp,
      ),
      label: Text(
        'Adicionar Ativos',
        style: AppTextStyle.p(fontWeight: FontWeight.bold, color: AppColors.white),
      ),
      onPressed: onPressed,
    );
  }
}
