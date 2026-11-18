import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_function/build_error_bar.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_In_Cubit/sign_in_cubit.dart';
import 'package:fruits_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
        } else if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
          isLoading: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
