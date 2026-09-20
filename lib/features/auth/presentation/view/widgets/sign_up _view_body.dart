import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/do_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/terms_conditions.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: "الاسم كامل",
                textInputType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "البريد الإكتروني ",
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: "كلمة المرور",
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFFC9CECF),
                ),
              ),
              SizedBox(height: 16),
              TermsAndConditions(),
              SizedBox(height: 30),
              CustomButton(onPressed: () {}, text: "إنشاء حساب جديد "),
              SizedBox(height: 30),
              DoHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
