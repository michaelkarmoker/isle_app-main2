import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:isletestapp/controller/profile/FAQ/faq_controller.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/ProgressHUD.dart';
import 'package:isletestapp/view/base/my_text_field.dart';

class FAQ extends StatefulWidget {
   FAQ({Key? key}) : super(key: key);
  bool isExpanded1=false;
  bool isExpanded2=false;
  bool isExpanded3=false;
  bool isExpanded4=false;
  bool isExpanded5=false;
  bool isExpanded6=false;
  bool isExpanded7=false;


  bool childexp1=false;
  bool childexp2=false;
  bool childexp3=false;
  bool childexp4=false;
  bool childexp5=false;
  bool childexp6=false;



  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<FAQController>().dataInitialize();
      // Get.find<PurchaseController>().dataInitializeForProductList();
    });
  }



  bool q1=false;
  bool q2=false;
  bool q3=false;
  bool q4=false;
  bool q5=false;
  bool q6=false;
  @override
  Widget build(BuildContext context) {
    // return GetBuilder<FAQController>(
    //   builder: (controller) {
        return GetBuilder<FAQController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: Color(0xffF2F6F9),
              appBar: AppBar(
                title: Text("Frequently asked Questions", style: railway.copyWith(fontSize: 18, color: Colors.black),),
                iconTheme: IconThemeData(color: Color(0xff000000)),
                titleSpacing: 0,
                backgroundColor: Color(0xffFFFFFF),
                centerTitle: true,
                elevation: 0,
                leadingWidth: Get.width / 3.5,
                /*   title: Container(
                // color: Colors.red,
                  height: 35, width: 100,
                  child: Image.asset(Images.logo, height: 35, width: 100)),*/
              ),
              body: ProgressHUD(
                inAsyncCall: controller.isLoading,
                child: SingleChildScrollView(

                child:  controller.isLoading?Container(): controller.faqResponse!=null? Column(
                    children: [
                      Container(
                        height: Get.height / 3.8,
                        width: Get.width,
                        // color: Colors.red,
                        child: Image.asset(
                          Images.faq,
                          height: Get.height / 3.8,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: Column(
                            children: [
                              Text(
                                "faq".tr.toUpperCase(),
                                style: acme.copyWith(fontSize: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 100),
                                child: Divider(
                                  thickness: 3,
                                  color: Color(0xffFF7A70),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 12),
                      Padding(
                          padding: const EdgeInsets.all(15.0),
                          child:



                       ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.faqResponse!.data!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState((){
                                          controller.faqResponse!.data![index].isDrop=!controller.faqResponse!.data![index].isDrop;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 7,
                                              child: Text(
                                                "${
                                                    controller.faqResponse!.data![index].question!

                                                }",
                                                style: a.copyWith(
                                                    fontSize: 17, fontWeight: FontWeight.w500),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: Color(0xff5D37B9),
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    controller.faqResponse!.data![index].isDrop?
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,top: 5,right: 20,bottom: 5),
                                      child: HtmlWidget("${
                                        controller.faqResponse!.data![index].answer!
                                      }",
                                        // style: robotoRegular.copyWith(fontSize: 16),
                                      ),
                                    ):Container(),
                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffF3F3F3),
                                    ),
                                  ],
                                );
                              }
                          )
                      ),
                      SizedBox(height: 50)
                    ],
                  ):Container(
                    height: Get.height,
                    width: Get.width,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Image.asset(Images.result_not_found, height: 80, width: 80,),
                    ),),),






             /*     child: Column(
                    children: [
                      Container(
                        height: Get.height / 5,
                        width: Get.width,
                        // color: Colors.red,
                        child: Image.asset(
                          Images.faq,
                          height: Get.height / 5,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: Column(
                            children: [
                              Text(
                                "faq".tr.toUpperCase(),
                                style: railway.copyWith(fontSize: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 100),
                                child: Divider(
                                  thickness: 3,
                                  color: Color(0xffFF7A70),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 0),
                      Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Column(
                                      children: [

                                        Divider(
                                          thickness: 10,
                                          color: Color(0xffF2F6F9),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            widget.isExpanded1=! widget.isExpanded1;
                                            setState(() {
                                            });
                                          },
                                          child: Container(
                                              color: Color(0xffFFFFFF),
                                              child: Row(
                                                children: [

                                                  Expanded(
                                                      flex: 9,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                          style: railway.copyWith(height: 1.5 ,fontWeight: FontWeight.bold, fontSize: 16),),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                        child: Icon(widget.isExpanded1? Icons.minimize : Icons.add, size: 25, color: Colors.black54,),
                                                      )
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        widget.isExpanded1? Container(
                                          // color: Colors.red,
                                          padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                                child: Text(
                                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                                  style: poppins.copyWith(
                                                      fontSize: 12,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black87
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 4),


                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ),
                                        ):Container(),
                                      ],
                                    ),


                                    Column(
                                      children: [

                                        Divider(
                                          thickness: 10,
                                          color: Color(0xffF2F6F9),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            widget.isExpanded2=! widget.isExpanded2;
                                            setState(() {
                                            });
                                          },
                                          child: Container(
                                              color: Color(0xffFFFFFF),
                                              child: Row(
                                                children: [

                                                  Expanded(
                                                      flex: 9,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                                        child: Text("What is Lorem Ipsum?",
                                                          style: railway.copyWith(height: 1.5 ,fontWeight: FontWeight.bold, fontSize: 16),),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                        child: Icon(widget.isExpanded2? Icons.minimize : Icons.add, size: 25, color: Colors.black54,),
                                                      )
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        widget.isExpanded2? Container(
                                          // color: Colors.red,
                                          padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                                child: Text(
                                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                                  style: poppins.copyWith(
                                                      fontSize: 12,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black87
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 4),


                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ),
                                        ):Container(),
                                      ],
                                    ),


                                    Column(
                                      children: [

                                        Divider(
                                          thickness: 10,
                                          color: Color(0xffF2F6F9),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            widget.isExpanded3=! widget.isExpanded3;
                                            setState(() {
                                            });
                                          },
                                          child: Container(
                                              color: Color(0xffFFFFFF),
                                              child: Row(
                                                children: [

                                                  Expanded(
                                                      flex: 9,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                                        child: Text("Where does it come from?",
                                                          style: railway.copyWith(height: 1.5 ,fontWeight: FontWeight.bold, fontSize: 16),),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                        child: Icon(widget.isExpanded3? Icons.minimize : Icons.add, size: 25, color: Colors.black54,),
                                                      )
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        widget.isExpanded3? Container(
                                          // color: Colors.red,
                                          padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                                child: Text(
                                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                                  style: poppins.copyWith(
                                                      fontSize: 12,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black87
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 4),


                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ),
                                        ):Container(),
                                      ],
                                    ),


                                    Column(
                                      children: [

                                        Divider(
                                          thickness: 10,
                                          color: Color(0xffF2F6F9),
                                        ),

                                        InkWell(
                                          onTap: (){
                                            widget.isExpanded4=! widget.isExpanded4;
                                            setState(() {
                                            });
                                          },
                                          child: Container(
                                              color: Color(0xffFFFFFF),
                                              child: Row(
                                                children: [

                                                  Expanded(
                                                      flex: 9,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 15),
                                                        child: Text("Why do we use it?",
                                                          style: railway.copyWith(height: 1.5 ,fontWeight: FontWeight.bold, fontSize: 16),),
                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                        child: Icon(widget.isExpanded4? Icons.minimize : Icons.add, size: 25, color: Colors.black54,),
                                                      )
                                                  )
                                                ],
                                              )
                                          ),
                                        ),
                                        widget.isExpanded4? Container(
                                          // color: Colors.red,
                                          padding: const EdgeInsets.only(left: 0,right: 15,top: 8, bottom: 8),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, top: 5, bottom: 5),
                                                child: Text(
                                                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                                                  style: poppins.copyWith(
                                                      fontSize: 12,
                                                      // fontWeight: FontWeight.w600,
                                                      color: Colors.black87
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 4),


                                              // Divider(thickness: 0.8,color: Color(0xffD1D2D2)),
                                            ],
                                          ),
                                        ):Container(),
                                      ],
                                    ),







                                    Divider(
                                      thickness: 1,
                                      color: Color(0xffF3F3F3),
                                    ),
                                  ],
                                );
                              }
                          )
                      ),
                      SizedBox(height: 50)
                    ],
                  ),*/
                ),
              ),
            );
          }
        );
    //   }
    // );
  }
}
