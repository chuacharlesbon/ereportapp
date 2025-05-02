import 'package:ereportapp/components/core/spacers.dart';
import 'package:ereportapp/utils/colors.dart';
import 'package:ereportapp/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final String richText;
  final String? name;
  final String? hintText;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final dynamic onChanged;
  final Function(String?)? onSubmit;
  final bool? isPassword;
  final TextInputAction textInputAction;
  final IconData? leadingIcon;
  final String? errorText;
  final String? Function(String?)? validation;
  final Widget? suffixIcon;
  final Widget? onSuffixTap;
  final bool? readOnly;
  final Color? nameColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? counterText;
  final bool? fieldNameBold;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;

  const MyTextField(
      {super.key,
      this.richText = '',
      this.name = '',
      this.hintText,
      this.validation,
      this.hintTextColor = Colors.grey,
      this.fillColor = Colors.white,
      this.borderColor = Colors.grey,
      this.enabledBorderColor = Colors.grey,
      this.textInputType = TextInputType.text,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.isPassword = false,
      this.textInputAction = TextInputAction.done,
      this.errorText,
      this.leadingIcon,
      this.suffixIcon,
      this.onSuffixTap,
      this.readOnly = false,
      this.nameColor = Colors.grey,
      this.inputFormatters,
      this.maxLength,
      this.counterText,
      this.fieldNameBold,
      this.onTap,
      this.autofillHints});

  @override
  State<MyTextField> createState() => _MyTextFieldStateState();
}

class _MyTextFieldStateState extends State<MyTextField> {
  bool _isObscure = false;
  late TextEditingController _controller;
  late TextInputType _textInputType;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword! ? true : false;
    _controller = widget.controller != null
        ? widget.controller!
        : TextEditingController();
    _textInputType = widget.textInputType!;
  }

  _getSuffixIconPassword() {
    return InkWell(
      onTap: () {
        bool obscureNewValue = !_isObscure;
        setState(() {
          _isObscure = obscureNewValue;
        });
      },
      child: widget.suffixIcon,
    );
  }

  _getPrefixIcon() {
    if (widget.leadingIcon != null) {
      return Padding(
        padding: const EdgeInsets.all(14),
        child: Icon(widget.leadingIcon, color: widget.borderColor),
      );
    }
    return null;
  }

  _getTextFieldName() {
    if (widget.isPassword!) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(text: widget.name),
                  TextSpan(
                      text: widget.richText,
                      style: const TextStyle(color: Colors.red)),
                ]),
          ),
          GestureDetector(
            onTap: () {
              bool obscureNewValue = !_isObscure;
              setState(() {
                _isObscure = obscureNewValue;
              });
            },
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      bool obscureNewValue = !_isObscure;
                      setState(() {
                        _isObscure = obscureNewValue;
                      });
                    },
                    icon: _isObscure
                        ? Image.asset('images/close_password.png')
                        : Image.asset('images/open_password.png')),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Show',
                  style: MyTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    return RichText(
      text: TextSpan(
          text: widget.name,
          style: TextStyle(
              color: Colors.black.withOpacity(0.75),
              fontFamily: GoogleFonts.workSans().fontFamily,
              fontSize: 16,
              fontWeight: widget.fieldNameBold != null
                  ? FontWeight.w600
                  : FontWeight.normal),
          children: <TextSpan>[
            TextSpan(
              text: widget.richText,
              style: const TextStyle(color: Colors.red),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // _getTextFieldName(),
        // const SizedBox(
        //   height: 8,
        // ),
        if (widget.name != null)
          RichText(
            text: TextSpan(
                text: widget.name,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontFamily: GoogleFonts.workSans().fontFamily,
                    fontSize: 16,
                    fontWeight: widget.fieldNameBold != null
                        ? FontWeight.w600
                        : FontWeight.normal),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.richText,
                    style: const TextStyle(color: Colors.red),
                  ),
                ]),
          ),
        if (widget.name != null) Spacers().verticalSpace(MySizes.sizeXs),
        TextFormField(
            autofillHints: widget.autofillHints,
            readOnly: widget.readOnly!,
            validator: widget.validation,
            keyboardType: _textInputType,
            controller: _controller,
            obscureText: _isObscure,
            style: TextStyle(
                fontSize: 14,
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontWeight: FontWeight.normal),
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              suffix: widget.onSuffixTap,
              suffixIcon: widget.isPassword ?? false
                  ? _getSuffixIconPassword()
                  : widget.suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor!),
              ),
              prefixIcon: _getPrefixIcon(),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: widget.hintTextColor,
                fontSize: 14,
                fontFamily: GoogleFonts.workSans().fontFamily,
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor!),
                borderRadius: BorderRadius.circular(6),
              ),
              fillColor: widget.fillColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.enabledBorderColor!),
                borderRadius: BorderRadius.circular(6),
              ),
              counterText: widget.counterText,
            ),
            onTap: widget.onTap,
            onFieldSubmitted: widget.onSubmit),
      ],
    ));
  }
}

