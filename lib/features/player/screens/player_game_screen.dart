import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class PlayerGameScreen extends StatefulWidget {
  final String sessionId;
  
  const PlayerGameScreen({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  @override
  State<PlayerGameScreen> createState() => _PlayerGameScreenState();
}

class _PlayerGameScreenState extends State<PlayerGameScreen> {
  bool _isWheelSpinning = false;
  String? _currentChallenge;
  final double _wheelSize = 300;

  Widget _buildWheel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('La roue tourne...', style: AppTextStyles.headline3.copyWith(color: AppColors.teal)),
        SizedBox(height: 32),
        Container(
          width: _wheelSize,
          height: _wheelSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              colors: [
                AppColors.teal,
                AppColors.blueLight,
                AppColors.blue,
                AppColors.yellowLight,
                AppColors.yellow,
                AppColors.teal,
              ],
            ),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)],
          ),
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 5)],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChallenge() {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nouveau défi!', style: AppTextStyles.headline2.copyWith(color: AppColors.tealDark)),
          SizedBox(height: 32),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.blueLight.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.blue, width: 2),
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/challenge.png',
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 16),
                Text(
                  _currentChallenge!,
                  style: AppTextStyles.subtitle1.copyWith(height: 1.4),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              // Handle ready button press
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('JE SUIS PRÊT!', style: AppTextStyles.button),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _isWheelSpinning 
          ? _buildWheel()
          : _currentChallenge != null
              ? _buildChallenge()
              : Center(
                  child: Text('En attente...', style: AppTextStyles.headline3),
                ),
    );
  }
}
