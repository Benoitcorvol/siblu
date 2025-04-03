import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camping_game_show/core/theme/app_icons.dart';
import 'package:camping_game_show/features/auth/blocs/auth_bloc.dart';
import 'package:camping_game_show/features/auth/blocs/auth_state.dart';
import 'package:camping_game_show/features/auth/blocs/auth_event.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/repositories/session_repository.dart';
import 'package:go_router/go_router.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late Future<List<GameSession>> _sessionsFuture;
  late final SessionRepository _sessionRepository;

  @override
  void initState() {
    super.initState();
    _sessionRepository = RepositoryProvider.of<SessionRepository>(context);
    _refreshSessions();
  }

  void _refreshSessions() {
    setState(() {
      _sessionsFuture = _loadSessions();
    });
  }

  Future<List<GameSession>> _loadSessions() async {
    try {
      // Simuler un délai pour montrer le chargement
      await Future.delayed(const Duration(milliseconds: 800));
      return await _sessionRepository.getAllSessions();
    } catch (e) {
      // Return empty list in case of error
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tableau de bord',
          style: TextStyle(
            fontFamily: 'Horatio D',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshSessions,
            tooltip: 'Actualiser',
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () => context.go('/admin/settings'),
            tooltip: 'Paramètres',
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                  context.go('/admin/login');
                },
                tooltip: 'Déconnexion',
              );
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
      ),
      drawer: Drawer(
        width: 280,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.secondary],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      AppIcons.camp_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Camping Game Show',
                      style: AppTextStyles.headline2.copyWith(
                        color: Colors.white,
                        fontFamily: 'Horatio D'
                      ),
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (user) => Text(
                            user.name,
                            style: AppTextStyles.headline4.copyWith(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          orElse: () => Text(
                            'Administrateur',
                            style: AppTextStyles.headline4.copyWith(
                              color: Colors.white.withOpacity(0.9)
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.dashboard,
              label: 'Tableau de bord',
              isSelected: true,
              onTap: () => Navigator.pop(context),
            ),
            _buildDrawerItem(
              context: context,
              icon: AppIcons.groups,
              label: 'Équipes',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/teams');
              },
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.emoji_events,
              label: 'Historique des jeux',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/history');
              },
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.settings,
              label: 'Paramètres',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/settings');
              },
            ),
            const Divider(height: 1, thickness: 1),
            _buildDrawerItem(
              context: context,
              icon: Icons.help_outline,
              label: 'Aide',
              onTap: () {
                Navigator.pop(context);
                context.go('/admin/help');
              },
            ),
            _buildDrawerItem(
              context: context,
              icon: Icons.logout,
              label: 'Déconnexion',
              onTap: () {
                Navigator.pop(context);
                context.read<AuthBloc>().add(const AuthEvent.logout());
                context.go('/admin/login');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/admin_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async => _refreshSessions(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Bienvenue Administrateur',
                  style: AppTextStyles.headline1.copyWith(
                    fontFamily: 'Horatio D',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Gestion des sessions de jeu',
                  style: AppTextStyles.headline3.copyWith(
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Section: Add Upcoming Game (Based on Figma 1:282)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ajouter une partie au planning',
                        style: AppTextStyles.headline3.copyWith(color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Enregistrer la date de la partie :',
                        style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'JJ / MM / AAAA',
                                filled: true,
                                fillColor: AppColors.background,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement date selection and session creation logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Partie créée (simulation)')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Créer'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Section: Upcoming/Past Games Tabs (Based on Figma 1:244, 1:292)
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle: AppTextStyles.button.copyWith(fontWeight: FontWeight.bold),
                        unselectedLabelStyle: AppTextStyles.button,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.textSecondary,
                        tabs: const [
                          Tab(text: 'Parties à venir'),
                          Tab(text: 'Parties passées'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          children: [
                            _buildSessionList(context, _sessionsFuture, isUpcoming: true),
                            _buildSessionList(context, _sessionsFuture, isUpcoming: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    Color? bgColor,
  }) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor ?? color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: AppTextStyles.body1.copyWith(
              color: color.withOpacity(0.9),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.headline3.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSessionCard(BuildContext context, GameSession session) {
    final statusColor = session.status == GameSessionStatus.active
        ? AppColors.success
        : session.status == GameSessionStatus.pending
            ? AppColors.warning
            : AppColors.error;
    
    final statusText = session.status == GameSessionStatus.active
        ? 'Active'
        : session.status == GameSessionStatus.pending
            ? 'En attente'
            : 'Terminée';
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.go('/admin/sessions/${session.id}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      session.name,
                      style: AppTextStyles.headline3.copyWith(
                        fontFamily: 'Horatio D',
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusColor),
                    ),
                    child: Text(
                      statusText,
                      style: AppTextStyles.body1.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.calendar_today, 
                    size: 20, 
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    session.scheduledDate != null
                        ? '${session.scheduledDate!.day}/${session.scheduledDate!.month}/${session.scheduledDate!.year}'
                        : 'Date non définie',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.location_on, 
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    session.locationName ?? 'Lieu non défini',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.groups, 
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${session.teams.length} équipes',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.emoji_events, 
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${session.history.length} tours joués',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (session.status == GameSessionStatus.pending) ...[
                    ElevatedButton.icon(
                      onPressed: () {
                        // Démarrer la session
                      },
                      icon: const Icon(Icons.play_arrow, size: 18),
                      label: const Text('Démarrer'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  if (session.status == GameSessionStatus.active) ...[
                    ElevatedButton.icon(
                      onPressed: () {
                        context.go('/admin/sessions/${session.id}/game');
                      },
                      icon: const Icon(Icons.gamepad, size: 18),
                      label: const Text('Contrôler'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.success,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () {
                      context.go('/admin/sessions/${session.id}');
                    },
                    icon: const Icon(Icons.info_outline, size: 18),
                    label: const Text('Détails'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        label,
        style: AppTextStyles.body1.copyWith(
          color: isSelected ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: onTap,
    );
  }

  Widget _buildSessionList(BuildContext context, Future<List<GameSession>> sessionsFuture, {required bool isUpcoming}) {
    return FutureBuilder<List<GameSession>>(
      future: sessionsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Une erreur est survenue',
              style: AppTextStyles.body1.copyWith(color: AppColors.error),
            ),
          );
        }

        final sessions = snapshot.data ?? [];
        final filteredSessions = sessions.where((session) {
          if (session.scheduledDate == null) return false;
          final now = DateTime.now();
          return isUpcoming ? session.scheduledDate!.isAfter(now) : session.scheduledDate!.isBefore(now);
        }).toList();

        if (filteredSessions.isEmpty) {
          return Center(
            child: Text(
              isUpcoming ? 'Aucune partie à venir' : 'Aucune partie passée',
              style: AppTextStyles.body1.copyWith(color: AppColors.textSecondary),
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredSessions.length,
          itemBuilder: (context, index) => _buildSessionCard(context, filteredSessions[index]),
        );
      },
    );
  }
}
