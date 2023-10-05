import 'package:flutter/material.dart';
import 'package:tech_blog/models/data_models.dart';
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
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu, color: Colors.black),
              Image(
                height: size.height / 13.6,
                image: const AssetImage("assets/images/logo.png"),
              ),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
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
                              image:
                                  AssetImage(homePagePosterMap['imageAsset']),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                      AssetImage(
                                          'assets/icons/hashtagicon.png'),
                                      color: Colors.white,
                                      size: 12,
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
                    height: 25,
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
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          MyStrings.viewHotestBlog,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  //  تصاویر داغ ترین نوشته ها / blog list
                  SizedBox(
                    height: size.height / 3.5,
                    child: ListView.builder(
                        itemCount: blogList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          // blog items
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index == 0 ? bodyMargin : 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 5.3,
                                    width: size.width / 2.4,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  blogList[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          // لایه گرادیانت روی عکس
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors:
                                                    GradientColors.blogPost),
                                          ),
                                        ),
                                        //  متن روی گرادیانت و عکس
                                        Positioned(
                                            bottom: 8,
                                            left: 0,
                                            right: 0,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      blogList[index].writer,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            blogList[index]
                                                                .views,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
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
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2.4,
                                  child: Text(
                                    blogList[index].title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  //مشاهده داغ ترین پادکست ها
                  Padding(
                    padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                    child: const Row(
                      children: [
                        ImageIcon(
                          AssetImage('assets/icons/microphon.png'),
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          MyStrings.viewHotestPodCasts,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height / 3.5,
                    child: ListView.builder(
                        itemCount: podCastList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          // blog items
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index == 0 ? bodyMargin : 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 5.3,
                                    width: size.width / 2.4,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  podCastList[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2.4,
                                  child: Text(
                                    podCastList[index].content,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),

            // bottom navigaton bar
            Positioned(
              bottom: 8,
              right: 0,
              left: 0,
              child: Container(
                  height: size.height / 10,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.bottomNavBackground,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25),
                    child: Container(
                      height: size.height / 8,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient:
                            LinearGradient(colors: GradientColors.bottomNav),
                      ),

                      // navBar icon buttons
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage(
                                  'assets/icons/home.png',
                                ),
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage(
                                  'assets/icons/write.png',
                                ),
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const ImageIcon(
                                AssetImage(
                                  'assets/icons/user.png',
                                ),
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
