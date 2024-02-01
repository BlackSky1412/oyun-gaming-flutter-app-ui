import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/trending_game_component.dart';
import 'package:oyun_gaming_flutter/components/your_game_list_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class YourGameScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final int gameIndex = 0;

  final List<GamingModel> tournamentGameList = getYourGameList();
  final List<GamingModel> treandingGameList = getTreandingGameList();

  final bool? drawerIsOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingGameComponent(),
            32.height,
            commonRichText(title: "Games ", subTitle: "You Play", textSize: 20).paddingOnly(left: 16),
            8.height,
            HorizontalList(
              itemCount: 10,
              padding: EdgeInsets.all(16),
              itemBuilder: (_, index) {
                GamingModel data = tournamentGameList[index % tournamentGameList.length];

                return YourGameListComponent(yourGameList: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
