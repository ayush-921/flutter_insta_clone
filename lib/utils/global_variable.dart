import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/screens/feeds_screen.dart';

import '../screens/add_post_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItem = [
  FeedScreen(),
  Text('seach'),
  AddPostScreen(),
  Text('Fav'),
  Text('user'),
];
