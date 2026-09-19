import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/social_button_login.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/do_not_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/or_divider.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.visibility, color: Color(0xFFC9CECF)),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ),
              SizedBox(height: 32),
              CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
              SizedBox(height: 33),
              DovNotHaveAccount(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 32),
              SocialButtonLogin(
                onPressed: () {},
                title: "تسجيل بواسطة جوجل",
                image: Assets.imagesGoogleIcon,
              ),
              SizedBox(height: 16),
              SocialButtonLogin(
                onPressed: () {},
                title: "تسجيل بواسطة آبل",
                image: Assets.imagesApplIcon,
              ),
              SizedBox(height: 16),
              SocialButtonLogin(
                onPressed: () {},
                title: "تسجيل بواسطةفيسبوك",
                image: Assets.imagesFacebookIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
