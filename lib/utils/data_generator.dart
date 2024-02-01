import 'package:flutter/material.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/screens/help_screen.dart';
import 'package:oyun_gaming_flutter/screens/home_screen.dart';
import 'package:oyun_gaming_flutter/screens/my_wish_list_screen.dart';
import 'package:oyun_gaming_flutter/screens/notification_screen.dart';
import 'package:oyun_gaming_flutter/screens/order_list_screen.dart';
import 'package:oyun_gaming_flutter/screens/return_and_cancel_list_sceen.dart';
import 'package:oyun_gaming_flutter/screens/setting_screen.dart';
import 'package:oyun_gaming_flutter/screens/shop_screen.dart';
import 'package:oyun_gaming_flutter/screens/your_game_screen.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';

List<GamingModel> getWalkthrough1Game() {
  List<GamingModel> walkthrough1ImageList = [];

  walkthrough1ImageList.add(GamingModel(gameImage: walkthrough1Game1));
  walkthrough1ImageList.add(GamingModel(gameImage: walkthrough1Game2));
  walkthrough1ImageList.add(GamingModel(gameImage: game7));

  return walkthrough1ImageList;
}

List<GamingModel> getSelectGame() {
  List<GamingModel> selectGameList = [];

  selectGameList.add(GamingModel(gameImage: walkthrough1Game1, selectGame: false));
  selectGameList.add(GamingModel(gameImage: walkthrough1Game2, selectGame: false));
  selectGameList.add(GamingModel(gameImage: game10, selectGame: false));

  return selectGameList;
}

List<GamingModel> getSignInSelectGame() {
  List<GamingModel> selectGameList = [];

  selectGameList.add(GamingModel(gameImage: walkthrough1Game1, selectGame: false));
  selectGameList.add(GamingModel(gameImage: game3, selectGame: false));
  selectGameList.add(GamingModel(gameImage: game10, selectGame: false));

  return selectGameList;
}

List<GamingModel> getDrawerList() {
  List<GamingModel> drawerListList = [];

  drawerListList.add(GamingModel(gameImage: home, drawerItemName: "Home ", drawerWidget: HomeScreen()));
  drawerListList.add(GamingModel(gameImage: notification, drawerItemName: "Notification", drawerWidget: NotificationScreen()));
  drawerListList.add(GamingModel(gameImage: yourGames, drawerItemName: "Your Games", drawerWidget: YourGameScreen()));
  drawerListList.add(GamingModel(gameImage: shop, drawerItemName: "Shop", drawerWidget: ShopScreen()));
  drawerListList.add(GamingModel(gameImage: yourWishList, drawerItemName: "Your Wishlist", drawerWidget: MyWishListScreen()));
  drawerListList.add(GamingModel(gameImage: yourOrders, drawerItemName: "Your Order", drawerWidget: OrderListScreen()));
  drawerListList.add(GamingModel(gameImage: cancellations, drawerItemName: "Return and cancellation", drawerWidget: ReturnAndCancelListScreen()));
  drawerListList.add(GamingModel(gameImage: help, drawerItemName: "Help", drawerWidget: HelpScreen()));
  drawerListList.add(GamingModel(gameImage: settings, drawerItemName: "Setting", drawerWidget: SettingScreen()));
  drawerListList.add(GamingModel(gameImage: logout, drawerItemName: "Logout", drawerWidget: SizedBox()));

  return drawerListList;
}

List<GamingModel> getNotificationGameList() {
  List<GamingModel> notificationGameList = [];

  notificationGameList.add(GamingModel(gameImage: walkthrough1Game1, drawerItemName: "Call Of Duty Is Streaming Now", title: "PLAY"));
  notificationGameList.add(GamingModel(gameImage: walkthrough1Game2, drawerItemName: "Oyun Mousepad Is Back In Stock", title: "SHOP NOW"));
  notificationGameList.add(GamingModel(gameImage: walkthrough1Game3, drawerItemName: "Call Of Duty Is Streaming Now", title: "PLAY"));
  notificationGameList.add(GamingModel(gameImage: walkthrough1Game1, drawerItemName: "Oyun Mousepad Is Back In Stock", title: "SHOP NOW"));
  notificationGameList.add(GamingModel(gameImage: walkthrough1Game2, drawerItemName: "Call Of Duty Is Streaming Now", title: "PLAY"));
  notificationGameList.add(GamingModel(gameImage: walkthrough1Game3, drawerItemName: "Oyun Mousepad Is Back In Stock", title: "SHOP NOW"));

  return notificationGameList;
}

