import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/categories/category_page.dart';
import 'screens/cart/cart_screen.dart';

import 'screens/details/details_screen.dart';

import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/Sell page/Sellpage_screen.dart';
import 'screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  // SignUpScreen.routeName: (context) => SignupScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SellPage.routeName: (context) => SellPage(),
  Category.routeName: (context) => Category(),
};
