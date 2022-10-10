import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_flutter/page/code_detail_page_web.dart';
// import 'package:my_flutter/page/common_list_page.dart';
// import 'package:my_flutter/page/debug/debug_data_page.dart';
// import 'package:my_flutter/page/gsy_webview.dart';
// import 'package:my_flutter/page/home/home_page.dart';
// import 'package:my_flutter/page/honor_list_page.dart';
// import 'package:my_flutter/page/issue/issue_detail_page.dart';
// import 'package:my_flutter/page/login/login_page.dart';
// import 'package:my_flutter/page/login/login_webview.dart';
// import 'package:my_flutter/page/notify_page.dart';
// import 'package:my_flutter/page/trend/trend_user_page.dart';
// import 'package:my_flutter/page/user/person_page.dart';
// import 'package:my_flutter/page/photoview_page.dart';
// import 'package:my_flutter/page/push/push_detail_page.dart';
// import 'package:my_flutter/page/release/release_page.dart';
// import 'package:my_flutter/page/repos/repository_detail_page.dart';
// import 'package:my_flutter/page/search/search_page.dart';
// import 'package:my_flutter/page/user_profile_page.dart';
import 'package:my_flutter/widget/never_overscroll_indicator.dart';

class NavigatorUtils {
  ///主页
  static goHome(BuildContext context) {
    // Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  ///登录页
  static goLogin(BuildContext context) {
    // Navigator.pushReplacementNamed(context, LoginPage.sName);
  }

  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
//    if (navigator == null) {
//      try {
//        navigator = Navigator.of(context);
//      } catch (e) {
//        error = true;
//      }
//    }
//
//    if (replace) {
//      ///如果可以返回，清空开始，然后塞入
//      if (!error && navigator.canPop()) {
//        navigator.pushAndRemoveUntil(
//          router,
//          ModalRoute.withName('/'),
//        );
//      } else {
//        ///如果不可返回，直接替换当前
//        navigator.pushReplacement(router);
//      }
//    } else {
//      navigator.push(router);
//    }
  }

  ///公共打开方式
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(
        context,
         CupertinoPageRoute(
            builder: (context) => pageContainer(widget, context)));
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget, BuildContext context) {
    return MediaQuery(

      ///不受系统字体缩放影响
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: NeverOverScrollIndicator(
          needOverload: false,
          child: widget,
        ));
  }

  ///弹出 dialog
  static Future<T?> showGSYDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder? builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(

            ///不受系统字体缩放影响
              data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .copyWith(textScaleFactor: 1),
              child: NeverOverScrollIndicator(
                needOverload: false,
                child: SafeArea(child: builder!(context)),
              ));
        });
  }
}
