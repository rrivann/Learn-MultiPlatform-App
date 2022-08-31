import 'package:flutter/material.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/common.dart';
import 'package:fundamental_app/moduls/localization_accessibility/practice/content/benefit_table.dart';

class BenefitWidget extends StatelessWidget {
  const BenefitWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.benefitTitle,
          style: Theme.of(context).textTheme.headline4,
          softWrap: true,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: BenefitTable(),
        ),
      ],
    );
  }
}
