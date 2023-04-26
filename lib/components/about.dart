import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Quick Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color.fromARGB(13, 0, 0, 255),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Quick report is an mobile application which allows to fire an FIR through the app Police can add the details and the complaint of the user.All the details related to a particular user will be saved in the database.Once the FIR is fired the user can see their details and all the complaints which he/she has filed..',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Our Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color.fromARGB(13, 0, 0, 255),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Our team is made up of some of the most talented developers and designers in the industry. We work tirelessly to ensure that Flutter remains the best choice for mobile app development, and we\'re always looking for ways to improve and expand the platform.'
                  '                                                          '
                  'Team Members :- Shobhit Dwivedi,Shivam Prajapati,Yogesh kumawat,Blesson Jacob Sunil',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color.fromARGB(13, 0, 0, 255),
                padding: EdgeInsets.all(10),
                child: Text(
                  'If you have any questions or comments about Quick Report, we\'d love to hear from you. Feel free to contact us using the information on this page, and be sure to follow us on social media to stay up-to-date with the latest news and developments.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Version:1.0.0',
                    textAlign: TextAlign.center,
                  )),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'www.quickreport.com',
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
