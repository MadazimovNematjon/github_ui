import 'package:flutter/material.dart';
import 'package:github_ui/model/user_model.dart';
import 'package:github_ui/network/network.dart';
import 'package:icons_plus/icons_plus.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  List<UserModel?> items = [];

  _apiGetList() async{
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if(response != null){
      setState(() {
        items = Network.parsePostList(response);
        print(items);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiGetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24292e),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(BoxIcons.bxl_github,color: Colors.white,size: 30,),

              Icon(EvaIcons.menu,color: Colors.white,size: 30,),
            ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context , index) => itemsUser(items[index]!),
            ),
          ),
        ],
      ),
    );
  }

 Widget itemsUser(UserModel item) {
    return Center(
      child: Container(
        child: Column(
          children: [
            
            Container(
              height: 240,
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 230,
                     height: 230,
                     decoration: BoxDecoration(
                    shape: BoxShape.circle,
                       color: Colors.red,
                       image: DecorationImage(image: Image.network(item.avatarUrl ?? "",fit: BoxFit.contain,).image),
        ),
      ),

                  ),

                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 200,),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Follow",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text(item.login ?? "",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),
            SizedBox(height: 40,),
            Text("Flutter",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
            SizedBox(height: 5,),
            Text("nmadazimov734@gmail.com",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
            SizedBox(height: 5,),
            Text(item.htmlUrl.toString(),style: TextStyle(color: Colors.blue,fontSize: 13,),),
            SizedBox(height: 10,),
            Image.asset("images/Untitled-1.png"),
    ])
      ));
 }
}
