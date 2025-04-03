#!/bin/bash

# Script de mise à jour automatique pour l'application Camping Game Show
# Ce script vérifie et installe les mises à jour disponibles

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Système de mise à jour automatique pour Camping Game Show ===${NC}"

# URL du serveur de mise à jour
UPDATE_SERVER="https://update.campinggameshow.example.com"
VERSION_FILE="version.json"
APP_PACKAGE="com.campingappshow.camping_game_show"
CURRENT_VERSION="1.0.0"

# Fonction pour vérifier les mises à jour disponibles
check_for_updates() {
    echo -e "${YELLOW}Vérification des mises à jour disponibles...${NC}"
    
    # Simuler une requête au serveur de mise à jour
    # Dans une implémentation réelle, cela ferait une requête HTTP
    echo '{
        "latest_version": "1.0.1",
        "min_required_version": "1.0.0",
        "release_notes": "Correction de bugs et améliorations de performance",
        "download_url": "https://update.campinggameshow.example.com/downloads/camping_game_show_1.0.1.apk",
        "force_update": false
    }' > /tmp/version_response.json
    
    # Extraire les informations de version
    LATEST_VERSION=$(grep -o '"latest_version": "[^"]*' /tmp/version_response.json | cut -d'"' -f4)
    MIN_REQUIRED=$(grep -o '"min_required_version": "[^"]*' /tmp/version_response.json | cut -d'"' -f4)
    FORCE_UPDATE=$(grep -o '"force_update": [^,}]*' /tmp/version_response.json | cut -d' ' -f2)
    DOWNLOAD_URL=$(grep -o '"download_url": "[^"]*' /tmp/version_response.json | cut -d'"' -f4)
    RELEASE_NOTES=$(grep -o '"release_notes": "[^"]*' /tmp/version_response.json | cut -d'"' -f4)
    
    echo -e "${YELLOW}Version actuelle: ${CURRENT_VERSION}${NC}"
    echo -e "${YELLOW}Dernière version disponible: ${LATEST_VERSION}${NC}"
    
    # Comparer les versions
    if [ "$CURRENT_VERSION" != "$LATEST_VERSION" ]; then
        echo -e "${GREEN}Une mise à jour est disponible!${NC}"
        echo -e "${YELLOW}Notes de version: ${RELEASE_NOTES}${NC}"
        
        # Vérifier si la mise à jour est obligatoire
        if [ "$FORCE_UPDATE" == "true" ] || [ "$CURRENT_VERSION" \< "$MIN_REQUIRED" ]; then
            echo -e "${RED}Cette mise à jour est obligatoire.${NC}"
            return 2  # Mise à jour obligatoire
        else
            return 1  # Mise à jour facultative
        fi
    else
        echo -e "${GREEN}Vous utilisez déjà la dernière version.${NC}"
        return 0  # Pas de mise à jour nécessaire
    fi
}

# Fonction pour télécharger et installer la mise à jour
download_and_install() {
    echo -e "${YELLOW}Téléchargement de la mise à jour...${NC}"
    
    # Simuler le téléchargement
    # Dans une implémentation réelle, cela téléchargerait le fichier APK
    echo "Téléchargement de $DOWNLOAD_URL..."
    sleep 2
    
    echo -e "${GREEN}Téléchargement terminé.${NC}"
    
    echo -e "${YELLOW}Installation de la mise à jour...${NC}"
    # Simuler l'installation
    # Dans une implémentation réelle, cela installerait l'APK
    sleep 2
    
    echo -e "${GREEN}Installation terminée avec succès!${NC}"
    echo -e "${YELLOW}L'application a été mise à jour vers la version ${LATEST_VERSION}.${NC}"
}

