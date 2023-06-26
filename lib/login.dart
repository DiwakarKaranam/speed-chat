import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:speed_chat/chat.dart';
import 'package:speed_chat/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';
import 'signup.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth=FirebaseAuth.instance;
  TextEditingController a= TextEditingController();
  TextEditingController b= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage('https://thumbs.dreamstime.com/b/design-can-be-used-as-logo-icon-as-complement-to-design-mail-speed-logo-icon-design-127653631.jpg'),
              radius: 70,
              backgroundColor: Colors.white,
            ),
        SizedBox(
          width: 250.0,

          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 30,
              fontWeight:FontWeight.bold,
              color: Colors.blueAccent,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('   🚀 Speed Chat'),
              ],

            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('Enter user id and password to login',style: TextStyle(color: Colors.grey,fontSize: 20),),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: a,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    labelText: '    user id',
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
              controller: b,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                    labelText: '    password',

                  ),
            )),
            DelayedDisplay(
              delay: Duration(milliseconds: 1750),
              child: Container(
                width: (MediaQuery.of(context).size.width)*0.35,
                height: (MediaQuery.of(context).size.width)*0.1,
                child: ElevatedButton(

                  child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: () async {
                    auth.signInWithEmailAndPassword(
                      email: a.text,
                      password: b.text,
                    ).then((value){ Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen()),
                    );}).onError((error, stackTrace) {print('${error.toString()}');});

                  },
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(20),
                        ),
                        elevation:10,
                    )
                    ),

                ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(onTap: () {
              Navigator.push(context,  MaterialPageRoute (
                builder: (BuildContext context) => const Signup(),
              ),
              );
            },
                child: Text('Did not have an account Signup',style: TextStyle(decoration: TextDecoration.underline,fontSize: 20,color: Colors.blue),)

            )

          ],
        ),
      ),
    );
  }
}
