import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/do_have_account.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/terms_conditions.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autouvalidateMode = AutovalidateMode.disabled;
  late String email, name, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autouvalidateMode,
            child: Column(
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: "الاسم كامل",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "البريد الإكتروني ",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 16),
                TermsAndConditions(
                  onChanged: (value) {
                    isTermsAccepted = value;
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              name,
                            );
                      } else {
                        buildErrorBar(
                          context,
                          "يجب عليك الموافقة علي الشروط والأحكام",
                        );
                      }
                    } else {
                      setState(() {
                        autouvalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "إنشاء حساب جديد ",
                ),
                SizedBox(height: 30),
                DoHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
