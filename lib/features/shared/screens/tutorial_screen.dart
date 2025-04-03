import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';

class TutorialScreen extends StatefulWidget {
  final String tutorialType;
  
  const TutorialScreen({Key? key, required this.tutorialType}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late List<TutorialStep> _tutorialSteps;
  
  @override
  void initState() {
    super.initState();
    _tutorialSteps = _getTutorialSteps(widget.tutorialType);
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  List<TutorialStep> _getTutorialSteps(String tutorialType) {
    switch (tutorialType) {
      case 'admin_intro':
        return _getAdminIntroTutorial();
      case 'player_intro':
        return _getPlayerIntroTutorial();
      case 'game_creation':
        return _getGameCreationTutorial();
      case 'wheel_usage':
        return _getWheelUsageTutorial();
      case 'offline_mode':
        return _getOfflineModeTutorial();
      default:
        return _getDefaultTutorial();
    }
  }
  
  List<TutorialStep> _getAdminIntroTutorial() {
    return [
      TutorialStep(
        title: 'Bienvenue dans Camping Game Show',
        description: 'Cette application vous permet d\'animer des jeux interactifs avec les campeurs. Découvrons ensemble comment l\'utiliser.',
        imagePath: 'assets/images/tutorials/admin_welcome.png',
      ),
      TutorialStep(
        title: 'Tableau de bord administrateur',
        description: 'Le tableau de bord vous donne une vue d\'ensemble de vos sessions de jeu et un accès rapide à toutes les fonctionnalités.',
        imagePath: 'assets/images/tutorials/admin_dashboard.png',
      ),
      TutorialStep(
        title: 'Création de session',
        description: 'Créez facilement une nouvelle session de jeu en définissant un nom, des paramètres et en personnalisant la roue de la fortune.',
        imagePath: 'assets/images/tutorials/session_creation.png',
      ),
      TutorialStep(
        title: 'Gestion des équipes',
        description: 'Créez et gérez des équipes avec des noms et des couleurs personnalisés. Assignez des joueurs manuellement ou laissez-les choisir.',
        imagePath: 'assets/images/tutorials/team_management.png',
      ),
      TutorialStep(
        title: 'Contrôle du jeu',
        description: 'Utilisez l\'interface de contrôle pour faire tourner la roue, attribuer des points et gérer le déroulement du jeu.',
        imagePath: 'assets/images/tutorials/game_control.png',
      ),
    ];
  }
  
  List<TutorialStep> _getPlayerIntroTutorial() {
    return [
      TutorialStep(
        title: 'Bienvenue dans Camping Game Show',
        description: 'Cette application vous permet de participer à des jeux interactifs organisés par votre camping. Découvrons comment jouer.',
        imagePath: 'assets/images/tutorials/player_welcome.png',
      ),
      TutorialStep(
        title: 'Rejoindre une session',
        description: 'Rejoignez une session de jeu en entrant le code à 6 chiffres fourni par l\'animateur ou en scannant le QR code affiché.',
        imagePath: 'assets/images/tutorials/join_session.png',
      ),
      TutorialStep(
        title: 'Choisir une équipe',
        description: 'Sélectionnez votre équipe parmi celles disponibles ou rejoignez une équipe existante selon les instructions de l\'animateur.',
        imagePath: 'assets/images/tutorials/choose_team.png',
      ),
      TutorialStep(
        title: 'Écran de jeu',
        description: 'L\'écran principal affiche l\'état actuel du jeu, le score de votre équipe et les défis en cours.',
        imagePath: 'assets/images/tutorials/player_game_screen.png',
      ),
      TutorialStep(
        title: 'Participation aux défis',
        description: 'Suivez les instructions à l\'écran pour participer aux défis lancés par l\'animateur et gagner des points pour votre équipe.',
        imagePath: 'assets/images/tutorials/challenges.png',
      ),
    ];
  }
  
  List<TutorialStep> _getGameCreationTutorial() {
    return [
      TutorialStep(
        title: 'Création d\'une nouvelle session',
        description: 'Appuyez sur "Nouvelle session" depuis le tableau de bord administrateur pour commencer.',
        imagePath: 'assets/images/tutorials/new_session_button.png',
      ),
      TutorialStep(
        title: 'Informations de base',
        description: 'Donnez un nom à votre session, ajoutez une description et définissez la durée approximative du jeu.',
        imagePath: 'assets/images/tutorials/session_info.png',
      ),
      TutorialStep(
        title: 'Configuration des équipes',
        description: 'Définissez le nombre maximum d\'équipes et de joueurs par équipe. Vous pourrez les ajuster plus tard si nécessaire.',
        imagePath: 'assets/images/tutorials/team_config.png',
      ),
      TutorialStep(
        title: 'Personnalisation de la roue',
        description: 'Ajoutez, modifiez ou supprimez des segments sur la roue de la fortune pour créer votre jeu personnalisé.',
        imagePath: 'assets/images/tutorials/wheel_customization.png',
      ),
      TutorialStep(
        title: 'Finalisation et partage',
        description: 'Une fois la configuration terminée, vous obtiendrez un code de session et un QR code à partager avec les joueurs.',
        imagePath: 'assets/images/tutorials/session_sharing.png',
      ),
    ];
  }
  
  List<TutorialStep> _getWheelUsageTutorial() {
    return [
      TutorialStep(
        title: 'La roue de la fortune',
        description: 'La roue est l\'élément central du jeu. Elle détermine aléatoirement le prochain défi ou action.',
        imagePath: 'assets/images/tutorials/wheel_overview.png',
      ),
      TutorialStep(
        title: 'Faire tourner la roue',
        description: 'Appuyez sur le bouton "Tourner" pour faire tourner la roue. Vous pouvez également la faire glisser manuellement.',
        imagePath: 'assets/images/tutorials/spin_wheel.png',
      ),
      TutorialStep(
        title: 'Segments de la roue',
        description: 'Chaque segment correspond à un type de défi ou d\'action. La couleur indique la difficulté ou la catégorie.',
        imagePath: 'assets/images/tutorials/wheel_segments.png',
      ),
      TutorialStep(
        title: 'Personnalisation des segments',
        description: 'Modifiez les segments en appuyant sur "Éditer la roue" dans les paramètres de la session.',
        imagePath: 'assets/images/tutorials/edit_wheel.png',
      ),
      TutorialStep(
        title: 'Résultat et action',
        description: 'Après l\'arrêt de la roue, suivez les instructions à l\'écran pour lancer le défi correspondant.',
        imagePath: 'assets/images/tutorials/wheel_result.png',
      ),
    ];
  }
  
  List<TutorialStep> _getOfflineModeTutorial() {
    return [
      TutorialStep(
        title: 'Mode hors ligne',
        description: 'Camping Game Show fonctionne parfaitement même sans connexion internet, idéal pour les campings isolés.',
        imagePath: 'assets/images/tutorials/offline_mode.png',
      ),
      TutorialStep(
        title: 'Préparation au mode hors ligne',
        description: 'Avant de perdre la connexion, assurez-vous que tous les joueurs ont installé l\'application et que l\'administrateur a créé la session.',
        imagePath: 'assets/images/tutorials/offline_preparation.png',
      ),
      TutorialStep(
        title: 'Réseau local',
        description: 'En mode hors ligne, les appareils communiquent via un réseau local. Assurez-vous que tous les appareils sont à proximité.',
        imagePath: 'assets/images/tutorials/local_network.png',
      ),
      TutorialStep(
        title: 'Synchronisation automatique',
        description: 'Lorsque la connexion internet est rétablie, l\'application synchronise automatiquement toutes les données avec le serveur.',
        imagePath: 'assets/images/tutorials/auto_sync.png',
      ),
      TutorialStep(
        title: 'Résolution des problèmes',
        description: 'En cas de problème de connexion, utilisez l\'option "Reconnecter" dans le menu des paramètres.',
        imagePath: 'assets/images/tutorials/reconnect_option.png',
      ),
    ];
  }
  
  List<TutorialStep> _getDefaultTutorial() {
    return [
      TutorialStep(
        title: 'Bienvenue dans Camping Game Show',
        description: 'Découvrez comment utiliser cette application pour animer ou participer à des jeux interactifs dans votre camping.',
        imagePath: 'assets/images/tutorials/welcome.png',
      ),
      TutorialStep(
        title: 'Navigation dans l\'application',
        description: 'Utilisez le menu principal pour accéder aux différentes fonctionnalités de l\'application.',
        imagePath: 'assets/images/tutorials/navigation.png',
      ),
      TutorialStep(
        title: 'Profil et paramètres',
        description: 'Personnalisez votre profil et ajustez les paramètres selon vos préférences.',
        imagePath: 'assets/images/tutorials/profile_settings.png',
      ),
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Ignorer', style: AppTextStyles.buttonText),
                  ),
                  Row(
                    children: List.generate(
                      _tutorialSteps.length,
                      (index) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? AppColors.primary
                              : AppColors.lightGrey,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage < _tutorialSteps.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      _currentPage < _tutorialSteps.length - 1 ? 'Suivant' : 'Terminer',
                      style: AppTextStyles.buttonText.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _tutorialSteps.length,
                itemBuilder: (context, index) {
                  final step = _tutorialSteps[index];
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.lightGrey.withOpacity(0.2),
                            ),
                            child: Center(
                              child: Image.asset(
                                step.imagePath,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.image_not_supported,
                                    size: 100,
                                    color: AppColors.darkGrey,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          step.title,
                          style: AppTextStyles.heading2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          step.description,
                          style: AppTextStyles.body,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialStep {
  final String title;
  final String description;
  final String imagePath;
  
  TutorialStep({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
