import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelgod/pages/authSelection.dart';
import 'package:travelgod/pages/botNavBar.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xFF3FBCB1),
        body: SingleChildScrollView(
          reverse: true,
          child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5, // Half the screen height
                    color: Color(0xFF3FBCB1), // Background color for the top half
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60, // Adjust the radius as needed
                                backgroundImage: AssetImage('images/mainProfile.png'), // Replace with your profile image
                              ),
                              SizedBox(height: 30,),
                              Text("",
                                style: GoogleFonts.montserrat(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10, // Adjust the top position as needed
                          right: 10, // Adjust the right position as needed
                          child: IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onPressed: () {
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5, // Half the screen height
                    decoration: const BoxDecoration(
                      color: Colors.white, // Background color for the bottom half
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0), // Top-left cornered radius
                        topRight: Radius.circular(30.0), // Top-right cornered radius
                      ),
                    ),
                    child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 25,),
                            ListTile(
                              leading: Image.asset(
                                'images/faq.png',
                                width: getProportionateScreenHeight(45),
                                height: getProportionateScreenHeight(45),
                              ),
                              title: Text("FAQs",style: TextStyle(fontSize: 22),),
                              trailing: IconButton(
                                icon : Icon(Icons.arrow_forward_ios_outlined),
                                onPressed: (){},
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Color(0xFFE8F3F1), width: 1.0),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'images/logout.png',
                                width: getProportionateScreenHeight(45),
                                height: getProportionateScreenHeight(45),
                              ),
                              title: Text("Logout",
                                style: GoogleFonts.inter(
                                    fontSize: 22,color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                              trailing: IconButton(
                                icon : Icon(Icons.arrow_forward_ios_outlined),
                                onPressed: ()async{
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => authSelection()),
                                  );

                                },
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ],
              )
          ),
        ),
      bottomNavigationBar: CustomBottomNavBar(
      selectedMenu: MenuState.profile,
    ),
    );
  }
}
