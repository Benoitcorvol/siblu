import 'package:flutter/material.dart';

class InteractiveElementsScreen extends StatelessWidget {
  final String sessionId;

  const InteractiveElementsScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Elements'),
      ),
      body: Center(
        child: Text('Interactive elements for session: $sessionId'),
      ),
    );
  }
}
