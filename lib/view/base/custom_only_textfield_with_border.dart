

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomOnlyTextFieldWithBorder extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final IconData? suffixIcon;
  final Function? onChanged;
  final Function? sufixIconFun;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final int minLines;
  final Color? color;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final bool divider;
  final TextStyle? hintStyle;
  final TextAlign textAlign;
  final double? height;

  final Radius? borderRadiousJ;


  CustomOnlyTextFieldWithBorder(
      {
        this.hintText = 'Write something...',
        required this.controller,
        required this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.minLines = 1,
         this.onSubmit,
        this.onChanged,
        this.suffixIcon,
        this.sufixIconFun,
        this.prefixIcon,
        this.color,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.divider = false,
        this.hintStyle=null,
        this.textAlign = TextAlign.left,
        this.height= 45,

        this.borderRadiousJ,

      }
      );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomOnlyTextFieldWithBorder> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          // color: Colors.red,
          height: widget.height,

          child: TextField(
            textAlign: widget.textAlign,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color:widget.color!=null?widget.color:null),
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            cursorColor: Theme.of(context).primaryColor,
            textCapitalization: widget.capitalization,
            enabled: widget.isEnabled,
            autofocus: false,
            obscureText: widget.isPassword ? _obscureText : false,
            inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : null,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(width: 1, color: Colors.white)),
              // fillColor: Color(0xff11253D),
              contentPadding: const EdgeInsets.only(top: 12,bottom:19,left: 15),
              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.white, style: BorderStyle.none, width: 1),
              ),
              isDense: true,
              hintText: widget.hintText,
              // fillColor: Theme.of(context).cardColor,
              hintStyle: widget.hintStyle??robotoRegular.copyWith(fontSize: 10, color: Theme.of(context).hintColor),
              filled: true,
              prefixIcon: widget.prefixIcon != null ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Image.asset(widget.prefixIcon!, height: 10, width: 10,),
              ) : null,
              suffixIcon: widget.isPassword ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.black.withOpacity(0.6)),
                onPressed: _toggle,
              ) : widget.suffixIcon!=null?IconButton(
                icon: Icon(widget.suffixIcon!, color: Colors.black.withOpacity(0.6)),
                onPressed:()=> widget.sufixIconFun!=null?widget.sufixIconFun!():null,
              ):null,
            ),
            onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit != null ? widget.onSubmit!(text) : null,
            onChanged:(text)=> widget.onChanged!=null?widget.onChanged!(text):widget.onChanged,
          ),
        ),

        widget.divider ? const Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider()) : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
