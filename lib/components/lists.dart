import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final user = FirebaseAuth.instance.currentUser;
    final myemail = user?.email ?? 'Unknown';
    

    Future<List<DocumentSnapshot>> getUsers() async {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: myemail).get();
      return querySnapshot.docs;
    }

    return Scaffold(
        appBar: AppBar(title: Text('Quick Report')),
        body: FutureBuilder<List<DocumentSnapshot>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error!');
              } else {
                List<DocumentSnapshot> documents = snapshot.data!;
                return SingleChildScrollView(
                    // physics: ScrollPhysics(),
                  child:Column(
                    children:[
                         Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(13, 0, 0, 255),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width),
              child: Text('COMPLAINTS',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data =
                        documents[index].data() as Map<String, dynamic>;
                    return Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: ListTile(
                          title: Text(
                            data['name'],
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['email'],
                                style: TextStyle(color: Color.fromARGB(255, 33, 100, 255)),
                              ),
                              Text(data['desc']),
                            ],
                          ),
                        ));
                  },
                ),],),);
              }
            } else {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
