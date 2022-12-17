import 'package:flutter/material.dart';
import 'package:Gameon/model/ground_model.dart';
import 'package:Gameon/utils/appcolor.dart';
import 'package:Gameon/utils/routes.dart';

class GroundContainer extends StatelessWidget {
  final Ground groundDetail;
  final int index;
  const GroundContainer(
      {super.key, required this.groundDetail, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.grounddetailscreen,
          arguments: {'ground': groundDetail}),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                groundDetail.img,
                width: 85,
                height: 100,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 5,
              ),
              timing()
            ]),
            const SizedBox(
              height: 10,
            ),
            Text(
              groundDetail.title,
              style: const TextStyle(
                  color: Appcolor.darkgreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 6,
            ),
            address(),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pitch type : ${groundDetail.pitch}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Appcolor.darkgreen),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.explore_outlined,
                      color: Appcolor.darkgreen2,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Only ${groundDetail.far}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Appcolor.darkgreen2),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded timing() {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "20 Over",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Appcolor.darkgreen,
              fontSize: 12),
        ),
        btnRow(),
        const Text(
          "30 Over",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Appcolor.darkgreen,
              fontSize: 12),
        ),
        btnRow2(),
      ],
    ));
  }

  Container address() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Appcolor.greyop)),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Appcolor.grey),
          Text(
            groundDetail.address,
            style: const TextStyle(
                color: Appcolor.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Wrap btnRow() {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        greenBtn("10:00 am"),
        const SizedBox(
          width: 3,
        ),
        disableBtn("1:00 pm"),
        const SizedBox(
          width: 3,
        ),
        greenBtn("4:00 am"),
      ],
    );
  }

  Wrap btnRow2() {
    return Wrap(
      children: [
        errorBtn("2:00 pm"),
        const SizedBox(
          width: 3,
        ),
        disableBtn("1:00 pm"),
      ],
    );
  }

  Expanded errorBtn(String time) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Appcolor.orange)),
        onPressed: () {},
        child: Text(
          time,
          style: const TextStyle(color: Appcolor.orange, fontSize: 11),
        ),
      ),
    );
  }

  Expanded disableBtn(String time) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Appcolor.grey)),
        onPressed: () {},
        child: Text(
          time,
          style: const TextStyle(color: Appcolor.grey, fontSize: 11),
        ),
      ),
    );
  }

  Expanded greenBtn(String time) {
    return Expanded(
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        elevation: 0,
        color: Appcolor.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onPressed: () {},
        child: Text(
          time,
          style: const TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
}
