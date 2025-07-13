import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/widgets/homepage/pick_color.dart';

class LastFolder extends StatelessWidget {
  const LastFolder({super.key});

  @override
  Widget build(BuildContext context) {
     
    return GestureDetector(
      onTap: () => _showAddFolderSheet(context),
      child: Stack(
            children: [
              Image.asset("Assets/folders/folder_green.png" , height:168, width: 168) , 
               Center(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset("Assets/firstcolor/plus-2.png" , height: 22,) , 
                  const SizedBox(height: 12,) , 
                  const Text( "New folder" , style: TextStyle(
                    fontSize: 15 ,   
                    fontFamily: "roboto" , 
                    fontWeight: FontWeight.w700 ,
                    color: Color.fromARGB(255, 53, 53, 53)
                  ),),              
                             ],),
               )
                ],
        
        
        ),
    ) ;
  }



      /////// add folder sheet 
  
  void _showAddFolderSheet(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final TextEditingController newfoldername =  TextEditingController() ; 
    final collections = Provider.of<Collection>(context, listen: false);
    collections.setAddFolder(true);
    
    await showModalBottomSheet(
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0 ,),
        child: SingleChildScrollView(
          child: Container(
            height: 420,
            width: double.infinity,
            
            decoration:  const BoxDecoration(
              
              color: Color.fromARGB(255, 255, 255, 255)  ,
              
              borderRadius: BorderRadius.only(topLeft: Radius.circular(34) , topRight: Radius.circular(34)  )),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Padding(
                   padding: EdgeInsets.only(top : 44.0 , left : 22 ),
                   child: Text("Create folder", style: TextStyle(
                      fontSize: 22,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 53, 53, 53)
                    )),
                 ),
          
                 const Padding(
                   padding: EdgeInsets.only(top : 0.0 , left : 26 , right: 26 , bottom: 18 ),
                   child: Text("Easily create a customizable folder to store your favorite words and sentences. ", style: TextStyle(
                      fontSize: 14,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 53, 53, 53)
                    )),
                 ),
          
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                   child: Padding(
                     padding: const EdgeInsets.only(left : 0.0),
                     child: SizedBox(
                      height: 70,
                       child: Form(
                        key:formKey ,
                         child: TextFormField(
                          controller: newfoldername ,              
                          scribbleEnabled: false  ,
                          decoration:  InputDecoration(
                            filled: true,
                          fillColor: const Color.fromARGB(31, 88, 88, 88),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
                            border: InputBorder.none , 
                            hintText: 'Folder name', 
                            enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.transparent), 
                                        
                            
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 129, 154, 145), width: 1.5), // Highlight on focus
                               ),
                               errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: Colors.red, width: 1.5),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                                  ),
                                              
                         
                            hintStyle:const TextStyle(
                                             fontSize: 14,
                                             fontFamily: "roboto",
                                             fontWeight: FontWeight.w700,
                                             color: Color.fromARGB(255, 116, 116, 116)
                                           )
                          ),
          
                            validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Folder name is required';
                            }
                            return null;
                          },    
                         ),
                         
                       ),
                     ),
                   ),
                 ) ,
                 const Padding(
                   padding: EdgeInsets.only(top : 5.0 , left : 22 ),
                   child: Text(" Pick color", style: TextStyle(
                      fontSize: 16,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 53, 53, 53)
                    )),
                 ),
          
          
                  const Padding(
                     padding: EdgeInsets.only(left: 18.0 , right: 4  ,top: 3 ),
                child: SizedBox(
                    child: PickColor(),
                  )  ) , 
          
                 Padding(
                   padding: const EdgeInsets.only(top : 32.0 , left: 12 , right : 12 , ),
                   child: ElevatedButton(
                    style: const ButtonStyle(
                      elevation:null ,
                      backgroundColor: WidgetStatePropertyAll( Color.fromARGB(255, 129, 154, 145),)
                    ),              
                    onPressed: (){
                      if (formKey.currentState!.validate()){
                    collections.changeNewFolderName(newfoldername.text);
                    collections.addFolder() ; 
                    Navigator.of(context).pop();
                      }
          
                   }, child: Container(
                    width: double.infinity,
                    height: 42,
                    decoration: const BoxDecoration(
                    ),
                    child: const Center(
                      child: Text("Add Folder" , 
                      style:TextStyle(
                      fontSize: 16,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w700,
                      color:  Color.fromARGB(255, 238, 239, 224),
                    )), 
                      ),
                    ),
                   )),
                
          
                ],
              ),
          ),
        ),
      ),
    );
    
    collections.setAddFolder(false);
  }
}