List<GamingModel> getSteamingList() {
  List<GamingModel> steamingList = [];

  steamingList.add(GamingModel(gameImage: game10, drawerItemName: "Samurai Warrior", title: "3.6K Spectators", rating: 3.6));
  steamingList.add(GamingModel(gameImage: game9, drawerItemName: "Ninja Zenith", title: "4.2K Spectators", rating: 4.2));
  steamingList.add(GamingModel(gameImage: game8, drawerItemName: "Dota 2", title: "2.0K Spectators", rating: 2.0));
  steamingList.add(GamingModel(gameImage: game7, drawerItemName: "Call Of Duty", title: "5.6K Spectators", rating: 5.6));
  steamingList.add(GamingModel(gameImage: game6, drawerItemName: "3 Fire", title: "6.4K Spectators", rating: 6.4));
  steamingList.add(GamingModel(gameImage: game5, drawerItemName: "COC", title: "3.6K Spectators", rating: 3.6));

  return steamingList;
}

List<GamingModel> getPlayerList() {
  List<GamingModel> playerList = [];

  playerList.add(GamingModel(gameImage: userImage, drawerItemName: "Smit Jhon", title: "English", time: ic_india, day: "Mid", rank: "2 DR", earned: "\$16K"));
  playerList.add(GamingModel(gameImage: userImage2, drawerItemName: "David Marc", title: "Africa", time: ic_af, day: "High", rank: "4 DR", earned: "\$20K"));
  playerList.add(GamingModel(gameImage: userImage3, drawerItemName: "Dennis Vega", title: "Arabic", time: ic_ar, day: "Low", rank: "6 DR", earned: "\$10K"));
  playerList.add(GamingModel(gameImage: userImage6, drawerItemName: "Faye Boyd", title: "Franch", time: ic_fr, day: "Mid", rank: "8 DR", earned: "\$12K"));
  playerList.add(GamingModel(gameImage: userImage5, drawerItemName: "Honey Benson", title: "Erbic", time: ic_pt, day: "High", rank: "5 DR", earned: "\$16K"));
  playerList.add(GamingModel(gameImage: userImage6, drawerItemName: "Bonita Perla", title: "Turkey", time: ic_tr, day: "Low", rank: "8 DR", earned: "\$5K"));

  return playerList;
}

List<GamingModel> getTeamsList() {
  List<GamingModel> teamsList = [];

  teamsList.add(GamingModel(gameImage: sharkGame, drawerItemName: "Shark Ranger", title: "English", time: ic_india, day: "Marine Expert", rank: "8,112", earned: "1,000"));
  teamsList.add(GamingModel(gameImage: eagleGame, drawerItemName: "Eagle Team", title: "Africa", time: ic_af, day: "Wolf Gang", rank: "2,941", earned: "2,456"));
  teamsList.add(GamingModel(gameImage: wolfGame, drawerItemName: "Wolf Gaming", title: "Arabic", time: ic_ar, day: "Laser Foxes", rank: "6,789", earned: "8,112"));
  teamsList.add(GamingModel(gameImage: theFoxGame, drawerItemName: "The Fox", title: "Franch", time: ic_fr, day: "Robot Gaming", rank: "1,000", earned: "4,789"));
  teamsList.add(GamingModel(gameImage: robotGame, drawerItemName: "Robot Gamers", title: "Erbic", time: ic_pt, day: "Farm Heros", rank: "2,456", earned: "9.999"));
  teamsList.add(GamingModel(gameImage: astroGame, drawerItemName: "Astro Game", title: "Turkey", time: ic_tr, day: "Wolf Gang", rank: "4,789", earned: "4.888"));
  teamsList.add(GamingModel(gameImage: chicksGame, drawerItemName: "Chicks Game", title: "Africa", time: ic_af, day: "Laser Foxes", rank: "6,789", earned: "8,789"));

  return teamsList;
}

