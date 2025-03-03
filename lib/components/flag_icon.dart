import 'package:flutter/material.dart';
import 'package:country_code_helper/country_code_helper.dart';

// must too be updated into `flutter_country_code`
const String placeholderImgPath = 'flags/placeholder.png';

class FlagIcon extends StatelessWidget {
  final String? countryCode;

  const FlagIcon({super.key, this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(99)),
        child: Image.asset(
          countryCode == null
              ? placeholderImgPath
              : CountryCode.getCountryByCountryCode(countryCode!)?.localFlag ??
                  placeholderImgPath,
          fit: BoxFit.fill,
          height: 50,
          width: 50,
          package: countryCodePackageName,
          errorBuilder: (context, _, __) => const SizedBox(width: 22),
        ),
      ),
    );
  }
}
