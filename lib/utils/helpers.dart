import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goToNamed({
  required BuildContext ctx,
  required String pathname
}) {
  ctx.goNamed(pathname);
}

void goToPushNamed({
  required BuildContext ctx,
  required String pathname
}) {
  ctx.pushNamed(pathname);
}

void goTo({
  required BuildContext ctx,
  required String pathname
}) {
  if(kIsWeb){
    goToNamed(ctx: ctx, pathname: pathname);
  }else{
    goToPushNamed(ctx: ctx, pathname: pathname);
  }
}