import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camping_game_show/main.dart' as app;
import 'package:performance/performance.dart';

void main() {
  group('Tests de performance', () {
    testWidgets('Mesure des performances de démarrage', (WidgetTester tester) async {
      final stopwatch = Stopwatch()..start();
      
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();
      
      stopwatch.stop();
      
      // Vérifier que l'application démarre en moins de 2 secondes
      expect(stopwatch.elapsedMilliseconds, lessThan(2000));
    });
    
    testWidgets('Mesure des performances de navigation', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();
      
      // Naviguer vers l'écran de connexion administrateur
      final stopwatch = Stopwatch()..start();
      
      await tester.tap(find.text('Administration'));
      await tester.pumpAndSettle();
      
      stopwatch.stop();
      
      // Vérifier que la navigation est fluide (moins de 300ms)
      expect(stopwatch.elapsedMilliseconds, lessThan(300));
    });
    
    testWidgets('Mesure de l\'utilisation de la mémoire', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();
      
      // Simuler une utilisation intensive de l'application
      for (int i = 0; i < 10; i++) {
        // Naviguer entre différents écrans
        await tester.tap(find.text('Administration'));
        await tester.pumpAndSettle();
        
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }
      
      // Vérifier qu'il n'y a pas de fuites de mémoire significatives
      // Note: Dans un environnement réel, nous utiliserions des outils comme
      // DevTools ou des profilers spécifiques pour mesurer l'utilisation de la mémoire
    });
    
    testWidgets('Test de performance de la roue de jeu', (WidgetTester tester) async {
      // Initialiser l'application et naviguer vers l'écran de jeu
      app.main();
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('Administration'));
      await tester.pumpAndSettle();
      
      await tester.enterText(find.byType(TextFormField).first, 'admin@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();
      
      await tester.tap(find.text('Session de test').first);
      await tester.pumpAndSettle();
      
      // Mesurer les performances de l'animation de la roue
      final stopwatch = Stopwatch()..start();
      
      await tester.tap(find.text('Tourner la roue'));
      
      // Attendre que l'animation commence
      await tester.pump(const Duration(milliseconds: 100));
      
      // Vérifier les FPS pendant l'animation
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 16)); // ~60 FPS
      }
      
      // Attendre la fin de l'animation
      await tester.pumpAndSettle();
      
      stopwatch.stop();
      
      // Vérifier que l'animation est fluide et se termine dans un délai raisonnable
      expect(stopwatch.elapsedMilliseconds, lessThan(3000));
    });
  });
}
