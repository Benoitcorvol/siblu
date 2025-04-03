import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:camping_game_show/main.dart' as app;
import 'package:camping_game_show/core/data/demo_data.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Test complet de bout en bout', () {
    testWidgets('Flux complet administrateur', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();

      // Vérifier l'écran d'accueil
      expect(find.text('Camping Game Show'), findsOneWidget);
      
      // Naviguer vers la connexion administrateur
      await tester.tap(find.text('Mode Administrateur'));
      await tester.pumpAndSettle();

      // Connexion administrateur
      await tester.enterText(find.byType(TextField).at(0), 'admin@campinggameshow.example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      // Vérifier le tableau de bord administrateur
      expect(find.text('Tableau de bord'), findsOneWidget);
      
      // Créer une nouvelle session
      await tester.tap(find.text('Nouvelle session'));
      await tester.pumpAndSettle();
      
      // Remplir les informations de session
      await tester.enterText(find.byType(TextField).at(0), 'Session de test');
      await tester.enterText(find.byType(TextField).at(1), 'Description de la session de test');
      await tester.tap(find.text('Suivant'));
      await tester.pumpAndSettle();
      
      // Configurer les équipes
      await tester.tap(find.text('Ajouter une équipe'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(0), 'Équipe Test');
      await tester.tap(find.text('Confirmer'));
      await tester.pumpAndSettle();
      
      // Finaliser la création de session
      await tester.tap(find.text('Créer la session'));
      await tester.pumpAndSettle();
      
      // Vérifier que la session a été créée
      expect(find.text('Session de test'), findsOneWidget);
      
      // Accéder à la session
      await tester.tap(find.text('Session de test'));
      await tester.pumpAndSettle();
      
      // Vérifier l'écran de contrôle du jeu
      expect(find.text('Contrôle du jeu'), findsOneWidget);
      
      // Faire tourner la roue
      await tester.tap(find.text('Tourner la roue'));
      await tester.pumpAndSettle(const Duration(seconds: 3));
      
      // Vérifier qu'un segment a été sélectionné
      expect(find.textContaining('Défi'), findsAtLeastNWidgets(1));
      
      // Attribuer des points
      await tester.tap(find.text('Attribuer des points'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(0), '100');
      await tester.tap(find.text('Confirmer'));
      await tester.pumpAndSettle();
      
      // Vérifier le tableau des scores
      expect(find.text('100'), findsOneWidget);
      
      // Terminer la session
      await tester.tap(find.text('Terminer la session'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirmer'));
      await tester.pumpAndSettle();
      
      // Vérifier le retour au tableau de bord
      expect(find.text('Tableau de bord'), findsOneWidget);
      
      // Se déconnecter
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();
      
      // Vérifier le retour à l'écran d'accueil
      expect(find.text('Camping Game Show'), findsOneWidget);
    });

    testWidgets('Flux complet joueur', (WidgetTester tester) async {
      // Initialiser l'application avec des données de démonstration
      loadDemoData();
      app.main();
      await tester.pumpAndSettle();

      // Vérifier l'écran d'accueil
      expect(find.text('Camping Game Show'), findsOneWidget);
      
      // Naviguer vers la connexion joueur
      await tester.tap(find.text('Rejoindre une partie'));
      await tester.pumpAndSettle();

      // Rejoindre une session avec un code
      await tester.enterText(find.byType(TextField).at(0), '123456');
      await tester.tap(find.text('Rejoindre'));
      await tester.pumpAndSettle();

      // Créer un profil joueur
      await tester.enterText(find.byType(TextField).at(0), 'Joueur Test');
      await tester.tap(find.text('Continuer'));
      await tester.pumpAndSettle();
      
      // Choisir une équipe
      await tester.tap(find.text('Les Dragons Rouges'));
      await tester.pumpAndSettle();
      
      // Vérifier l'écran de jeu principal
      expect(find.text('Soirée Camping des Pins'), findsOneWidget);
      
      // Vérifier les informations de l'équipe
      expect(find.text('Les Dragons Rouges'), findsOneWidget);
      
      // Participer à un défi
      if (find.text('Participer').evaluate().isNotEmpty) {
        await tester.tap(find.text('Participer'));
        await tester.pumpAndSettle();
        
        // Interagir avec le défi
        if (find.byType(TextField).evaluate().isNotEmpty) {
          await tester.enterText(find.byType(TextField).at(0), 'Réponse test');
          await tester.tap(find.text('Soumettre'));
          await tester.pumpAndSettle();
        }
      }
      
      // Accéder au profil
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();
      
      // Vérifier l'écran de profil
      expect(find.text('Profil'), findsOneWidget);
      expect(find.text('Joueur Test'), findsOneWidget);
      
      // Retourner à l'écran de jeu
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      
      // Quitter la session
      await tester.tap(find.byIcon(Icons.exit_to_app));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirmer'));
      await tester.pumpAndSettle();
      
      // Vérifier le retour à l'écran d'accueil
      expect(find.text('Camping Game Show'), findsOneWidget);
    });

    testWidgets('Test du mode hors ligne', (WidgetTester tester) async {
      // Initialiser l'application
      app.main();
      await tester.pumpAndSettle();

      // Activer le mode hors ligne
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Mode hors ligne'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Activer'));
      await tester.pumpAndSettle();
      
      // Vérifier l'indicateur de mode hors ligne
      expect(find.byIcon(Icons.cloud_off), findsOneWidget);
      
      // Naviguer vers la connexion administrateur
      await tester.tap(find.text('Mode Administrateur'));
      await tester.pumpAndSettle();

      // Connexion administrateur en mode hors ligne
      await tester.enterText(find.byType(TextField).at(0), 'admin@campinggameshow.example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.text('Se connecter'));
      await tester.pumpAndSettle();

      // Vérifier le tableau de bord administrateur
      expect(find.text('Tableau de bord (Mode hors ligne)'), findsOneWidget);
      
      // Créer une session hors ligne
      await tester.tap(find.text('Nouvelle session hors ligne'));
      await tester.pumpAndSettle();
      
      // Remplir les informations de session
      await tester.enterText(find.byType(TextField).at(0), 'Session hors ligne');
      await tester.tap(find.text('Créer'));
      await tester.pumpAndSettle();
      
      // Vérifier que la session a été créée
      expect(find.text('Session hors ligne'), findsOneWidget);
      
      // Désactiver le mode hors ligne
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Mode hors ligne'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Désactiver'));
      await tester.pumpAndSettle();
      
      // Vérifier la synchronisation
      expect(find.text('Synchronisation en cours...'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 3));
      
      // Vérifier que la synchronisation est terminée
      expect(find.text('Synchronisation terminée'), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
