import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_therapist/utils/helpers/helper_functions.dart';

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer({
    super.key,
    this.title,
    this.color,
  });
  final title;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffD6D6D6), width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            decoration: BoxDecoration(
                color: THelperFunctions.getColor(color),
                shape: BoxShape.circle),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: GoogleFonts.urbanist(
                color: Color(0xff171950),
                fontSize: 15,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