List<GamingModel> getShopItemList() {
  List<GamingModel> shopItemList = [];

  shopItemList.add(GamingModel(
    mainPrice: "\$35",
    gameImage: mug,
    drawerItemName: "Go Gamer's Mug",
    title: "\$25",
    rating: 3.0,
    productImage: [mug1, mug2, mug3],
  ));
  shopItemList.add(GamingModel(
    mainPrice: "\$80",
    gameImage: penDrive1,
    drawerItemName: "Tech D Pendrive",
    title: "\$60",
    rating: 1.0,
    productImage: [penDrive3, penDrive4, penDrive5],
  ));
  shopItemList.add(GamingModel(
    mainPrice: "\$25",
    gameImage: penDrive2,
    drawerItemName: "ScanDisk Pendrive",
    title: "\$15",
    rating: 2.0,
    productImage: [penDrive3, penDrive4, penDrive5],
  ));
  shopItemList.add(GamingModel(
    mainPrice: "\$50",
    gameImage: medicine,
    drawerItemName: "Oyun MousePad",
    title: "\$30",
    rating: 5.0,
    productImage: [medicine1, medicine2, medicine1],
  ));

  return shopItemList;
}

List<GamingModel> getRatingProgressList() {
  List<GamingModel> ratingProgressList = [];

  ratingProgressList.add(GamingModel(gameImage: "5", ratingProgress: 100, title: "8"));
  ratingProgressList.add(GamingModel(gameImage: "4", ratingProgress: 60, title: "5"));
  ratingProgressList.add(GamingModel(gameImage: "3", ratingProgress: 20, title: "2"));
  ratingProgressList.add(GamingModel(gameImage: "2", ratingProgress: 0, title: "0"));
  ratingProgressList.add(GamingModel(gameImage: "1", ratingProgress: 10, title: "1"));

  return ratingProgressList;
}

List<GamingModel> getWishListList() {
  List<GamingModel> wishListList = [];

  wishListList.add(GamingModel(mainPrice: "\$35", gameImage: mug, drawerItemName: "Go Gamer's Mug", rating: 3.0));
  wishListList.add(GamingModel(mainPrice: "\$80", gameImage: penDrive1, drawerItemName: "Tech D Pendrive", rating: 1.0));
  wishListList.add(GamingModel(mainPrice: "\$25", gameImage: medicine, drawerItemName: "Oyun MousePad", rating: 2.0));

  return wishListList;
}

List<GamingModel> geCartList() {
  List<GamingModel> cartList = [];

  cartList.add(GamingModel(mainPrice: "White", gameImage: mug, drawerItemName: "Go Gamer's Mug", productImage: ['1', '2', '3', '4', '5']));
  cartList.add(GamingModel(mainPrice: "Red", gameImage: penDrive1, drawerItemName: "Tech D Pendrive", productImage: ['1', '2', '3', '4', '5']));
  cartList.add(GamingModel(mainPrice: "Yellow", gameImage: medicine, drawerItemName: "Oyun MousePad", productImage: ['1', '2', '3', '4', '5']));

  return cartList;
}

List<GamingModel> geOrderList() {
  List<GamingModel> orderList = [];

  orderList.add(GamingModel(
      mainPrice: "White",
      gameImage: mug,
      drawerItemName: "Go Gamer's Mug",
      title: "Exchange Or Return Product Until Feb 15",
      rating: 5.0,
      earned: "Delivered On Feb 05",
      rank: "Sam John",
      day: "(812) 201-9999",
      time: "2118 Thornridge Cir. Syracuse, Connecticut 35624",
      ratingProgress: 100,
      email: "sam@gmail.com"));
  orderList.add(GamingModel(
      mainPrice: "Red",
      gameImage: penDrive1,
      drawerItemName: "Tech D Pendrive",
      title: "Exchange Or Return Product Until May 30",
      rating: 3.0,
      earned: "Delivered On May 20",
      rank: "Jesse Dean",
      day: "(123) 568-2771",
      time: "671 Honeysuckle Lane Parrill Court",
      ratingProgress: 60,
      email: "jesse@gmail.com"));
  orderList.add(GamingModel(
      mainPrice: "Yellow",
      gameImage: medicine,
      drawerItemName: "Oyun MousePad",
      title: "Exchange Or Return Product Until June 20",
      rating: 4.0,
      earned: "Delivered On June 10",
      rank: "Terry Morris",
      day: "(456) 777-4567",
      time: "3550 Rollins Hill Croft Farm Road",
      ratingProgress: 80,
      email: "terry@gmail.com"));

  return orderList;
}

