import 'dart:convert';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ereportapp/components/bottom-navbar.dart';
import 'package:ereportapp/components/core/button.dart';
import 'package:ereportapp/components/core/spacers.dart';
import 'package:ereportapp/components/core/text-field.dart';
import 'package:ereportapp/data/app-cubit/app-cubit.dart';
import 'package:ereportapp/utils/dialog.dart';
import 'package:ereportapp/utils/helpers.dart';
import 'package:ereportapp/utils/routes.dart';
import 'package:ereportapp/utils/themes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title});

  final String? title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Cubit
  late AppCubit appCubit;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  List<PlatformFile> reportFiles = [];
  Uint8List? imageInBytes;

  void pickFile({
    required BuildContext ctx,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg'],
        withReadStream: !kIsWeb,
        withData: !kIsWeb);
    List<PlatformFile>? files = result?.files;
    setState(() {
      reportFiles = files ?? [];
      if (files?.first != null) {
        if (files?.first.bytes != null) {
          Uint8List imageBytes = files?.first.bytes ?? Uint8List(0);
          imageInBytes = imageBytes;
        } else if (files?.first.path != null) {
          String base64String = files?.first.path?.split(',')[1] ?? "N/A";
          Uint8List imageBytes = base64Decode(base64String);
          imageInBytes = imageBytes;
        }
      }
    });
    // ignore: use_build_context_synchronously
    Navigator.pop(ctx);
    reportEvent();
  }

  void reportEvent() {
    final formKey = GlobalKey<FormState>();

    Future<bool> sendReport() async {
      if (formKey.currentState?.validate() ?? false) {
        goTo(ctx: context, pathname: RouteNames.reportSuccess.name);
        return true;
      } else {
        return false;
      }
    }

    MyDialog().showAppDialog(
      context: context,
      child: StatefulBuilder(builder: (context, setFormState) {
        return Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Submit a Report',
                style: MyTheme.lightTheme.textTheme.titleMedium,
              ),
              Spacers().verticalSpace(MySizes.sizeSm),
              MyTextField(
                controller: nameCtrl,
                textInputType: TextInputType.name,
                autofillHints: const [AutofillHints.name],
                hintText: "Name",
                validation: (value) {
                  if (value?.trim() == "") {
                    return 'Name required.';
                  }
                  return null;
                },
              ),
              MyTextField(
                controller: descCtrl,
                textInputType: TextInputType.text,
                hintText: "Event description",
                validation: (value) {
                  if (value?.trim() == "") {
                    return 'Description required.';
                  }
                  return null;
                },
              ),
              Spacers().verticalSpace(MySizes.sizeReg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Capture event (optional):',
                    style: MyTheme.lightTheme.textTheme.bodyLarge,
                  ),
                  GestureDetector(
                      onTap: () {
                        pickFile(ctx: context);
                      },
                      child: imageInBytes != null
                          ? Image.memory(
                              imageInBytes ?? Uint8List(0),
                              width: 80,
                              height: 80,
                            )
                          : const Icon(
                              Icons.image,
                              size: 80,
                              color: Colors.grey,
                            )),
                ],
              ),
              Spacers().verticalSpace(MySizes.sizeReg),
            ],
          ),
        );
      }),
      confirmButtonText: "Send",
      confirmButtonFunction: sendReport,
    );
  }

  void initData() {
    log("Initialize home screen");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // initData();
    super.initState();
    appCubit = GetIt.instance<AppCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: 'https://ereportapp.pages.dev/ereport-app-logo.png',
              ),
            ),
            MyButton(
                width: 200, onPressed: reportEvent, buttonText: "Report Event"),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
