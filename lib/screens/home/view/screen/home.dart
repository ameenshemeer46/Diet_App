import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/view/model/homeScreenProvider.dart';
import 'package:flutter_application_1/screens/home/view/screen/ContactScreen.dart';
import 'package:flutter_application_1/screens/home/view/screen/chatlistScreen.dart';
import 'package:flutter_application_1/screens/home/view/screen/settingScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  
 final List<Widget> screens = [
    ChatListScreen(),
   SettingScreen()
    
  ];
   final List<String> titles = ["Chats", "Settings"];
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeScreenProvider>();

    
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[provider.currentIndex],
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[provider.currentIndex],style: TextStyle(color: Colors.green,
        fontSize: 25,
        fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            
            backgroundColor: Colors.green.shade100,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            currentIndex: provider.currentIndex,
            onTap: (index) {
              context.read<HomeScreenProvider>().changeTab(index);
            },
           items: const [
             BottomNavigationBarItem(
               icon: Icon(Icons.home,color: Colors.black,),
               label: "Home",
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.settings,color: Colors.black,),
               label: "Settings",
             ),
          
           ],),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ContactScreen(),
            ),
          );
        },
        child: const Icon(Icons.chat),
      ),
   
    );
  }
}
