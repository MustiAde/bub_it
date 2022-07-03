import 'dart:convert';

import 'package:bub_it/constants/colours.dart';
import 'package:bub_it/constants/widgets.dart';
import 'package:bub_it/screens/recent_links.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final longUrlController = TextEditingController();
  final shortUrlController = TextEditingController();
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
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 30,
                                offset: Offset(0, 10))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 320.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            SizedBox(
                              height: 1.h,
                            ),
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
                              height: 50.h,
                              // width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(width: .4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50.w,
                                    width: 190.h,
                                    child: TextField(
                                      controller: shortUrlController,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                  ),
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(
                                      'alias',
                                      style: TextStyle(fontSize: 13.sm),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RecentLinks()));
                                    },
                                    child: const Text(
                                      'My URL',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        callShortenUrl();
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }

  callShortenUrl() async {
    String longUrl = longUrlController.text;
    final String shortUrl = await ShortLink(longUrl);
    return shortUrl;
  }

  Future<String> ShortLink(String longUrlm) async {
    String apiLink =
        'https://cleanuri.com/api/v1/shorten'; //'https://shorturl22.herokuapp.com/api/url/shorten';
    final response =
        await http.post(Uri.parse(apiLink), body: {"result_url": longUrlm});
    if (response.statusCode == 200) {
      final Result = jsonDecode(response.body);
      print('Linked successfully');
      return Result('result_url');
      'linked success';
    } else {
      print('There is an error: ${response.statusCode}');
      print('${response.body}');
      print('${longUrlController.text}');
      return 'There was an error';
    }
  }
}
