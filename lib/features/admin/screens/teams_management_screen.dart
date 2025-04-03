import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:go_router/go_router.dart';

class TeamsManagementScreen extends StatefulWidget {
  final String sessionId;
  
  const TeamsManagementScreen({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  @override
  State<TeamsManagementScreen> createState() => _TeamsManagementScreenState();
}

class _TeamsManagementScreenState extends State<TeamsManagementScreen> {
  late List<Team> _teams;
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadTeams();
  }
  
  Future<void> _loadTeams() async {
    // Simuler le chargement des données
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Dans une implémentation réelle, cela viendrait du repository
    setState(() {
      _teams = [
        Team(
          id: 'team1',
          name: 'Les Aventuriers',
          colorHex: '#F44336',
          score: 120,
          sessionId: widget.sessionId,
          players: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Team(
          id: 'team2',
          name: 'Les Explorateurs',
          colorHex: '#2196F3',
          score: 90,
          sessionId: widget.sessionId,
          players: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Team(
          id: 'team3',
          name: 'Les Champions',
          colorHex: '#4CAF50',
          score: 150,
          sessionId: widget.sessionId,
          players: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];
      _isLoading = false;
    });
  }
  
  void _addTeam() {
    showDialog(
      context: context,
      builder: (context) => _TeamDialog(
        onTeamCreated: (team) {
          setState(() {
            _teams.add(team);
          });
        },
      ),
    );
  }
  
  void _editTeam(Team team, int index) {
    showDialog(
      context: context,
      builder: (context) => _TeamDialog(
        initialTeam: team,
        onTeamCreated: (updatedTeam) {
          setState(() {
            _teams[index] = updatedTeam;
          });
        },
      ),
    );
  }
  
  void _deleteTeam(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer l\'équipe'),
        content: Text('Êtes-vous sûr de vouloir supprimer l\'équipe "${_teams[index].name}" ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _teams.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des équipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadTeams();
            },
            tooltip: 'Actualiser',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTeam,
        child: const Icon(Icons.add),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Équipes',
                    style: AppTextStyles.headline2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Gérez les équipes participant à la session de jeu',
                    style: AppTextStyles.body1,
                  ),
                  const SizedBox(height: 24),
                  
                  if (_teams.isEmpty)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.groups_outlined,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Aucune équipe',
                            style: AppTextStyles.headline4,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Ajoutez des équipes pour commencer le jeu',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            onPressed: _addTeam,
                            icon: const Icon(Icons.add),
                            label: const Text('Ajouter une équipe'),
                          ),
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: _teams.length,
                        itemBuilder: (context, index) {
                          final team = _teams[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(int.parse('0xFF${team.colorHex.substring(1)}')),
                                        radius: 24,
                                        child: Text(
                                          team.name.substring(0, 1).toUpperCase(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              team.name,
                                              style: AppTextStyles.headline4,
                                            ),
                                            Text(
                                              'Score: ${team.score} points',
                                              style: AppTextStyles.body1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.edit),
                                            onPressed: () => _editTeam(team, index),
                                            tooltip: 'Modifier',
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete),
                                            onPressed: () => _deleteTeam(index),
                                            tooltip: 'Supprimer',
                                            color: AppColors.error,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  const Divider(),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Joueurs (${team.players.length})',
                                    style: AppTextStyles.body1.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  if (team.players.isEmpty)
                                    const Text(
                                      'Aucun joueur dans cette équipe',
                                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                                    )
                                  else
                                    const Text(
                                      'Liste des joueurs (à implémenter)',
                                      style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                                    ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      OutlinedButton.icon(
                                        onPressed: () {
                                          // Naviguer vers la gestion des joueurs de l'équipe
                                          context.go('/admin/teams/${team.id}/players');
                                        },
                                        icon: const Icon(Icons.person_add),
                                        label: const Text('Gérer les joueurs'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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

class _TeamDialog extends StatefulWidget {
  final Team? initialTeam;
  final Function(Team) onTeamCreated;

  const _TeamDialog({
    Key? key,
    this.initialTeam,
    required this.onTeamCreated,
  }) : super(key: key);

  @override
  State<_TeamDialog> createState() => _TeamDialogState();
}

class _TeamDialogState extends State<_TeamDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late String _colorHex;

  final List<String> _predefinedColors = [
    '#F44336', // Rouge
    '#E91E63', // Rose
    '#9C27B0', // Violet
    '#673AB7', // Violet foncé
    '#3F51B5', // Indigo
    '#2196F3', // Bleu
    '#03A9F4', // Bleu clair
    '#00BCD4', // Cyan
    '#009688', // Teal
    '#4CAF50', // Vert
    '#8BC34A', // Vert clair
    '#CDDC39', // Lime
    '#FFEB3B', // Jaune
    '#FFC107', // Ambre
    '#FF9800', // Orange
    '#FF5722', // Orange foncé
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialTeam?.name ?? '');
    _colorHex = widget.initialTeam?.colorHex ?? '#F44336';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveTeam() {
    if (_formKey.currentState?.validate() ?? false) {
      final team = widget.initialTeam?.copyWith(
            name: _nameController.text,
            colorHex: _colorHex,
          ) ??
          Team(
            id: 'team-${DateTime.now().millisecondsSinceEpoch}',
            name: _nameController.text,
            colorHex: _colorHex,
            score: 0,
            sessionId: 'session-id', // À remplacer par l'ID réel de la session
            players: [],
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          );

      widget.onTeamCreated(team);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.initialTeam == null ? 'Ajouter une équipe' : 'Modifier l\'équipe'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nom de l\'équipe',
                hintText: 'Ex: Les Aventuriers',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un nom pour l\'équipe';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            const Text('Couleur de l\'équipe'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _predefinedColors.map((color) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _colorHex = color;
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(int.parse('0xFF${color.substring(1)}')),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _colorHex == color ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: _colorHex == color
                          ? [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _saveTeam,
          child: Text(widget.initialTeam == null ? 'Ajouter' : 'Enregistrer'),
        ),
      ],
    );
  }
}
