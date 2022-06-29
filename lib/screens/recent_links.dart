import 'package:bub_it/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/components.dart';

class RecentLinks extends StatefulWidget {
  const RecentLinks({Key? key}) : super(key: key);

  @override
  State<RecentLinks> createState() => _RecentLinksState();
}

class _RecentLinksState extends State<RecentLinks> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: ((context, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  BezierHeaderCurves(),
                  // SizedBox(height: 30.h,),
                  RecentUrls(),
                  RecentUrlComponent(),
                ],
              )

            ],
          ),
        )
      );

        }));
  }
}














