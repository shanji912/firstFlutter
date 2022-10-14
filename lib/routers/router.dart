import 'package:flutter/material.dart';
import '../common/net/net_dio.dart';
import '../page/tabs/animate.dart';
import '../page/animate2.dart';
import '../page/animate3.dart';
import '../page/tabs/button.dart';
import '../page/detail.dart';
import '../page/flex.dart';
import '../page/gsy1.dart';
import '../page/tabs/list.dart';
import '../page/listview.dart';
import '../page/study1.dart';
import '../page/tabs/study2.dart';
import '../page/tabs/tabs.dart';
import '../page/wrap_flow.dart';
import '../page/hero1.dart';
import '../page/stagger2.dart';
import '../page/request.dart';

//配置路由
final Map<String,Function> routes = {
  '/': (context) => const Tabs(),
  "ListPage": (context) => const ListPage(),
  "Page2": (context) => const ListViewPage(),
  "DetailPage": (context) => const DetailPage(),
  "Button": (context) => const ButtonPage(),
  "Flex": (context) => const FlexLayoutPage(),
  "Animate": (context) => AnimatePage(),
  "Animate2": (context) => Animate2Page(),
  "Animate3": (context) => Animate3Page(),
  "GSY1": (context) => const GSY1Page(),
  "study": (context) => const StudyPage(),
  "study2": (context) => const Study2Page(),
  "wrap": (context) => const WrapAndFlowPage(),
  "hero": (context) => const HeroAnimationRouteA(),
  "stagger": (context) => StaggerRoute(),
  "request": (context) => HttpTestRoute(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};