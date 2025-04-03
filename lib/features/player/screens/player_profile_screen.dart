import 'package:flutter/material.dart';

class PlayerProfileScreen extends StatelessWidget {
  final String playerId;
  
  const PlayerProfileScreen({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Profile'),
      ),
      body: Center(
        child: Text('Profile for player: $playerId'),
      ),
    );
  }
}
