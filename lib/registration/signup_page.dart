import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_report/components/bottom_navigation.dart';
import 'package:quick_report/registration/home_page.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_report/registration/login_screen.dart';
import 'package:quick_report/registration/smooth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  final _usernameController = TextEditingController();
    final _emailController = TextEditingController();
      final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:SingleChildScrollView (
        child:Container(
            padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/app_bg.png'),
      fit: BoxFit.cover,
    ),),
          child:Form(
        key: _formKey,
          child:Column(
          children: [
  const SizedBox(height:210,),

Container(
  alignment: AlignmentDirectional.bottomStart,
  child:Text('Are you new to Quick Report?',style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),),
),
Container(
  alignment: AlignmentDirectional.bottomStart,
  child:Text('Register Now',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
),
      const SizedBox(height: 22.0,),

TextFormField(
                       controller: _usernameController,
                         decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.mail,color:Colors.blue),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              ),

  const SizedBox(height:26.0,),
            TextFormField(
                    controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.mail,color:Colors.blue),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),
               const SizedBox(height:26.0,),
            TextFormField(
                    controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.password,color:Colors.blue),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onSaved: (value) {
                _password = value!;
              },
            ),
 const SizedBox(height:88.0,),

         Container  ( 
             width:double.infinity,
          child:RawMaterialButton(
          fillColor: const Color(0xFF0069FE),
          elevation:0.0,
          padding:const  EdgeInsets.symmetric(vertical:20.0),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),

          ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _signup();
                }
              },
              child: Text('Sign up',style:TextStyle(color:Colors.white,fontSize:18.0,),),
            ),)
          ],
        ),),
      ),),
    );
  }
  
  void _signup() async {
        final username = _usernameController.text.trim();
           final email = _emailController.text.trim();
              final password= _passwordController.text.trim();
    try {
      await Firebase.initializeApp();
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      
      final uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('userid').doc(uid).set({
        'username': username,
         'email': email,
          'password': password,
      }) .then((result) {
    // Sign up successful
   Fluttertoast.showToast(
        msg: "Registration successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  });
      // Navigate to the home page after successful signup
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
  Fluttertoast.showToast( 
        msg: "Too weak password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blue,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
        msg: "Email already exists",
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
