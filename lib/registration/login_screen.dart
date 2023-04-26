import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_report/components/bottom_navigation.dart';
import 'package:quick_report/registration/smooth.dart';
import 'package:quick_report/registration/home_page.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_report/registration/signup_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  late String _email, _password;

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> BottomNavigation()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
           Fluttertoast.showToast(
        msg: "User not found for that email",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
        } else if (e.code == 'wrong-password') {
           Fluttertoast.showToast(
        msg: "Entered wrong password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
       child: Container(
         padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/app_bg.png'),
      fit: BoxFit.cover,
    ),),
        child: Form(
          key: _formKey,
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160.0,),
                const   Text('Quick Report', style:TextStyle(color:Colors.blue,fontSize: 20.0,
        fontWeight: FontWeight.bold,
        ),),
     const   Text('Login to Our App',style:TextStyle(
          color:Colors.black,
          fontSize:30.0,
        fontWeight: FontWeight.bold,
        ),),
        const SizedBox(height: 44.0,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                 decoration: const InputDecoration(
hintText:"Enter your email",
labelText: "User Email",
prefixIcon: Icon(Icons.mail,color:Colors.blue),
           ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
               const SizedBox(height:26.0,),
              TextFormField(
                obscureText: true,
              decoration: const InputDecoration(
          hintText: "Enter your password",
          labelText: "User Password",
          prefixIcon: Icon(Icons.lock,color:Colors.blue,)
        ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
               const SizedBox(height: 8.0,),
       Row(children:[    const Text('Dont Remember your password?  ',style:TextStyle(color:Colors.black),
        ),
        GestureDetector(
onTap:(){
  Navigator.push(
  context,
  SmoothPageRoute(
    child: SignupPage(),
  ),
);
},
child:Text('Register Now',style:TextStyle(color:Colors.blue,fontWeight:FontWeight.bold),
      ), ),]),
   
        const SizedBox(height:88.0,),
             Container (
                 width:double.infinity,
              child:RawMaterialButton(
          fillColor: const Color(0xFF0069FE),
          elevation:0.0,
          padding:const  EdgeInsets.symmetric(vertical:20.0),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: _signIn,
      child:const Text("Login",style:TextStyle(color:Colors.white,fontSize:18.0,),),),),
   
          
            ],
          ),
        ),),
      );
  }
}
