import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitlePicture extends StatelessWidget {
  const TitlePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/logos/Logo.png'),
        SizedBox(
          height: 10,
        ),
        Text(
          'Hello,',
          style:
              GoogleFonts.urbanist(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(
          'Mr Meziane Redouane',
          style:
              GoogleFonts.urbanist(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
