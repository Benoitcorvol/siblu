import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:go_router/go_router.dart';
// Import other necessary models and widgets

class GameControlScreen extends StatefulWidget {
  final String sessionId;

  const GameControlScreen({
    Key? key,
    required this.sessionId,
  }) : super(key: key);

  @override
  State<GameControlScreen> createState() => _GameControlScreenState();
}

class _GameControlScreenState extends State<GameControlScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  // TODO: Load actual session data based on widget.sessionId
  late GameSession _session;
  late List<Team> _teams;
  bool _isLoading = true;
  bool _isJokerMode = false; // Example state based on Figma

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs based on Figma
    _loadSessionData();
  }

  // Simulate loading session data
  Future<void> _loadSessionData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
       _teams = [
         Team(
           id: '1',
           name: 'Équipe Rose',
           score: 25,
           colorHex: AppColors.colorToHex(AppColors.teamColors[9]),
           sessionId: widget.sessionId,
           players: [],
         ),
         Team(
           id: '2',
           name: 'Équipe Verte',
           score: 16,
           colorHex: AppColors.colorToHex(AppColors.teamColors[2]),
           sessionId: widget.sessionId,
           players: [],
         ),
         Team(
           id: '3',
           name: 'Équipe Bleue',
           score: 20,
           colorHex: AppColors.colorToHex(AppColors.teamColors[1]),
           sessionId: widget.sessionId,
           players: [],
         ),
         Team(
           id: '4',
           name: 'Équipe Jaune',
           score: 30,
           colorHex: AppColors.colorToHex(AppColors.teamColors[3]),
           sessionId: widget.sessionId,
           players: [],
         ),
       ];
       _session = GameSession(
         id: widget.sessionId,
         name: 'Session Actuelle',
         teams: _teams,
         settings: {},
         status: GameSessionStatus.active,
         gameTemplateType: 'standard',
       );
      _isLoading = false;
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(appBar: AppBar(title: const Text('Chargement...')), body: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/admin/dashboard'), // Navigate back
        ),
        title: Text(_session.name, style: AppTextStyles.headline4.copyWith(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColors.primary,
         shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20)
          )
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          indicatorColor: AppColors.secondary,
          tabs: const [
            Tab(text: 'Intro'),
            Tab(text: 'Scores'),
            Tab(text: 'Mini-jeux'),
            Tab(text: 'Final'),
          ],
        ),
      ),
      body: Container(
         decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgrounds/admin_bg.png'), // Use admin background
            fit: BoxFit.cover,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildIntroTab(),
            _buildScoresTab(),
            _buildMiniGamesTab(),
            _buildFinalTab(),
          ],
        ),
      ),
    );
  }

  // Placeholder Widgets for Tabs - To be implemented based on Figma
  Widget _buildIntroTab() {
    // Based on Figma node 1:489
    return Center(child: Text('Contrôles Introduction', style: AppTextStyles.headline3));
  }

  Widget _buildScoresTab() {
    // Based on Figma node 1:492 and 1:505
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
           Text('Tableau des Scores', style: AppTextStyles.headline3.copyWith(color: Colors.white)),
           const SizedBox(height: 20),
           Expanded(child: _buildScoreManagementPanel()),
        ],
      ),
    );
  }

  Widget _buildMiniGamesTab() {
    // Based on Figma node 1:619 and 1:730
     return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
           Text('Contrôle Mini-jeux', style: AppTextStyles.headline3.copyWith(color: Colors.white)),
           const SizedBox(height: 20),
           _buildScreenControlPanel(), // Example placement
           const SizedBox(height: 20),
           if (_isJokerMode) _buildJokerPanel(), // Example placement
        ],
      ),
    );
  }

  Widget _buildFinalTab() {
    // Based on Figma node 1:496
    return Center(child: Text('Contrôles Final', style: AppTextStyles.headline3));
  }

  // --- Sub-components to build based on Figma ---

  Widget _buildScoreManagementPanel() {
    // Based on Figma node 1:505
    return ListView.builder(
      itemCount: _teams.length,
      itemBuilder: (context, index) {
        final team = _teams[index];
        final teamColor = Color(int.parse('0xFF${team.colorHex.substring(1)}'));
        // Example state for points to add/remove for this team
        int pointsDelta = 0; 

        return Card(
          color: Colors.white.withOpacity(0.95),
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      team.name, 
                      style: AppTextStyles.headline4.copyWith(color: teamColor)
                    ),
                    Text(
                      '${team.score} pts', 
                      style: AppTextStyles.headline4.copyWith(fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: teamColor,
                          inactiveTrackColor: teamColor.withOpacity(0.3),
                          thumbColor: teamColor,
                          overlayColor: teamColor.withOpacity(0.2),
                          valueIndicatorColor: teamColor,
                          valueIndicatorTextStyle: const TextStyle(color: Colors.white),
                        ),
                        // TODO: Implement state management for pointsDelta per team
                        child: Slider(
                          value: pointsDelta.toDouble(),
                          min: -100,
                          max: 100,
                          divisions: 20, // Steps of 10 points
                          label: '${pointsDelta > 0 ? '+' : ''}$pointsDelta',
                          onChanged: (value) {
                            // setState(() { pointsDelta = value.toInt(); }); // Needs proper state management
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textSecondary.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${pointsDelta > 0 ? '+' : ''}$pointsDelta',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headline4.copyWith(
                          color: pointsDelta == 0 ? AppColors.textSecondary : (pointsDelta > 0 ? AppColors.success : AppColors.error)
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                     ElevatedButton(
                      onPressed: () { /* TODO: Implement add points logic */ },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(12),
                      ),
                      child: const Icon(Icons.check, size: 20),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildScreenControlPanel() {
    // Based on Figma node 1:631
    // TODO: Add state for selected game/screen
    String selectedGame = 'Question pour un champion'; // Example state

    return Card(
      color: Colors.white.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contrôle Écran Principal', style: AppTextStyles.headline4),
            const SizedBox(height: 16),
            // Example: Category Icon (replace with actual logic)
            Container(
              width: 116,
              height: 102,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/images/illustrations/un_pour_tous.png', // Example asset
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            // Screen Navigation Controls (Simplified example)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous, size: 30),
                  onPressed: () { /* TODO: Navigate to previous screen */ },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      selectedGame, // Display selected game/screen name
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headline4.copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, size: 30),
                  onPressed: () { /* TODO: Navigate to next screen */ },
                ),
              ],
            ),
             const SizedBox(height: 16),
             // TODO: Add more controls as needed (e.g., jump to specific screen)
             Text("Select Screen:", style: AppTextStyles.body1),
             DropdownButton<String>(
               value: selectedGame, // Example
               isExpanded: true,
               items: <String>['Intro', 'Question pour un champion', 'Rat de Star', 'Scoreboard', 'Final']
                   .map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(
                   value: value,
                   child: Text(value),
                 );
               }).toList(),
               onChanged: (String? newValue) {
                 // setState(() { selectedGame = newValue!; }); // Needs state management
               },
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildJokerPanel() {
     // Based on Figma node 1:664
     return Card(
       color: Colors.white.withOpacity(0.9),
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Gestion des Jokers', style: AppTextStyles.headline4),
             const SizedBox(height: 16),
             // TODO: Add Joker activation buttons based on Figma
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 ElevatedButton(onPressed: () {}, child: Text('Joker Positif')),
                 ElevatedButton(onPressed: () {}, child: Text('Joker Négatif')),
               ],
             ),
             const SizedBox(height: 10),
             // TODO: Add team selection for negative joker
           ],
         ),
       ),
     );
  }
}
