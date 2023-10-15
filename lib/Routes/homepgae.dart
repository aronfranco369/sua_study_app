import 'package:flutter/material.dart';

class Saf extends StatelessWidget {
  const Saf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Aron'),
            Text('Muganyizi'),
            Text('Franco'),
          ],
        ),
      ),
    );
  }
}
