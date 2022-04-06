import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 32.0,
              height: 1.12,
              color: Color(0xFF252849),
            ),
            children: [
              TextSpan(
                text: 'С',
                style: TextStyle(
                  color: Color(0xFF4CAF50),
                ),
              ),
              TextSpan(
                text: 'писок\n',
              ),
              TextSpan(
                text: 'и',
                style: TextStyle(
                  color: Color(0xFFFBC02D),
                ),
              ),
              TextSpan(
                text: 'нтересных мест',
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: const Center(child: Text('Hello!')),
    );
  }
}
