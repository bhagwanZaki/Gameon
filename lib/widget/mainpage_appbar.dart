import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appcolor.dart';

class MainpageAppbar extends StatelessWidget with PreferredSizeWidget {
  const MainpageAppbar({super.key});

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
      title: const Text("Grounds"),
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.tune_rounded,
              color: Colors.white,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
