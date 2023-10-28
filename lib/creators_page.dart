import 'package:flutter/material.dart';

class CreatorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the Creators'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Created by:'),
            Text('Hamzaoui Thameur'),
            Text('Omari Hamza'),
          ],
        ),
      ),
    );
  }
}
