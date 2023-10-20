import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pre_test_mobile_dev/login/cubit/login_cubit.dart';
import 'package:pre_test_mobile_dev/login/model/user.dart';
import 'package:pre_test_mobile_dev/shared/cubit/auth_cubit.dart';
import 'package:pre_test_mobile_dev/shared/model/base_state.dart';
import 'package:pre_test_mobile_dev/shared/ui/helper/snackbar_helper.dart';
import 'package:pre_test_mobile_dev/shared/ui/widget/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit _loginCubit;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginCubit = LoginCubit();
    _usernameController.text = "kminchelle";
    _passwordController.text = "0lelplR";
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: BlocListener<LoginCubit, BaseState<User>>(
          bloc: _loginCubit,
          listener: (context, state) {
            if (state is Loading) {
              context.loaderOverlay.show();
              // print("Loading...");
            } else {
              context.loaderOverlay.hide();
              // print("Not loading");
            }
            if (state is Error) {
              SnackBarHelper.errorSnackbar(context, (state as Error).message);
              // print("Error");
            }
            if (state is Success) {
              context.read<AuthCubit>().login();
              // print("Success");
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomTextFormField(
                  label: 'Username',
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Password',
                  controller: _passwordController,
                  isObsecureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _loginCubit.login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
