import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class GamingListComponent extends StatefulWidget {
  final GamingModel? data;

  GamingListComponent({this.data});

  @override
  _GamingListComponentState createState() => _GamingListComponentState();
}

class _GamingListComponentState extends State<GamingListComponent> {
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
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.data!.selectGame.validate() ? [Colors.red, accentColor] : [Colors.transparent, Colors.transparent],
        ),
      ),
      height: 150,
      child: Padding(
        padding: EdgeInsets.all(1.5),
        child: Stack(
          children: [
            commonCachedNetworkImage(widget.data!.gameImage.validate(), fit: BoxFit.cover, height: 150, width: context.width(), radius: 0.0),
            Positioned(
              right: 0,
              child: widget.data!.selectGame.validate()
                  ? Container(
                      decoration: BoxDecoration(
                        gradient: commonGradientWidget(),
                      ),
                      height: 30,
                      child: Padding(
                          padding: EdgeInsets.all(1.5),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            color: primaryColor,
                            child: Icon(Icons.done, color: white, size: 18),
                          )),
                    )
                  : SizedBox(),
            )
          ],
        ),
      ),
    ).onTap(() {
      widget.data!.selectGame = !widget.data!.selectGame.validate();
      setState(() {});
    });
  }
}
