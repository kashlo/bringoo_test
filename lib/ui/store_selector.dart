import 'package:bringoo_test/theme.dart';
import 'package:flutter/material.dart';

class StoreSelectorScreen extends StatefulWidget {
  @override
  _StoreSelectorScreenState createState() => _StoreSelectorScreenState();
}

class _StoreSelectorScreenState extends State<StoreSelectorScreen> {
  final PageController pageViewController = PageController(
    viewportFraction: 0.57,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: Image.asset("assets/icons/drawer.png", height: 24)
        ),
        title: Image.asset("assets/images/logo.png", width: 86),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Image.asset("assets/icons/bell.png", height: 24)
          )
        ],
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: [
        buildHeader(),
        buildContent()
      ],
    );
  }

  buildHeader(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Image.asset(
            "assets/icons/pin.png",
            width: 32,
            height: 32,
            color: ThemeProvider.darkBlue
          ),
          SizedBox(height: 14),
          Text(
            "Deliver to",
            style: TextStyle(
              fontSize: 20
            )
          ),
          SizedBox(height: 8),
          Text(
            "Ferdinandstraße 32, Hamburg",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.2
            )
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  buildContent(){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            buildFavoriteStores(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
              child: Text(
                "All shops",
                style: TextStyle(
                  color: ThemeProvider.blue,
                  fontSize: 16
                )
              ),
            ),
            SizedBox(height: 10,),
            buildAllStores()
          ],
        ),
      ),
    );
  }

  buildFavoriteStores() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/heart.png", height: 24, width: 24, color: ThemeProvider.green,),
                  SizedBox(width: 10),
                  Text(
                    "Favorites",
                    style: TextStyle(
                      color: ThemeProvider.blue,
                      fontSize: 16
                    )
                  ),
                ],
              ),
              TextButton(
                onPressed: (){},
                child: Row(
                  children: [
                    Text("More",
                      style: TextStyle(color: ThemeProvider.darkBlue)
                    ),
                    SizedBox(width: 10),
                    Image.asset(
                      "assets/icons/right_arrow.png",
                      color: ThemeProvider.darkBlue,
                      height: 18
                    )
                  ],
                )
              )
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 200,
          child: PageView(
            onPageChanged: (int pageIdx) {},
            controller: pageViewController,
            children: [
              buildFavoriteStoreItem(
                label: "Bringoo Fresh",
                distance: "0.7 km",
                bottomButtonColor: ThemeProvider.green,
                image: "store_1",
                logo: "bringoo"
              ),
              buildFavoriteStoreItem(
                label: "REWE",
                distance: "0.7 km",
                bottomButtonColor: ThemeProvider.red,
                image: "store_1",
                logo: "rewe"
              ),
              buildFavoriteStoreItem(
                label: "REWE",
                distance: "0.7 km",
                bottomButtonColor: ThemeProvider.red,
                image: "store_1",
                logo: "rewe"
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildFavoriteStoreItem({String label, String distance, Color bottomButtonColor, String image, String logo}) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage("assets/store_images/$image.png"),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                            Image.asset("assets/store_logos/$logo.png", height: 26),
                            SizedBox(width: 10,),
                            Image.asset("assets/icons/right_arrow.png", height: 12)
                          ],
                        )
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 13),
            Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeProvider.darkBlue
              )
            ),
            SizedBox(width: 10),
            Row(
              children: [
                buildDistance("0.7"),
                SizedBox(width: 16),
                buildTime("34")
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildDistance(String distance) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/pin2.png",
          height: 12,
          color: ThemeProvider.green
        ),
        SizedBox(width: 5),
        Text(
          distance,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: ThemeProvider.green
          )
        ),
      ],
    );
  }

  buildTime(String time) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/clock.png",
          height: 12,
          color: ThemeProvider.lightBlue
        ),
        SizedBox(width: 5),
        Text(
          time,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: ThemeProvider.lightBlue
          )
        ),
      ],
    );
  }

  buildAllStores() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return buildStoreItem(logo: "meyers", name: "Meyer’s Frischecenter");
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10,);
          },
        ),
      ),
    );
  }

  buildStoreItem({String logo, String name}){
    return Row(
      children: [
        Container(
          width: 104,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ThemeProvider.darkBlue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: ThemeProvider.lightBlue,
              width: 1
            ),
          ),
          child: Image.asset("assets/store_logos/$logo.png", height: 40)
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            Row(
              children: [
                buildDistance("0.7"),
                SizedBox(width: 16),
                buildTime("34")
              ],
            ),
          ],
        )
      ],
    );
  }
}