# Fonction pour implémenter la mise à jour dans l'application Flutter
create_update_service() {
    echo -e "${YELLOW}Création du service de mise à jour dans l'application...${NC}"
    
    # Créer le fichier de service de mise à jour
    mkdir -p lib/core/services
    cat > lib/core/services/update_service.dart << EOL
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:camping_game_show/core/config/constants.dart';

class UpdateService {
  static const String updateServerUrl = 'https://update.campinggameshow.example.com';
  
  // Vérifier si des mises à jour sont disponibles
  static Future<UpdateInfo?> checkForUpdates() async {
    try {
      // Obtenir la version actuelle de l'application
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      
      // Faire une requête au serveur de mise à jour
      final response = await http.get(Uri.parse('\$updateServerUrl/version.json'));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final latestVersion = data['latest_version'];
        final minRequiredVersion = data['min_required_version'];
        final forceUpdate = data['force_update'];
        final downloadUrl = data['download_url'];
        final releaseNotes = data['release_notes'];
        
        // Comparer les versions
        if (currentVersion != latestVersion) {
          return UpdateInfo(
            currentVersion: currentVersion,
            latestVersion: latestVersion,
            minRequiredVersion: minRequiredVersion,
            forceUpdate: forceUpdate,
            downloadUrl: downloadUrl,
            releaseNotes: releaseNotes,
            updateAvailable: true,
            mandatoryUpdate: forceUpdate || _isVersionLower(currentVersion, minRequiredVersion),
          );
        }
      }
      
      // Pas de mise à jour disponible ou erreur
      return UpdateInfo(
        currentVersion: currentVersion,
        latestVersion: currentVersion,
        updateAvailable: false,
        mandatoryUpdate: false,
      );
    } catch (e) {
      debugPrint('Erreur lors de la vérification des mises à jour: \$e');
      return null;
    }
  }
  
  // Télécharger et installer la mise à jour
  static Future<bool> downloadAndInstallUpdate(String downloadUrl) async {
    try {
      if (Platform.isAndroid) {
        // Sur Android, ouvrir le lien de téléchargement
        final uri = Uri.parse(downloadUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          return true;
        }
      } else if (Platform.isIOS) {
        // Sur iOS, rediriger vers l'App Store
        final appStoreUrl = 'https://apps.apple.com/app/idXXXXXXXXXX';
        final uri = Uri.parse(appStoreUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Erreur lors du téléchargement de la mise à jour: \$e');
      return false;
    }
  }
  
  // Vérifier si une version est inférieure à une autre
  static bool _isVersionLower(String version1, String version2) {
    final v1Parts = version1.split('.');
    final v2Parts = version2.split('.');
    
    for (int i = 0; i < v1Parts.length && i < v2Parts.length; i++) {
      final v1Part = int.parse(v1Parts[i]);
      final v2Part = int.parse(v2Parts[i]);
      
      if (v1Part < v2Part) {
        return true;
      } else if (v1Part > v2Part) {
        return false;
      }
    }
    
    return v1Parts.length < v2Parts.length;
  }
  
  // Afficher la boîte de dialogue de mise à jour
  static Future<bool> showUpdateDialog(BuildContext context, UpdateInfo updateInfo) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: !updateInfo.mandatoryUpdate,
      builder: (context) => AlertDialog(
        title: Text(updateInfo.mandatoryUpdate 
          ? 'Mise à jour obligatoire' 
          : 'Mise à jour disponible'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Une nouvelle version (\${updateInfo.latestVersion}) est disponible.'),
            const SizedBox(height: 8),
            Text('Votre version actuelle: \${updateInfo.currentVersion}'),
            const SizedBox(height: 16),
            Text('Notes de version:'),
            const SizedBox(height: 8),
            Text(updateInfo.releaseNotes ?? 'Améliorations et corrections de bugs'),
          ],
        ),
        actions: [
          if (!updateInfo.mandatoryUpdate)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Plus tard'),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Mettre à jour maintenant'),
          ),
        ],
      ),
    ) ?? false;
  }
}

class UpdateInfo {
  final String currentVersion;
  final String latestVersion;
  final String? minRequiredVersion;
  final bool forceUpdate;
  final String? downloadUrl;
  final String? releaseNotes;
  final bool updateAvailable;
  final bool mandatoryUpdate;
  
  UpdateInfo({
    required this.currentVersion,
    required this.latestVersion,
    this.minRequiredVersion,
    this.forceUpdate = false,
    this.downloadUrl,
    this.releaseNotes,
    required this.updateAvailable,
    required this.mandatoryUpdate,
  });
}
EOL
    
    echo -e "${GREEN}Service de mise à jour créé avec succès${NC}"
    
    # Créer un exemple d'utilisation
    cat > lib/core/services/update_manager.dart << EOL
import 'package:flutter/material.dart';
import 'package:camping_game_show/core/services/update_service.dart';