List<GamingModel> getReturnReasonList() {
  List<GamingModel> returnReasonList = [];
  returnReasonList.add(GamingModel(selectGame: false, rank: "Brought By Mistake"));
  returnReasonList.add(GamingModel(selectGame: false, rank: "Product Damaged"));
  returnReasonList.add(GamingModel(selectGame: false, rank: "Missing Parts Or Accessories"));
  returnReasonList.add(GamingModel(selectGame: false, rank: "Wrong Item Was Sent"));
  returnReasonList.add(GamingModel(selectGame: false, rank: "Item Arrived Too Late"));

  return returnReasonList;
}

List<GamingModel> getReturnRightReasonList() {
  List<GamingModel> returnRightReasonList = [];
  returnRightReasonList.add(GamingModel(selectGame: false, rank: "Add To Your Oyun Wallet"));
  returnRightReasonList.add(GamingModel(selectGame: false, rank: "Refund To Your Original Payment Method"));

  return returnRightReasonList;
}

List<GamingModel> geTournamentGameList() {
  List<GamingModel> tournamentGameList = [];

  tournamentGameList.add(GamingModel(mainPrice: "3.0K", gameImage: walkthrough1Game1));
  tournamentGameList.add(GamingModel(mainPrice: "3.0K", gameImage: game10));
  tournamentGameList.add(GamingModel(mainPrice: "3.0K", gameImage: game8));

  return tournamentGameList;
}

List<GamingModel> geTournamentScheduleList() {
  List<GamingModel> TournamentScheduleList = [];

  TournamentScheduleList.add(GamingModel(mainPrice: "Dreamhack Cup", gameImage: "Sat", title: "Jan 22", time: "12:30 PM AEDT"));
  TournamentScheduleList.add(GamingModel(mainPrice: "Overwatch League", gameImage: "Sun", title: "Feb 12", time: "01:45 AM AEDT"));
  TournamentScheduleList.add(GamingModel(mainPrice: "Seoul Open", gameImage: "Tue", title: "May 25", time: "05:10 PM AEDT"));
  TournamentScheduleList.add(GamingModel(mainPrice: "Heartstone", gameImage: "Wed", title: "Jun 30", time: "10:30 AM AEDT"));

  return TournamentScheduleList;
}

List<GamingModel> geUpcomingList() {
  List<GamingModel> upcomingList = [];

  upcomingList.add(GamingModel(mainPrice: "Samurai Warrior", gameImage: "Sat", title: "Jan 22", time: "12:30 PM AEDT", earned: game1));
  upcomingList.add(GamingModel(mainPrice: "Call Of Duty", gameImage: "Sun", title: "Feb 12", time: "01:45 AM AEDT", earned: game2));
  upcomingList.add(GamingModel(mainPrice: "Heartstone", gameImage: "Tue", title: "May 25", time: "05:10 PM AEDT", earned: game3));
  upcomingList.add(GamingModel(mainPrice: "Heartstone", gameImage: "Wed", title: "Jun 30", time: "10:30 AM AEDT", earned: game6));
  upcomingList.add(GamingModel(mainPrice: "Shark Ranger", gameImage: "Wed", title: "Jun 30", time: "10:30 AM AEDT", earned: game5));
  upcomingList.add(GamingModel(mainPrice: "Eagle Team", gameImage: "Wed", title: "Jun 30", time: "10:30 AM AEDT", earned: game6));

  return upcomingList;
}

