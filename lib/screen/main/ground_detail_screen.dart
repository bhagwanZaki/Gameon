import 'package:flutter/material.dart';
import 'package:Gameon/model/ground_model.dart';
import 'package:Gameon/widget/ground_detail_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/appcolor.dart';

class GoundDetailScreen extends StatefulWidget {
  const GoundDetailScreen({super.key});

  @override
  State<GoundDetailScreen> createState() => _GoundDetailScreenState();
}

class _GoundDetailScreenState extends State<GoundDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Ground data = arguments['ground'];
    return Scaffold(
      appBar: GroundDetailAppbar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Appcolor.darkgreen2,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Sunday, 5 January 2021",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Appcolor.darkgreen),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/image/grdbig.png'),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data.title,
                style: TextStyle(
                    color: Appcolor.darkgreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            row1(data),
            const SizedBox(
              height: 10,
            ),
            row2(data),
            const SizedBox(
              height: 10,
            ),
            bookCard("20 overs", "Mumbai Indian", "Available", "10:00 am"),
            bookCard("30 overs", "Mumbai Indian", "Available", "3:00 am"),
          ],
        ),
      )),
    );
  }

  Container bookCard(String overText, String team1, String team2, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 3),
                color: Color.fromRGBO(8, 143, 129, 0.08),
                blurRadius: 40,
                spreadRadius: 0)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "For $overText",
                style: const TextStyle(color: Appcolor.darkgreen),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Appcolor.darkgreen2)),
                child: Text(
                  time,
                  style: const TextStyle(
                      color: Appcolor.darkgreen2, fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [team1section(team1), team2section(team2)],
          ),
          const SizedBox(
            height: 10,
          ),
          checkBoxRow(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "'\u{20B9} 3000",
                style: TextStyle(color: Appcolor.darkgreen2, fontSize: 18),
              ),
              MaterialButton(
                onPressed: () {},
                elevation: 0,
                color: Appcolor.darkgreen2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Book Now",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container checkBoxRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Appcolor.greyop))),
      child: Row(children: [
        checkboxWithLable("Ball provided", true),
        checkboxWithLable("Umpire provided", false),
        Flexible(
          child: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "Ball Detail : ",
                style: GoogleFonts.poppins(
                    color: Appcolor.darkgreen, fontSize: 11)),
            TextSpan(
                text: "Tennis",
                style: GoogleFonts.poppins(
                    color: Appcolor.darkgreen2, fontSize: 11)),
          ])),
        )
      ]),
    );
  }

  Row checkboxWithLable(String text, bool val) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 10, color: Appcolor.darkgreen),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(231, 231, 231, 1),
              borderRadius: BorderRadius.circular(4)),
          child: Checkbox(
            value: val,
            onChanged: (value) {},
            checkColor: Appcolor.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: const Color.fromRGBO(231, 231, 231, 1),
          ),
        )
      ],
    );
  }

  Expanded team1section(String team) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Team 1",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Appcolor.green2),
          ),
          Text(
            team,
            style: const TextStyle(
                color: Appcolor.darkgreen,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          MaterialButton(
            onPressed: () {},
            elevation: 0,
            color: const Color.fromRGBO(17, 16, 16, 0.1),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color.fromRGBO(17, 16, 16, 0.1)),
                borderRadius: BorderRadius.circular(4)),
            child: const Text("Booked"),
          )
        ],
      ),
    );
  }

  Expanded team2section(String team) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            team,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Appcolor.green2),
          ),
          const Text(
            "Available",
            style: TextStyle(
                color: Appcolor.darkgreen,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          MaterialButton(
            onPressed: () {},
            elevation: 0,
            color: Appcolor.greenop,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Appcolor.greenop),
                borderRadius: BorderRadius.circular(4)),
            child: const Text("Available"),
          )
        ],
      ),
    );
  }

  Row row2(Ground data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            greenBox(Icons.restaurant_rounded),
            greenBox(Icons.wc_rounded),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Appcolor.greenop),
          child: Row(
            children: [
              const Icon(
                Icons.explore_outlined,
                color: Appcolor.darkgreen2,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(data.far)
            ],
          ),
        )
      ],
    );
  }

  Row row1(Ground data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              Icons.location_on_outlined,
              color: Appcolor.darkgreen2,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Navigate",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Appcolor.darkgreen2),
            )
          ],
        ),
        Text(
          "Pitch type : ${data.pitch}",
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Appcolor.darkgreen),
        ),
      ],
    );
  }

  Container greenBox(IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Appcolor.greenop),
      child: Icon(
        icon,
        color: Appcolor.darkgreen2,
      ),
    );
  }
}
