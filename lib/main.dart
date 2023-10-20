import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pre_test_mobile_dev/home/ui/page/home_page.dart';
import 'package:pre_test_mobile_dev/login/ui/page/login_page.dart';
import 'package:pre_test_mobile_dev/shared/cubit/auth_cubit.dart';
import 'package:pre_test_mobile_dev/shared/dio_client.dart';

void main() {
  DioClient.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = AuthCubit()..init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => _authCubit),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoaderOverlay(
          child: BlocBuilder<AuthCubit, AuthState>(
            bloc: _authCubit,
            builder: (context, state) {
              if (state is LoggedIn) {
                return const HomePage();
              }
              return const Scaffold(
                body: LoginPage(),
              );
            },
          ),
        ),
      ),
    );
  }
}
