import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';

import 'package:dalel/features/profile/presentation/widget/account_info_section.dart';
import 'package:dalel/features/profile/presentation/widget/acoount_settings.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.offwhite,
          title: Text(
            'Profile',
            style: CustomTextStyle.poppins600style28
                .copyWith(color: AppColors.deepbrown, fontSize: 20),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                AccountInfoSection(),
                SizedBox(height: 25),
                AccountSettings(),
              ],
            ),
          ),
        ));
  }
}
