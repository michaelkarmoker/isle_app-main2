import 'package:flutter/material.dart';
import 'package:isletestapp/util/dimensions.dart';
import 'package:isletestapp/util/styles.dart';


class CustomRealDropDownWithTitle extends StatelessWidget {
  final List<String> dataArray;
  final String? title;
  final String hint;
  final double height;
  final bool isIgnore;
  final bool isRequired;
  final String? seletcedValue;
  final Function? selecetTap;
  final double? titleHeight;
  final double? titleSize;
  final double? dropdownValueSize;
  final Color? dropdownValueColor;
  final Color? hintTextColor;


  const CustomRealDropDownWithTitle(
      {Key? key,
        required this.dataArray,
         this.title,
        required this.hint,
        this.isRequired=false,
        this.height = 40,
        this.selecetTap,
        this.seletcedValue,
        this.titleHeight=7,
        this.titleSize= 13,
        this.dropdownValueSize= 14,
        this.dropdownValueColor,
        this.hintTextColor,
        this.isIgnore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          child: isRequired?Text.rich(
            TextSpan(
              children: [
                TextSpan(text: title!,style: railwaybold.copyWith(fontSize:Dimensions.fontSizeDefault)),
                TextSpan(
                  text: '*',
                  style: railwaybold.copyWith(fontWeight: FontWeight.bold,color: Colors.red),
                ),
              ],
            ),
          ):Text(title!,textAlign:TextAlign.left,style: railwaybold.copyWith(fontSize: titleSize),),),
        /*     Text(
          title,
          style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
        ),*/
        SizedBox(height: titleHeight),
        Container(
          height: height,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(width: 1, color: Colors.black45),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: IgnorePointer(
              ignoring: isIgnore,
              child: DropdownButton<String>(
                // iconDisabledColor: iconColor,
                iconEnabledColor: Theme.of(context).primaryColor,
                isExpanded: true,
                underline: SizedBox(),
                value: seletcedValue,
                elevation: 4,
                hint: Text(
                  hint,
                  style: robotoRegular.copyWith(
                      fontSize: Dimensions.fontSizeDefault,
                      color:  Theme.of(context).hintColor),
                ),
                isDense: true,
                items: dataArray.map((String ds) {
                  return DropdownMenuItem<String>(
                    value: ds,
                    child: Text(
                      ds,
                      style: robotoMedium.copyWith(
                        fontSize: dropdownValueSize,
                        color: dropdownValueColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }).toList(),
                onChanged: (value) =>
                selecetTap != null ? selecetTap!(value) : null,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
