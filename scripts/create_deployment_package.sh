#!/bin/bash

# Script de création du package de déploiement pour Camping Game Show
# Ce script génère les builds de production pour Android et iOS

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Création du package de déploiement pour Camping Game Show ===${NC}"
echo "Date: $(date)"
echo "Version: 1.0.0"
echo ""

# Vérifier que Flutter est installé
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter n'est pas installé ou n'est pas dans le PATH${NC}"
    exit 1
fi

# Vérifier la version de Flutter
FLUTTER_VERSION=$(flutter --version | head -n 1)
echo -e "${GREEN}Utilisation de: ${FLUTTER_VERSION}${NC}"
echo ""

# Nettoyer les builds précédents
echo -e "${YELLOW}Nettoyage des builds précédents...${NC}"
flutter clean
echo -e "${GREEN}Nettoyage terminé${NC}"
echo ""

# Récupérer les dépendances
echo -e "${YELLOW}Récupération des dépendances...${NC}"
flutter pub get
echo -e "${GREEN}Dépendances récupérées${NC}"
echo ""

# Exécuter les tests
echo -e "${YELLOW}Exécution des tests...${NC}"
flutter test
if [ $? -ne 0 ]; then
    echo -e "${RED}Les tests ont échoué. Arrêt du build.${NC}"
    exit 1
fi
echo -e "${GREEN}Tests réussis${NC}"
echo ""

# Créer le répertoire de sortie
OUTPUT_DIR="./build/release"
mkdir -p $OUTPUT_DIR
echo -e "${GREEN}Répertoire de sortie créé: $OUTPUT_DIR${NC}"
echo ""

# Build Android
echo -e "${YELLOW}Création du build Android...${NC}"
flutter build apk --release
if [ $? -ne 0 ]; then
    echo -e "${RED}Le build Android a échoué${NC}"
    exit 1
fi

# Copier l'APK dans le répertoire de sortie
cp ./build/app/outputs/flutter-apk/app-release.apk $OUTPUT_DIR/camping_game_show_1.0.0.apk
echo -e "${GREEN}Build Android terminé: $OUTPUT_DIR/camping_game_show_1.0.0.apk${NC}"
echo ""

# Build Android Bundle
echo -e "${YELLOW}Création du bundle Android...${NC}"
flutter build appbundle --release
if [ $? -ne 0 ]; then
    echo -e "${RED}Le build du bundle Android a échoué${NC}"
    exit 1
fi

# Copier le bundle dans le répertoire de sortie
cp ./build/app/outputs/bundle/release/app-release.aab $OUTPUT_DIR/camping_game_show_1.0.0.aab
echo -e "${GREEN}Build du bundle Android terminé: $OUTPUT_DIR/camping_game_show_1.0.0.aab${NC}"
echo ""

# Vérifier si nous sommes sur macOS pour le build iOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo -e "${YELLOW}Création du build iOS...${NC}"
    flutter build ios --release --no-codesign
    if [ $? -ne 0 ]; then
        echo -e "${RED}Le build iOS a échoué${NC}"
        exit 1
    fi
    echo -e "${GREEN}Build iOS terminé${NC}"
    echo -e "${YELLOW}Note: Pour générer un IPA signé, utilisez Xcode pour l'archivage et l'exportation${NC}"
else
    echo -e "${YELLOW}Skipping iOS build (requires macOS)${NC}"
fi
echo ""

# Créer un fichier d'informations sur le build
BUILD_INFO="$OUTPUT_DIR/build_info.txt"
echo "Camping Game Show - Build Information" > $BUILD_INFO
echo "=====================================" >> $BUILD_INFO
echo "" >> $BUILD_INFO
echo "Version: 1.0.0" >> $BUILD_INFO
echo "Date de build: $(date)" >> $BUILD_INFO
echo "Flutter version: $FLUTTER_VERSION" >> $BUILD_INFO
echo "" >> $BUILD_INFO
echo "Fichiers inclus:" >> $BUILD_INFO
echo "- camping_game_show_1.0.0.apk (Android APK)" >> $BUILD_INFO
echo "- camping_game_show_1.0.0.aab (Android App Bundle)" >> $BUILD_INFO
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "- Build iOS (disponible via Xcode)" >> $BUILD_INFO
fi
echo "" >> $BUILD_INFO
echo "Instructions d'installation:" >> $BUILD_INFO
echo "1. Android: Installez l'APK directement sur l'appareil ou utilisez le bundle pour Google Play" >> $BUILD_INFO
echo "2. iOS: Utilisez Xcode pour générer un IPA signé et le distribuer via TestFlight ou l'App Store" >> $BUILD_INFO

echo -e "${GREEN}Fichier d'informations créé: $BUILD_INFO${NC}"
echo ""

# Générer un code QR pour l'installation (si qrencode est installé)
if command -v qrencode &> /dev/null; then
    echo -e "${YELLOW}Génération du code QR pour l'installation...${NC}"
    INSTALL_URL="https://campinggameshow.example.com/install"
    qrencode -o "$OUTPUT_DIR/install_qr.png" "$INSTALL_URL"
    echo -e "${GREEN}Code QR généré: $OUTPUT_DIR/install_qr.png${NC}"
else
    echo -e "${YELLOW}qrencode n'est pas installé, le code QR n'a pas été généré${NC}"
fi
echo ""

# Créer un fichier ZIP contenant tous les fichiers
echo -e "${YELLOW}Création de l'archive ZIP...${NC}"
cd $OUTPUT_DIR/..
zip -r release.zip release/
mv release.zip release/camping_game_show_1.0.0.zip
cd - > /dev/null
echo -e "${GREEN}Archive ZIP créée: $OUTPUT_DIR/camping_game_show_1.0.0.zip${NC}"
echo ""

echo -e "${GREEN}=== Package de déploiement créé avec succès ===${NC}"
echo -e "${GREEN}Tous les fichiers sont disponibles dans: $OUTPUT_DIR${NC}"
