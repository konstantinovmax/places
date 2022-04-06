import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          children: const [
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Список\nинтересных мест',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                fontSize: 32.0,
                height: 1.12,
                color: Color(0xFF3B3E5B),
              ),
              maxLines: 2,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SightCard(sight: mocks[0]),
          const SizedBox(
            height: 16.0,
          ),
          SightCard(sight: mocks[1]),
          const SizedBox(
            height: 16.0,
          ),
          SightCard(sight: mocks[2]),
        ]),
      ),
    );
  }
}
