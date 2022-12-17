import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appcolor.dart';

class GroundDetailAppbar extends StatelessWidget with PreferredSizeWidget {
  const GroundDetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolor.green,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      titleTextStyle: GoogleFonts.poppins(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
      title: const Text("Ground Detail"),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
