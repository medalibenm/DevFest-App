import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/utils/constants/colors.dart';

class NotifBox extends StatelessWidget {
  const NotifBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 315,
      decoration: BoxDecoration(
          color: TColors.white,
          border: Border.all(color: Colors.grey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '12:45',
                  style: TextStyle(color: Color(0xff171950)),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 20,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 270,
                  child: Text(
                    'Machine temperature reached 85°C. Cooling system check required.',
                    softWrap: true,
                    style: GoogleFonts.urbanist(
                        fontSize: 15,
                        color: Color(0xff171950),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Color(0xff0E43FB),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '19/10/2024',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '12:45',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Color(0xff0E43FB),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '19/10/2024',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '12:45',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Color(0xff0E43FB),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '19/10/2024',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '12:45',
                          style: GoogleFonts.urbanist(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 7,
            ),
            Text(
              'Alert Details',
              style: GoogleFonts.urbanist(
                  fontSize: 16,
                  color: Color(0xff0E43FB),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Machine temperature reached 85°C. Cooling system check required.',
              style: GoogleFonts.urbanist(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color(
                              0xff0E43FB), // Change border color
                          width: 1, // Change border width
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.arrow_circle_right,
                            size: 20,
                            color: Color(0xff0E43FB),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Mark as read',
                            style: GoogleFonts.urbanist(
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
