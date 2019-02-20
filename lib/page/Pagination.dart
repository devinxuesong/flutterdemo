import 'package:flutter/material.dart';
import '../model/StoryModel.dart';
import '../components/HomeBanner.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/testData.dart';

class Pagination extends StatelessWidget {
  static final String routeName = '/material/page-selector';

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _pageSelector(BuildContext context) {
    List<Widget> list = [];
    List<StoryModel> bannerStories = [];

    /// super.initState();
    arr.forEach((item) {
      bannerStories.add(StoryModel.fromJson(item));
    });

    if (arr.length > 0) {
      list.add(HomeBanner(bannerStories, (story) {
        _launchURL('${story.url}');
      }));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        key: Key('__header__'),
        //physics: AlwaysScrollableScrollPhysics(),
        //padding: EdgeInsets.only(),
        children: _pageSelector(context));
  }
}
