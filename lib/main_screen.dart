import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              // AppBar section
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu),
                  Image(
                    height: size.height / 13.6,
                    image: const AssetImage("assets/images/logo.png"),
                  ),
                  const Icon(Icons.search),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // عکس و نوشته های صفحه اصلی
            Stack(
              children: [
                // عکس ثابت و گرادیانت
                Container(
                  width: size.width / 1.24,
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(homePagePosterMap['imageAsset']),
                        fit: BoxFit.cover),
                  ),
                  // گرادیانت روی عکس
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: GradientColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePosterMap['writer'] +
                                  ' - ' +
                                  homePagePosterMap['date'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              children: [
                                Text(homePagePosterMap['view'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal)),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye,
                                  size: 16,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          homePagePosterMap['title'],
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ],
                    )),
              ],
            ),

            const SizedBox(
              height: 8,
            ),
            // لیست هشتگ ها
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? bodyMargin : 15, 8),
                      child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                                size: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(tagList[index].title,
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ),

            const SizedBox(
              height: 38,
            ),

            // طراحی قسمت وسط صفحه / see hotest blogs
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
              child: const Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/icons/blue_pen.png'),
                    color: Colors.blue,
                  ),
                  // Icon(
                  //   Icons.add_box_rounded,
                  //   color: Colors.blue,
                  //   size: 35,
                  // ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.viewHotestBlog,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                ],
              ),
            ),

            //  تصاویر داغ ترین نوشته ها

            Padding(
              padding: EdgeInsets.only(right: bodyMargin),
              child: SizedBox(
                height: size.height / 4.1,
                child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 100,
                          color: Colors.blueAccent,
                        ),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
