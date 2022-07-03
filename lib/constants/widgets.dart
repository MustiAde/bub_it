import 'package:bub_it/constants/colours.dart';
import 'package:bub_it/screens/detailed_stats.dart';
import 'package:bub_it/screens/homepage.dart';
import 'package:bub_it/screens/recent_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        leading: Padding(
          padding: EdgeInsets.fromLTRB(28.0, 10, 0, 0),
          child: Text(
            'Bub-It',
            style: GoogleFonts.newRocker(
                fontSize: 20,
                color: Color(0xFF80593B),
                fontWeight: FontWeight.bold),

            // style: TextStyle(
            //     color: Color(0xFF80593B),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 23),
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel_outlined))
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
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text(
                            shortUrlController
                                .text, //'bub.junyong.me/floral98',
                            style: const TextStyle(fontSize: 15),
                          ),
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
                        child: Center(
                          child: Builder(builder: (context) {
                            return IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                        text: shortUrlController.text))
                                    .then(
                                  (value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: Text(
                                        'Link Copied',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: butColor),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 4,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.copy_outlined,
                                color: Colors.white,
                                size: 15,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecentLinks()));
                },
                child: Text(
                  'My URLs',
                  style: TextStyle(
                      fontSize: 14.h, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 7, size.height - 30);
    var firstEndPoint = Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BezierHeaderCurves extends StatelessWidget {
  const BezierHeaderCurves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BezierClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        color: const Color(0xFFA1887F),
      ),
    );
  }
}

class RecentUrls extends StatelessWidget {
  const RecentUrls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          // child: Align(
          // alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              'Bub-It',
              style: GoogleFonts.newRocker(fontSize: 20),
            ),
          ),
          // ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5, // Space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 2.0,
            ))),
            child: Text(
              "Your Recent Bub-URLs",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class DetailedBoxWidget extends StatelessWidget {
  const DetailedBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Detailed stats',
        style: GoogleFonts.poppins(color: const Color(0xFFA1887F)),
      ),
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFA1887F), width: 2),
        primary: Colors.white,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailedStats()));
      },
    );
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        "Copy",
        style: GoogleFonts.poppins(color: Colors.white),
      ),
      icon: const Icon(Icons.copy),
      onPressed: () {},
      style: ElevatedButton.styleFrom(primary: const Color(0xFF795548)),
    );
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
