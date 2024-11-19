import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  const MyText({super.key, required this.text, required this.color, required this.fontsize, required this.fontWeight, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines != null ? maxLines : null,
      overflow: overflow != null ? overflow : null,
    );
  }
}
