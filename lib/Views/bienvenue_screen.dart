 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rencontre/Views/auth/connexion_inscription.dart';


class BienvenueScreen extends StatelessWidget {
  const BienvenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            SizedBox(
              height: 50,
            ),

            Text("Bienvénue  !!",style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            ),

           /* SizedBox(
              height: 5,
            ),

            Text("Système de Gestion des Evènements",style: TextStyle(fontSize: 16),),
*/
            SizedBox(
              height: 50,
            ),

            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Image.asset('assets/onboardIcon.png'),
            ),

            SizedBox(
              height: 50,
            ),


              Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 2
                      )
                    ],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16),topLeft: Radius.circular(16))
                ),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Text("Achétez  et recevez votre ticket  dépuis chez vous en toute confiance",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Text("Kaleme est une application qui permet aux utilisateurs de créer, découvrir, partager et monétiser des événements ou des services.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),



                      Padding(
                        padding: EdgeInsets.only(
                            left: 30,
                            right: 30
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          color: Colors.orange,
                          elevation: 4,
                          height: 50,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ConnexionInscription()));
                            },

                          child: Text("Continuer",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      ),

                    ],
                ),

              ),
              ),

          ],

        ),
      ),
    )
    );
  }
}
