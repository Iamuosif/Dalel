import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/profile/data/model/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInfoSection extends StatelessWidget {
  const AccountInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return FutureBuilder<UserProfileModel?>(
          future: context
              .read<AuthCubit>()
              .fetchUserProfile(), // Call the fetch method
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while fetching data
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Show an error message if something went wrong
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              // Handle case where no data is returned
              return const Center(child: Text('No user data found.'));
            } else {
              // Data fetched successfully, display it
              final userProfile = snapshot.data!;
              final fullName =
                  '${userProfile.firstName}${userProfile.lastName}';
              final email = userProfile.email;

              return Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.lightgrey,
                    child: IconButton(
                      onPressed: () {
                        // Add functionality to change profile picture
                      },
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: AppColors.deepbrown,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName, // Display full name
                        style: CustomTextStyle.poppins500style16.copyWith(
                          color: AppColors.deepbrown,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        email, // Display email
                        style: TextStyle(
                          color: AppColors.lightgrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
