import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stc_flutter_task/view_models/auth_view_model.dart';
import 'package:stc_flutter_task/views/home/bottom_navigation_bar.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});
  Future<void> showErrorDialog(
      BuildContext context, String errorMessage) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Try Again'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Color.fromRGBO(42, 179, 198, 1)),
              ),
            ),
          ],
        );
      },
    );
  }

  login(BuildContext context) async {
    final auth = Provider.of<AuthViewModel>(context, listen: false);
    final response = await auth.login(
        auth.usernameController.text, auth.passwordController.text);
    if (response) {
      Navigator.of(context)
          .pushReplacementNamed(MyBottomNavigationBar.routeName);
    } else {
      showErrorDialog(context, 'Could not Authenticate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 10 / 100,
          right: MediaQuery.of(context).size.width * 10 / 100,
          top: MediaQuery.of(context).size.height * 5 / 100),
      child: Consumer<AuthViewModel>(
        builder: (context, auth, child) => Column(
          children: [
            TextField(
              controller: auth.usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8500000238418579),
                  fontSize: 13,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: auth.usernameController.text.isNotEmpty
                    ? const Icon(
                        Icons.check_circle_outline_sharp,
                        color: Color.fromRGBO(86, 192, 193, 1),
                      )
                    : null,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 2 / 100),
            TextField(
              controller: auth.passwordController,
              obscureText: !auth.isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.8500000238418579),
                  fontSize: 13,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: GestureDetector(
                  onTap: auth.togglePasswordVisibility,
                  child: Icon(
                    auth.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: auth.isPasswordVisible
                        ? const Color.fromRGBO(86, 192, 193, 1)
                        : const Color.fromRGBO(0, 0, 0, 0.15),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
            auth.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: Color.fromRGBO(42, 179, 198, 1)),
                  )
                : ElevatedButton(
                    onPressed: () => login(context),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          MediaQuery.of(context).size.width * 80 / 100,
                          MediaQuery.of(context).size.height * 7 / 100),
                      backgroundColor: const Color.fromRGBO(42, 179, 198, 1),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
            Text(
              'NEED HELP?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6499999761581421),
                fontSize: 15,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
