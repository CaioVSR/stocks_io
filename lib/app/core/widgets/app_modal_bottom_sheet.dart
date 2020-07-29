import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks_io/app/core/widgets/app_flat_button.dart';
import 'package:stocks_io/app/core/widgets/app_text_button.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';

class AppBottomSheet {
  static noConnection({BuildContext context, Function btnOneOnTap, Function btnTwoOnTap}) {
    return modalBottomSheet(
      mainColor: AppColors.alizarin,
      isDimissible: false,
      enableDrag: false,
      context: context,
      imageURL: 'assets/images/no_connection.png',
      imageHeight: 250,
      imageWidth: 250,
      title: 'Houston, temos um problema!',
      subtitle: 'Não conseguimos nos conectar com nossos servidores.',
      btnOneLable: 'Tentar novamente',
      btnOneOnTap: btnOneOnTap,
      btnTwoLable: 'Sair do app',
      btnTwoOnTap: btnTwoOnTap,
    );
  }

  static removeStock({BuildContext context, Function btnOneOnTap, Function btnTwoOnTap, String stockTickersymbol}) {
    return modalBottomSheet(
      mainColor: AppColors.alizarin,
      isDimissible: true,
      enableDrag: true,
      context: context,
      title: 'Remover ativo',
      subtitle: 'Deseja realmente remover o ativo $stockTickersymbol da sua lista de ativos monitorados?',
      btnOneLable: 'Sim, remover ativo',
      btnOneOnTap: btnOneOnTap,
      btnTwoLable: 'Cancelar',
      btnTwoOnTap: btnTwoOnTap,
    );
  }

  static wrongPasswordOrEmail({BuildContext context, Function btnOneOnTap}) {
    return modalBottomSheet(
      mainColor: AppColors.alizarin,
      isDimissible: true,
      enableDrag: true,
      context: context,
      imageURL: 'assets/images/wrong_pass.png',
      imageHeight: 250,
      imageWidth: 250,
      title: 'Login Inválido!',
      subtitle: 'O e-mail ou senha digitado está incorreto, por favor verifique os dados e tente novamente.',
      btnOneLable: 'Tentar novamente',
      btnOneOnTap: btnOneOnTap,
    );
  }
}

modalBottomSheet({
  @required BuildContext context,
  Color mainColor,
  String key,
  double imageHeight,
  double imageWidth,
  String imageURL,
  String title,
  String subtitle,
  String btnOneLable,
  String btnTwoLable,
  Function btnOneOnTap,
  Function btnTwoOnTap,
  bool isDimissible = false,
  bool enableDrag = false,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    isDismissible: isDimissible,
    enableDrag: enableDrag,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    backgroundColor: AppColors.white,
    context: context,
    builder: (context) {
      return ModalBottomSheet(
        key: Key(key),
        btnOneLable: btnOneLable,
        btnOneOnTap: btnOneOnTap,
        btnTwoLable: btnTwoLable,
        btnTwoOnTap: btnTwoOnTap,
        imageHeight: imageHeight,
        imageURL: imageURL,
        imageWidth: imageWidth,
        isDismissible: isDimissible,
        mainColor: mainColor,
        subtitle: subtitle,
        title: title,
      );
    },
  );
}

class ModalBottomSheet extends StatefulWidget {
  final Color mainColor;
  final bool isDismissible;
  final double imageHeight;
  final double imageWidth;
  final String imageURL;
  final String title;
  final String subtitle;
  final String btnOneLable;
  final String btnTwoLable;
  final Function btnOneOnTap;
  final Function btnTwoOnTap;

  const ModalBottomSheet(
      {Key key,
      this.mainColor,
      this.isDismissible,
      this.imageHeight,
      this.imageWidth,
      this.imageURL,
      this.title,
      this.subtitle,
      this.btnOneLable,
      this.btnTwoLable,
      this.btnOneOnTap,
      this.btnTwoOnTap})
      : super(key: key);
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.isDismissible ?? true,
      child: Container(
        padding: EdgeInsets.only(top: widget.imageURL != null ? 16.h : 48.h, bottom: 48.h, left: 36.w, right: 36.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (widget.imageURL != null)
              Image.asset(
                widget.imageURL,
                height: widget.imageHeight.h ?? 250,
                width: widget.imageWidth.w ?? 250,
                fit: BoxFit.contain,
              ),
            Visibility(
              visible: widget.title != null,
              child: Text(
                widget.title ?? '',
                style: AppTextStyle.h6(color: widget.mainColor ?? AppColors.tiber, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Visibility(
              visible: widget.subtitle != null,
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  widget.subtitle ?? '',
                  style: AppTextStyle.p(color: AppColors.grey110),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Visibility(
              visible: widget.btnOneLable != null,
              child: Padding(
                padding: EdgeInsets.only(top: 36.h),
                child: AppFlatButton(
                  color: AppColors.alizarin,
                  width: 303.w,
                  lable: widget.btnOneLable ?? '',
                  onPressed: widget.btnOneOnTap ?? null,
                ),
              ),
            ),
            Visibility(
              visible: widget.btnTwoLable != null,
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  child: AppTextButton(
                    lable: widget.btnTwoLable ?? '',
                    onPressed: widget.btnTwoOnTap ?? null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
