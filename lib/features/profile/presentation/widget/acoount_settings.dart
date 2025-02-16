import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('    Account',
            style: TextStyle(color: AppColors.lightgrey, fontSize: 16)),
        ListTile(
          leading: Icon(
            Icons.edit,
            color: AppColors.deepbrown,
          ),
          title: Text(
            'Edit Profile',
            style: CustomTextStyle.poppins500style16.copyWith(
              color: AppColors.deepbrown,
            ),
          ),
          onTap: () {
            // Navigate to Edit Profile page
          },
        ),
        const Divider(), // Line separator
        ListTile(
          leading: Icon(Icons.notifications, color: AppColors.deepbrown),
          title: Text(
            'Notifications',
            style: CustomTextStyle.poppins500style16.copyWith(
              color: AppColors.deepbrown,
            ),
          ),
          onTap: () {
            // Navigate to Notifications page
          },
        ),
        const Divider(),

        const SizedBox(height: 30),
        Text('   General',
            style: TextStyle(color: AppColors.lightgrey, fontSize: 16)),
        ListTile(
          leading: Icon(Icons.settings, color: AppColors.deepbrown),
          title: Text(
            'Settings',
            style: CustomTextStyle.poppins500style16
                .copyWith(color: AppColors.deepbrown),
          ),
          onTap: () {
            // Navigate to Privacy & Security page
          },
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.security, color: AppColors.deepbrown),
          title: Text(
            'Security',
            style: CustomTextStyle.poppins500style16.copyWith(
              color: AppColors.deepbrown,
            ),
          ),
          onTap: () {
            // Navigate to Notifications page
          },
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.privacy_tip, color: AppColors.deepbrown),
          title: Text(
            'Privacy Policy',
            style: CustomTextStyle.poppins500style16.copyWith(
              color: AppColors.deepbrown,
            ),
          ),
          onTap: () {
            // Navigate to Notifications page
          },
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.logout, color: AppColors.deepbrown),
          title: Text(
            'Log Out',
            style: CustomTextStyle.poppins500style16.copyWith(
              color: AppColors.deepbrown,
            ),
          ),
          onTap: () {
            customReplacementNavigate(context, '/signIn');
            Supabase.instance.client.auth.signOut();
          },
        ),
      ],
    );
  }
}
