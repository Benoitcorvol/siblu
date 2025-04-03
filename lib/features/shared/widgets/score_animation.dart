import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';

class ScoreAnimation extends StatefulWidget {
  final int score;
  final int previousScore;
  final Color teamColor;
  final bool isHighlighted;
  
  const ScoreAnimation({
    Key? key,
    required this.score,
    required this.previousScore,
    required this.teamColor,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  State<ScoreAnimation> createState() => _ScoreAnimationState();
}

class _ScoreAnimationState extends State<ScoreAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scoreAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Color?> _colorAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _initializeAnimations();
    
    if (widget.score != widget.previousScore) {
      _controller.forward(from: 0.0);
      // Vibration légère pour le retour haptique
      HapticFeedback.lightImpact();
    }
  }
  
  @override
  void didUpdateWidget(ScoreAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.score != oldWidget.score) {
      _initializeAnimations();
      _controller.forward(from: 0.0);
      // Vibration légère pour le retour haptique
      HapticFeedback.lightImpact();
    }
  }
  
  void _initializeAnimations() {
    // Animation du score
    _scoreAnimation = Tween<double>(
      begin: widget.previousScore.toDouble(),
      end: widget.score.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    
    // Animation d'échelle
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.3)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.3, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 70,
      ),
    ]).animate(_controller);
    
    // Animation d'opacité pour l'effet de points ajoutés
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
    ]).animate(_controller);
    
    // Animation de couleur
    _colorAnimation = ColorTween(
      begin: widget.teamColor.withOpacity(0.7),
      end: widget.teamColor,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Score principal
            Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.isHighlighted 
                      ? _colorAnimation.value 
                      : widget.teamColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: widget.isHighlighted ? [
                    BoxShadow(
                      color: widget.teamColor.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ] : null,
                ),
                child: Text(
                  _scoreAnimation.value.toInt().toString(),
                  style: AppTextStyles.heading2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Animation de points ajoutés
            if (widget.score > widget.previousScore)
              Opacity(
                opacity: _opacityAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "+${widget.score - widget.previousScore}",
                    style: AppTextStyles.body.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            
            // Animation de points perdus
            if (widget.score < widget.previousScore)
              Opacity(
                opacity: _opacityAnimation.value,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "${widget.score - widget.previousScore}",
                    style: AppTextStyles.body.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class TeamScoreCard extends StatelessWidget {
  final String teamName;
  final Color teamColor;
  final int score;
  final int previousScore;
  final int rank;
  final bool isHighlighted;
  
  const TeamScoreCard({
    Key? key,
    required this.teamName,
    required this.teamColor,
    required this.score,
    required this.previousScore,
    required this.rank,
    this.isHighlighted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isHighlighted 
                ? teamColor.withOpacity(0.3) 
                : Colors.black12,
            blurRadius: isHighlighted ? 10 : 5,
            spreadRadius: isHighlighted ? 2 : 1,
          ),
        ],
        border: isHighlighted 
            ? Border.all(color: teamColor, width: 2) 
            : null,
      ),
      child: Row(
        children: [
          // Rang
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _getRankColor(rank),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                rank.toString(),
                style: AppTextStyles.body.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Nom de l'équipe
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamName,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: teamColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
          
          // Score
          ScoreAnimation(
            score: score,
            previousScore: previousScore,
            teamColor: teamColor,
            isHighlighted: isHighlighted,
          ),
        ],
      ),
    );
  }
  
  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.blueGrey.shade300;
      case 3:
        return Colors.brown.shade300;
      default:
        return Colors.grey;
    }
  }
}
