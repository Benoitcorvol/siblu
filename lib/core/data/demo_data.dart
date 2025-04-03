// Données de démonstration pour l'application Camping Game Show
// Ce fichier contient des données JSON pour pré-remplir l'application avec des exemples

// 1. Sessions de jeu de démonstration
const demoSessions = [
  {
    "id": "demo_session_1",
    "name": "Soirée Camping des Pins",
    "adminId": "admin_user_1",
    "createdAt": "2025-03-28T18:00:00.000Z",
    "startedAt": "2025-03-28T19:00:00.000Z",
    "endedAt": "2025-03-28T21:30:00.000Z",
    "teamIds": ["team_red", "team_blue", "team_green", "team_yellow"],
    "status": "completed",
    "joinCode": "123456",
    "description": "Session de démonstration avec 4 équipes et 20 joueurs"
  },
  {
    "id": "demo_session_2",
    "name": "Tournoi du Lac",
    "adminId": "admin_user_1",
    "createdAt": "2025-03-29T14:00:00.000Z",
    "startedAt": "2025-03-29T15:00:00.000Z",
    "status": "active",
    "teamIds": ["team_purple", "team_orange", "team_pink"],
    "joinCode": "654321",
    "description": "Session en cours avec 3 équipes et défis aquatiques"
  },
  {
    "id": "demo_session_3",
    "name": "Challenge des Étoiles",
    "adminId": "admin_user_1",
    "createdAt": "2025-03-30T10:00:00.000Z",
    "status": "created",
    "teamIds": [],
    "description": "Session prête à démarrer pour la soirée astronomie"
  }
];

// 2. Équipes de démonstration
const demoTeams = [
  {
    "id": "team_red",
    "name": "Les Dragons Rouges",
    "sessionId": "demo_session_1",
    "color": "#FF5252",
    "playerIds": ["player_1", "player_2", "player_3", "player_4", "player_5"],
    "score": 1250
  },
  {
    "id": "team_blue",
    "name": "Les Requins Bleus",
    "sessionId": "demo_session_1",
    "color": "#448AFF",
    "playerIds": ["player_6", "player_7", "player_8", "player_9", "player_10"],
    "score": 1400
  },
  {
    "id": "team_green",
    "name": "Les Crocodiles Verts",
    "sessionId": "demo_session_1",
    "color": "#4CAF50",
    "playerIds": ["player_11", "player_12", "player_13", "player_14"],
    "score": 950
  },
  {
    "id": "team_yellow",
    "name": "Les Lions Jaunes",
    "sessionId": "demo_session_1",
    "color": "#FFEB3B",
    "playerIds": ["player_15", "player_16", "player_17", "player_18", "player_19", "player_20"],
    "score": 1100
  },
  {
    "id": "team_purple",
    "name": "Les Dauphins Violets",
    "sessionId": "demo_session_2",
    "color": "#9C27B0",
    "playerIds": ["player_21", "player_22", "player_23", "player_24"],
    "score": 750
  },
  {
    "id": "team_orange",
    "name": "Les Tigres Orange",
    "sessionId": "demo_session_2",
    "color": "#FF9800",
    "playerIds": ["player_25", "player_26", "player_27", "player_28", "player_29"],
    "score": 820
  },
  {
    "id": "team_pink",
    "name": "Les Flamants Roses",
    "sessionId": "demo_session_2",
    "color": "#E91E63",
    "playerIds": ["player_30", "player_31", "player_32", "player_33"],
    "score": 680
  }
];

