// import 'package:travelgod/components/botNavBar.dart';
// import 'package:travelgod/components/homeTiles.dart';
// import 'package:travelgod/components/homeTools.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travelgod/pages/loginPage.dart';
import 'package:travelgod/phoenix/repository.dart';
// import 'package:travelgod/pages/meditation.dart';
// import 'package:travelgod/pages/moodJournal.dart';
// import 'package:travelgod/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:travelgod/pages/botNavBar.dart';

import '../Places.dart';

class home extends StatefulWidget {
  home({required String name,super.key});

  String name = '';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  final client= Repository(
  Dio(
  BaseOptions(
  contentType: "application/json",
  baseUrl: "http://10.0.2.2:8000",
  ),
  ),
  );
  
  final ScrollController _scrollController = ScrollController();
  bool _isQuoteVisible = true;
  List<String> imageUrls = [];
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async{
    await FirebaseFirestore.instance.collection('images').get().then((value) {
      value.docs.forEach((element) {
        print(element['imageUrl']);
        imageUrls.add(element['imageUrl']);
        tags.add(element['tag']);
      });
    });
    setState(() {
      imageUrls = imageUrls;
      tags=tags;
    });
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  bool _isLongPressed = false;
  Set<int> selectedImages = Set<int>();
  String tag = '';
  @override
  Widget build(BuildContext context) {


    SizeConfig().init(context);

    double w = MediaQuery.of(context).size.width;
    double itemwidth = getProportionateScreenWidth(180);
    double crossAxisCount = w / (itemwidth);
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
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(28)),
                child: Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: SizeConfig.screenWidth * 0.89,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA0A0A0).withOpacity(0.4),
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

              SizedBox(height: getProportionateScreenHeight(20),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    Visibility(
                      visible: _isLongPressed,
                      child: ElevatedButton(
                          onPressed: ()async{
                            selectedImages.forEach((element) {
                              tag+=tags[element]+",";
                            });
                            final response=await client.GetPlaces(tag:tag);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PlacesView(res: response,)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xB98170D2), // Change the color to your desired color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                            ),
                          ),
                          child: Text("Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800
                          ),)
                      ),
                    )
                    // To add Arrow
                  ]),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: 20),
                    child: MasonryGridView.count(
                        itemCount: imageUrls.length,
                        mainAxisSpacing: getProportionateScreenHeight(25),
                        crossAxisCount: crossAxisCount.toInt(),
                        itemBuilder: (context, index) {
                          // int randomHeight = Random().nextInt(3);
                          String imageUrl = imageUrls[index];
                          // return UnconstrainedBox(
                          //     child: Container(
                          //         width: getProportionateScreenWidth(170),
                          //         height: (randomHeight % 5 +1) * 100,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(10),
                          //         image: DecorationImage(
                          //           fit: BoxFit.cover,
                          //           image: NetworkImage(imageUrl),
                          //         ),
                          //       )));
                          return UnconstrainedBox(
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _isLongPressed = true;
                                      selectedImages.add(index);
                                    });
                                  },
                                  onTap: (){
                                    if(_isLongPressed){
                                      setState(() {
                                        selectedImages.remove(index);
                                        if(selectedImages.isEmpty){
                                          _isLongPressed = false;
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: getProportionateScreenWidth(150),
                                    height: (2 % 5 + 1) * 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(imageUrl),
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: _isLongPressed && selectedImages.contains(index),
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20.0,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
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

