import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/app_text_styles.dart';
import '../view_model/onboarding_view_model.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<_OnboardingPageData> pages = const [
    _OnboardingPageData(
      image: 'assets/images/onboarding_illustration.png',
      title: "Bienvenue dans l'univers Savvy !",
      description:
          "Savvy t'aide à mieux gérer ton argent avec des outils simples, ludiques et puissants.",
    ),
    _OnboardingPageData(
      image: 'assets/images/onboarding_illustration.png',
      title: "Analyse tes dépenses",
      description: "Visualise et comprends où va ton argent chaque mois.",
    ),
    _OnboardingPageData(
      image: 'assets/images/onboarding_illustration.png',
      title: "Atteins tes objectifs",
      description:
          "Planifie, économise et progresse vers tes rêves financiers.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final pageController = PageController();

    return ChangeNotifierProvider(
      create: (_) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: pages.length,
                      onPageChanged: viewModel.setPage,
                      itemBuilder: (context, index) {
                        final page = pages[index];
                        return Column(
                          children: [
                            SizedBox(height: height * 0.08),
                            Center(
                              child: SizedBox(
                                width: width * 0.6,
                                child: AspectRatio(
                                  aspectRatio: 270.667 / 388.0,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.07),
                                    child: Image.asset(
                                      page.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.075),
                              child: Text(
                                page.title,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.onboardingTitle,
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.075),
                              child: Text(
                                page.description,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.onboardingDescription,
                              ),
                            ),
                            const Spacer(),
                          ],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: viewModel.currentPage == i ? 35 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: viewModel.currentPage == i
                              ? AppColors.vert1
                              : AppColors.grisIndicateur,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                    child: SizedBox(
                      width: double.infinity,
                      height: height * 0.08,
                      child: GestureDetector(
                        onTap: () {
                          if (viewModel.currentPage < pages.length - 1) {
                            pageController.animateToPage(
                              viewModel.currentPage + 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                            context.go('/login');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.gradientStart,
                                AppColors.gradientMiddle,
                                AppColors.gradientEnd,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(height * 0.044),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8.7,
                                offset: Offset(0, 3.5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              viewModel.currentPage < pages.length - 1
                                  ? 'Suivant'
                                  : 'Commencer',
                              style: AppTextStyles.onboardingTitle.copyWith(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blanc,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OnboardingPageData {
  final String image;
  final String title;
  final String description;
  const _OnboardingPageData({
    required this.image,
    required this.title,
    required this.description,
  });
}
