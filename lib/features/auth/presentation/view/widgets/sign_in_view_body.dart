import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_In_Cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/social_button_login.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/do_not_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().signin(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'تسجيل دخول',
              ),
              SizedBox(height: 33),
              DovNotHaveAccount(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 32),
              SocialButtonLogin(
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
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
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
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
