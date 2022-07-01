import 'package:bub_it/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class NotFound extends StatefulWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  State<NotFound> createState() => _NotFoundState();
}

class _NotFoundState extends State<NotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Bub-It',
                  style: GoogleFonts.newRocker(fontSize: 20),
                ),
              ),
            ),
            const Spacer(),
            Image.asset('assets/not_found.png'),
            const SizedBox(height: 20),
            const Text(
              'PAGE NOT FOUND',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "We can't seem to find the page you're looking for.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "The link you followed may be broken or you may have entered the wrong link.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
                icon: const Icon(Icons.home_outlined),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(230, 50),
                  primary: butColor,
                ),
                label: const Text(
                  'Go to Homepage',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
