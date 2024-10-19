import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_therapist/features/Tasks/screens/widgets/dropdown_example.dart';
import 'package:my_therapist/utils/constants/colors.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({
    super.key,
    required this.name,
    required this.type,
    required this.state,
    required this.description,
    required this.deadline,
  });
  final String name;
  final String type;
  final String state;
  final String description;
  final String deadline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 300,
      decoration: BoxDecoration(
          color: TColors.white,
          border: Border.all(color: Colors.grey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: GoogleFonts.urbanist(
                  fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Type : ',
                  style: GoogleFonts.urbanist(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 25,
                  width: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Text(
                      type,
                      style: GoogleFonts.urbanist(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'State :',
                  style: GoogleFonts.urbanist(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 15,
                ),
                DropdownExample(
                  status: state,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Description : ',
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: TColors.black)),
              TextSpan(
                  text: description,
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: TColors.black)),
            ])),
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Deadline : ',
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: TColors.black)),
              TextSpan(
                  text: deadline,
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: TColors.black)),
            ])),
            SizedBox(
              height: 15,
            ),
            Text(
              'Manager Details :',
              style: GoogleFonts.urbanist(
                  fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kesbi Walid',
                          style: GoogleFonts.urbanist(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Departement A',
                          style: GoogleFonts.urbanist(
                              color: Colors.orange,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(Iconsax.call),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Iconsax.message)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
