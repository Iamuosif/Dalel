import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void checkCurrentUserState() {
  final supabase = Supabase.instance.client;

  // Fetch the current user
  final user = supabase.auth.currentUser;

  if (user != null) {
    // User is logged in
    debugPrint('User is logged in: ${user.email}');
  } else {
    // User is not logged in
    debugPrint('No user is logged in.');
  }
}
