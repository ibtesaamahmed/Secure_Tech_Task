import 'package:flutter/material.dart';
import 'package:stc_flutter_task/views/login/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height * 0.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF188095), Color(0xFF2AB3C6)],
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: height < 600 ? height * 0.15 : height * 0.2),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      ' STC \nHEALTH \n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height < 600 ? height * 0.38 : height * 0.42,
                      left: width * 0.08),
                  child: const SizedBox(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.30,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height * 0.5,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: const LoginWidget(),
          )
        ]),
      ),
    );
  }
}
