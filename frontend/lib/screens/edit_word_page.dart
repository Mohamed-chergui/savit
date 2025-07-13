
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/word_provider.dart';
import 'package:wordsapp/screens/drop_down_for_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/examples_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/synonyms_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/tags_settings.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_details_text_field.dart';
import 'package:wordsapp/widgets/utils/editWordList/word_forms_text_fields_drop_down.dart';


class EditWordPage extends StatefulWidget {
  const EditWordPage({super.key});
  @override
  State<EditWordPage> createState() => _EditWordPageState();
}

class _EditWordPageState extends State<EditWordPage>  with TickerProviderStateMixin {
  final TextEditingController _shit = TextEditingController(text: "bahae eddine");
  List <String> types  =  ['adjective' ,'noun', 'verb'] ; 
  @override 
  Widget build(BuildContext context) {
    final word = Provider.of<WordProvider>(context);
    return  SafeArea(child: 
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
                      Padding(
                       padding: const EdgeInsets.only(top: 16 ,),
                        child: Container(
                         width: double.infinity,
                         decoration: BoxDecoration(
                           color: const Color.fromARGB(255, 245, 245 , 245),
                           borderRadius: BorderRadius.circular(14), 
                         ),
                         
                         child:  Padding(
                           padding:  const EdgeInsets.only(left : 20.0 , top : 16 , right: 18 ,),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Text('Update word'  , 
                             style: TextStyle(
                                           fontFamily: "roboto" , 
                                           fontSize: 18 , 
                                           fontWeight: FontWeight.w700 , 
                                             color: Color.fromARGB(255, 59, 59, 59),
                             ) ,),Padding(
                                                   padding: const EdgeInsets.only(bottom : 8.0 , top : 12.0),
                                                   child: WordDetailsTextField(text: "word title", controller:_shit , maxLine: false ,),
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(bottom : 8.0 , top : 12.0),
                                                   child: WordDetailsTextField(text: "spelling", controller:_shit , maxLine: false,),
                                                 ),
                                                 Padding(
                                                    padding: const EdgeInsets.only(bottom : 8.0),
                                                   child: WordDetailsTextField(text: "definition", controller:_shit , maxLine: true ,),
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.only(bottom : 28.0),
                                                   child: DropDownForSettings(types: types , text: "type",),
                                                 ) , 
                                                   Padding(
                                                   padding: const EdgeInsets.only(bottom :  0.0),
                                                   child: Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,                                                 
                                                     children: [
                                                      const Text("word forms" , style: TextStyle(
                                                         fontSize: 15 , 
                                                         fontFamily: "roboto",  
                                                       ), 
                                                     ) , 
                                                     Row(
                                                       children: [
                                                           GestureDetector(
                                                       onTap: () {
                                                          word.setHideWordForms() ; 
                                                       },
                                                       child: Text( !word.hideWordsForm ? "hide" : "show" , style: const TextStyle(
                                                          fontWeight: FontWeight.w400 ,  decorationColor:  Color.fromARGB(200, 3, 3, 3) , 
                                                          decorationThickness: 1.0, 
                                                       color: Color.fromARGB(200, 3, 3, 3) ,
                      
                                                       ),)) , 
                                                       Padding(
                                                         padding: const EdgeInsets.only(left : 8.0),
                                                         child: GestureDetector
                                                           (
                                                             onTap: () {
                                                                word.addWordForms() ; 
                                                             },
                                                             child: const Icon(Icons.add , color: Color.fromARGB(255, 59, 59, 59), )),
                                                       ),
                                                       ],
                                                     ) , 
                                                     
                                                   ],)
                                                 ) , 
                                                  AnimatedSize(
                                                    duration: const Duration(milliseconds: 300), 
                                                    curve: Curves.easeInOut,
                                                        alignment: Alignment.topCenter, 
                      
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(bottom  : 18.0),
                                                      child: !word.hideWordsForm ? Column(
                                                                                      children: List.generate(word.addedForms.length, (index) {
                                                                                        return WordFormsTextFieldsDropDown(
                                                                                          options: word.wordFormsTextFieldsOptions,
                                                                                          selected:word.addedForms[index],
                                                                                          onSelected: (value) {
                                                      
                                                                                            word.changeWordForm(value,word.addedForms[index]) ;
                                                                                          },
                                                                                        );
                                                                                      }),
                                                                                    ) : const SizedBox.shrink(),
                                                    ),
                                                  ),
                             ],
                           ),
                         ),
                        )
                      ),
                   const Padding(
                     padding: EdgeInsets.only(top : 12.0),
                     child: ExamplesSettings(), 
                   ),
                   const SizedBox( height :  12) , 
                   const SynonymsSettings() , 
                   const SizedBox( height :  12) , 
                   const TagsSettings() , 
                   const SizedBox( height: 20,) , 
                  
          ],
          
        ),
      ),
    ));
  }
}


























