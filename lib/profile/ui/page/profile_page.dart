import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/profile/cubit/profile_cubit.dart';
import 'package:pre_test_mobile_dev/profile/ui/widget/profile_card.dart';
import 'package:pre_test_mobile_dev/login/cubit/auth_cubit.dart';
import 'package:pre_test_mobile_dev/shared/model/base_state.dart';
import 'package:pre_test_mobile_dev/shared/ui/helper/alert_dialog_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit _profileCubit;

  @override
  void initState() {
    super.initState();
    _profileCubit = ProfileCubit()..init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, BaseState<User>>(
      bloc: _profileCubit,
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Error) {
          return Center(
            child: Text(
              (state as Error).message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state is Success) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileCard(user: (state as Success<User>).data),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  AlertDialogHelper.show(context, onContinue: () {
                    context.read<AuthCubit>().logout();
                  }, message: "Are you sure to sign out?");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
