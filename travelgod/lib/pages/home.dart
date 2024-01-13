// import 'package:travelgod/components/botNavBar.dart';
// import 'package:travelgod/components/homeTiles.dart';
// import 'package:travelgod/components/homeTools.dart';
import 'dart:math';

import 'package:travelgod/pages/loginPage.dart';
// import 'package:travelgod/pages/meditation.dart';
// import 'package:travelgod/pages/moodJournal.dart';
// import 'package:travelgod/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  final ScrollController _scrollController = ScrollController();
  bool _isQuoteVisible = true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double itemwidth = 200;
    double crossAxisCount = w / (itemwidth);

    SizeConfig().init(context);
    return Scaffold(
        body: Center(
            child: Column(children: [
              Container(
                height: getProportionateScreenHeight(320),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.0), // Adjust the radius as needed.
                  ),
                  color: Color(0xFF3FBCB1),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(
                              size: 30.0,
                              Icons.menu_rounded ,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: Center(
                                child: Text(
                                  'Good Morning, \nMayur',
                                  style:  GoogleFonts.montserrat (
                                    fontSize:  25,
                                    fontWeight:  FontWeight.w700,
                                    color:  Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(

                      padding:  EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(20)
                      ),
                      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                      width:  double.infinity,
                      decoration:  BoxDecoration (
                        borderRadius:  BorderRadius.circular(20),
                        image:  DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/bannerBg.png'),
                        )
                      ),
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            width: 25,
                            height: 23,
                            child: Image.asset(
                              'images/doubleInvertedComma.png', // Provide the correct path to your image
                              width: 25,
                              height: 23,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Container(
                            padding:  EdgeInsets.only(
                                left: getProportionateScreenWidth(30),
                            ),
                            constraints:  BoxConstraints (
                              maxWidth:  300,
                            ),
                            child:
                            Text(
                              'Embark on a journey where each step is a discovery and every destination tells a story.',
                              style:  GoogleFonts.montserrat (
                                fontSize:  17,
                                fontWeight:  FontWeight.w700,
                                color:  Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: SizeConfig.screenWidth * 0.89,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF979797).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search Destinations",
                            prefixIcon: const Icon(Icons.search_outlined),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenWidth(14),
                            )),
                      ),
                    ),
                    // To add Arrow
                  ]),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),

              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children:  [
                    Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                      ),
                      child:
                      Text(
                        'Select Destinations',
                        textAlign:  TextAlign.center,
                        style:  GoogleFonts.inter (
                          fontSize:  22,
                          fontWeight:  FontWeight.w600,
                          height:  1.5,
                          color:  Color(0xff1a4844),
                        ),
                      ),
                    ),
                    // To add Arrow
                  ]),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                    child: MasonryGridView.count(
                        itemCount: 50,
                        mainAxisSpacing: getProportionateScreenHeight(10),
                        crossAxisCount: crossAxisCount.toInt(),
                        itemBuilder: (context, index) {
                          int randomHeight = Random().nextInt(3);
                          return UnconstrainedBox(
                              child: Container(
                                  width: getProportionateScreenWidth(170),
                                  height: (randomHeight % 5 +1) * 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://picsum.photos/100/${(randomHeight % 5 + 2) * 100}")))));
                        }),
                  ))
            ])
        ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedMenu: MenuState.home,
    );
  }
}
