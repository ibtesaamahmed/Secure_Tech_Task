import 'package:flutter/material.dart';

class RoundedBottomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RoundedBottomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x3F6B7F99),
              blurRadius: 15,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
          color: Color.fromRGBO(255, 255, 255, 1)),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'All Products',
          style: TextStyle(
            color: Color(0xFF08293B),
            fontSize: 28,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.36,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
