import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';




//bhai validation ke liye jo karna hai kar code me jaise edit
// karna hai kar bus database ki gaand ungli mat karna 
//kyunki ab pura app dynamic hai tu waha change karega or changes
//saare related apps me honge to dhyaan rakhna is baat ka
//tujhe agar kuch lag raha hai to apna database bana or test kar
// "yogx" wale database ko tum me se koi bhi chuna mat
// -YOGESH KUMAWAT




class complaint extends StatelessWidget {
  const complaint({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      final user = FirebaseAuth.instance.currentUser;
final uid = user!.email;

     final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
   final _fatherController = TextEditingController();
  final _mobileController = TextEditingController();
   final _firController = TextEditingController();
  final _officerController = TextEditingController();
   final _aadharController = TextEditingController();
  final _descController = TextEditingController();
  
final firestore=FirebaseFirestore.instance;
sendEmail(String name,String email,String father,String mobile,String fir,String officer,String aadhar,String desc) async{
  final Email emails=Email(
    body:name,
    subject:desc,
    recipients:['reportquick91@gmail.com'],
    isHTML:false,
  );
  await FlutterEmailSender.send(emails);
}

    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Report'),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child:Column(
          children: [
            
            SizedBox(
              height: 20,
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(13, 0, 0, 255),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width),
              child: Text('COMPLAINT FORM',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                   controller: _fatherController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your fathers name',
                  labelText: 'Fathers Name',
                ),
              ),
            ),       

            Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                      hintText: "Enter your mobile number",
                      icon: Icon(Icons.phone_iphone),
                    ),),),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.mail),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _firController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.article_outlined),
                  hintText: 'S-375',
                  labelText: 'FIR Section',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _officerController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.local_police_outlined),
                  hintText: 'Enter officers name',
                  labelText: 'Officer name',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                controller: _aadharController,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.document_scanner_outlined),
                  hintText: 'Enter Aadhar Card Number',
                  labelText: 'Aadhar Card ',
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                controller: _descController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Elaborate the FIR",
                  labelText: "FIR Description",
                  icon: const Icon(Icons.description),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
               onPressed: () {
                 Map<String,dynamic> data ={
                 "name":_nameController.text,
                 "father":_fatherController.text,
                 "mobile":_mobileController.text,
                 "email":_emailController.text,
                 "fir":_firController.text,
                 "officer":_officerController.text,
                 "aadhar":_aadharController.text,
                 "desc":_descController.text,
                 "uid":uid,
                 };
FirebaseFirestore.instance.collection("users").add(data);

Fluttertoast.showToast(msg: "Complaint submitted successfully",
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
backgroundColor: Colors.blue,
textColor: Colors.white);

_formKey.currentState!.save();
print('${_emailController.text}');
sendEmail(     _nameController.text,
                 _fatherController.text,
                _mobileController.text,
                 _emailController.text,
                 _firController.text,
                _officerController.text,
                 _aadharController.text,
                _descController.text);
              },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),),

            SizedBox(
              height: 20,
            ),

          ],
        ),),
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
