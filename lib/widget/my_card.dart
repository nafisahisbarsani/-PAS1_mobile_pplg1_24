import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_color.dart';
import 'my_text.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final String logo;
  final int? maxLines;
  final TextOverflow? overflow;
  const MyCard({super.key, required this.title, required this.description, this.maxLines, this.overflow, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                logo,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 60,
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: title,
                    color: textColor,
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 6),
                  MyText(
                    text: description,
                    color: textColor,
                    fontsize: 14,
                    fontWeight: FontWeight.normal,
                    maxLines: maxLines,
                    overflow: overflow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}