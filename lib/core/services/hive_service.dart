import 'package:hive_flutter/hive_flutter.dart';
import 'package:camping_game_show/features/game_engine/models/game_session.dart';
import 'package:camping_game_show/features/game_engine/models/team.dart';
import 'package:camping_game_show/features/game_engine/models/player.dart';
import 'package:camping_game_show/features/game_engine/models/game_round.dart';
import 'package:camping_game_show/features/game_engine/models/wheel_segment.dart';

class HiveService {
  static const String sessionsBoxName = 'sessions';
  static const String teamsBoxName = 'teams';
  static const String playersBoxName = 'players';
  static const String roundsBoxName = 'rounds';
  static const String wheelSegmentsBoxName = 'wheel_segments';
  static const String pendingChangesBoxName = 'pending_changes';
  
  late Box<Map> _sessionsBox;
  late Box<Map> _teamsBox;
  late Box<Map> _playersBox;
  late Box<Map> _roundsBox;
  late Box<Map> _wheelSegmentsBox;
  late Box<Map> _pendingChangesBox;
  
  Future<void> init() async {
    await Hive.initFlutter();
    
    // Ouvrir les boxes
    _sessionsBox = await Hive.openBox<Map>(sessionsBoxName);
    _teamsBox = await Hive.openBox<Map>(teamsBoxName);
    _playersBox = await Hive.openBox<Map>(playersBoxName);
    _roundsBox = await Hive.openBox<Map>(roundsBoxName);
    _wheelSegmentsBox = await Hive.openBox<Map>(wheelSegmentsBoxName);
    _pendingChangesBox = await Hive.openBox<Map>(pendingChangesBoxName);
  }
  
  // Sessions
  Future<void> saveSession(GameSession session) async {
    await _sessionsBox.put(session.id, session.toJson());
  }
  
  GameSession? getSession(String sessionId) {
    final json = _sessionsBox.get(sessionId);
    if (json == null) return null;
    return GameSession.fromJson(Map<String, dynamic>.from(json));
  }
  
  List<GameSession> getAllSessions() {
    return _sessionsBox.values
        .map((json) => GameSession.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }
  
  // Teams
  Future<void> saveTeam(Team team) async {
    await _teamsBox.put(team.id, team.toJson());
  }
  
  Team? getTeam(String teamId) {
    final json = _teamsBox.get(teamId);
    if (json == null) return null;
    return Team.fromJson(Map<String, dynamic>.from(json));
  }
  
  List<Team> getTeamsBySession(String sessionId) {
    return _teamsBox.values
        .map((json) => Team.fromJson(Map<String, dynamic>.from(json)))
        .where((team) => team.sessionId == sessionId)
        .toList();
  }
  
  // Players
  Future<void> savePlayer(Player player) async {
    await _playersBox.put(player.id, player.toJson());
  }
  
  Player? getPlayer(String playerId) {
    final json = _playersBox.get(playerId);
    if (json == null) return null;
    return Player.fromJson(Map<String, dynamic>.from(json));
  }
  
  List<Player> getPlayersByTeam(String teamId) {
    return _playersBox.values
        .map((json) => Player.fromJson(Map<String, dynamic>.from(json)))
        .where((player) => player.teamId == teamId)
        .toList();
  }
  
  // Game Rounds
  Future<void> saveRound(GameRound round) async {
    await _roundsBox.put(round.id, round.toJson());
  }
  
  GameRound? getRound(String roundId) {
    final json = _roundsBox.get(roundId);
    if (json == null) return null;
    return GameRound.fromJson(Map<String, dynamic>.from(json));
  }
  
  List<GameRound> getRoundsBySession(String sessionId) {
    return _roundsBox.values
        .map((json) => GameRound.fromJson(Map<String, dynamic>.from(json)))
        .where((round) => round.sessionId == sessionId)
        .toList();
  }
  
  // Wheel Segments
  Future<void> saveWheelSegment(WheelSegment segment) async {
    await _wheelSegmentsBox.put(segment.id, segment.toJson());
  }
  
  WheelSegment? getWheelSegment(String segmentId) {
    final json = _wheelSegmentsBox.get(segmentId);
    if (json == null) return null;
    return WheelSegment.fromJson(Map<String, dynamic>.from(json));
  }
  
  // Pending Changes
  Future<void> savePendingChange(PendingChange change) async {
    await _pendingChangesBox.put(change.id, change.toJson());
  }
  
  Future<void> removePendingChange(String changeId) async {
    await _pendingChangesBox.delete(changeId);
  }
  
  List<PendingChange> getAllPendingChanges() {
    return _pendingChangesBox.values
        .map((json) => PendingChange.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }
  
  // Cleanup
  Future<void> clearOldSessions() async {
    final oneDayAgo = DateTime.now().subtract(const Duration(days: 1));
    
    final oldSessions = getAllSessions().where((session) {
      return session.updatedAt.isBefore(oneDayAgo);
    });
    
    for (final session in oldSessions) {
      await _sessionsBox.delete(session.id);
    }
  }
}

class PendingChange {
  final String id;
  final String entityType;
  final String entityId;
  final String operation;
  final Map<String, dynamic> data;
  final DateTime timestamp;
  
  PendingChange({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.operation,
    required this.data,
    required this.timestamp,
  });
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'entityType': entityType,
      'entityId': entityId,
      'operation': operation,
      'data': data,
      'timestamp': timestamp.toIso8601String(),
    };
  }
  
  factory PendingChange.fromJson(Map<String, dynamic> json) {
    return PendingChange(
      id: json['id'] as String,
      entityType: json['entityType'] as String,
      entityId: json['entityId'] as String,
      operation: json['operation'] as String,
      data: json['data'] as Map<String, dynamic>,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}
