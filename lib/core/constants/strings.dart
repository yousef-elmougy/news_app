/// https://api.openweathermap.org/data/2.5/weather?q=London&appid=b466e697447632ee6c82f6adb6e3e7fa

class AppStrings {
  /// ROUTES
  static const String newsLayoutScreen = '/';
  static const String onBoardingScreen = '/onboarding_screen';
  static const String newsDetailsScreen = '/news_details_screen';
  static const String searchScreen = '/search_screen';
  static const String sourcesDetailsScreen = '/sources_details_screen';

  /// KEYS
  static const String isDarkKey = 'isDark';
  // static const String apiKey = 'c274b777d30e4f4c9eeefb8f6af3c7d2';
  // static const String apiKey = '924dea2a217c4b9f82a1a29ee2002ce7';
  static const String apiKey = 'ade8a59578ea4050994dad67d0e8578d';
  // static const String apiKey = 'c89ee89c3373449495de3739df6931e1';
  // static const String apiKey = 'afb6d433cd6645448090d11aa2028bfe';

  /// URLS
  static const String baseUrl = 'https://newsapi.org/';

  /// IMAGES
  static const String pathImage = "assets/img";
  static const String pathLogo = "assets/logos";

  // LOADING
  static const String loadingImage = "$pathImage/Circles.gif";
  static const String placeholderImage = "$pathImage/placeholder.jpg";

  // ON BOARDING
  static const String cookImage = "$pathImage/cook.png";
  static const String deliverImage = "$pathImage/deliver.png";
  static const String orderImage = "$pathImage/order.png";


  /// STRINGS

// ON BOARDING DESCRIPTION
  static const String cookDesc =
      "We are maintain safty and We keep clean while making food.";
  static const String deliverDesc =
      "Orders your favorite meals will be  immediately deliver";
  static const String orderDesc =
      "Now you can order food any time  right from your mobile.";

  // ON BOARDING TITLE
  static const String cookTitle = "Cooking Safe Food";
  static const String deliverTitle = "Quick Delivery";
  static const String orderTitle = "Order Your Food";
}
