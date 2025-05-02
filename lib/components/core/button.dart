import 'package:ereportapp/utils/colors.dart';
import 'package:ereportapp/utils/themes.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.height,
    this.width,
    this.radius,
    this.icon,
    this.padding,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final double? height;
  final double? width;
  final double? radius;
  final Widget? icon;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
          padding: padding,
          fixedSize: Size(width ?? double.infinity, height ?? 45),
          backgroundColor: backgroundColor ?? MyColors.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 6)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (icon ?? const SizedBox()),
            Text(buttonText,
                style: MyTheme.lightTheme.textTheme.titleSmall
                    ?.copyWith(color: Colors.white))
          ],
        ));
        // child: Center(
        //     child: Text(buttonText,
        //         style: MyTheme.lightTheme.textTheme.titleSmall
        //             ?.copyWith(color: Colors.white))));
  }
}
