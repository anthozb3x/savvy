import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';
import '../../core/ui/savvy_text_field.dart';

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;
  late final AnimationController _scaleController;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.95,
      upperBound: 1.0,
      value: 1.0,
    );
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    context.go('/');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.blanc,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.08),
                      // Logo
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: width * 0.6,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      // Titre
                      Text(
                        "Connexion",
                        style: AppTextStyles.onboardingTitle.copyWith(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Sous-titre
                      Text(
                        "Connecte-toi à ton compte Savvy",
                        style: AppTextStyles.onboardingDescription.copyWith(
                          fontSize: 16,
                          color: Color(0xFF949494),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      // Champ Email
                      SavvyTextField(
                        label: "Adresse e-mail",
                        obscureText: false,
                      ),
                      SizedBox(height: 16),
                      // Champ Password
                      SavvyTextField(
                        label: "Mot de passe",
                        obscureText: true,
                      ),
                      SizedBox(height: 24),
                      // Bouton principal
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              _isButtonPressed = true;
                            });
                            _scaleController.reverse();
                          },
                          onTapUp: (_) {
                            setState(() {
                              _isButtonPressed = false;
                            });
                            _scaleController.forward();
                            // TODO: Connexion
                          },
                          onTapCancel: () {
                            setState(() {
                              _isButtonPressed = false;
                            });
                            _scaleController.forward();
                          },
                          child: ScaleTransition(
                            scale: _scaleController,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.gradientInscriptionStart,
                                    AppColors.gradientInscriptionEnd,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Connexion",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // OU séparateur
                      Row(
                        children: [
                          Expanded(child: Divider(color: Color(0xFF5E5E5E))),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "OU",
                              style: TextStyle(
                                color: Color(0xFF949494),
                                fontSize: 14,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Color(0xFF5E5E5E))),
                        ],
                      ),
                      SizedBox(height: 24),
                      // Bouton Google
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Google sign-in
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0E0422),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 12),
                                Text(
                                  "Continuer avec Google",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFF8F8F8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Pas encore de compte ? S'inscrire
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pas encore de compte ? ",
                            style: TextStyle(
                              color: Color(0xFF949494),
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.go('/inscription');
                            },
                            child: Text(
                              "S'inscrire",
                              style: TextStyle(
                                color: Color(0xFF8076A9),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
