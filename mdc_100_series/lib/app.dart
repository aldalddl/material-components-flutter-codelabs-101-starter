// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'colors.dart';
import 'supplemental/cut_corners_border.dart';
// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: HomePage(),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // TODO: Add a theme (103)
      theme: _kShrineTheme, // New code
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kShrinePurple,
    buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrinePurple,
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple)
    ),
    scaffoldBackgroundColor: kShrineSurfaceWhite,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineSurfaceWhite
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}
// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Raleway',
  );
}