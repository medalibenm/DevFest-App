import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/logos/Rocket.png',
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Recent Tasks',
              style: GoogleFonts.urbanist(
                  color: Color(0xff171950),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 38,
              width: 71,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffAEB9E1), width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.filter,
                    color: Color(0xffAEB9E1),
                  ),
                  Text(
                    'Filter',
                    style: GoogleFonts.urbanist(color: Color(0xffAEB9E1)),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
