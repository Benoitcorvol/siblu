import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:camping_game_show/main.dart' as app;
import 'package:camping_game_show/features/player/screens/player_login_screen.dart';
import 'package:camping_game_show/features/admin/screens/admin_login_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Flux d\'authentification', () {
    testWidgets('Flux de connexion administrateur complet', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();

      // Naviguer vers l'écran de connexion administrateur (en supposant que nous commençons sur un écran d'accueil)
      await tester.tap(find.text('Administration'));
      await tester.pumpAndSettle();

      // Vérifier que nous sommes sur l'écran de connexion administrateur
      expect(find.byType(AdminLoginScreen), findsOneWidget);
      expect(find.text('Camping Game Show'), findsOneWidget);
      expect(find.text('Administration'), findsOneWidget);

      // Entrer les informations de connexion
      await tester.enterText(find.byType(TextFormField).first, 'admin@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      
      // Soumettre le formulaire
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      // Vérifier que nous sommes redirigés vers le tableau de bord administrateur
      expect(find.text('Tableau de bord'), findsOneWidget);
      expect(find.text('Sessions de jeu'), findsOneWidget);
    });

    testWidgets('Flux de connexion joueur complet', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();

      // Naviguer vers l'écran de connexion joueur (en supposant que nous commençons sur un écran d'accueil)
      await tester.tap(find.text('Rejoindre une partie'));
      await tester.pumpAndSettle();

      // Vérifier que nous sommes sur l'écran de connexion joueur
      expect(find.byType(PlayerLoginScreen), findsOneWidget);
      expect(find.text('Rejoindre une session'), findsOneWidget);

      // Entrer le code de session
      await tester.enterText(find.byType(TextFormField), '123456');
      
      // Soumettre le formulaire
      await tester.tap(find.text('Rejoindre'));
      await tester.pumpAndSettle();

      // Vérifier que nous sommes redirigés vers l'écran de jeu
      expect(find.text('Session #123456'), findsOneWidget);
    });
  });

  group('Flux de gestion de session', () {
    testWidgets('Création et configuration d\'une nouvelle session', (WidgetTester tester) async {
      // Initialiser l'application et se connecter en tant qu'administrateur
      app.main();
      await tester.pumpAndSettle();
      
      // Naviguer vers l'écran de connexion administrateur
      await tester.tap(find.text('Administration'));
      await tester.pumpAndSettle();
      
      // Se connecter
      await tester.enterText(find.byType(TextFormField).first, 'admin@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();
      
      // Créer une nouvelle session
      await tester.tap(find.text('Nouvelle session'));
      await tester.pumpAndSettle();
      
      // Remplir le formulaire de création de session
      await tester.enterText(find.byKey(const Key('session_name_field')), 'Session de test');
      await tester.enterText(find.byKey(const Key('location_field')), 'Terrain principal');
      
      // Sélectionner une date
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      await tester.tap(find.text('15')); // Sélectionner le 15 du mois
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      
      // Ajouter une équipe
      await tester.tap(find.text('Ajouter une équipe'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('team_name_field')), 'Les Aventuriers');
      await tester.tap(find.text('Ajouter'));
      await tester.pumpAndSettle();
      
      // Créer la session
      await tester.tap(find.text('Créer la session'));
      await tester.pumpAndSettle();
      
      // Vérifier que la session a été créée
      expect(find.text('Session créée avec succès'), findsOneWidget);
      expect(find.text('Session de test'), findsOneWidget);
    });
  });

  group('Flux de jeu', () {
    testWidgets('Déroulement d\'un tour de jeu complet', (WidgetTester tester) async {
      // Initialiser l'application et se connecter en tant qu'administrateur
      app.main();
      await tester.pumpAndSettle();
      
      // Naviguer vers l'écran de connexion administrateur et se connecter
      await tester.tap(find.text('Administration'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).first, 'admin@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();
      
      // Sélectionner une session existante
      await tester.tap(find.text('Session de test').first);
      await tester.pumpAndSettle();
      
      // Démarrer la session
      await tester.tap(find.text('Démarrer la session'));
      await tester.pumpAndSettle();
      
      // Faire tourner la roue
      await tester.tap(find.text('Tourner la roue'));
      await tester.pumpAndSettle(const Duration(seconds: 3)); // Attendre l'animation
      
      // Attribuer des points
      await tester.tap(find.text('Attribuer des points'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Les Aventuriers'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('+10'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirmer'));
      await tester.pumpAndSettle();
      
      // Vérifier que les points ont été attribués
      expect(find.text('Points attribués avec succès'), findsOneWidget);
      
      // Passer au tour suivant
      await tester.tap(find.text('Tour suivant'));
      await tester.pumpAndSettle();
      
      // Vérifier que nous sommes au tour suivant
      expect(find.text('Tour 2'), findsOneWidget);
    });
  });
}
