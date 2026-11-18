import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_In_Cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/widgets/SignIn_View_Body_Bloc_Consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'login_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
