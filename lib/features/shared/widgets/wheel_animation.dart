import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class WheelAnimation extends StatefulWidget {
  final List<Color> segmentColors;
  final List<String> segmentLabels;
  final Function(int) onSegmentSelected;
  final bool isSpinning;
  final VoidCallback onSpinComplete;

  const WheelAnimation({
    Key? key,
    required this.segmentColors,
    required this.segmentLabels,
    required this.onSegmentSelected,
    required this.isSpinning,
    required this.onSpinComplete,
  }) : super(key: key);

  @override
  State<WheelAnimation> createState() => _WheelAnimationState();
}

class _WheelAnimationState extends State<WheelAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final double _angle = 0;
  final _random = math.Random();
  int _selectedSegment = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Calculer le segment sélectionné
        final segmentAngle = 2 * math.pi / widget.segmentColors.length;
        final normalizedAngle = (_angle % (2 * math.pi)) / (2 * math.pi);
        final segmentIndex = (normalizedAngle * widget.segmentColors.length).floor();
        _selectedSegment = segmentIndex;
        
        // Vibrer pour indiquer la fin du tour
        HapticFeedback.heavyImpact();
        
        // Notifier le parent
        widget.onSegmentSelected(_selectedSegment);
        widget.onSpinComplete();
      }
    });
  }

  @override
  void didUpdateWidget(WheelAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSpinning && !oldWidget.isSpinning) {
      _spinWheel();
    }
  }

  void _spinWheel() {
    // Réinitialiser le contrôleur
    _controller.reset();
    
    // Générer un angle aléatoire pour la rotation
    final spinAngle = 2 * math.pi * (5 + _random.nextDouble() * 5);
    
    // Mettre à jour l'animation
    _animation = Tween<double>(
      begin: 0,
      end: spinAngle,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutExpo,
    ));
    
    // Jouer un son de rotation
    // SoundEffect.play('wheel_spin.mp3');
    
    // Vibrer légèrement au début
    HapticFeedback.mediumImpact();
    
    // Démarrer l'animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Roue
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value,
                    child: CustomPaint(
                      size: const Size(280, 280),
                      painter: WheelPainter(
                        segmentColors: widget.segmentColors,
                        segmentLabels: widget.segmentLabels,
                      ),
                    ),
                  );
                },
              ),
              
              // Indicateur
              Positioned(
                top: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_downward,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              
              // Bouton central
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.casino,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: widget.isSpinning ? null : () => _spinWheel(),
          icon: const Icon(Icons.refresh),
          label: Text(widget.isSpinning ? 'Rotation en cours...' : 'Tourner la roue'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ],
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<Color> segmentColors;
  final List<String> segmentLabels;

  WheelPainter({
    required this.segmentColors,
    required this.segmentLabels,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;
    final segmentAngle = 2 * math.pi / segmentColors.length;
    
    // Dessiner les segments
    for (int i = 0; i < segmentColors.length; i++) {
      final paint = Paint()
        ..color = segmentColors[i]
        ..style = PaintingStyle.fill;
      
      final startAngle = i * segmentAngle;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        paint,
      );
      
      // Ajouter une bordure
      final borderPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        segmentAngle,
        true,
        borderPaint,
      );
      
      // Ajouter le texte
      final textPainter = TextPainter(
        text: TextSpan(
          text: segmentLabels[i],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black54,
                blurRadius: 2,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      
      textPainter.layout();
      
      // Calculer la position du texte
      final textAngle = startAngle + segmentAngle / 2;
      final textRadius = radius * 0.7; // Positionner le texte à 70% du rayon
      final textX = center.dx + textRadius * math.cos(textAngle);
      final textY = center.dy + textRadius * math.sin(textAngle);
      
      // Sauvegarder l'état du canvas
      canvas.save();
      
      // Translater et pivoter pour aligner le texte
      canvas.translate(textX, textY);
      canvas.rotate(textAngle + math.pi / 2);
      
      // Dessiner le texte
      textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      
      // Restaurer l'état du canvas
      canvas.restore();
    }
    
    // Dessiner le cercle extérieur
    final outerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    
    canvas.drawCircle(center, radius, outerCirclePaint);
    
    // Ajouter des décorations
    for (int i = 0; i < segmentColors.length; i++) {
      final dotAngle = i * segmentAngle + segmentAngle / 2;
      final dotRadius = 5.0;
      final dotX = center.dx + (radius + 10) * math.cos(dotAngle);
      final dotY = center.dy + (radius + 10) * math.sin(dotAngle);
      
      final dotPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;
      
      canvas.drawCircle(Offset(dotX, dotY), dotRadius, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
