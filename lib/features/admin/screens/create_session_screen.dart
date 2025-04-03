import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:go_router/go_router.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({Key? key}) : super(key: key);

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  DateTime? _scheduledDate;
  final List<Team> _teams = [];
  String _gameTemplateType = 'standard';
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _scheduledDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _scheduledDate) {
      setState(() {
        _scheduledDate = picked;
      });
    }
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

  void _removeTeam(int index) {
    setState(() {
      _teams.removeAt(index);
    });
  }

  void _createSession() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isCreating = true;
      });

      try {
        // Simuler un délai pour montrer le chargement
        await Future.delayed(const Duration(seconds: 1));

        // Dans une implémentation réelle, cela utiliserait le repository
        final session = GameSession(
          id: 'new-session-${DateTime.now().millisecondsSinceEpoch}',
          name: _nameController.text,
          teams: _teams,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          status: GameSessionStatus.pending,
          gameTemplateType: _gameTemplateType,
          scheduledDate: _scheduledDate,
          locationName: _locationController.text,
          settings: {},
          history: [],
          currentRound: null,
        );

        // Naviguer vers le tableau de bord avec un message de succès
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Session créée avec succès'),
              backgroundColor: AppColors.success,
            ),
          );
          context.go('/admin/dashboard');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erreur lors de la création de la session: $e'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isCreating = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer une nouvelle session'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/admin/dashboard');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informations de la session',
                  style: AppTextStyles.headline3,
                ),
                const SizedBox(height: 16),
                
                // Nom de la session
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom de la session',
                    hintText: 'Ex: Grand jeu du camping - Été 2025',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.event),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer un nom pour la session';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // Date prévue
                InkWell(
                  onTap: () => _selectDate(context),
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'Date prévue',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      _scheduledDate != null
                          ? '${_scheduledDate!.day}/${_scheduledDate!.month}/${_scheduledDate!.year}'
                          : 'Sélectionner une date',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Lieu
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Lieu',
                    hintText: 'Ex: Terrain de jeux principal',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Type de jeu
                Text(
                  'Type de jeu',
                  style: AppTextStyles.headline3,
                ),
                const SizedBox(height: 16),
                
                DropdownButtonFormField<String>(
                  value: _gameTemplateType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.sports_esports),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'standard',
                      child: Text('Jeu standard'),
                    ),
                    DropdownMenuItem(
                      value: 'quiz',
                      child: Text('Quiz'),
                    ),
                    DropdownMenuItem(
                      value: 'challenge',
                      child: Text('Défis'),
                    ),
                    DropdownMenuItem(
                      value: 'custom',
                      child: Text('Personnalisé'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _gameTemplateType = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 24),
                
                // Équipes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Équipes',
                      style: AppTextStyles.headline3,
                    ),
                    ElevatedButton.icon(
                      onPressed: _addTeam,
                      icon: const Icon(Icons.add),
                      label: const Text('Ajouter une équipe'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                if (_teams.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Aucune équipe ajoutée. Cliquez sur "Ajouter une équipe" pour commencer.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _teams.length,
                    itemBuilder: (context, index) {
                      final team = _teams[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Color(int.parse('0xFF${team.colorHex.substring(1)}')),
                            child: Text(
                              team.name.substring(0, 1).toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(team.name),
                          subtitle: Text('${team.players.length} joueurs'),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _removeTeam(index),
                          ),
                        ),
                      );
                    },
                  ),
                
                const SizedBox(height: 32),
                
                // Boutons d'action
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _isCreating
                            ? null
                            : () {
                                context.go('/admin/dashboard');
                              },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Annuler'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isCreating ? null : _createSession,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: _isCreating
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text('Créer la session'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TeamDialog extends StatefulWidget {
  final Function(Team) onTeamCreated;

  const _TeamDialog({
    Key? key,
    required this.onTeamCreated,
  }) : super(key: key);

  @override
  State<_TeamDialog> createState() => _TeamDialogState();
}

class _TeamDialogState extends State<_TeamDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _colorHex = '#FF5722'; // Couleur par défaut

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
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _createTeam() {
    if (_formKey.currentState?.validate() ?? false) {
      final team = Team(
        id: 'team-${DateTime.now().millisecondsSinceEpoch}',
        name: _nameController.text,
        colorHex: _colorHex,
        score: 0,
        sessionId: 'pending-session',
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
      title: const Text('Ajouter une équipe'),
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
          onPressed: _createTeam,
          child: const Text('Ajouter'),
        ),
      ],
    );
  }
}
