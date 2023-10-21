import 'package:flutter/material.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// mainTags class
class MainTags extends StatelessWidget {
  const MainTags({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            const ImageIcon(
              AssetImage('assets/icons/hashtagicon.png'),
              color: Colors.white,
              size: 10,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
