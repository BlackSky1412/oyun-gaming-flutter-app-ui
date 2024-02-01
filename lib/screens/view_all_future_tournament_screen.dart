import 'package:flutter/material.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/future_tournament.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class ViewAllFutureTournamentScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final List<GamingModel> futureTournament = getFutureTournamentList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        itemCount: futureTournament.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          GamingModel data = futureTournament[index];
          return FutureTournament(futureTournament: data);
        },
      ),
    );
  }
}