// 3. Joueurs de démonstration
const demoPlayers = [
  // Équipe Rouge
  {"id": "player_1", "name": "Thomas", "teamId": "team_red", "sessionId": "demo_session_1", "personalScore": 300, "status": "playing"},
  {"id": "player_2", "name": "Sophie", "teamId": "team_red", "sessionId": "demo_session_1", "personalScore": 250, "status": "playing"},
  {"id": "player_3", "name": "Lucas", "teamId": "team_red", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  {"id": "player_4", "name": "Emma", "teamId": "team_red", "sessionId": "demo_session_1", "personalScore": 300, "status": "playing"},
  {"id": "player_5", "name": "Hugo", "teamId": "team_red", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  
  // Équipe Bleue
  {"id": "player_6", "name": "Léa", "teamId": "team_blue", "sessionId": "demo_session_1", "personalScore": 350, "status": "playing"},
  {"id": "player_7", "name": "Nathan", "teamId": "team_blue", "sessionId": "demo_session_1", "personalScore": 300, "status": "playing"},
  {"id": "player_8", "name": "Chloé", "teamId": "team_blue", "sessionId": "demo_session_1", "personalScore": 250, "status": "playing"},
  {"id": "player_9", "name": "Théo", "teamId": "team_blue", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  {"id": "player_10", "name": "Inès", "teamId": "team_blue", "sessionId": "demo_session_1", "personalScore": 300, "status": "playing"},
  
  // Équipe Verte
  {"id": "player_11", "name": "Mathis", "teamId": "team_green", "sessionId": "demo_session_1", "personalScore": 250, "status": "playing"},
  {"id": "player_12", "name": "Jade", "teamId": "team_green", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  {"id": "player_13", "name": "Louis", "teamId": "team_green", "sessionId": "demo_session_1", "personalScore": 300, "status": "playing"},
  {"id": "player_14", "name": "Manon", "teamId": "team_green", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  
  // Équipe Jaune
  {"id": "player_15", "name": "Jules", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  {"id": "player_16", "name": "Camille", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 150, "status": "playing"},
  {"id": "player_17", "name": "Raphaël", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 200, "status": "playing"},
  {"id": "player_18", "name": "Zoé", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 250, "status": "playing"},
  {"id": "player_19", "name": "Gabriel", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 150, "status": "playing"},
  {"id": "player_20", "name": "Louise", "teamId": "team_yellow", "sessionId": "demo_session_1", "personalScore": 150, "status": "playing"},
  
  // Équipe Violette
  {"id": "player_21", "name": "Ethan", "teamId": "team_purple", "sessionId": "demo_session_2", "personalScore": 200, "status": "playing"},
  {"id": "player_22", "name": "Lina", "teamId": "team_purple", "sessionId": "demo_session_2", "personalScore": 150, "status": "playing"},
  {"id": "player_23", "name": "Maxime", "teamId": "team_purple", "sessionId": "demo_session_2", "personalScore": 200, "status": "playing"},
  {"id": "player_24", "name": "Sarah", "teamId": "team_purple", "sessionId": "demo_session_2", "personalScore": 200, "status": "playing"},
  
  // Équipe Orange
  {"id": "player_25", "name": "Adam", "teamId": "team_orange", "sessionId": "demo_session_2", "personalScore": 180, "status": "playing"},
  {"id": "player_26", "name": "Eva", "teamId": "team_orange", "sessionId": "demo_session_2", "personalScore": 150, "status": "playing"},
  {"id": "player_27", "name": "Noa", "teamId": "team_orange", "sessionId": "demo_session_2", "personalScore": 170, "status": "playing"},
  {"id": "player_28", "name": "Lola", "teamId": "team_orange", "sessionId": "demo_session_2", "personalScore": 150, "status": "playing"},
  {"id": "player_29", "name": "Paul", "teamId": "team_orange", "sessionId": "demo_session_2", "personalScore": 170, "status": "playing"},
  
  // Équipe Rose
  {"id": "player_30", "name": "Arthur", "teamId": "team_pink", "sessionId": "demo_session_2", "personalScore": 180, "status": "playing"},
  {"id": "player_31", "name": "Clara", "teamId": "team_pink", "sessionId": "demo_session_2", "personalScore": 150, "status": "playing"},
  {"id": "player_32", "name": "Sacha", "teamId": "team_pink", "sessionId": "demo_session_2", "personalScore": 170, "status": "playing"},
  {"id": "player_33", "name": "Maëlle", "teamId": "team_pink", "sessionId": "demo_session_2", "personalScore": 180, "status": "playing"}
];

// 4. Tours de jeu de démonstration
const demoRounds = [
  {
    "id": "round_1_session_1",
    "sessionId": "demo_session_1",
    "roundNumber": 1,
    "startedAt": "2025-03-28T19:00:00.000Z",
    "endedAt": "2025-03-28T19:15:00.000Z",
    "wheelSegmentId": "segment_quiz",
    "teamScores": {
      "team_red": 200,
      "team_blue": 300,
      "team_green": 150,
      "team_yellow": 250
    },
    "status": "completed"
  },
  {
    "id": "round_2_session_1",
    "sessionId": "demo_session_1",
    "roundNumber": 2,
    "startedAt": "2025-03-28T19:20:00.000Z",
    "endedAt": "2025-03-28T19:40:00.000Z",
    "wheelSegmentId": "segment_physical",
    "teamScores": {
      "team_red": 350,
      "team_blue": 250,
      "team_green": 300,
      "team_yellow": 200
    },
    "status": "completed"
  },
  {
    "id": "round_3_session_1",
    "sessionId": "demo_session_1",
    "roundNumber": 3,
    "startedAt": "2025-03-28T19:45:00.000Z",
    "endedAt": "2025-03-28T20:05:00.000Z",
    "wheelSegmentId": "segment_creative",
    "teamScores": {
      "team_red": 300,
      "team_blue": 350,
      "team_green": 200,
      "team_yellow": 250
    },
    "status": "completed"
  },
  {
    "id": "round_4_session_1",
    "sessionId": "demo_session_1",
    "roundNumber": 4,
    "startedAt": "2025-03-28T20:10:00.000Z",
    "endedAt": "2025-03-28T20:30:00.000Z",
    "wheelSegmentId": "segment_memory",
    "teamScores": {
      "team_red": 200,
      "team_blue": 300,
      "team_green": 150,
      "team_yellow": 200
    },
    "status": "completed"
  },
  {
    "id": "round_5_session_1",
    "sessionId": "demo_session_1",
    "roundNumber": 5,
    "startedAt": "2025-03-28T20:35:00.000Z",
    "endedAt": "2025-03-28T21:00:00.000Z",
    "wheelSegmentId": "segment_bonus",
    "teamScores": {
      "team_red": 200,
      "team_blue": 200,
      "team_green": 150,
      "team_yellow": 200
    },
    "status": "completed"
  },
  {
    "id": "round_1_session_2",
    "sessionId": "demo_session_2",
    "roundNumber": 1,
    "startedAt": "2025-03-29T15:00:00.000Z",
    "endedAt": "2025-03-29T15:20:00.000Z",
    "wheelSegmentId": "segment_quiz",
    "teamScores": {
      "team_purple": 250,
      "team_orange": 300,
      "team_pink": 200
    },
    "status": "completed"
  },
  {
    "id": "round_2_session_2",
    "sessionId": "demo_session_2",
    "roundNumber": 2,
    "startedAt": "2025-03-29T15:25:00.000Z",
    "endedAt": "2025-03-29T15:45:00.000Z",
    "wheelSegmentId": "segment_physical",
    "teamScores": {
      "team_purple": 300,
      "team_orange": 250,
      "team_pink": 250
    },
    "status": "completed"
  },
  {
    "id": "round_3_session_2",
    "sessionId": "demo_session_2",
    "roundNumber": 3,
    "startedAt": "2025-03-29T15:50:00.000Z",
    "wheelSegmentId": "segment_creative",
    "teamScores": {
      "team_purple": 200,
      "team_orange": 270,
      "team_pink": 230
    },
    "status": "active"
  }
];

// 5. Segments de roue de démonstration
const demoWheelSegments = [
  {
    "id": "segment_quiz",
    "name": "Quiz",
    "description": "Questions de culture générale",
    "color": "#2196F3",
    "icon": "quiz",
    "points": 100,
    "probability": 0.2
  },
  {
    "id": "segment_physical",
    "name": "Défi Physique",
    "description": "Épreuves d'adresse et de rapidité",
    "color": "#F44336",
    "icon": "fitness_center",
    "points": 150,
    "probability": 0.2
  },
  {
    "id": "segment_creative",
    "name": "Créativité",
    "description": "Dessins, mimes et expression",
    "color": "#4CAF50",
    "icon": "brush",
    "points": 100,
    "probability": 0.2
  },
  {
    "id": "segment_memory",
    "name": "Mémoire",
    "description": "Tests de mémoire et d'observation",
    "color": "#9C27B0",
    "icon": "psychology",
    "points": 100,
    "probability": 0.15
  },
  {
    "id": "segment_team",
    "name": "Défi d'Équipe",
    "description": "Coopération et coordination",
    "color": "#FF9800",
    "icon": "groups",
    "points": 200,
    "probability": 0.15
  },
  {
    "id": "segment_bonus",
    "name": "Bonus",
    "description": "Points bonus pour toutes les équipes",
    "color": "#FFEB3B",
    "icon": "star",
    "points": 50,
    "probability": 0.05
  },
  {
    "id": "segment_risk",
    "name": "Tout ou Rien",
    "description": "Double ou perte de points",
    "color": "#607D8B",
    "icon": "casino",
    "points": 0,
    "probability": 0.05
  }
];

// 6. Utilisateurs de démonstration
const demoUsers = [
  {
    "id": "admin_user_1",
    "name": "Admin Principal",
    "email": "admin@campinggameshow.example.com",
    "role": "admin",
    "lastLoginAt": "2025-03-30T09:30:00.000Z"
  },
  {
    "id": "admin_user_2",
    "name": "Admin Secondaire",
    "email": "admin2@campinggameshow.example.com",
    "role": "admin",
    "lastLoginAt": "2025-03-29T14:15:00.000Z"
  }
];

// 7. Défis de démonstration
const demoChallenges = [
  {
    "id": "challenge_quiz_1",
    "type": "quiz",
    "title": "Culture Générale",
    "description": "10 questions sur divers sujets",
    "timeLimit": 300,
    "questions": [
      {
        "question": "Quelle est la capitale de l'Australie ?",
        "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
        "correctAnswer": 2
      },
      {
        "question": "Qui a peint La Joconde ?",
        "options": ["Van Gogh", "Picasso", "Michel-Ange", "Léonard de Vinci"],
        "correctAnswer": 3
      },
      // ... autres questions
    ]
  },
  {
    "id": "challenge_physical_1",
    "type": "physical",
    "title": "Course d'obstacles",
    "description": "Parcours chronométré avec obstacles",
    "timeLimit": 180,
    "instructions": [
      "Préparez un parcours avec 5 obstacles",
      "Chaque équipe désigne 2 participants",
      "Chronométrez chaque participant",
      "L'équipe avec le meilleur temps moyen gagne"
    ]
  },
  {
    "id": "challenge_creative_1",
    "type": "creative",
    "title": "Dessin Mystère",
    "description": "Devinez ce que votre coéquipier dessine",
    "timeLimit": 240,
    "wordList": [
      "Camping-car", "Feu de camp", "Tente", "Randonnée", 
      "Marshmallow", "Étoile filante", "Sac de couchage", "Lac"
    ]
  }
];

// Fonction pour charger les données de démonstration
void loadDemoData() {
  print("Chargement des données de démonstration...");
  
  // Ici, vous implémenteriez le code pour charger ces données dans votre base de données
  // Par exemple, avec Firebase Firestore :
  
  /*
  // Chargement des utilisateurs
  for (final user in demoUsers) {
    firestore.collection('users').doc(user['id']).set(user);
  }
  
  // Chargement des sessions
  for (final session in demoSessions) {
    firestore.collection('sessions').doc(session['id']).set(session);
  }
  
  // Chargement des équipes
  for (final team in demoTeams) {
    firestore.collection('teams').doc(team['id']).set(team);
  }
  
  // Chargement des joueurs
  for (final player in demoPlayers) {
    firestore.collection('players').doc(player['id']).set(player);
  }
  
  // Chargement des tours
  for (final round in demoRounds) {
    firestore.collection('rounds').doc(round['id']).set(round);
  }
  
  // Chargement des segments de roue
  for (final segment in demoWheelSegments) {
    firestore.collection('wheelSegments').doc(segment['id']).set(segment);
  }
  
  // Chargement des défis
  for (final challenge in demoChallenges) {
    firestore.collection('challenges').doc(challenge['id']).set(challenge);
  }
  */
  
  print("Données de démonstration chargées avec succès !");
}

// Exporter les données pour utilisation dans l'application
final Map<String, dynamic> demoData = {
  'sessions': demoSessions,
  'teams': demoTeams,
  'players': demoPlayers,
  'rounds': demoRounds,
  'wheelSegments': demoWheelSegments,
  'users': demoUsers,
  'challenges': demoChallenges,
  'loadDemoData': loadDemoData
};
