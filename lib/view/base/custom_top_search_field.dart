import 'package:flutter/material.dart';
import 'package:isletestapp/util/styles.dart';

import '../../util/images.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 28,
      // width: 300, // Set the desired width for your text field
      decoration: BoxDecoration(
        // color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(0), // Adjust the border radius as needed
        border: Border.all(

          color: Colors.grey, // Border color
          width: 0.1, // Border width
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(Images.search, color: Colors.grey, height: 15, width: 15,)
     /*       child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 15,// Icon color
            ),*/
          ),
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: railway.copyWith(fontSize: 9),
                contentPadding: EdgeInsets.only(bottom: 18),
                border: InputBorder.none, // Remove the default input border
              ),
            ),
          ),
        ],
      ),
    );
  }
}
