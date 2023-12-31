import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/models/data_models.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';
import 'package:tech_blog/view/my_component.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key, required Size size, required double bodyMargin});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textThem = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/images/tcbot.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(MyStrings.successfulRegistration,
                    style: textThem.headlineMedium),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'نام و نام خانوادگی',
                      hintStyle: textThem.bodyMedium,
                      fillColor: Colors.grey),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(MyStrings.chooseCats, style: textThem.headlineMedium),

                // gridview . tagList
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains((tagList[index]))) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  print('${tagList[index]} exists');
                                }
                              });
                            },
                            child: MainTags(index: index));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                const ImageIcon(
                  AssetImage('assets/icons/down_cat_arrow.png'),
                  size: 40,
                ),

                // selected Tags list
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.2,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: SolidColors.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  selectedTags[index].title,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
