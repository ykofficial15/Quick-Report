// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class news extends StatefulWidget {
  @override
  _newsState createState() => _newsState();
}

class _newsState extends State<news> {
  List articles = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=fa2d47ce701f4dfab2b11ed02f3b8ccb&pageSize=100'));
    if (response.statusCode == 200) {
      setState(() {
        articles = json.decode(response.body)['articles'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
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
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width),
              child: Text('TOP HEADLINES',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            // ignore: deprecated_member_use
                            if (await canLaunch(article['url'])) {
                              await launch(article['url']);
                            } else {
                              throw 'Could not launch url';
                            }
                          },
                          child: Column(children: [
                            Image.network(article['urlToImage']),
                            ListTile(
                              title: Text(
                                article['title'],
                                style: TextStyle(color: Colors.blue),
                              ),
                              subtitle: Text(
                                article['description'],
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
