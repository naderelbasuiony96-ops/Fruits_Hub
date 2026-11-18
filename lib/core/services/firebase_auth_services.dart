import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword:${e.toString()}and code is ${e.code}",
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: "الرقم السري أو البريد الالكتروني غيؤ صحيح",
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: "الرقم السري أو البريد الالكتروني غيؤ صحيح",
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "تأكد من الاتصال بالانترنت ");
      } else {
        throw CustomException(
          message: "لقد حدث خطأ ما . الرجاء المحاولة مرة آخري",
        );
      }
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword.${e.toString()} ",
      );
      throw CustomException(
        message: "لقد حدث خطأ ما . الرجاء المحاولة مرة آخري",
      );
    }
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User> signInWithGoogle() async {
    try {
      //sign in user
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw CustomException(
          message: "لقد حدث خطأ ما . الرجاء المحاولة مرة آخري",
        );
      }
      // personl information about user
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      //creat card of user
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // send your card to firebase
      return (await _auth.signInWithCredential(credential)).user!;
    } catch (e) {
      log(
        "Exception in FirebaseAuthService.signInWithEmailAndPassword.${e.toString()} ",
      );
      throw CustomException(
        message: "لقد حدث خطأ ما . الرجاء المحاولة مرة آخري",
      );
    }
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }
}
