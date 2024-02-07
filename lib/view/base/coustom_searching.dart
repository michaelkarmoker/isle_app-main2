
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/images.dart';
import 'package:isletestapp/util/styles.dart';
import 'package:isletestapp/view/base/custom_only_textfield_with_border.dart';


class CustomSearching extends StatefulWidget {
  final String? title;
  final Function() onClose;
  final Function onSelect;
  final List<String> datalist;
  final String hint;

  CustomSearching({Key? key,  this.title, required this.onClose, required this.datalist,  required this.hint, required this.onSelect,}) : super(key: key);

  @override
  State<CustomSearching> createState() => _CustomSearchingState();
}

class _CustomSearchingState extends State<CustomSearching> {
  List<String> tempDatalist=[];

  TextEditingController searchDealerCtr=new TextEditingController();

  FocusNode searchFocus=new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tempDatalist=widget.datalist;
  }
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      insetPadding: EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(

        padding: EdgeInsets.all(3),
        child: Stack(
          children:[
          /*  Positioned(
              top: 2,
              right: 2,
              child: InkWell(
                onTap: widget.onClose,
                child: Container(
                  // color: Colors.red,
                    padding: EdgeInsets.all(0),
                    child: Image.asset(Images.close,width: 20,)),),
            ),*/
              Positioned(
              top: 2,
              right: 8,
              child: InkWell(
                onTap: widget.onClose,
                child: Container(
                  // color: Colors.red,
                    padding: EdgeInsets.all(8),
                    child: Text("Close", style: railwaybold.copyWith(fontSize: 14,),)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 10,),
                  Text('${widget.title!}',textAlign:TextAlign.center,
                      style: railwaybold.copyWith(fontSize: Dimensions.fontSizeExtraLarge, color: Colors.grey)),
                  SizedBox(height: 10,),
                  /*Row(
                    children: [
                      Icon(Icons.search,size: 20,color: Colors.black26,),
                      CustomTextField(controller: controller, focusNode: focusNode, title: title, onSubmit: null, nextFocus: null,)
                    ],
                  )*/
                  CustomOnlyTextFieldWithBorder(controller: searchDealerCtr,
                    hintText: widget.hint,
                    focusNode: searchFocus,
                    prefixIcon: Images.search,
                    // color: Colors.red,
                    suffixIcon:searchDealerCtr.text.isNotEmpty? Icons.close:null,
                    sufixIconFun: (){
                      searchDealerCtr.clear();
                      tempDatalist=widget.datalist;
                      setState(() {
                      });
                    },
                    onChanged:(text){
                      if (widget.datalist.length > 0) {
                        tempDatalist = widget.datalist
                            .where((i) => i.isCaseInsensitiveContains(text))
                            .toList();
                        //print(_filteredDealerList);
                        //   print(tempDatalist.length);
                        setState(() {
                        });
                      }
                    },),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:tempDatalist.length ,
                        itemBuilder:(context,position){
                          return InkWell(
                            onTap:() {
                              // widget.datalist.indexOf(tempDatalist[position]);
                              widget.onSelect( widget.datalist.indexOf(tempDatalist[position]));
                            } ,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5),
                              decoration:  BoxDecoration(
                                color: Color(0xffF1F2F3),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              height: Get.height/17,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${tempDatalist[position]}",
                                      style:railway.copyWith(fontSize: 14) ,),
                                    // Divider(height: 2,color: Colors.black26,)
                                  ],
                                ),
                              ),
                            ),
                          );

                        }),
                  )
                ],
              ),
            )
          ] ,
        ),
      ),
    );
  }
}
