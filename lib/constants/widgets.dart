import 'package:bub_it/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/detailed_stats.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBF5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/top.png'),
              ],
            ),
            Row(
              children: [
                Image.asset('assets/bottom.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppBal extends StatelessWidget {
  const AppBal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200.h,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: butColor,
              ))
        ],
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(28.0, 10, 0, 0),
          child: Text(
            'Bub-It',
            style: TextStyle(
                color: Color(0xFF80593B),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
        ));
  }
}

class AppBalDetail extends StatelessWidget {
  const AppBalDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 200.h,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: Text(
            'Bub-It',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              height: 1.5,
              color: Colors.grey.shade800,
            ),
          ),
        ));
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Color(0xFFFFFBF5),
        width: 330.h,
        height: 300.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            const Text(
              'Your Shortened \nBub-URL:',
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10))
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Text(
                        'bub.junyong.me/floral98',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      // height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: butColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(60),
                              bottomRight: Radius.circular(60))),
                      child: const Center(
                        child: Icon(
                          Icons.copy_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DetailedStats()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 45),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: butColor, width: 2),
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(10)),
                    primary: Colors.white,
                  ),
                  child: Text(
                    'Detailed stats',
                    style: TextStyle(
                        color: butColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sm),
                  )),
            ),
            Spacer(),
            Center(
              child: Text(
                'My URLs',
                style: TextStyle(
                    fontSize: 14.h, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
