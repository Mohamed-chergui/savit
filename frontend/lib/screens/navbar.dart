import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/Providers/settings_provider.dart';


class Navbar extends StatefulWidget {

  final Widget child;
  const Navbar({super.key , required this.child});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // basically when you route to one of this the nav bar will have it as child
    // declared in routes file 

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/Words');
        break;
      case 2:
        context.go('/searchPage');
        break;
      case 3:
        context.go('/settingsPage');
        break;
    }
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
      final collections = Provider.of<Collection>(context);
      final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
        widget.child ,
             Selector<Collection, bool>(
            selector: (context, provider) => provider.isholdFolderMode,
            builder: (context, isholdFolderMode, _) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,

                bottom: isholdFolderMode ? 50 : -320,
                
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                       Padding(
                         padding: const EdgeInsets.only(left : 20.0),
                         child: GestureDetector(
                          onTap: () {
                                collections.choosedDeletefunc(true)  ; 
                          },
                           child: Container(
                             width: 130, 
                             decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 94, 153, 201),
                                            borderRadius: BorderRadius.circular(50)
                             ),
                                            height: 43,
                           
                                            child: const Center(child: Text("delete")),
                                          ),
                         ),
                       ),

                       const SizedBox(width: 10,) , 

                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: 220,
                          height: 43,
                         decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 94, 153, 201),
                                        borderRadius: BorderRadius.circular(50)
                         ),
                          child: const Center(child: Text("edit folder ")),
                        ),
                      ),                     
                     
                    ],
                  ),
                ),
              );
            },
          ),
                            
                          
        
        ]),
      extendBody: true, 
      bottomNavigationBar: AnimatedSlide(
        offset: collections.isholdFolderMode ||  collections.isAddFolder? const Offset(0, 1)  : Offset.zero ,
        duration: const Duration(milliseconds: 300 ) ,
        child: BottomAppBar(
          
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: const Color.fromARGB(255, 247, 247, 247),
        
          height: 55, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem( "Assets/firstcolor/book-bookmark-2.png", "Assets/secondcolor/book-bookmark.png" ,  0),
              buildNavItem( "Assets/firstcolor/game-rules-2.png" , "Assets/secondcolor/game-rules.png" ,  1),
              
              
              const SizedBox(width: 40), 
              buildNavItem( "Assets/firstcolor/search-2.png", "Assets/secondcolor/search.png" ,  2),
              buildNavItem( "Assets/firstcolor/menu-burger-2.png", "Assets/secondcolor/menu-burger.png" ,  3),
            ],
          ),
        ),
      ),

      floatingActionButton: AnimatedSlide(
offset: collections.isholdFolderMode || collections.isAddFolder? const Offset(0, 6)  : Offset.zero ,
        duration: const Duration(milliseconds: 300 ) ,
        child: GestureDetector(
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: settingsProvider.mainColorOptions[settingsProvider.mainColorindex],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset("Assets/firstcolor/plus.png"),
              ),
            ),
            
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavItem( String icon1 ,  String icon2 , int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
           _currentIndex == index ? icon1 : icon2,
            height: 24,
          ),
        ],
      ),
    );
  }
}