class MyTextField2 extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final dynamic onChanged;
  final Function(String?)? onSubmit;
  final FocusNode? focusNode;
  final String? name;

  const MyTextField2(
      {super.key,
      this.hintText,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.focusNode,
      this.name});

  @override
  State<MyTextField2> createState() => _MyTextField2StateState();
}

class _MyTextField2StateState extends State<MyTextField2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.name != null)
          Text(
            widget.name ?? "",
            style: MyTheme.lightTheme.textTheme.bodySmall
                ?.copyWith(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        if (widget.name != null) Spacers().verticalSpace(MySizes.sizeXs),
        SizedBox(
          width: double.infinity,
          height: 30,
          child: TextFormField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            style:
                MyTheme.lightTheme.textTheme.bodySmall?.copyWith(fontSize: 14),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: widget.hintText,
              hintStyle: MyTheme.lightTheme.textTheme.bodySmall
                  ?.copyWith(color: Colors.grey, fontSize: 14),
            ),
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmit,
          ),
        ),
      ],
    ));
  }
}

class MyAutoTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final Function(String?) onChanged;
  final Function(String?) onSubmit;
  final List<dynamic> optionsList;
  final double width;
  final Icon? prefixIcon;

  const MyAutoTextField(
      {super.key,
      this.hintText,
      required this.controller,
      required this.onChanged,
      required this.onSubmit,
      required this.optionsList,
      required this.width,
      this.prefixIcon});

  @override
  State<MyAutoTextField> createState() => _MyAutoTextFieldStateState();
}

class _MyAutoTextFieldStateState extends State<MyAutoTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.width,
              height: 30,
              child: TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                style: MyTheme.lightTheme.textTheme.bodySmall
                    ?.copyWith(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8),
                  hintText: widget.hintText,
                  hintStyle: MyTheme.lightTheme.textTheme.bodySmall
                      ?.copyWith(color: Colors.grey, fontSize: 14),
                  prefixIcon: widget.prefixIcon,
                ),
                onChanged: widget.onChanged,
                onFieldSubmitted: widget.onSubmit,
              ),
            ),
          ],
        );
      },
      optionsBuilder: (textEditingValue) {
        Iterable<String> options = ['N/A'];
        return options;
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Card(
            elevation: 3,
            child: Container(
              width: widget.width,
              height: 300,
              padding: EdgeInsets.symmetric(vertical: MySizes.sizeReg),
              child: (widget.optionsList.isNotEmpty)
                  ? ListView.builder(
                      padding: EdgeInsets.all(MySizes.sizeReg),
                      itemCount: widget.optionsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Perform search select
                          },
                          child: Container(
                            padding: EdgeInsets.all(MySizes.sizeXs),
                            child: Text("${widget.optionsList[index]}"),
                          ),
                        );
                      })
                  : const Center(
                      child: SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                              color: MyColors.mainColor))),
            ),
          ),
        );
      },
    );
  }
}
