import 'package:bub_it/constants/widgets.dart';
import 'package:bub_it/screens/recent_links.dart';
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
                SingleChildScrollView(
                  child: Container(
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
                        const NumbersOfClicks(),
                        SizedBox(height: 20.h),
                        Container(
                          height: 280.h,
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
                            child: Table(
                              columnWidths: const {0: FlexColumnWidth(0.4)},
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800,
                                          fontSize: 18.sm),
                                    ),
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
                                namesList(name: 'Edoki Chuks', time: '1'),
                                namesList(name: 'Musti Adekule', time: '4'),
                                namesList(name: 'Mj Don', time: '3'),
                                namesList(name: 'Praise Johnson', time: '1'),
                                namesList(
                                    name: 'A very long name Chuks', time: '10'),
                                namesList(name: 'Isaac Frances', time: '3'),
                                namesList(name: 'Mercy Garfield', time: '9'),
                                namesList(name: 'Edoki Chuks', time: '2'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }

  TableRow namesList({required String name, required String time}) {
    return TableRow(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(0, 2),
            ),
          ]),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Icon(
            Icons.person_outline,
            color: Colors.grey.shade800,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.grey.shade800, fontSize: 16.sm),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '$time hours ago',
            style: TextStyle(
                //     fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
                fontSize: 18.sm),
          ),
        ),
      ],
    );
  }
}

class NumbersOfClicks extends StatelessWidget {
  const NumbersOfClicks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 110.w),
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
    );
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
            context, MaterialPageRoute(builder: (_) => const RecentLinks()));
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
