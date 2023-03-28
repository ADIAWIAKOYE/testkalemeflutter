import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../Views/Profile/add_profile.dart';
import '../Views/home/home_screen.dart';


class AuthController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  void login(BuildContext context,{String? email, String? password}) {

    isLoading(true);

    auth.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      /// Login Success
      // Get.to(()=> HomeScreen());

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );

      isLoading(false);

      //Get.to(() => BottomBarView());
    }).catchError((e) {
      isLoading(false);
      Get.snackbar('Error', "$e");

      ///Error occured
    });
  }

  void signUp(BuildContext context,{String? email, String? password}){
    ///ici, nous devons fournir deux choses
    ///1- email
    ///2- password
    
   isLoading(true);

    auth.createUserWithEmailAndPassword(email: email!, password: password!)
    .then((value){
      isLoading(false);

      /// Naviguer l'utilisateur vers l'écran de profil
      //Get.to(() => ProfileScreen());

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );

    }).catchError((e){
      /// afficher les informations d'erreur
      
      print("Erreur d'authentification $e");
      
      isLoading(false);
    });
  }

  void forgetPassword(String email) {
    auth.sendPasswordResetEmail(email: email).then((value) {
      // Get.back();
      print('E-mail envoyé avec succès');
    }).catchError((e) {
      print("Erreur d'envoi de l'e-mail de réinitialisation du mot de passe est $e");
    });
  }

  signInWithGoogle() async {
    isLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLoading(false);

      ///SuccessFull loged in
      Get.to(() => HomeScreen());
    }).catchError((e) {
      /// Error in getting Login
      isLoading(false);
      print("Error is $e");
    });

  }


}