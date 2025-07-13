import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/Providers/wods_provider_logic/words.dart';
import 'package:wordsapp/widgets/utils/editWordList/setings_buttons.dart';

class EditWordList extends StatefulWidget {
  const EditWordList({super.key});

  @override
  State<EditWordList> createState() => _EditWordListState();
}

class _EditWordListState extends State<EditWordList> {
  @override
  Widget build(BuildContext context) {

    
    return GestureDetector
    (
      onTap: () => showEditBottomSheet() ,
      
      child: Image.asset("Assets/firstcolor/pencil.png" ,height: 23,));
  }
  void showEditBottomSheet()async{
    final collections = Provider.of<Collection>(context, listen: false) ;
    final words= Provider.of<WordsProvider>(context, listen: false) ;
     collections.setAddFolder(true);
      await showModalBottomSheet(
        isScrollControlled: true,
        barrierColor: Colors.black.withOpacity(0.2),
        context: context, builder:(context) {
        return Container(
          height: 690,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24) , 
            color:const Color.fromARGB(255, 255, 255, 255),
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                    Padding(
                      padding: const EdgeInsets.only( top: 14 ,  ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top : 12.0 , left : 6),
                                child: Text("Settings" ,
                                style: TextStyle(
                                          fontFamily: "roboto",
                                          fontSize: 21,
                                          fontWeight: FontWeight.w800,
                                          color: Color.fromARGB(255, 53, 53, 53),
                                        ), ),
                              ),
                          
                          
                            ],
                          ) , 
                          Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 242, 242, 242), 
                                shape: BoxShape.circle , 
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.close_rounded),
                              ),
                          ),
                        ],
                      ),
                    ),
                        Padding(
                      padding:    Platform.isIOS ? const EdgeInsets.only( top : 26.0) : const EdgeInsets.only( top : 4.0) ,
                      child: SizedBox(
                        height: 600, // the size of the screen 
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 246, 246, 246),
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Padding(
                                          padding:  Platform.isIOS ? const EdgeInsets.only(top : 6.0 , bottom: 5) : const EdgeInsets.only(top : 2.0 , bottom: 2),
                                          child: const Text("Lists experience" ,
                                                                          style: TextStyle(
                                                  fontFamily: "roboto",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  color: Color.fromARGB(255, 53, 53, 53),
                                                ), ),
                                        ),
                                        const SettingWithSwitch( typeOfSetting: "showOnlyPinned",  nameOfSetting: "Show only pinned words"),
                                        const SettingWithSwitch( typeOfSetting: "showWordsType",  nameOfSetting: "Show words types"),
                                        Padding(
                                          padding: Platform.isIOS ? const EdgeInsets.only(top : 6.0 , bottom: 6  , right: 21) : const EdgeInsets.only(top :1.0 , bottom: 1  , right: 21),
                                          child: Container( color: const Color.fromARGB(255, 59, 59, 59), height: 0.2,margin: const EdgeInsets.symmetric(horizontal: 2), ),
                                        ) , 
                                        const SettingWithSwitch( typeOfSetting: "showSearchBar",  nameOfSetting: "Show SearchBar"),
                                        const SettingWithSwitch( typeOfSetting: "pinnedWordsIntop",  nameOfSetting: "Pinned words in the top"),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                              padding: const EdgeInsets.only(top : 12.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 246, 246, 246),
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                ),
                                
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 12),
                                  child: Selector<WordsProvider, bool>(
                                    selector: (p0, provider) => provider.temprecentlyAdded,
                                    builder: (context, recentlyAdded, _) {
                                      return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top : 8.0 ,bottom: 4),
                                            child: Text("Sort By" , 
                                             style: TextStyle(
                                            fontFamily: "roboto",
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromARGB(255, 53, 53, 53), 
                                                                                ),),
                                          ) , 
                                        const SettingWithSwitch( typeOfSetting: "recentlyAdded",  nameOfSetting: "Recently Added"),
                                        Padding(
                                          padding: const EdgeInsets.only(top :12.0 , bottom: 6  , right: 4 ),
                                          child: Container( color: const Color.fromARGB(255, 59, 59, 59), height: 0.2,margin: const EdgeInsets.symmetric(horizontal: 2), ),
                                        ) , 
                                         SettingwithCheckBox( typeOfSetting:  recentlyAdded ? "ascendingDateTime" : "atoZ" ,  nameOfSetting: !recentlyAdded ? "Priority by alphabet" :  "Ascending order" , shape: "circle",),
                                         SettingwithCheckBox( typeOfSetting:  recentlyAdded ?  "descendingDateTime" : "priorityToWordType"  ,  nameOfSetting:  !recentlyAdded ?  "Priority to word type" :"Descending order" , shape: "circle", )  , 
                                         
                                      ],
                                    ) ; 
                                    },
                                  ),
                                ),
                              ),
                            ),
                              ],
                            ),
                            
                             Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Changes should be permanent" ,style: TextStyle(
                                                fontFamily: "roboto",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(255, 53, 53, 53),
                                              ),),
                                      SettingwithCheckBox( typeOfSetting:  "permanentChanges" ,  nameOfSetting:  "" , shape: "square",),
                                    ],
                                  ),
                                     ElevatedButton(
                                  style:  const ButtonStyle(
                                    elevation:null ,
                                    backgroundColor: WidgetStatePropertyAll( Color.fromARGB(255, 129, 154, 145),)
                                  ),              
                                  onPressed: (){
                                   words.handleSettingsChanges() ; 
                                    Navigator.of(context).pop() ; 
                                }, child: Container(
                                  width: double.infinity,
                                  height: 42,
                                  decoration:  const BoxDecoration(
                                  ),
                                  child:  const Center(
                                    child: Text("Save Changes" , 
                                    style:TextStyle(
                                    fontSize: 16,
                                    fontFamily: "roboto",
                                    fontWeight: FontWeight.w700,
                                    color:  Color.fromARGB(255, 255, 255, 255),
                                  )), 
                                    ),
                                  ),
                                )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
            ],),
          ),

          
        ) ; 
      },); 

    collections.setAddFolder(false);
  }
}

