// import 'package:travelgod/components/botNavBar.dart';
// import 'package:travelgod/components/homeTiles.dart';
// import 'package:travelgod/components/homeTools.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelgod/pages/loginPage.dart';
// import 'package:travelgod/pages/meditation.dart';
// import 'package:travelgod/pages/moodJournal.dart';
// import 'package:travelgod/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelgod/pages/botNavBar.dart';

class home extends StatefulWidget {
  home({required String name,super.key});

  String name = '';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  
  final ScrollController _scrollController = ScrollController();
  bool _isQuoteVisible = true;
  List<String> imageUrls = [];
  List<String> tags = [];

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection('images').get().then((value) {
      value.docs.forEach((element) {
        imageUrls.add(element['imageurl']);

      });
    }
    );
    
  }


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
    return Material(
      child: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled){
              return [
                SliverPersistentHeader(
                  delegate: _MyAppBar(expandedHeight: getProportionateScreenHeight(300),backgroundColor: Color(0xFF3FBCB1), minCollapsedHeight: getProportionateScreenHeight(100)),
                  pinned: true,
                  floating: false,
                ),
              ];
            },
            body: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: 28),
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
                      child: Column(
                        children: [
                          TextField(
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
                        ],
                      ),
                    ),
                    // To add Arrow
                  ]),
              ),

              Row(
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
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: 20),
                    child: MasonryGridView.count(
                        itemCount: imageUrls.length,
                        mainAxisSpacing: getProportionateScreenHeight(10),
                        crossAxisCount: crossAxisCount.toInt(),
                        itemBuilder: (context, index) {
                          int randomHeight = Random().nextInt(3);
                          String imageUrl = imageUrls[index];
                          return UnconstrainedBox(
                              child: Container(
                                  width: getProportionateScreenWidth(170),
                                  height: (randomHeight % 5 +1) * 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(imageUrl),
                                  ),
                                )));
                        }),
                  )),
              // Expanded(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: 20),
              //       child: MasonryGridView.count(
              //           itemCount: 50,
              //           mainAxisSpacing: getProportionateScreenHeight(10),
              //           crossAxisCount: crossAxisCount.toInt(),
              //           itemBuilder: (context, index) {
              //             int randomHeight = Random().nextInt(3);
              //             return UnconstrainedBox(
              //                 child: Container(
              //                     width: getProportionateScreenWidth(170),
              //                     height: (randomHeight % 5 +1) * 100,
              //                     decoration: BoxDecoration(
              //                         borderRadius: BorderRadius.circular(10),
              //                         image: DecorationImage(
              //                             fit: BoxFit.cover,
              //                             image: NetworkImage(
              //                                 "https://picsum.photos/100/${(randomHeight % 5 + 2) * 100}")))));
              //           }),
              //     )),

              CustomBottomNavBar(
                selectedMenu: MenuState.home,

              )
            ]),
          // bottomNavigationBar: CustomBottomNavBar(
          //   selectedMenu: MenuState.home,
        ),
      ),

    );
  }
}

class _MyAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Color backgroundColor;
  final double minCollapsedHeight;


  _MyAppBar({
    required this.expandedHeight,
    required this.backgroundColor,
    required this.minCollapsedHeight,
  });

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    final offset = shrinkOffset / expandedHeight;
    final maxQuoteHeight = 50.0; // Adjust as needed
    final quoteOpacity = 1 - offset;
    final quoteIsVisible = true;

    return Material(
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
            left: 23,
            top:16,
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
                SizedBox(width: getProportionateScreenWidth(15),),
                Text(
                  'Good Morning, \nMayur',
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffffffff),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (quoteIsVisible)
            Positioned(
              top:78,
              child: AnimatedOpacity(
                opacity: 1-offset,
                duration: Duration(milliseconds: 150),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.18,
                  // autogroup8sdhLWb (J8GPeExU7JmjdT4pag8sdh)
                  padding:  EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(20)
                  ),
                  margin: EdgeInsets.all(getProportionateScreenWidth(20)),

                  decoration:  BoxDecoration (
                      borderRadius:  BorderRadius.circular(20),
                      image:  DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/bannerBg.png'),
                      )
                  ),
                  child:
                  Stack(
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
                          'a good mood is like a balloon, one little prick is all it takes to ruin it',
                          style:  GoogleFonts.montserrat (
                            fontSize:  23,
                            fontWeight:  FontWeight.w700,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minCollapsedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

