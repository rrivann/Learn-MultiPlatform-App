import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/common.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        AppLocalizations.of(context)!.orText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
