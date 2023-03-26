import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rencontre/Views/Profile/add_profile.dart';
import 'package:rencontre/Views/home/home_screen.dart';


class AuthController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  void login({String? email, String? password}) {
    isLoading(true);

    auth.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      /// Login Success
       Get.to(()=> HomeScreen());
      isLoading(false);
      //Get.to(() => BottomBarView());
    }).catchError((e) {
      isLoading(false);
      Get.snackbar('Error', "$e");

      ///Error occured
    });
  }

  void signUp({String? email, String? password}){
    ///ici, nous devons fournir deux choses
    ///1- email
    ///2- password

    auth.createUserWithEmailAndPassword(email: email!, password: password!)
    .then((value){
      /// Naviguer l'utilisateur vers l'écran de profil
      Get.to(() => ProfileScreen());
    }).catchError((e){
      /// afficher les informations d'erreur
      print("Erreur d'authentification $e");
    });
  }

}