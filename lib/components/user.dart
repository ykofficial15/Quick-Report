import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quick_report/main.dart';
import 'package:quick_report/registration/home_page.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  File? _image;
  
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection('users');
  final User? user = FirebaseAuth.instance.currentUser;
  late String uid = user!.uid;
   final currentUserEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Report'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'LogOut',
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
          );
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(13, 0, 0, 255),
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width),
              child: Text('PROFILE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(13, 0, 0, 255),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: (MediaQuery.of(context).size.width),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/police.jpg',
                    ),
                  ),
                  SizedBox(height: 10),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('userid')
                        .doc(uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      final username = data['username'] as String;

                      return Center(
                        child: Text(
                          '$username',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 202, 118, 0),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
      Container   ( 
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
          Expanded( child:Container (
               margin:EdgeInsets.all(5),
            child:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: currentUserEmail).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final docs = snapshot.data!.docs;
          final count = docs.length;
          return Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                  ),
                  child: Text(
                    'Your Complaints\n $count',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
        },
      ),)),
            Expanded(
              child:Container(   
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin:EdgeInsets.all(5),
                child:StreamBuilder<QuerySnapshot>(
              stream: myCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
                int totalRows = snapshot.data?.size ?? 0;
                return Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlue,
                  ),
                  child: Text(
                    'Total Complaints\n $totalRows',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                );
              },
            ),),),],
            ),),
          ],
        ),
      ),
    );
  }
}
