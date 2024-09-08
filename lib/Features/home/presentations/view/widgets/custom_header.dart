import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/Features/home/presentations/view/widgets/see_more_button.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.text,
    this.ontap,
  });
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          SeeMoreButton(
            ontap: ontap,
          ),
        ],
      ),
    );
  }
}
