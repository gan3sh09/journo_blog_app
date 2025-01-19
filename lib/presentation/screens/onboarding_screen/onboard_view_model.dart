part of 'onboarding_imports.dart';

class OnboardViewModel extends ChangeNotifier {
  int currentIndex = 0;
  final PageController pageController = PageController();

  void goToNextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
      notifyListeners();
    }
  }
}
