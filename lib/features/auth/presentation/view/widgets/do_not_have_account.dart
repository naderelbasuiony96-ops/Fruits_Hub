import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class DovNotHaveAccount extends StatelessWidget {
  const DovNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'لا تمتلك حساب؟ ',
        style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A68)),
        children: [
          TextSpan(
            text: "قم بإنشاء حساب",
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
