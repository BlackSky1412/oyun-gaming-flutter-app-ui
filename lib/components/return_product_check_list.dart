import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/model/gaming_model.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';

class ReturnProductCheckList extends StatefulWidget {
  final List<GamingModel> returnReasonData11;

  ReturnProductCheckList({required this.returnReasonData11});

  @override
  _ReturnProductCheckListState createState() => _ReturnProductCheckListState();
}

class _ReturnProductCheckListState extends State<ReturnProductCheckList> {
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
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      children: widget.returnReasonData11
          .map(
            (returnReasonData) => CheckboxListTile(
              title: Text(returnReasonData.rank.validate(), style: secondaryTextStyle()),
              value: returnReasonData.selectGame.validate(),
              dense: true,
              checkColor: primaryColor,
              activeColor: accentColor,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.all(0),
              onChanged: (bool? val) {
                setState(() {
                  returnReasonData.selectGame = val!;
                });
              },
            ),
          )
          .toList(),
    );
  }
}
