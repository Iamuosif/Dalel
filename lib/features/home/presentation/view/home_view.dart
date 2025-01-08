import 'package:dalel/core/functions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Supabase.instance.client.auth.signOut();
                customReplacementNavigate(context, '/signIn');
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: const Center(
        child: Text('Home View'),
      ),
    );
  }
}
