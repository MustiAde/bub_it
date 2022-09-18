import 'dart:convert';

import 'package:bub_it/constants/colours.dart';
import 'package:bub_it/constants/widgets.dart';
import 'package:bub_it/screens/not_found.dart';
import 'package:bub_it/screens/recent_links.dart';
import 'package:bub_it/screens/redirect_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'detailed_stats.dart';

final longUrlController = TextEditingController();
final shortUrlController = TextEditingController();
final aliasController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 800),
        builder: ((context, child) {
          return Scaffold(
              backgroundColor: Color(0xFFFFFBF5),
              body: Stack(
                children: [
                  Background(),
                  AppBal(),
                  Center(
                    child: Container(
                      width: 320.h,
                      height: 370.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 30,
                                offset: Offset(0, 10))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 320.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.link),
                                Text(
                                  'Enter your long URL here',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sm),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            controller: longUrlController,
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.link),
                              Text(
                                'Customize your link',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sm),
                              ),
                            ],
                          ),
                          Container(
                            // height: 60.h,
                            // width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(width: .4),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    'https://shorturl22.herokuapp.com',
                                    style: TextStyle(fontSize: 13.sm),
                                  ),
                                ),
                                Container(
                                  // height: 60.w,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: TextField(
                                    controller: aliasController,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        hintText: 'alias',
                                        isDense: true,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RecentLinks()));
                                  },
                                  child: Text(
                                    'My URL',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      await callShortenUrl();

                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Result();
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(130.h, 45.h),
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      primary: Color(0xFF80593B),
                                    ),
                                    child: Text(
                                      'Bub it',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.sm),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Text('Temporary buttons for the QA team'),
                        Text("Backend didn't drop APIs for these pages"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              child: Text(
                                'Error 404 Page',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFFA1887F)),
                              ),
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFFA1887F), width: 2),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NotFound()));
                              },
                            ),
                            ElevatedButton(
                              child: Text(
                                'Redirect Page',
                                style: GoogleFonts.poppins(
                                    color: const Color(0xFFA1887F)),
                              ),
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFFA1887F), width: 2),
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RedirectPage()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        }));
  }

  callShortenUrl() async {
    String longUrl = longUrlController.text;
    final String shortUrl = await shortLink(longUrl);
    shortUrlController.text = shortUrl;
    return shortUrl;
  }

  Future<String> shortLink(String longUrl) async {
    String apiLink = 'https://shorturl22.herokuapp.com/api/url/shorten';
    final response = await http.post(
      Uri.parse(apiLink),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      },
      body: json.encode({"longUrl": longUrl}),
    );

    if (response.statusCode == 200) {
      final Result = jsonDecode(response.body);

      final String ourShortLink = Result['shortUrl'].toString();
      return ourShortLink;
    } else {
      return 'There was an error ${response.body}';
    }
  }
}
