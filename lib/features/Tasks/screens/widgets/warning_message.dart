import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class WarningMessage extends StatelessWidget {
  const WarningMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 63,
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.3),
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Iconsax.danger,
            color: Colors.red,
          ),
          SizedBox(
            width: 7,
          ),
          Container(
            width: 300,
            child: Text(
              'Machine temperature reached 85°C. Cooling system check required.',
              softWrap: true,
              style: GoogleFonts.urbanist(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
