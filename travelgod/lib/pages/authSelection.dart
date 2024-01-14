import 'package:travelgod/pages/loginPage.dart';
import 'signinPage.dart';
import 'package:flutter/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';

class authSelection extends StatelessWidget {
  const authSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(children: [
          SizedBox(
            height: getProportionateScreenWidth(200),
          ),
          Text(
            "Adventuro",
            style: GoogleFonts.montserrat(
              color: Color(0xff4285f4),
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          Container(
            child: Text(
              'Let’s get started!',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff101522),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 267,
            ),
            child: Text(
              'Login to enjoy the features we’ve provided, and explore places!',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: Color(0xff707684),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(20)),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => loginPage()),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(18),
                    vertical: getProportionateScreenWidth(15)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff50aafa),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => signinpage()),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff50aafa)),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 16 ,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff50aafa),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
