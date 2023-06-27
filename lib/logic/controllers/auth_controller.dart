import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/routes.dart';
import '../../view/widgets/snackbar_widget.dart';

class AuthController extends GetxController {
  bool isVisibility = false;

  void visibilityFun() {
    isVisibility = !isVisibility;
    update();
  }

  bool isCheck = false;
  void checkBox() {
    isCheck = !isCheck;
    update();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage authBox = GetStorage();
  String authKey = 'authKey';
  void signUp({
    required String emailController,
    required String passwordController,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: emailController,
            password: passwordController,
          )
          .then(
            (value) => auth.currentUser!.updateDisplayName('Abdulrahman'),
          );
      snackbarWidget(title: 'SIGN UP', message: 'Successfully Registered');
      authBox.write(authKey, true);
      update();
      Get.offNamed(RoutesName.mainScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        snackbarWidget(
            title: 'Weak Password',
            message: 'Choose a strong password of more than 8 characters');
      } else if (e.code == 'email-already-in-use') {
        snackbarWidget(
          title: 'Error',
          message: 'The account already exists for that email',
        );
      } else {
        snackbarWidget(
            title: 'Error',
            message: e.toString().replaceAll('-', ' ').capitalize!);
      }
    } catch (e) {
      snackbarWidget(
          title: 'Error',
          message: e.toString().replaceAll('-', ' ').capitalize!);
    }
  }

  void login({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      snackbarWidget(title: 'login sussufl', message: 'message');
      authBox.write(authKey, true);
      update();

      Get.offNamed(RoutesName.mainScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackbarWidget(title: 'user not found', message: 'Shod be user found');
      } else if (e.code == 'wrong-password') {
        snackbarWidget(
            title: 'wrong password', message: 'Shod be password true');
      } else {
        snackbarWidget(
            title: 'Error',
            message: e.toString().replaceAll('-', ' ').capitalize!);
      }
    } catch (e) {
      snackbarWidget(
          title: 'Error',
          message: e.toString().replaceAll('-', ' ').capitalize!);
    }
  }

  void restPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      snackbarWidget(
          title: 'Reset the password',
          message: 'The password has been reset successfully');
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackbarWidget(title: 'user not found', message: 'Shod be user found');
      } else if (e.code == 'wrong-password') {
        snackbarWidget(
            title: 'wrong password', message: 'Shod be password true');
      } else {
        snackbarWidget(
            title: 'Error',
            message: e.toString().replaceAll('-', ' ').capitalize!);
      }
    } catch (e) {
      snackbarWidget(
          title: 'Error',
          message: e.toString().replaceAll('-', ' ').capitalize!);
    }
  }

  var googleSignIn = GoogleSignIn();
  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      authBox.write(authKey, true);
      update();
    } catch (e) {
      snackbarWidget(
        title: 'Error',
        message: e.toString().replaceAll('-', ' ').capitalize!,
      );
    }
  }

  signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      authBox.remove(authKey);
      update();
      Get.offNamed(RoutesApp.welcome);
    } catch (e) {
      snackbarWidget(
        title: 'Error',
        message: e.toString().replaceAll('-', ' ').capitalize!,
      );
    }
  }
}
