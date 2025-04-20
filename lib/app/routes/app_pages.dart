import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jenisumkm/bindings/jenisumkm_binding.dart';
import '../modules/jenisumkm/views/jenisumkm_view.dart';
import '../modules/keuangan/bindings/keuangan_binding.dart';
import '../modules/keuangan/views/keuangan_view.dart';
import '../modules/legalusaha/bindings/legalusaha_binding.dart';
import '../modules/legalusaha/views/legalusaha_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/marketing/bindings/marketing_binding.dart';
import '../modules/marketing/views/marketing_view.dart';
import '../modules/operasional/bindings/operasional_binding.dart';
import '../modules/operasional/views/operasional_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.JENISUMKM,
      page: () => const JenisumkmView(),
      binding: JenisumkmBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.OPERASIONAL,
      page: () => OperasionalView(),
      binding: OperasionalBinding(),
    ),
    GetPage(
      name: _Paths.KEUANGAN,
      page: () => KeuanganView(),
      binding: KeuanganBinding(),
    ),
    GetPage(
      name: _Paths.MARKETING,
      page: () => const MarketingView(),
      binding: MarketingBinding(),
    ),
    GetPage(
      name: _Paths.LEGALUSAHA,
      page: () => const LegalusahaView(),
      binding: LegalusahaBinding(),
    ),
  ];
}
