import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Report'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
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
              child: Text('DASHBOARD',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GridView.extent(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 200.0,
              children: <Widget>[
                // Information of first container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/complaint');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/fir.jpg'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'FIR',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Information of second container
                GestureDetector(
                  onTap: () async {
                    const url =
                        'https://www.google.com/search?sxsrf=APwXEdf0CNJ6Thm48GLWh4u9rHqJcDnTqg:1680191181500&q=police+station+near+me&npsic=0&rflfq=1&rldoc=1&rllag=22758791,75886329,1206&tbm=lcl&sxsrf=APwXEdf0CNJ6Thm48GLWh4u9rHqJcDnTqg:1680191181500&sa=X&ved=2ahUKEwi5oJz0_4P-AhWGUWwGHWSBAQsQtgN6BAgUEAE&biw=1707&bih=828&dpr=1.13#rlfi=hd:;si:;mv:[[22.843020471970263,76.13365580480958],[22.62960232380316,75.69179942053223]]';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/map.png'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'MAP',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                // Information of third container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/lists');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/complaints.png'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'COMPLAINTS',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                // Information of fourth container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/news');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/news.png'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'NEWS',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Information of fifth container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/about.png'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'ABOUT',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                // Information of sixth container
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/helpline');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/helpline.png'),
                            radius: 50,
                          ),
                        ),
                        Text(
                          'HELPLINE',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
