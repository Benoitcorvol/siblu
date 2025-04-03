import 'package:flutter_test/flutter_test.dart';
import 'package:camping_game_show/features/game_engine/models/wheel_segment.dart';

void main() {
  group('WheelSegment Model Tests', () {
    test('WheelSegment should be created correctly', () {
      final wheelSegment = WheelSegment(
        id: 'segment1',
        name: 'Défi Physique',
        points: 10,
        color: '#F44336',
        type: 'challenge',
        description: 'Réaliser un défi physique',
      );
      
      expect(wheelSegment.id, 'segment1');
      expect(wheelSegment.name, 'Défi Physique');
      expect(wheelSegment.points, 10);
      expect(wheelSegment.color, '#F44336');
      expect(wheelSegment.type, 'challenge');
      expect(wheelSegment.description, 'Réaliser un défi physique');
    });
    
    test('WheelSegment copyWith should work correctly', () {
      final wheelSegment = WheelSegment(
        id: 'segment1',
        name: 'Défi Physique',
        points: 10,
        color: '#F44336',
        type: 'challenge',
        description: 'Réaliser un défi physique',
      );
      
      final updatedSegment = wheelSegment.copyWith(
        name: 'Nouveau défi',
        points: 20,
        color: '#2196F3',
      );
      
      expect(updatedSegment.id, 'segment1'); // Inchangé
      expect(updatedSegment.name, 'Nouveau défi'); // Modifié
      expect(updatedSegment.points, 20); // Modifié
      expect(updatedSegment.color, '#2196F3'); // Modifié
      expect(updatedSegment.type, 'challenge'); // Inchangé
      expect(updatedSegment.description, 'Réaliser un défi physique'); // Inchangé
    });
    
    test('WheelSegment fromJson and toJson should work correctly', () {
      final json = {
        'id': 'segment1',
        'name': 'Défi Physique',
        'points': 10,
        'color': '#F44336',
        'type': 'challenge',
        'description': 'Réaliser un défi physique',
      };
      
      final wheelSegment = WheelSegment.fromJson(json);
      
      expect(wheelSegment.id, 'segment1');
      expect(wheelSegment.name, 'Défi Physique');
      expect(wheelSegment.points, 10);
      expect(wheelSegment.color, '#F44336');
      
      final serialized = wheelSegment.toJson();
      
      expect(serialized['id'], 'segment1');
      expect(serialized['name'], 'Défi Physique');
      expect(serialized['points'], 10);
      expect(serialized['color'], '#F44336');
      expect(serialized['type'], 'challenge');
      expect(serialized['description'], 'Réaliser un défi physique');
    });
    
    test('WheelSegment equality should work correctly', () {
      final segment1 = WheelSegment(
        id: 'segment1',
        name: 'Défi Physique',
        points: 10,
        color: '#F44336',
        type: 'challenge',
        description: 'Réaliser un défi physique',
      );
      
      final segment2 = WheelSegment(
        id: 'segment1',
        name: 'Défi Physique',
        points: 10,
        color: '#F44336',
        type: 'challenge',
        description: 'Réaliser un défi physique',
      );
      
      final segment3 = WheelSegment(
        id: 'segment2',
        name: 'Question Culture',
        points: 20,
        color: '#2196F3',
        type: 'question',
        description: 'Répondre à une question de culture générale',
      );
      
      expect(segment1, segment2);
      expect(segment1, isNot(segment3));
      
      // Vérifier que les objets avec le même ID sont considérés comme égaux
      expect(segment1.hashCode, segment2.hashCode);
      expect(segment1.hashCode, isNot(segment3.hashCode));
    });
  });
}
