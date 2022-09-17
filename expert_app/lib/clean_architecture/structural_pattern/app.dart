import 'package:expert_app/clean_architecture/structural_pattern/model/adapter_pattern.dart';
import 'package:flutter/material.dart';

class AppStructuralPattern extends StatelessWidget {
  const AppStructuralPattern({super.key});

  @override
  Widget build(BuildContext context) {
    final googleSDKAuthtication = GoogleSDKAuthentication();
    final githubAuthenticationAdapter =
        GitHubAuthenticationAdapter('abcd-efgh', 'read');

    authenticateApps(googleSDKAuthtication); // Authenticated!
    authenticateApps(githubAuthenticationAdapter); // Authenticated!
    return Container();
  }
}
