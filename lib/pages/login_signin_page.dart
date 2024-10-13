import 'dart:ui';  
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:event_management/components/login_button.dart';
import 'package:event_management/pages/user/user_home.dart';
import 'package:flutter/material.dart';

class LogInSignInPage extends StatefulWidget {
  const LogInSignInPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LogInSignInPageState();
  }
}

class _LogInSignInPageState extends State<LogInSignInPage> {
  final PageController _pageController = PageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _progress = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,  
        ),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.green],  
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'ZAP.IO',
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 100
                                ),

                                colors: [
                                  Colors.green,
                                  Colors.black,
                                  Colors.green,
                                  Colors.black,
                                ],
                              ),
                            ],
                            repeatForever: false,
                            totalRepeatCount: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    duration: Duration(milliseconds: 1),
                    height: MediaQuery.of(context).size.height * 0.4 +
                        _progress * 140,
                    child: PageView(
                      controller: _pageController,
                      children: [
                         
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Zap.io – Book event tickets in a zap! ⚡",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "With Zap.io, you can quickly discover and book tickets for your favorite events, concerts, and festivals with just a few taps. Fast, easy, and hassle-free—get ready to experience events in a flash!",
                                style: TextStyle(color: Colors.grey[400]),
                                softWrap: true,
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedButton(
                                    text: "Get Started",
                                    onTap: () {
                                      _pageController.animateToPage(
                                        1,
                                        duration: Duration(milliseconds: 350),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                         
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: AnimatedButton(text: "Log In", onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserHome()));
                                })
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
