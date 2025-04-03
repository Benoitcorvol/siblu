import 'package:flutter/material.dart';
import 'package:camping_game_show/core/theme/app_colors.dart';
import 'package:camping_game_show/core/theme/app_text_styles.dart';
import 'package:camping_game_show/core/theme/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camping_game_show/features/auth/blocs/auth_bloc.dart';
import 'package:camping_game_show/features/auth/blocs/auth_event.dart';
import 'package:camping_game_show/features/auth/blocs/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:camping_game_show/features/player/screens/player_game_screen.dart';

class PlayerLoginScreen extends StatefulWidget {
  const PlayerLoginScreen({super.key});

  @override
  State<PlayerLoginScreen> createState() => _PlayerLoginScreenState();
}

class _PlayerLoginScreenState extends State<PlayerLoginScreen> {
  final _sessionIdController = TextEditingController();
  final _playerNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _sessionIdController.dispose();
    _playerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (user) {
              if (!user.isAdmin) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerGameScreen(
                      sessionId: user.currentSessionId,
                    ),
                  ),
                );
              }
            },
            failure: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo et titre
                      const Icon(
                        AppIcons.camp_outlined,
                        size: 80,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Camping Game Show',
                        style: AppTextStyles.headline1,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rejoindre une partie',
                        style: AppTextStyles.headline3,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      
                      // Formulaire de connexion
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _sessionIdController,
                              decoration: const InputDecoration(
                                labelText: 'Session ID',
                                hintText: 'Entrez le code à 6 chiffres',
                                prefixIcon: Icon(Icons.numbers),
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer le code de session';
                                }
                                if (value.length != 6 || int.tryParse(value) == null) {
                                  return 'Le code doit contenir 6 chiffres';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _playerNameController,
                              decoration: const InputDecoration(
                                labelText: 'Your Name',
                                hintText: 'Comment souhaitez-vous être appelé?',
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre nom';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            
                            // Bouton de connexion
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: state.maybeWhen(
                                  loading: () => null,
                                  orElse: () => () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthBloc>().add(
                                            AuthEvent.joinSession(
                                              sessionId: _sessionIdController.text,
                                              playerName: _playerNameController.text,
                                            ),
                                          );
                                    }
                                  },
                                ),
                                child: state.maybeWhen(
                                  loading: () => const CircularProgressIndicator(),
                                  orElse: () => const Text(
                                    'Rejoindre la partie',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Scanner QR
                            OutlinedButton.icon(
                              onPressed: () {
                                context.go('/player/scan');
                              },
                              icon: const Icon(Icons.qr_code_scanner),
                              label: const Text('Scanner un code QR'),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Lien vers l'interface admin
                            TextButton(
                              onPressed: () {
                                context.go('/admin/login');
                              },
                              child: const Text('Accéder à l\'interface administrateur'),
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
        },
      ),
    );
  }
}
