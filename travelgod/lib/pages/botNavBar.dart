import 'package:travelgod/pages/home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelgod/pages/chat.dart';
import 'package:travelgod/pages/profilePage.dart';



enum MenuState { home, dashboard, chatbot, profile }

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // IconButton(
              //   icon: MenuState.dashboard == selectedMenu
              //       ? SvgPicture.asset(
              //     'images/botNavBar/graph-fill.svg',
              //     color: Color(0xFF3FBCB1), // Set the desired color here.
              //   )
              //       : SvgPicture.asset(
              //     'images/botNavBar/graph.svg',
              //     color: Color(0xFF838383), // Set the desired color here.
              //   ),
              //   onPressed: () { if (selectedMenu != MenuState.dashboard) {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => dashboard()),
              //     // );
              //   } },
              // ),
              IconButton(
                icon: MenuState.chatbot == selectedMenu
                    ? SvgPicture.asset(
                  'images/botNavBar/chatbot-fill.svg',
                  color: Color(0xFF3FBCB1),
                  width: 35, // Set the desired width here.
                  height: 35,// Set the desired color here.
                )
                    : SvgPicture.asset(
                  'images/botNavBar/chatbot.svg',
                  color: Color(0xFF838383),
                  width: 23, // Set the desired width here.
                  height: 23,// Set the desired color here.
                ),
                onPressed: () { if (selectedMenu != MenuState.chatbot) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>ChatBotScreen(),

                  ));
                } },
              ),
              IconButton(
                icon: MenuState.home == selectedMenu
                    ? SvgPicture.asset(
                  'images/botNavBar/house-fill.svg',
                  color: Color(0xFF3FBCB1), // Set the desired color here.
                )
                    : SvgPicture.asset(
                  'images/botNavBar/house.svg',
                  color: Color(0xFF838383), // Set the desired color here.
                ),
                onPressed: () {
                  if (selectedMenu != MenuState.home) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => home()),
                    );
                  }
                },
              ),
              IconButton(
                icon: MenuState.profile == selectedMenu
                    ? SvgPicture.asset(
                  'images/botNavBar/person-fill.svg',
                  color: Color(0xFF3FBCB1), // Set the desired color here.
                )
                    : SvgPicture.asset(
                  'images/botNavBar/person.svg',
                  color: Color(0xFF838383), // Set the desired color here.
                ),
                onPressed: () { if (selectedMenu != MenuState.profile) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                }  },
              ),

            ],
          )),
    );
  }
}
