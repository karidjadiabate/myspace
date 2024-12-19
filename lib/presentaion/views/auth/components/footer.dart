import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FooterTexts extends StatelessWidget {
  const FooterTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Text(
          loc.copyright,
          style: const TextStyle(
            fontSize: 12, 
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}