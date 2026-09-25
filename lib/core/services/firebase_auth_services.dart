import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthServices.createUserWithEmailAndPassword:${e.toString()} and code is ${e.code} ",
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: "الرقم السري ضعيف جدًا ");
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: "لقد قمت بالتسجيل مسبقًا. الرجاء تسجيل الدخول",
        );
      } else if (e.code == "network-request-failed") {
        throw CustomException(message: "تأكد من اتصالك بالانترنت");
      } else {
        throw CustomException(message: " حدث خطأ ما. الرجاء المحاولة مرة آخري");
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthServices.createUserWithEmailAndPassword:${e.toString()}",
      );
      throw CustomException(message: " حدث خطأ ما. الرجاء المحاولة مرة آخري ");
    }
  }
}
