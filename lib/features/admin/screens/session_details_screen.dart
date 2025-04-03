import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:go_router/go_router.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:camping_game_show/features/game_engine/models/player.dart';

class SessionDetailsScreen extends StatefulWidget {
  final String sessionId;
  
  const SessionDetailsScreen({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  late GameSession _session;
  bool _isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadSession();
  }
  
  Future<void> _loadSession() async {
    // Simuler le chargement des données
    await Future.delayed(const Duration(milliseconds: 800));
    
    setState(() {
      _session = GameSession(
        id: widget.sessionId,
        name: 'Test Session',
        teams: [
          Team(
            id: '1',
            name: 'Team A',
            players: [
              Player(
                id: '1',
                userId: 'user1',
                sessionId: widget.sessionId,
                displayName: 'Player 1',
                joinedAt: DateTime.now(),
              ),
            ],
            score: 0,
            colorHex: '#FF0000',
            sessionId: widget.sessionId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          Team(
            id: '2',
            name: 'Team B',
            players: [
              Player(
                id: '2',
                userId: 'user2',
                sessionId: widget.sessionId,
                displayName: 'Player 2',
                joinedAt: DateTime.now(),
              ),
            ],
            score: 0,
            colorHex: '#0000FF',
            sessionId: widget.sessionId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
          Team(
            id: '3',
            name: 'Team C',
            players: [
              Player(
                id: '3',
                userId: 'user3',
                sessionId: widget.sessionId,
                displayName: 'Player 3',
                joinedAt: DateTime.now(),
              ),
            ],
            score: 0,
            colorHex: '#00FF00',
            sessionId: widget.sessionId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        ],
        settings: {},
        status: GameSessionStatus.pending,
        gameTemplateType: 'default',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      _isLoading = false;
    });
  }
  
  Color _getStatusColor(GameSessionStatus status) {
    switch (status) {
      case GameSessionStatus.pending:
        return AppColors.warning;
      case GameSessionStatus.active:
        return AppColors.success;
      case GameSessionStatus.completed:
        return AppColors.info;
    }
  }
  
  String _getStatusText(GameSessionStatus status) {
    switch (status) {
      case GameSessionStatus.pending:
        return 'En attente';
      case GameSessionStatus.active:
        return 'Active';
      case GameSessionStatus.completed:
        return 'Terminée';
    }
  }
  
  String _getGameTypeText(String? type) {
    switch (type) {
      case 'standard':
        return 'Jeu standard';
      case 'custom':
        return 'Jeu personnalisé';
      default:
        return 'Type inconnu';
    }
  }
  
  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return '${date.day}/${date.month}/${date.year}';
  }
  
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
  
  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
  
  void _startSession() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Démarrer la session'),
        content: const Text('Êtes-vous sûr de vouloir démarrer cette session de jeu ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/admin/sessions/${widget.sessionId}/game');
            },
            child: const Text('Démarrer'),
          ),
        ],
      ),
    );
  }
  
  void _editSession() {
    context.go('/admin/sessions/${widget.sessionId}/edit');
  }
  
  void _deleteSession() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la session'),
        content: const Text('Êtes-vous sûr de vouloir supprimer cette session de jeu ? Cette action est irréversible.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Session supprimée avec succès'),
                  backgroundColor: AppColors.success,
                ),
              );
              context.go('/admin/dashboard');
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
        title: const Text('Détails de la session'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              _loadSession();
            },
            tooltip: 'Actualiser',
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _isLoading ? null : _editSession,
            tooltip: 'Modifier',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _isLoading ? null : _deleteSession,
            tooltip: 'Supprimer',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // En-tête avec informations de base
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _session.name,
                                style: AppTextStyles.headline2,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(_session.status).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: _getStatusColor(_session.status)),
                                    ),
                                    child: Text(
                                      _getStatusText(_session.status),
                                      style: TextStyle(color: _getStatusColor(_session.status)),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const Icon(Icons.calendar_today, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    _session.scheduledDate != null
                                        ? '${_session.scheduledDate!.day}/${_session.scheduledDate!.month}/${_session.scheduledDate!.year}'
                                        : 'Date non définie',
                                    style: AppTextStyles.body2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (_session.status == GameSessionStatus.pending)
                          ElevatedButton.icon(
                            onPressed: _startSession,
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Démarrer la session'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.success,
                              foregroundColor: Colors.white,
                            ),
                          )
                        else if (_session.status == GameSessionStatus.active)
                          ElevatedButton.icon(
                            onPressed: () {
                              context.go('/admin/sessions/${widget.sessionId}/game');
                            },
                            icon: const Icon(Icons.sports_esports),
                            label: const Text('Continuer le jeu'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Informations détaillées
                    const Divider(),
                    const SizedBox(height: 16),
                    
                    // Détails de la session
                    Text(
                      'Détails de la session',
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard([
                      _buildInfoRow('Type de jeu', _getGameTypeText(_session.gameTemplateType)),
                      _buildInfoRow('Lieu', _session.locationName ?? 'Non défini'),
                      _buildInfoRow('Créée le',
                      _session.createdAt != null
                          ? '${_session.createdAt!.day}/${_session.createdAt!.month}/${_session.createdAt!.year}'
                          : 'N/A'),
                      _buildInfoRow('Dernière modification',
                      _session.updatedAt != null
                          ? '${_session.updatedAt!.day}/${_session.updatedAt!.month}/${_session.updatedAt!.year}'
                          : 'N/A'),
                    ]),
                    const SizedBox(height: 24),
                    
                    // Paramètres
                    Text(
                      'Paramètres',
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard([
                      _buildInfoRow('Nombre max. de tours', _session.settings?['maxRounds']?.toString() ?? '10'),
                      _buildInfoRow('Temps par tour', '${_session.settings?['timePerRound']?.toString() ?? '300'} secondes'),
                      _buildInfoRow('Chat d\'équipe', (_session.settings?['allowTeamChat'] ?? true) ? 'Activé' : 'Désactivé'),
                    ]),
                    const SizedBox(height: 24),
                    
                    // Équipes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Équipes',
                          style: AppTextStyles.headline3,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            context.go('/admin/sessions/${widget.sessionId}/teams');
                          },
                          icon: const Icon(Icons.groups),
                          label: const Text('Gérer les équipes'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    if (_session.teams.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Aucune équipe ajoutée. Cliquez sur "Gérer les équipes" pour commencer.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _session.teams.length,
                        itemBuilder: (context, index) {
                          final team = _session.teams[index];
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
                              subtitle: Text('${team.playerCount} joueurs'),
                              trailing: Text(
                                '${team.score ?? 0} points',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    
                    const SizedBox(height: 24),
                    
                    // Historique des tours
                    Text(
                      'Historique des tours',
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(height: 16),
                    
                    if (_session.history.isEmpty)
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Aucun tour joué. Démarrez la session pour commencer à jouer.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    else
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Historique des tours (à implémenter)',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    
                    const SizedBox(height: 32),
                    
                    // Code de session
                    Text(
                      'Code de session',
                      style: AppTextStyles.headline3,
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const Text(
                              'Partagez ce code avec les joueurs pour qu\'ils puissent rejoindre la session:',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'CAMP-${widget.sessionId.substring(0, 4).toUpperCase()}',
                              style: AppTextStyles.headline2.copyWith(
                                color: AppColors.primary,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                // Copier le code
                              },
                              icon: const Icon(Icons.copy),
                              label: const Text('Copier le code'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
