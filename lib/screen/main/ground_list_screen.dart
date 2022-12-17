import 'package:flutter/material.dart';
import 'package:Gameon/model/ground_model.dart';
import 'package:Gameon/utils/appcolor.dart';
import 'package:Gameon/utils/dummy_data.dart';
import 'package:Gameon/widget/ground_container.dart';
import 'package:Gameon/widget/mainpage_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class GroundListScreen extends StatefulWidget {
  const GroundListScreen({super.key});

  @override
  State<GroundListScreen> createState() => _GroundListScreenState();
}

class _GroundListScreenState extends State<GroundListScreen> {
  List<Ground> grounds = List.from(DummyData.groundList)
      .map((item) => Ground.fromMap(item))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainpageAppbar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            // Dates
            SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: dateSection()),

            const SizedBox(
              height: 15,
            ),

            // Address
            addressBar(),

            const SizedBox(
              height: 15,
            ),
            // List of items

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: grounds.length,
              itemBuilder: (context, index) {
                return GroundContainer(
                  groundDetail: grounds[index],
                  index: index,
                );
              },
            )
          ],
        ),
      )),
    );
  }

  Container addressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffe7e7e7)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.location_on_outlined, color: Appcolor.darkgreen2),
              Text(
                "Maharastra, India",
                style: TextStyle(
                    color: Appcolor.darkgreen,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                "Change",
                style: TextStyle(
                    color: Appcolor.darkgreen2,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Appcolor.darkgreen2,
              )
            ],
          )
        ],
      ),
    );
  }

  // Components

  Row dateSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dateItem("Jan", "03", "Sun", false),
        dateItem("Jan", "04", "Mon", false),
        dateItem("Jan", "05", "Tue", true),
        dateItem("Jan", "06", "Wed", false),
        dateItem("Jan", "07", "Thu", false),
        dateItem("Jan", "08", "Fri", false),
      ],
    );
  }

  Container dateItem(String month, String date, String weekday, bool selected) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selected ? Appcolor.darkgreen2 : Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 20),
      width: 60,
      child: Column(
        children: [
          Text(
            month,
            style: TextStyle(
                color: selected ? Colors.white : Appcolor.darkgreen,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          Text(
            date,
            style: TextStyle(
                color: selected ? Colors.white : Appcolor.darkgreen,
                fontSize: 19,
                fontWeight: FontWeight.w600),
          ),
          Text(
            weekday,
            style: TextStyle(
                color: selected ? Colors.white : Appcolor.darkgreen,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
