#!/bin/bash

# Script de création du serveur de distribution pour l'application Camping Game Show
# Ce script configure un serveur web simple pour distribuer l'application

# Définir les couleurs pour les messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Configuration du serveur de distribution pour Camping Game Show ===${NC}"

# Vérifier que les outils nécessaires sont installés
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Python3 n'est pas installé${NC}"
    exit 1
fi

# Créer le dossier de distribution s'il n'existe pas
mkdir -p dist/web

# Créer la page d'accueil du serveur de distribution
echo -e "${YELLOW}Création de la page d'accueil du serveur de distribution...${NC}"
cat > dist/web/index.html << EOL
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Camping Game Show - Téléchargement</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            text-align: center;
            margin-bottom: 40px;
        }
        h1 {
            color: #2c3e50;
        }
        .download-section {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .download-button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            border-radius: 4px;
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        .download-button:hover {
            background-color: #45a049;
        }
        .qr-section {
            text-align: center;
            margin: 30px 0;
        }
        .qr-code {
            max-width: 200px;
            margin: 0 auto;
            display: block;
        }
        footer {
            text-align: center;
            margin-top: 50px;
            color: #7f8c8d;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <header>
        <h1>Camping Game Show</h1>
        <p>Téléchargez l'application pour animer vos soirées au camping!</p>
    </header>

    <div class="download-section">
        <h2>Téléchargement pour Android</h2>
        <p>Version: 1.0.0 - Publiée le 30 mars 2025</p>
        <a href="camping_game_show.apk" class="download-button">Télécharger l'APK</a>
        <p><small>Note: Vous devrez peut-être autoriser l'installation d'applications provenant de sources inconnues dans les paramètres de votre appareil.</small></p>
    </div>

    <div class="download-section">
        <h2>Téléchargement pour iOS</h2>
        <p>Pour les appareils iOS, veuillez utiliser TestFlight ou contacter votre administrateur pour obtenir un lien d'installation.</p>
    </div>

    <div class="qr-section">
        <h2>Scanner pour installer</h2>
        <p>Scannez ce code QR avec votre appareil mobile pour télécharger l'application:</p>
        <img src="install_android.png" alt="QR Code d'installation" class="qr-code">
    </div>

    <div class="download-section">
        <h2>Documentation</h2>
        <p>Consultez notre guide d'installation et d'utilisation:</p>
        <a href="installation_guide.pdf" class="download-button">Guide d'installation</a>
    </div>

    <footer>
        <p>&copy; 2025 Camping Game Show. Tous droits réservés.</p>
        <p>Pour toute assistance, contactez support@campinggameshow.example.com</p>
    </footer>
</body>
</html>
EOL

echo -e "${GREEN}Page d'accueil créée avec succès${NC}"

# Créer le script de démarrage du serveur
echo -e "${YELLOW}Création du script de démarrage du serveur...${NC}"
cat > dist/web/start_server.sh << EOL
#!/bin/bash
echo "Démarrage du serveur de distribution sur le port 8000..."
echo "Accédez à l'application via: http://localhost:8000"
echo "Appuyez sur Ctrl+C pour arrêter le serveur"
cd "\$(dirname "\$0")"
python3 -m http.server 8000
EOL

chmod +x dist/web/start_server.sh
echo -e "${GREEN}Script de démarrage créé avec succès${NC}"

# Copier les fichiers nécessaires dans le dossier de distribution
echo -e "${YELLOW}Copie des fichiers dans le dossier de distribution...${NC}"

# Copier l'APK
if [ -f "build/app/outputs/flutter-apk/app-release.apk" ]; then
    cp build/app/outputs/flutter-apk/app-release.apk dist/web/camping_game_show.apk
    echo -e "${GREEN}APK copié avec succès${NC}"
else
    echo -e "${YELLOW}APK non trouvé, veuillez exécuter le script de build d'abord${NC}"
fi

# Copier le QR code
if [ -f "dist/install_android.png" ]; then
    cp dist/install_android.png dist/web/
    echo -e "${GREEN}QR code copié avec succès${NC}"
else
    echo -e "${YELLOW}QR code non trouvé, veuillez exécuter le script de build d'abord${NC}"
fi

# Convertir le guide d'installation en PDF
echo -e "${YELLOW}Conversion du guide d'installation en PDF...${NC}"
if command -v pandoc &> /dev/null; then
    if [ -f "docs/installation_guide.md" ]; then
        pandoc docs/installation_guide.md -o dist/web/installation_guide.pdf
        echo -e "${GREEN}Guide d'installation converti en PDF avec succès${NC}"
    else
        echo -e "${YELLOW}Guide d'installation non trouvé${NC}"
    fi
else
    echo -e "${YELLOW}pandoc n'est pas installé, impossible de convertir le guide en PDF${NC}"
    # Copier le fichier markdown directement
    if [ -f "docs/installation_guide.md" ]; then
        cp docs/installation_guide.md dist/web/
        echo -e "${GREEN}Guide d'installation copié au format markdown${NC}"
    fi
fi

echo -e "${GREEN}=== Serveur de distribution configuré avec succès ===${NC}"
echo -e "${YELLOW}Pour démarrer le serveur:${NC}"
echo -e "  1. Naviguez vers le dossier dist/web"
echo -e "  2. Exécutez ./start_server.sh"
echo -e "  3. Accédez à http://localhost:8000 dans votre navigateur"

echo -e "${GREEN}=== Fin de la configuration du serveur de distribution ===${NC}"
