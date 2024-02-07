import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/auth_controller.dart';
import 'package:isletestapp/controller/wishlist/wishlist_controller.dart';
import 'package:isletestapp/util/color.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_button.dart';
import 'package:isletestapp/view/base/custom_snackbar.dart';
import 'package:isletestapp/view/base/my_text_field.dart';
import 'package:isletestapp/view/screens/main_page/main_screen.dart';
import 'package:isletestapp/view/screens/wardrob/wardrob_name.dart';

class CreateWardrobe extends StatefulWidget {
  const CreateWardrobe({Key? key}) : super(key: key);

  @override
  State<CreateWardrobe> createState() => _WardrobNameState();
}

class _WardrobNameState extends State<CreateWardrobe> {

  FocusNode wardrobFcs = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        titleSpacing: 0,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
        elevation: 0,
        leadingWidth: Get.width / 3.5,
      title: Text("Create Wardrobe",  style: railway.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15,),
        child: GetBuilder<WishlistController>(
          builder: (controller) {
            return Column(
              children: [
                MyTextField(
                    controller: controller.wardrobCtr,
                    focusNode: wardrobFcs,
                    title: "Wardrobe Name",
                  isRequired: true,
                  titlesize: 12,
                  // hintStyle: railway.copyWith(fontWeight: FontWeight.bold),
                  myfontWeight: FontWeight.bold,
                ),
                SizedBox(height: 30),

                CustomButton(
                    height: 45,
                    width: Get.width / 1,
                    buttoncolor: gold,
                    color: Colors.white,
                    buttontextcolor: Colors.white,
                    radius: 0,
                    fontSize: 12.5,
                    myfontweight: FontWeight.bold,
                    onPressed: () {
                      if (controller.wardrobCtr.text.toString().isNotEmpty) {
                        controller.createWardrobe(
                          name: controller.wardrobCtr.text,
                          customer_id: Get.find<AuthController>().getUserId(),
                        );
                      }
                      else {
                        showCustomSnackBar("Please Enter Wardrobe Name");
                      }
                    },
                    buttonText: "Create Wardrobe".toUpperCase())
              ],
            );
          }
        ),
      ),
    );
  }
}
