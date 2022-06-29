import 'package:bub_it/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colours.dart';
import 'homepage.dart';

class DetailedStats extends StatefulWidget {
  const DetailedStats({Key? key}) : super(key: key);

  @override
  State<DetailedStats> createState() => _DetailedStatsState();
}

class _DetailedStatsState extends State<DetailedStats> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: ((context, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFFFFBF5),
            body: Stack(
              children: [
                const Background(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppBalDetail(),
                      SizedBox(
                        height: 8.h,
                      ),
                      const BackHome(),
                      SizedBox(height: 30.h),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                //  blurRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                        child: Text(
                          'Detailed Stats',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      const FaceBookLink(),
                      SizedBox(height: 20.h),
                      Text(
                        'The total number of clicks that your link has received do far:',
                        style: TextStyle(
                            color: Colors.grey.shade800, fontSize: 16.sm),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.w),
                            margin: EdgeInsets.symmetric(
                                vertical: 4.h, horizontal: 110.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: butColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '88',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                  fontSize: 30.sm),
                            ),
                          ),
                          Text(
                            'Clicks',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                                fontSize: 15.sm),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 280.h,
                        // padding: EdgeInsets.symmetric(
                        // //     vertical: 15.h, horizontal: 30.w),
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   borderRadius: BorderRadius.circular(8),
                        //   border: Border.all(
                        //     color: Colors.grey.shade300,
                        //     width: 1,
                        //   ),
                        // ),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ]),
                        child: SingleChildScrollView(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //SizedBox(height: 20.h),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Location',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                        fontSize: 18.sm),
                                  ),
                                  Text(
                                    'Timestamp',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800,
                                        fontSize: 18.sm),
                                  ),
                                ],
                              ),

                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              const LocationTimestamp(
                                name: 'Edoki Chuks',
                                time: '2',
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}

class FaceBookLink extends StatelessWidget {
  const FaceBookLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.hvac_rounded,
          color: Colors.grey.shade700,
          size: 35.h,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Facebook',
              style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sm),
            ),
            Text(
              'bub.junyong.me/floral98',
              style: TextStyle(
                  color: butColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sm),
            ),
          ],
        ),
      ],
    );
  }
}

class BackHome extends StatelessWidget {
  const BackHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(160, 45),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: butColor, width: 1.5),
            //to set border radius to button
            borderRadius: BorderRadius.circular(10)),
        primary: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios_outlined,
            color: butColor,
            size: 12.sm,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            'Back to My URLs',
            style: TextStyle(
                color: butColor, fontWeight: FontWeight.bold, fontSize: 14.sm),
          ),
        ],
      ),
    );
  }
}

class LocationTimestamp extends StatelessWidget {
  final String name;
  final String time;
  const LocationTimestamp({
    Key? key,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
      margin: EdgeInsets.symmetric(
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              //  blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.person_outline,
                color: Colors.grey.shade800,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                name,
                maxLines: 2,
                softWrap: true,
                textDirection: TextDirection.rtl,
                style: TextStyle(

                    //  fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    fontSize: 18.sm),
              ),
              SizedBox(
                width: 25.w,
              ),
            ],
          ),

          // Icon(Icons.person_outline),
          Text(
            '$time hours ago',
            style: TextStyle(
                //     fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontSize: 18.sm),
          ),
          SizedBox(
            width: 1.w,
          ),
        ],
      ),
    );
  }
}
