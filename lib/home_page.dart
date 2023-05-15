import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NotificationData> notificationList = [
    NotificationData(
        name: 'Megan Moreno',
        leadingImage:
            'https://thumbs.dreamstime.com/b/portrait-handsome-smiling-young-man-folded-arms-smiling-joyful-cheerful-men-crossed-hands-isolated-studio-shot-172869765.jpg',
        titleText: ' Liked Your Post',
        subtitleText: '3 min ago',
        trailingImage:
            'https://img.freepik.com/free-vector/golden-bird-logo-design_1195-336.jpg'),
    NotificationData(
        name: "Tiffany James",
        leadingImage:
            'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg',
        titleText: ' commented: "this coupino is best for travelling ".',
        subtitleText: '10 min ago',
        trailingImage:
            'https://thumbs.dreamstime.com/b/b-letter-boutique-logo-design-159417325.jpg'),
    NotificationData(
        name: "Lori Kelly, Tiffany James and others",
        leadingImage:
            'https://cdn.xxl.thumbs.canstockphoto.com/portrait-of-a-smiling-young-man-looking-at-camera-closeup-portrait-of-a-smiling-young-man-looking-at-stock-images_csp15964556.jpg',
        titleText: ' liked your Post',
        subtitleText: '30 min ago',
        trailingImage:
            'https://png.pngtree.com/element_pic/00/16/09/2057e0eecf792fb.jpg'),
    NotificationData(
        name: 'Dennis Byrd',
        leadingImage:
            'https://www.shutterstock.com/image-photo/portrait-young-smiling-woman-looking-260nw-1865153395.jpg',
        titleText: ' bookmarked this post',
        subtitleText: '1 hour ago',
        trailingImage:
            'https://img.freepik.com/free-vector/gradient-quill-pen-design-template_23-2149837194.jpg'),
    NotificationData(
        name: 'Randall Walker',
        leadingImage:
            'https://img.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
        titleText: ' commented: "Good Offers for travelling".',
        subtitleText: '6 hours ago',
        trailingImage:
            'https://thumbs.dreamstime.com/b/gradient-fire-phoenix-bird-simple-logo-design-black-bird-simple-logo-design-simple-gradient-fire-phoenix-bird-logo-158339374.jpg'),
    NotificationData(
        name: '7Media',
        leadingImage:
            'https://www.shutterstock.com/image-vector/dots-letter-c-logo-design-260nw-551769190.jpg',
        titleText: ' has Create a new coupino',
        subtitleText: '10 hours ago',
        trailingImage:
            'https://t4.ftcdn.net/jpg/04/42/01/81/360_F_442018137_F4FTedsmVBxmaibxMKuNbeIms8Xkk1e4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      drawer: Drawer(
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(50, 30),
                      backgroundColor: Colors.red,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Like",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 1.0),
                      fixedSize: const Size(50, 30),
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Comment",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 1.0),
                      fixedSize: const Size(100, 30),
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Bookmark",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 1.0),
                      fixedSize: const Size(105, 30),
                      backgroundColor: Colors.white,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ListView.builder(
                itemCount: notificationList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage(notificationList[index].leadingImage),
                      ),
                      title: Text(
                        notificationList[index].name +
                            notificationList[index].titleText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: Text(
                        notificationList[index].subtitleText,
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Container(
                        child: Image.network(
                            notificationList[index].trailingImage),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(10),
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          isExtended: true,
          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
          },
          child: Text("Action!"), //icon inside button
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 20,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black45,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.card_giftcard_outlined,
              ),
              label: 'Coupons'),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.event_available_outlined,
              ),
              label: 'Events'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.location_on_outlined), label: 'Map'),
        ],
      ),
    );
  }
}

class NotificationData {
  final String leadingImage;
  final String titleText;
  final String subtitleText;
  final String trailingImage;
  final String name;

  NotificationData(
      {required this.leadingImage,
      required this.titleText,
      required this.subtitleText,
      required this.trailingImage,
      required this.name});
}
