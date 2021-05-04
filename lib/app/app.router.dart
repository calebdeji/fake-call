// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/Home/Home.dart';
import '../ui/views/Success/Success.dart';

class Routes {
  static const String homeView = '/';
  static const String successView = '/success-view';
  static const all = <String>{
    homeView,
    successView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.successView, page: SuccessView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SuccessView: (data) {
      var args = data.getArgs<SuccessViewArguments>(
        orElse: () => SuccessViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SuccessView(
          minutes: args.minutes,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SuccessView arguments holder class
class SuccessViewArguments {
  final int minutes;
  final String phoneNumber;
  SuccessViewArguments({this.minutes, this.phoneNumber});
}
