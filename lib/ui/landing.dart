import 'dart:ui';

import 'package:bringoo_test/theme.dart';
import 'package:bringoo_test/ui/store_selector.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController pageViewController = PageController(
    viewportFraction: 0.57,
    initialPage: 0,
  );
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((_) {
      showBottomOrdersSheet();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),
            buildHeader(),
            SizedBox(height: 34),
            buildCards(),
            SizedBox(height: 34),
            buildMenu()
          ],
        ),
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
                Image.asset("assets/icons/bell.png", height: 24, color: ThemeProvider.darkBlue,),
              ],
            )
          )
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
            bottomButtonLabel: "SHow listings",
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
                    // shape: BoxShape.circle(20)
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
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          SizedBox(height: 17),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return buildDeliveryItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10,);
              },
            ),
          )
        ],
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
        // tileColor: ThemeProvider.beige.withOpacity(0.15),
        contentPadding: EdgeInsets.fromLTRB(19, 18, 26, 18),
        // tileColor: Colors.blue,
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

  void showBottomOrdersSheet() {
    scaffoldState.currentState.showBottomSheet((context) => buildBottomSheet());
  }

  void openStoreLocatorScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StoreSelectorScreen()),
    );
  }
}
