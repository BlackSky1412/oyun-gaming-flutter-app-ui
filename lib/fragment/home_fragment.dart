import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/components/drawer_component.dart';
import 'package:oyun_gaming_flutter/components/future_tournament.dart';
import 'package:oyun_gaming_flutter/components/shop_item_component.dart';
import 'package:oyun_gaming_flutter/components/trending_game_component.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/view_all_future_tournament_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/data_generator.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<GamingModel> treandingGameList = getTreandingGameList();
  List<GamingModel> drawerList = getDrawerList();

  List<GamingModel> futureTournament = getFutureTournamentList();
  List<GamingModel> tournamentScheduleList = geTournamentScheduleList();
  List<GamingModel> bestPlayerNameData = getBestPlayerNameList();
  List<GamingModel> shopItemList = getShopItemList();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode messageFocusNode = FocusNode();

  int currentIndexPage = 100 ~/ 3;
  int pageLength = 1;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      key: scaffoldKey,
      appBar: commonAppBar(context, callBack: () {
        scaffoldKey.currentState!.openDrawer();
      }),
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TrendingGameComponent(),
            64.height,
            commonRichText(title: "Feature ", subTitle: "Tournaments"),
            ListView.builder(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              itemCount: futureTournament.take(2).length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = futureTournament[index];
                return FutureTournament(futureTournament: data);
              },
            ),
            TextButton(
              onPressed: () {
                ViewAllFutureTournamentScreen().launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('VIEW ALL', style: boldTextStyle(color: white)),
                  8.width,
                  commonCachedNetworkImage(slash),
                  Text("/", style: boldTextStyle(color: redColor, size: 18)),
                ],
              ),
            ),
            42.height,
            commonRichText(title: "Sponsors", subTitle: " For Tournament"),
            32.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonCachedNetworkImage(sponsors1, fit: BoxFit.cover, radius: 15, height: 80, width: 80),
                commonCachedNetworkImage(sponsors2, fit: BoxFit.cover, radius: 15, height: 70, width: 70),
                commonCachedNetworkImage(sponsors3, fit: BoxFit.cover, radius: 15, height: 80, width: 80),
              ],
            ).paddingSymmetric(horizontal: 16),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonCachedNetworkImage(sponsors4, fit: BoxFit.cover, radius: 15, height: 80, width: 80),
                commonCachedNetworkImage(sponsors7, fit: BoxFit.cover, radius: 15, height: 70, width: 70),
                commonCachedNetworkImage(sponsors6, fit: BoxFit.cover, radius: 15, height: 80, width: 80),
              ],
            ).paddingSymmetric(horizontal: 16),
            52.height,
            commonRichText(title: "The Future Of ", titleTextColor: white, subTitle: "Your Oyun", subTitleTextColor: accentColor),
            8.height,
            ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: tournamentScheduleList.length,
              separatorBuilder: (BuildContext context, int index) => Divider(color: context.dividerColor),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                GamingModel data = tournamentScheduleList[index];
                return Row(
                  children: [
                    Text(data.mainPrice.validate(), style: boldTextStyle(color: accentColor)).expand(),
                    Text(data.gameImage.validate(), style: secondaryTextStyle(size: 14)),
                    8.width,
                    Container(height: 16, width: 1, color: accentColor),
                    8.width,
                    Text(data.title.validate(), style: secondaryTextStyle(size: 14)),
                    16.width,
                    Text(data.time.validate(), style: secondaryTextStyle(size: 14)),
                  ],
                ).paddingOnly(bottom: 16, top: 16);
              },
            ),
            32.height,
            commonRichText(title: "Upcoming ", subTitle: "Match", textSize: 18),
            32.height,
            upComingMatch(context, ChampionBgColor: progressIndicatorColor, hideWithBlurWidget: true, showImage: false, hideWithoutBlurWidget: false),
            42.height,
            commonRichText(title: "Best Of ", titleTextColor: white, subTitle: "Oyun Gamers", subTitleTextColor: accentColor),
            32.height,
            HorizontalList(
              itemCount: bestPlayerNameData.length,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              itemBuilder: (_, index) {
                GamingModel data = bestPlayerNameData[index];

                return Column(
                  children: [
                    commonCachedNetworkImage(data.gameImage.validate(), height: 180, width: 150, fit: BoxFit.cover, radius: 0),
                    Container(
                      color: editTextBackgroundColor,
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.mainPrice.validate(), style: boldTextStyle(color: white)),
                          8.height,
                          Text(data.title.validate(), style: secondaryTextStyle(color: white.withOpacity(0.7))),
                        ],
                      ),
                    )
                  ],
                ).paddingOnly(right: 8);
              },
            ),
            24.height,
            commonRichText(title: "Latest Video By ", titleTextColor: white, subTitleTextColor: accentColor, subTitle: "Best Gamers"),
            32.height,
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                commonCachedNetworkImage(bestGamers, width: context.width(), height: 170, fit: BoxFit.cover, radius: 0),
                Positioned(
                  bottom: 24,
                  left: 24,
                  child: GradientBorder(
                    gradient: commonGradientWidget(),
                    borderRadius: 0,
                    child: Blur(
                      blur: 10.0,
                      padding: EdgeInsets.all(8),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cs Go', style: secondaryTextStyle(color: white.withOpacity(0.7))),
                          8.height,
                          Text('Final league Battle', style: boldTextStyle(color: white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            42.height,
            commonRichText(title: "Be A Part Of ", titleTextColor: white, subTitleTextColor: accentColor, subTitle: "Oyun"),
            32.height,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: List.generate(
                shopItemList.length,
                (index) {
                  GamingModel data = shopItemList[index];
                  return ShopItemComponent(shopItemList: data);
                },
              ),
            ),
            42.height,
            commonRichText(title: "Let\'s Start ", titleTextColor: white, subTitleTextColor: accentColor, subTitle: "playing"),
            32.height,
            Column(
              children: [
                Text('Got Doubts? Reach out To Us And Will Help You Out With Your Queries.', style: primaryTextStyle(color: white.withOpacity(0.7))),
                32.height,
                Row(
                  children: [
                    AppTextField(
                      controller: nameController,
                      focus: nameFocusNode,
                      nextFocus: emailFocusNode,
                      textFieldType: TextFieldType.NAME,
                      decoration: gamingInputDecoration(hintText: "Enter Your Name"),
                      textStyle: TextStyle(color: white),
                      suffixIconColor: white,
                    ).expand(),
                    8.width,
                    AppTextField(
                      controller: emailController,
                      focus: emailFocusNode,
                      nextFocus: messageFocusNode,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: gamingInputDecoration(hintText: "Enter Your Email"),
                      textStyle: TextStyle(color: white),
                    ).expand(),
                  ],
                ),
                8.height,
                AppTextField(
                  controller: messageController,
                  focus: messageFocusNode,
                  textFieldType: TextFieldType.MULTILINE,
                  decoration: gamingInputDecoration(hintText: "Enter Your Message"),
                  textStyle: TextStyle(color: white),
                  suffixIconColor: white,
                ),
              ],
            ).paddingSymmetric(horizontal: 16),
            32.height,
            appButtonGradientBorderWidget(
              gradientWidget: AppButton(
                color: white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text('CONTACT', style: boldTextStyle(color: black, size: 18), textAlign: TextAlign.center),
                onTap: () {
                  //HomeScreen().launch(context);
                },
              ),
            ),
            24.height,
          ],
        ),
      ),
    );
  }
}
