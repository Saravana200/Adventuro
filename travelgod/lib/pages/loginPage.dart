import 'home.dart';
import 'signinPage.dart';
import 'package:flutter/material.dart';
import 'package:travelgod/screenComponents/ScreenSize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelgod/firebase/auth_service.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        size: 30.0,
                        Icons.arrow_back_ios_rounded,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Center(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff101522),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Container(
                  padding: const EdgeInsets.all(8.0), // Adjust the padding as needed.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed.
                    border: Border.all(
                      color: const Color(0x7fdedede),
                      width: 2.0, // Adjust the border width as needed.
                    ),
                    color: const Color(0xFFF9F9F9),
                  ),
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0, // Adjust the top padding as needed.
                          right: 10.0, // Adjust the right padding as needed.
                          bottom: 8.0, // Adjust the bottom padding as needed.
                          left: 20.0, // Adjust the left padding as needed.
                        ), // Adjust the padding as needed.
                        child: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the default border.
                            hintText: 'Enter your Email',
                            contentPadding: EdgeInsets.only(left: 20.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          // Add any additional properties for the TextField.
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Container(
                  padding: const EdgeInsets.all(8.0), // Adjust the padding as needed.
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed.
                    border: Border.all(
                      color: const Color(0x7fdedede),
                      width: 2.0, // Adjust the border width as needed.
                    ),
                    color: const Color(0xFFF9F9F9),
                  ),
                  child:  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0, // Adjust the top padding as needed.
                          right: 10.0, // Adjust the right padding as needed.
                          bottom: 8.0, // Adjust the bottom padding as needed.
                          left: 20.0, // Adjust the left padding as needed.
                        ), // Adjust the padding as needed.
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none, // Remove the default border.
                            hintText: 'Enter your Password',
                            contentPadding: EdgeInsets.only(left: 20.0),
                          ),
                          obscureText: true,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(20)),
                width: double.infinity,
                child: TextButton(
                  onPressed: () async{
                    final message = await AuthService().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (message!.contains('Success')){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                      ),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Container(
                    child:
                    RichText(
                      textAlign:  TextAlign.center,
                      text:
                      TextSpan(
                        style:  GoogleFonts.inter(
                          fontSize:  15,
                          fontWeight:  FontWeight.w400,
                          letterSpacing:  0.5,
                          color:  Color(0xff707684),
                        ),
                        children:  [
                          TextSpan(
                            text:  'Don’t have an account?',
                            style:  GoogleFonts.inter(
                              fontSize:  15,
                              fontWeight:  FontWeight.w400,
                              letterSpacing:  0.5,
                              color:  Color(0xff707684),
                            ),
                          ),
                          TextSpan(
                            text:  ' ',
                            style:  GoogleFonts.inter(
                              fontSize:  15,
                              fontWeight:  FontWeight.w400,
                              height:  1.5,
                              letterSpacing:  0.5,
                              color:  Color(0xff50aafa),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    // signupQ6K (19:263)
                    onPressed:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signinpage()),
                      );
                    },
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Text(
                      'Sign Up',
                      textAlign:  TextAlign.center,
                      style:  GoogleFonts.inter(
                        fontSize:  15,
                        fontWeight:  FontWeight.w400,
                        letterSpacing:  0.5,
                        color:  Color(0xff50aafa),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown,
                        )
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR',
                        style: TextStyle(color: Colors.blueGrey,fontSize: 18),
                      ),
                    ),

                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.brown,
                        )
                    )
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                },
                child: ClipRRect(
                  child: Image.asset(
                    'images/googleSignIn.png',
                    width: 350,
                    height: 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
