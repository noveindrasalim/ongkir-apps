import 'package:get/get.dart';

import 'package:ongkoskirimapps/app/modules/home/bindings/home_binding.dart';
import 'package:ongkoskirimapps/app/modules/home/views/home_view.dart';
import 'package:ongkoskirimapps/app/modules/introduction_screen/bindings/introduction_screen_binding.dart';
import 'package:ongkoskirimapps/app/modules/introduction_screen/views/introduction_screen_view.dart';
import 'package:ongkoskirimapps/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:ongkoskirimapps/app/modules/login_page/views/login_page_view.dart';
import 'package:ongkoskirimapps/app/modules/main_page/bindings/main_page_binding.dart';
import 'package:ongkoskirimapps/app/modules/main_page/views/main_page_view.dart';
import 'package:ongkoskirimapps/app/modules/registrasi_page/bindings/registrasi_page_binding.dart';
import 'package:ongkoskirimapps/app/modules/registrasi_page/views/registrasi_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INTRODUCTION_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION_SCREEN,
      page: () => IntroductionScreenView(),
      binding: IntroductionScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRASI_PAGE,
      page: () => RegistrasiPageView(),
      binding: RegistrasiPageBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
    ),
  ];
}
