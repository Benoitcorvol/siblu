#!/bin/bash

# Script de build pour l'application Camping Game Show
# Ce script génère les packages de déploiement pour Android et iOS

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Début du processus de build pour Camping Game Show ===${NC}"

# Vérifier que Flutter est installé
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter n'est pas installé ou n'est pas dans le PATH${NC}"
    exit 1
fi

# Vérifier la version de Flutter
FLUTTER_VERSION=$(flutter --version | grep -o "Flutter [0-9]\.[0-9]*\.[0-9]*" | cut -d ' ' -f 2)
REQUIRED_VERSION="3.16.4"

echo -e "${YELLOW}Version de Flutter détectée: ${FLUTTER_VERSION}${NC}"
echo -e "${YELLOW}Version minimale requise: ${REQUIRED_VERSION}${NC}"

# Nettoyer le projet
echo -e "${YELLOW}Nettoyage du projet...${NC}"
flutter clean
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors du nettoyage du projet${NC}"
    exit 1
fi
echo -e "${GREEN}Nettoyage terminé avec succès${NC}"

# Récupérer les dépendances
echo -e "${YELLOW}Récupération des dépendances...${NC}"
flutter pub get
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de la récupération des dépendances${NC}"
    exit 1
fi
echo -e "${GREEN}Dépendances récupérées avec succès${NC}"

# Exécuter les tests
echo -e "${YELLOW}Exécution des tests...${NC}"
flutter test
if [ $? -ne 0 ]; then
    echo -e "${RED}Certains tests ont échoué${NC}"
    read -p "Voulez-vous continuer malgré les erreurs de test? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}Tous les tests ont réussi${NC}"
fi

# Créer le build Android
echo -e "${YELLOW}Création du build Android...${NC}"
flutter build apk --release
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de la création du build Android${NC}"
    exit 1
fi
echo -e "${GREEN}Build Android créé avec succès${NC}"

# Créer le bundle Android App Bundle
echo -e "${YELLOW}Création du bundle Android App Bundle...${NC}"
flutter build appbundle --release
if [ $? -ne 0 ]; then
    echo -e "${RED}Erreur lors de la création du bundle Android${NC}"
    exit 1
fi
echo -e "${GREEN}Bundle Android créé avec succès${NC}"

# Vérifier si nous sommes sur macOS pour le build iOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Créer le build iOS
    echo -e "${YELLOW}Création du build iOS...${NC}"
    flutter build ios --release --no-codesign
    if [ $? -ne 0 ]; then
        echo -e "${RED}Erreur lors de la création du build iOS${NC}"
        exit 1
    fi
    echo -e "${GREEN}Build iOS créé avec succès${NC}"
else
    echo -e "${YELLOW}Skipping iOS build - not on macOS${NC}"
fi

# Créer le dossier de distribution s'il n'existe pas
mkdir -p dist

# Copier les fichiers de build dans le dossier de distribution
echo -e "${YELLOW}Copie des fichiers de build dans le dossier de distribution...${NC}"
cp build/app/outputs/flutter-apk/app-release.apk dist/camping_game_show.apk
cp build/app/outputs/bundle/release/app-release.aab dist/camping_game_show.aab

# Générer les QR codes pour l'installation
echo -e "${YELLOW}Génération des QR codes pour l'installation...${NC}"
if command -v qrencode &> /dev/null; then
    qrencode -o dist/install_android.png "https://example.com/download/camping_game_show.apk"
    echo -e "${GREEN}QR code généré avec succès${NC}"
else
    echo -e "${YELLOW}qrencode n'est pas installé, impossible de générer les QR codes${NC}"
fi

# Afficher le résumé
echo -e "${GREEN}=== Build terminé avec succès ===${NC}"
echo -e "${YELLOW}Fichiers générés:${NC}"
echo -e "  - dist/camping_game_show.apk (Android APK)"
echo -e "  - dist/camping_game_show.aab (Android App Bundle)"
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "  - build/ios/iphoneos (iOS build)"
fi
if command -v qrencode &> /dev/null; then
    echo -e "  - dist/install_android.png (QR code d'installation Android)"
fi

echo -e "${YELLOW}Pour installer l'application sur un appareil Android:${NC}"
echo -e "  1. Transférer le fichier APK sur l'appareil"
echo -e "  2. Ouvrir le fichier APK sur l'appareil pour l'installer"
echo -e "  3. Ou scanner le QR code généré"

if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${YELLOW}Pour distribuer l'application iOS:${NC}"
    echo -e "  1. Ouvrir le projet Xcode"
    echo -e "  2. Configurer la signature du code"
    echo -e "  3. Archiver et distribuer via TestFlight ou Ad Hoc"
fi

echo -e "${GREEN}=== Fin du processus de build ===${NC}"
