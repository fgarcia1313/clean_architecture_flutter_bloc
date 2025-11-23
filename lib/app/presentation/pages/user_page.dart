import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';
import 'user_detail_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          // 1. Loading
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Error
          if (state is UserError) {
            return Center(
              child: Text(state.message, style: const TextStyle(color: Colors.red)),
            );
          }

          // 3. Lista cargada
          if (state is UsersLoaded) {
            final users = state.users;

            if (users.isEmpty) {
              return const Center(child: Text("No users found"));
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text('${user.email}  |  WebSite: ${user.website}'),
                  onTap: () {
                    context.read<UserBloc>().add(LoadUserByIdEvent(user.id));

                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const UserDetailPage(), // hola
                      ),
                    );
                    */
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<UserBloc>(), // Reusar el mismo bloc
                          child: const UserDetailPage(),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }

          // 4. Estado inicial sin cargar nada
          return const Center(child: Text("Cargando usuarios..."));
        },
      ),
    );
  }
}
