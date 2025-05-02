import 'package:ereportapp/components/core/button.dart';
import 'package:ereportapp/components/core/spacers.dart';
import 'package:flutter/material.dart';

class MyDialog {
  void showAppDialog({
    required BuildContext context,
    required Widget child,
    String? confirmButtonText,
    String? cancelButtonText,
    Future<bool> Function()? confirmButtonFunction,
    VoidCallback? cancelButtonFunction,
    double? maxDialogWidth,
  }) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxDialogWidth ?? 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
                MyButton(
                  onPressed: () async {
                    if(confirmButtonFunction != null){
                      final data = await confirmButtonFunction();
                      if(data){
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      }
                    }else{
                      Navigator.pop(context);
                    }
                  },
                  buttonText: confirmButtonText ?? "Confirm",
                ),
                Spacers().verticalSpace(MySizes.sizeSm),
                MyButton(
                  backgroundColor: Colors.grey,
                  onPressed: () {
                    if(cancelButtonFunction != null){
                      cancelButtonFunction();
                    }
                    Navigator.pop(context);
                  },
                  buttonText: cancelButtonText ?? "Cancel",
                ),
              ],
            ),
          ),
        ),
        
      ),
    );
  }
}
