import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:oyun_gaming_flutter/screens/home_screen.dart';
import 'package:oyun_gaming_flutter/screens/purchase_more_screen.dart';
import 'package:oyun_gaming_flutter/utils/colors.dart';
import 'package:oyun_gaming_flutter/utils/image.dart';
import 'package:oyun_gaming_flutter/utils/widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  DateTime? currentBackPressTime;

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
      appBar: gamingAppBarWidget(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 32, right: 32, top: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            commonRichText(
              title: "Welcome Back",
              subTitle: " To Oyun",
              textSize: 20,
            ).center(),
            24.height,
            AppTextField(
              controller: emailController,
              focus: emailFocusNode,
              nextFocus: passWordFocusNode,
              textFieldType: TextFieldType.EMAIL,
              decoration: gamingInputDecoration(hintText: "Enter Your Email"),
              textStyle: TextStyle(color: white),
            ),
            16.height,
            AppTextField(
              controller: passwordController,
              focus: passWordFocusNode,
              textFieldType: TextFieldType.PASSWORD,
              decoration: gamingInputDecoration(hintText: "Enter Your Password"),
              textStyle: TextStyle(color: white),
              suffixIconColor: white,
            ),
            16.height,
            Row(
              children: [
                ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: kGradientBoxDecoration,
                    child: Padding(
                      padding: EdgeInsets.all(4.0), //width of the border
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          decoration: kInnerDecoration,
                          child: Icon(Icons.question_mark, size: 16, color: white),
                        ),
                      ),
                    ),
                  ),
                ),
                12.width,
                Text('Forgot Password?', style: secondaryTextStyle()),
              ],
            ).onTap(() {
              PurchaseMoreScreen().launch(context);
            }),
            24.height,
            appButtonGradientBorderWidget(
              gradientWidget: AppButton(
                color: white,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('SIGN IN', style: boldTextStyle(color: black, size: 18), textAlign: TextAlign.center),
                onTap: () {
                  HomeScreen().launch(context, isNewTask: true);
                },
              ),
            ).center(),
            24.height,
            Text('Or Continue With', style: boldTextStyle(color: white, size: 18)).center(),
            24.height,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gradientBorderWidget(gradientWidget: commonCachedNetworkImage(googleLogo, height: 25, width: 25)),
                24.width,
                gradientBorderWidget(gradientWidget: commonCachedNetworkImage(appleLogo, color: white, height: 25, width: 25)),
                24.width,
                gradientBorderWidget(gradientWidget: commonCachedNetworkImage(faceBookLogo, color: white, height: 25, width: 25)),
              ],
            ),
            24.height,
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Don\'t Have An Account? ',
                    style: secondaryTextStyle(height: 1.7),
                    children: [
                      TextSpan(text: ' SIGN UP', style: boldTextStyle(color: white)),
                    ],
                  ),
                ),
                8.width,
                commonCachedNetworkImage(slash).paddingOnly(top: 8),
                Text("/", style: boldTextStyle(color: redColor, size: 18)).paddingOnly(top: 8),
              ],
            ).onTap(() {
              PurchaseMoreScreen().launch(context);
            }),
          ],
        ),
      ),
    );
  }
}
