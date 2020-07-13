import 'package:my2ndportfoloio/config/assets.dart';
import 'package:my2ndportfoloio/config/constants.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/theme_inherited_widget.dart';

int cv;
//SharedPreferences prefs =  SharedPreferences.getInstance() as SharedPreferences;
//void counter() async {
//  cv++;
//
//    prefs.setInt('counter', cv);
//     cv = prefs.getInt('counter');
//
//  }




class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset(Assets.avatar).image,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Khurram ALi',
                textScaleFactor: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Software Engineer',
                style: Theme.of(context).textTheme.caption,

                textScaleFactor: 2,

                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Android. Flutter. Cricket. Music.\nLikes Traveling.',
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  FlatButton.icon(
//                    icon: SizedBox(
//                        width: 20,
//                        height: 20,
//                        child: Image.asset(Assets.github)),
//                    label: Text('Github'),
//                    onPressed: () => html.window
//                        .open(Constants.PROFILE_GITHUB, 'adityadroid'),
//                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.twitter)),
                    label: Text('Twitter'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_TWITTER, 'Khurram ali'),
                  ),
//                  FlatButton.icon(
//                    icon: SizedBox(
//                        width: 20,
//                        height: 20,
//                        child: Image.asset(
//                            ThemeSwitcher.of(context).isDarkModeOn
//                                ? Assets.medium
//                                : Assets.medium_light)),
//                    label: Text('Medium'),
//                    onPressed: () => html.window
//                        .open(Constants.PROFILE_MEDIUM, 'adityadroid'),
//                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.instagram)),
                    label: Text('Instagram'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_INSTAGRAM, 'khurram'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.facebook)),
                    label: Text('Facebook'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_FACEBOOK, 'khurram'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.medium)),
                    label: Text('Fiverr'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_fiver, 'khurram'),
                  ),
                  FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(Assets.linkedin)),
                    label: Text('Linkedin'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_LINKEDIN, 'khurram'),
                  ),
//                  FlatButton.icon(
//                    icon: SizedBox(
//                        width: 20,
//                        height: 20,
//                        child: Image.asset(Assets.linkedin)),
//                    label: Text('$c'),
//
//
//                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
