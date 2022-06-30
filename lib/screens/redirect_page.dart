import 'package:bub_it/constants/widgets.dart';
import 'package:bub_it/screens/recent_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage.dart';

class Redirect extends StatefulWidget {
  const Redirect({Key? key}) : super(key: key);

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Text(
          "Bub-It",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),*/
      body: Center(
        child: Image.asset('flying.png'),
      ),
    );
  }
}
