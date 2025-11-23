import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/blocs/user/user_event.dart';
import '../presentation/pages/user_page.dart';
import 'app_injections.dart';

class AppRoutes {
  static const String users = '/users';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case users:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(create: (_) => AppInjections.provideUserBloc()..add(LoadAllUsersEvent()), child: const UserPage()),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(body: Center(child: Text("Página no encontrada"))),
        );
    }
  }
}