class UpdateManager {
  // Vérifier les mises à jour au démarrage de l'application
  static Future<void> checkForUpdatesOnStartup(BuildContext context) async {
    // Attendre que l'application soit complètement chargée
    await Future.delayed(const Duration(seconds: 2));
    
    // Vérifier les mises à jour
    final updateInfo = await UpdateService.checkForUpdates();
    
    if (updateInfo != null && updateInfo.updateAvailable) {
      // Afficher la boîte de dialogue de mise à jour
      final shouldUpdate = await UpdateService.showUpdateDialog(context, updateInfo);
      
      if (shouldUpdate && updateInfo.downloadUrl != null) {
        // Télécharger et installer la mise à jour
        await UpdateService.downloadAndInstallUpdate(updateInfo.downloadUrl!);
      } else if (updateInfo.mandatoryUpdate) {
        // Si la mise à jour est obligatoire et que l'utilisateur a refusé,
        // afficher à nouveau la boîte de dialogue ou fermer l'application
        await checkForUpdatesOnStartup(context);
      }
    }
  }
  
  // Vérifier manuellement les mises à jour
  static Future<void> checkForUpdatesManually(BuildContext context) async {
    // Afficher un indicateur de chargement
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      const SnackBar(content: Text('Vérification des mises à jour...')),
    );
    
    // Vérifier les mises à jour
    final updateInfo = await UpdateService.checkForUpdates();
    
    // Masquer l'indicateur de chargement
    scaffoldMessenger.hideCurrentSnackBar();
    
    if (updateInfo != null) {
      if (updateInfo.updateAvailable) {
        // Afficher la boîte de dialogue de mise à jour
        final shouldUpdate = await UpdateService.showUpdateDialog(context, updateInfo);
        
        if (shouldUpdate && updateInfo.downloadUrl != null) {
          // Télécharger et installer la mise à jour
          await UpdateService.downloadAndInstallUpdate(updateInfo.downloadUrl!);
        }
      } else {
        // Afficher un message indiquant que l'application est à jour
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Vous utilisez déjà la dernière version')),
        );
      }
    } else {
      // Afficher un message d'erreur
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('Impossible de vérifier les mises à jour')),
      );
    }
  }
}
EOL
    
    echo -e "${GREEN}Gestionnaire de mise à jour créé avec succès${NC}"
    
    # Mettre à jour le fichier main.dart pour intégrer la vérification des mises à jour
    echo -e "${YELLOW}Mise à jour du fichier main.dart...${NC}"
    cat > lib/main.dart.update << EOL
import 'package:flutter/material.dart';
import 'package:camping_game_show/app.dart';
import 'package:camping_game_show/core/config/environment.dart';
import 'package:camping_game_show/core/services/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Firebase
  await FirebaseConfig.initialize();
  
  // Initialiser l'environnement
  await Environment.initialize(Environment.production);
  
  runApp(const CampingGameShowApp());
  
  // Note: La vérification des mises à jour sera effectuée dans le widget App
  // après le chargement complet de l'application
}
EOL
    
    # Mettre à jour le fichier app.dart
    echo -e "${YELLOW}Mise à jour du fichier app.dart...${NC}"
    cat > lib/app.dart.update << EOL
import 'package:flutter/material.dart';
import 'package:camping_game_show/core/navigation/app_router.dart';
import 'package:camping_game_show/core/theme/app_theme.dart';
import 'package:camping_game_show/core/services/update_manager.dart';

class CampingGameShowApp extends StatefulWidget {
  const CampingGameShowApp({Key? key}) : super(key: key);

  @override
  State<CampingGameShowApp> createState() => _CampingGameShowAppState();
}

class _CampingGameShowAppState extends State<CampingGameShowApp> {
  final _appRouter = AppRouter();
  
  @override
  void initState() {
    super.initState();
    // Vérifier les mises à jour après le premier rendu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdateManager.checkForUpdatesOnStartup(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Camping Game Show',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
EOL
    
    echo -e "${GREEN}Fichiers mis à jour avec succès${NC}"
    
    # Ajouter les dépendances nécessaires
    echo -e "${YELLOW}Ajout des dépendances nécessaires...${NC}"
    flutter pub add package_info_plus url_launcher
    
    echo -e "${GREEN}Mécanisme de mise à jour automatique implémenté avec succès${NC}"
}

# Exécuter les fonctions principales
check_for_updates
update_status=$?

if [ $update_status -eq 1 ]; then
    echo -e "${YELLOW}Voulez-vous télécharger et installer la mise à jour? (o/n)${NC}"
    read -n 1 -r
    echo
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        download_and_install
    else
        echo -e "${YELLOW}Mise à jour reportée.${NC}"
    fi
elif [ $update_status -eq 2 ]; then
    echo -e "${RED}Cette mise à jour est obligatoire. Installation...${NC}"
    download_and_install
fi

# Créer le service de mise à jour dans l'application
create_update_service

echo -e "${GREEN}=== Système de mise à jour automatique configuré avec succès ===${NC}"
