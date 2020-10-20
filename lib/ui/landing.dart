import 'dart:ui';

import 'package:bringoo_test/theme.dart';
import 'package:bringoo_test/ui/store_selector.dart';
import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin {
  final PageController pageViewController = PageController(
    viewportFraction: 0.57,
    initialPage: 0,
  );
  RubberAnimationController bottomSheetController;

  @override
  void initState() {
    bottomSheetController = RubberAnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/landing_bg.png"),
          fit: BoxFit.fill
        )
      ),
      child: RubberBottomSheet(
        headerHeight: 70,
        header: buildBottomSheetHeader(),
        upperLayer: buildBottomSheet(),
        lowerLayer: buildContent(),
        animationController: bottomSheetController,
      ),
    );
  }

  buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUser(),
          IconButton(
            onPressed: (){},
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: ThemeProvider.green,
                    shape: BoxShape.circle,
                  ),
                ),
                Image.asset(
                  "assets/icons/bell_active.png",
                  height: 24,
                  color: ThemeProvider.darkBlue
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  buildContent(){
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          SizedBox(height: 12),
          buildHeader(),
          SizedBox(height: 34),
          buildCards(),
          SizedBox(height: 34),
          buildMenu(),
        ],
      ),
    );
  }

  buildUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
        SizedBox(height: 22),
        Text(
          "Guten Abend, \nChristian",
          style: TextStyle(
            fontSize: 32,
            height: 1,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  buildMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildMenuButton("My Location", "pin"),
        buildMenuButton("Shopping List", "shoplist"),
        buildMenuButton("Shop Cart", "cart"),
      ],
    );
  }

  buildMenuButton(String label, String icon) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(CircleBorder())
      ),
      onPressed: (){},
      child: Column(
        children: [
          Image.asset("assets/icons/$icon.png", height: 32),
          Text(
            label,
            style: TextStyle(
              color: ThemeProvider.lightBlue,
              fontSize: 12,
              fontWeight: FontWeight.bold
            )
          ),
        ],
      )
    );
  }

  buildCards() {
    return Container(
      height: 280,
      child: PageView(
        onPageChanged: (int pageIdx) {},
        controller: pageViewController,
        children: [
          buildCardItem(
            label: "Shop \nOnline",
            bottomButtonLabel: "Select Store",
            bottomButtonColor: ThemeProvider.green,
            image: "card_1_bg"
          ),
          buildCardItem(
            label: "Today \nOffers",
            bottomButtonLabel: "Show Offers",
            bottomButtonColor: ThemeProvider.blue,
            image: "card_2_bg"
          ),
          buildCardItem(
            label: "New \nListings",
            bottomButtonLabel: "Show listings",
            bottomButtonColor: ThemeProvider.green,
            image: "card_1_bg"
          ),
        ],
      ),
    );
  }

  buildCardItem({String label, String bottomButtonLabel, Color bottomButtonColor, String image}) {
    return InkWell(
      onTap: openStoreLocatorScreen,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage("assets/images/$image.png"),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 24,
                  height: 1.2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                )
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  decoration: BoxDecoration(
                    color: bottomButtonColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(8)
                    )
                  ),
                  child: Row(
                    children: [
                      Text(bottomButtonLabel,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(width: 10,),
                      Image.asset("assets/icons/right_arrow.png", height: 12,)
                    ],
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildBottomSheet(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildDeliveryItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10,);
        }
      ),
    );
  }

  buildDeliveryItem() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeProvider.beige.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16)
      ),
      child: ListTile(
        onTap: (){},
        contentPadding: EdgeInsets.fromLTRB(19, 18, 26, 18),
        leading: Image.asset("assets/icons/route.png", height: 24,),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pending Delivery · BF-12046",
              style: TextStyle(
                color: ThemeProvider.green,
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Bringoo Fresh",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 7),
            Text(
              "09 Nov ∙ 19:09",
              style: TextStyle(
                color: ThemeProvider.lightBlue,
                fontSize: 12,
              ),
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "39.0 €", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              )
            ),
          ],
        ),
      ),
    );
  }

  void openStoreLocatorScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoreSelectorScreen()),
    );
  }

  Widget buildBottomSheetHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        )
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: 15),
          Center(
            child: Container(
              width: 70,
              height: 5,
              decoration: BoxDecoration(
                color: ThemeProvider.lightBlue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4)
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "My orders",
            style: TextStyle(
              fontSize: 17,
              color: ThemeProvider.lightBlue
            )
          ),
        ]
      ),
    );
  }
}
