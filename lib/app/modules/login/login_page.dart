import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stocks_io/core/widgets/app_flat_button.dart';
import 'package:stocks_io/core/widgets/app_text_form_field.dart';
import 'package:stocks_io/themes/app_colors.dart';
import 'package:stocks_io/themes/app_text_style.dart';
import 'login_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  var formKey = GlobalKey<FormState>();
  var emailFocusNode = FocusNode();
  var emailController = TextEditingController();
  var passwordFocusNode = FocusNode();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 128.h),
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo_large.png',
                  height: 80.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 48.h),
              child: Text(
                'Olá',
                style: AppTextStyle.h5(
                  fontWeight: FontWeight.bold,
                  color: AppColors.tiber,
                ),
              ),
            ),
            Text(
              'Para começar, digite seu e-mail',
              style: AppTextStyle.h6(
                fontWeight: FontWeight.bold,
                color: AppColors.grey110,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  AppTextFormField(
                    padding: EdgeInsets.only(top: 32.h),
                    focusNode: emailFocusNode,
                    onFieldSubmitted: () => passwordFocusNode.requestFocus(),
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    validatorText: 'E-mail inválido, por favor digite um email válido',
                    suffixIcon: Icon(Icons.mail_outline),
                  ),
                  AppTextFormField(
                    padding: EdgeInsets.only(top: 32.h),
                    focusNode: passwordFocusNode,
                    onFieldSubmitted: () {},
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    labelText: 'Senha',
                    validatorText: 'Sua senha deve ter no mínimo 6 caracteres',
                    suffixIcon: Icon(Icons.lock_outline),
                    obscureText: true,
                  )
                ],
              ),
            ),
            AppFlatButton(
              padding: EdgeInsets.only(left: 16.sp, right: 16.sp, top: 48.sp),
              lable: 'Continuar',
              onPressed: () {
                if (formKey.currentState.validate()) {
                  Modular.to.pushReplacementNamed('/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