List<GamingModel> geRefundProcessList() {
  List<GamingModel> refundProcessList = [];

  refundProcessList.add(GamingModel(mainPrice: "10 Jun", title: "Item Picked Up From Location"));
  refundProcessList.add(GamingModel(mainPrice: "13 Jun", title: "Refund Initiated"));
  refundProcessList.add(GamingModel(mainPrice: "14 Jun", title: "Refund Credited to your original payment method"));

  return refundProcessList;
}

List<GamingModel> getYourGameList() {
  List<GamingModel> yourGameList = [];

  yourGameList.add(GamingModel(mainPrice: "Samurai Warrior", gameImage: walkthrough1Game1));
  yourGameList.add(GamingModel(mainPrice: "Call Of Duty", gameImage: walkthrough1Game2));
  yourGameList.add(GamingModel(mainPrice: "Heartstone", gameImage: walkthrough1Game3));

  return yourGameList;
}

List<GamingModel> getTreandingGameList() {
  List<GamingModel> treandingGameList = [];

  treandingGameList.add(GamingModel(mainPrice: "Samurai Warrior", gameImage: game1));
  treandingGameList.add(GamingModel(mainPrice: "Call Of Duty", gameImage: game7));
  treandingGameList.add(GamingModel(mainPrice: "Heartstone", gameImage: game3));

  return treandingGameList;
}

List<GamingModel> getLiveChatList() {
  List<GamingModel> liveChatList = [];

  liveChatList.add(GamingModel(mainPrice: "Ralph Tom", gameImage: userImage, drawerItemName: "Awesome GamePlay", title: "19:00"));
  liveChatList.add(GamingModel(mainPrice: "Smit john", gameImage: userImage2, drawerItemName: "Let\'s Go You Have To Win This Game.", title: "01:00"));
  liveChatList.add(GamingModel(mainPrice: "Sam John", gameImage: userImage3, drawerItemName: "Excellent!!", title: "02:00"));
  liveChatList.add(GamingModel(mainPrice: "Jesse Dean", gameImage: userImage, drawerItemName: "Let\'s Go Team Shark", title: "03:00"));
  liveChatList.add(GamingModel(mainPrice: "Sam Morris", gameImage: userImage5, drawerItemName: "Awesome GamePlay", title: "04:00"));

  return liveChatList;
}

List<GamingModel> getFutureTournamentList() {
  List<GamingModel> futureTournamentList = [];

  futureTournamentList.add(GamingModel(mainPrice: "Racing Championship", gameImage: walkthrough1Game1, drawerItemName: "Dec 10", title: "19:00 PM EST", day: "Dec 10", earned: "\$250"));
  futureTournamentList.add(GamingModel(mainPrice: "The Great Leangue", gameImage: game7, drawerItemName: "Dec 10", title: "01:00 PM EST", day: "May 12", earned: "\$150"));
  futureTournamentList.add(GamingModel(mainPrice: "Heartstone", gameImage: game1, drawerItemName: "Dec 10", title: "02:00 PM EST", day: "Jun 06", earned: "\$300"));
  futureTournamentList.add(GamingModel(mainPrice: "Shark Ranger", gameImage: game3, drawerItemName: "Dec 10", title: "03:00 PM EST", day: "Sep 20", earned: "\$350"));
  futureTournamentList.add(GamingModel(mainPrice: "Eagle Team", gameImage: game9, drawerItemName: "Dec 10", title: "04:00 PM EST", day: "Aug 25", earned: "\$100"));

  return futureTournamentList;
}

List<GamingModel> getBestPlayerNameList() {
  List<GamingModel> BestPlayerNameList = [];

  BestPlayerNameList.add(GamingModel(mainPrice: "Ralph Tom", gameImage: userImage, title: "Player 1"));
  BestPlayerNameList.add(GamingModel(mainPrice: "Smit john", gameImage: userImage2, title: "Player 2"));
  BestPlayerNameList.add(GamingModel(mainPrice: "Sam John", gameImage: userImage3, title: "Player 3"));
  BestPlayerNameList.add(GamingModel(mainPrice: "Jesse Dean", gameImage: userImage, title: "Player 4"));
  BestPlayerNameList.add(GamingModel(mainPrice: "Sam Morris", gameImage: userImage5, title: "Player 5"));

  return BestPlayerNameList;
}
