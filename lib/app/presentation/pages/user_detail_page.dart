import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_state.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Detail")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserError) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red)),
            );
          }

          if (state is UserLoaded) {
            final user = state.user;

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${user.id}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Name: ${user.name}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('WebSite: ${user.website}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            );
          }

          return const Center(child: Text("Sin información del usuario"));
        },
      ),
    );
  }
}
