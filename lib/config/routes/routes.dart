
import 'package:classic_gpa/presentation/pages/GPA/gpa_class.dart';
import 'package:classic_gpa/presentation/pages/GPA/gpa_page.dart';
import 'package:classic_gpa/presentation/pages/Home/home.dart';
import 'package:classic_gpa/presentation/pages/Home/home_insights.dart';
import 'package:classic_gpa/presentation/pages/Home/setObjective.dart';
import 'package:classic_gpa/presentation/pages/Home/home_plus.dart';
import 'package:go_router/go_router.dart';

class AppRoute{
  GoRouter get router =>
   GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'gpa',
            builder: (context, state) => GpaPage(),
            routes: [
              GoRoute(
                path: 'class',
                builder: (context, state) =>  GpaClass(),
              ),
            ]
          ),
        ],
      ),
      GoRoute(
        path: '/insights/:pageTitle',
        builder: (context, state) {
          final pageTitle = state.params['pageTitle']!;
          return HomeInsights(pageTitle: pageTitle);
        },
      ),
      GoRoute(
        path: '/objective',
        builder: (context, state) => const ObjectivePage(),
      ),
      GoRoute(
        path: '/plus',
        builder: (context, state) => const HomePlus(),
      ),
    ]
  );
}