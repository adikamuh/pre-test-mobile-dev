import 'package:flutter/material.dart';
import 'package:pre_test_mobile_dev/login/model/user.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(
            user.image,
            width: 100,
            height: 100,
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${user.firstName} ${user.lastName}"),
              const SizedBox(height: 4),
              Text("username: ${user.username}"),
            ],
          ),
        ),
      ],
    );
  }
}
