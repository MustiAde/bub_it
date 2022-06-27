import 'package:flutter/material.dart';

class RecentLinks extends StatefulWidget {
  const RecentLinks({Key? key}) : super(key: key);

  @override
  State<RecentLinks> createState() => _RecentLinksState();
}

class _RecentLinksState extends State<RecentLinks> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Recent Links'),
    );
  }
}
