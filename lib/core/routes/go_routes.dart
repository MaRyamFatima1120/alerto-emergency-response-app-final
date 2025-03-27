import 'package:alerto_emergency_response_app/core/routes/transition_routes.dart';
import 'package:alerto_emergency_response_app/features/rescuer/view/authentication/forget_page.dart';
import 'package:alerto_emergency_response_app/features/rescuer/view/authentication/login_page.dart';
import 'package:alerto_emergency_response_app/features/rescuer/view/authentication/register_page.dart';
import 'package:alerto_emergency_response_app/features/splash/view/splash.dart';
import 'package:alerto_emergency_response_app/features/user/view/profile/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/rescuer/view/authentication/profile_page.dart';
import '../../features/user/view/emergency_help/emergency_request_help_step2.dart';
import '../../features/user/view/emergency_help/emergency_request_page.dart';
import '../../features/user/view/emergency_help/waiting_for_rescuer_page.dart';
import '../../features/user/view/main_page.dart';
import '../../features/user/view/map/user_map_screen.dart';
import '../../features/user/view/profile/edit_personal_info_page.dart';
import 'error_routes.dart';

class AppRoutes {
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoute.errorPage,
        path: '/error-page',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ErrorPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.splashPage,
        path: '/',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SplashPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.mainPage,
        path: '/mainPage',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const MainPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.emergencyRequestPage,
        path: '/emergency-request',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const EmergencyRequestPage(),
        ),
      ),
      GoRoute(
          name: AppRoute.emergencyRequestHelpPage,
          path: '/emergencyRequest-help',
          pageBuilder: (context, state) {
            final emergencyType = state.extra as Map<String, dynamic>;
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: EmergencyRequestHelpStep2(
                  latitude: emergencyType['latitude'],
                  longitude: emergencyType['longitude'],
                  emergencyType: emergencyType['selectedEmergency']),
            );
          }),
      GoRoute(
          name: AppRoute.waitingForRescuerPage,
          path: '/waitingRescuer_response',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: WaitingForRescuerPage(),
            );
          }),

      //User Map Page
      GoRoute(
          name: AppRoute.userMapPage,
          path: '/userMap-page',
          pageBuilder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: UserMapPage(
                latitude: data['latitude'] ?? 0.0,
                longitude: data['longitude'] ?? 0.0,
                emergencyType: data['selectedEmergency'] ?? "Unknown",
                phone: data['phone'] ?? "No phone provided",
                notes: data['notes'] ?? "No notes provided",
            ));
          }),

      GoRoute(
          name: AppRoute.personalInfoPage,
          path: '/personalInfo-page',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: PersonalInfo(),
            );
          }),
      GoRoute(
          name: AppRoute.editPersonalInfoPage,
          path: '/editPersonalInfo-page',
          pageBuilder: (context, state) {
            return buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: EditPersonalInfoPage(),
            );
          }),

      ///Rescuer  Routes

      GoRoute(
        name: AppRoute.loginPage,
        path: '/login',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.registerPage,
        path: '/register',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.profilePage,
        path: '/profile',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ProfilePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgetPage,
        path: '/forget',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ForgetPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String splashPage = 'splash-page';
  static const String registerPage = 'register-page';
  static const String loginPage = 'login-page';
  static const String profilePage = 'profile-page';
  static const String forgetPage = 'forget-page';

  ///User
  static const String mainPage = 'main-page';
  static const String emergencyRequestPage = 'emergencyRequest-page';
  static const String emergencyRequestHelpPage = 'emergencyRequest-help';
  static const String waitingForRescuerPage = 'waitingRescuer_response';
  static const String personalInfoPage = 'personalInfo-page';
  static const String editPersonalInfoPage = 'editPersonalInfo-page';
  static const String userMapPage = 'userMap-page';
}
