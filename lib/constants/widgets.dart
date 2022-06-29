import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        height: MediaQuery.of(context).size.height/6,
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
          child: Align(
              alignment: Alignment.topLeft,
              child: Text('Bub-It', style: GoogleFonts.newRocker(fontSize: 20),)),
        ),
        const SizedBox(height: 10,),
        Center(
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 5, // Space between underline and text
            ),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 2.0,
                ))
            ),
            child: Text(
              "Your Recent Bub-URLs",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
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
      child: Text('Detailed stats', style: GoogleFonts.poppins(color: const Color(0xFFA1887F)),),
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFA1887F), width: 2),
        primary: Colors.white,
      ), onPressed: () {  },

    );
  }
}

class CopyButton extends StatelessWidget {
  const CopyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text("Copy", style: GoogleFonts.poppins(color: Colors.white),),
      icon: const Icon(Icons.copy),
      onPressed: (){},
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF795548)
      ),
    );
  }
}

