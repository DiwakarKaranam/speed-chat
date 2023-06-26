import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat.dart';
import 'home.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController x =TextEditingController();
  TextEditingController y =TextEditingController();
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text('Enter user id and password to signup ',style: TextStyle(color: Colors.grey,fontSize: 20),),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: x,
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
                controller: y,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                  labelText: '    password',

                ),
              )),
          DelayedDisplay(
            delay: Duration(milliseconds: 100),
            child: Container(
              width: (MediaQuery.of(context).size.width)*0.35,
              height: (MediaQuery.of(context).size.width)*0.1,
              child: ElevatedButton(

                  child: Text('Signup',style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: () async {
                        final u=await _auth.createUserWithEmailAndPassword(email: x.text, password: y.text);
                        if(u!=null){
                        Navigator.push(context,MaterialPageRoute (
                          builder: (BuildContext context) => ChatScreen(),
                        ),
                        );}
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



        ],
      ),
    );
  }
}
