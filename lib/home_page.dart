import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 70,left: 30,right: 30),
        //Main Column of Home PAge
        child: Column(
              children: [
                Row(
                  children: [
                    Text("Training",
                    style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                    ),
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,),
                    SizedBox(width: 10,),
                    Icon(Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcons,),
                    SizedBox(width: 14,),
                    Icon(Icons.arrow_forward_ios,
                    size: 20,color:color.AppColor.homePageIcons ,)
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("Your program",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700
                    ),),
                    Expanded(child: Container()),
                    Text("Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageDetail,
                    ),),

                    SizedBox(width: 5,),
                    Icon(Icons.arrow_forward,
                    size: 20,
                    color: color.AppColor.homePageIcons,)
                  ],
                )
                //Isha start from here
              ],
        ),
      ),
    );
  }
}