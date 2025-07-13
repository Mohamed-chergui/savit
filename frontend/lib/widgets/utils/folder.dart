import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';

class Folder extends StatefulWidget {
  final String name ; 
  final String color ; 
  final String revised ; 
  final String total ; 
  final bool best ; 
  final String last; 
  final int index ; 
  final String id  ; 


  const Folder({super.key , required this.name , required this.color  , required this.total  , required this.revised   , required this.last ,required this.best  ,  required this.index  , required this.id
  });

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> with SingleTickerProviderStateMixin {
 
  late  AnimationController _controller ;
    
  
  late final  Animation<double> _opacity  =  CurvedAnimation(parent: _controller
    , curve:Curves.easeOut) ;

  @override
  void initState() {
     super.initState();
    _controller = AnimationController(vsync:  this , 
    duration: const Duration(milliseconds: 600) , 
    ) ; 
   
  }

  @override
  void didChangeDependencies() async {
      super.didChangeDependencies();
       final collections = Provider.of<Collection>(context , listen: false );
      if ( collections.isFirstBuild[widget.id] ?? false  ){  // if not animated before 
         _controller.forward() ; 
         collections.isFirstBuild[widget.id] = false  ; 
      }
      else {
        _controller.value = 1.0; // show the fucking Folder 
      }
      /// delete folder if is selcted too 
    if ( collections.choosedDelete && widget.id == collections.foldeToDeleteId ){
      collections.isholdFolderMode= false   ; 
        await   _controller.reverse().then((_){
              collections.deleteFolder(collections.foldeToDeleteId) ; 
                }) ; 
                 collections.choosedDelete = false ;
                  
                 collections.foldeToDeleteId = "" ; 
      
    }
  }

  @override
  void dispose() {
    _controller.dispose(); 
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  final collections = Provider.of<Collection>(context);

  return Stack(
    children: [
      ScaleTransition(
        scale: _opacity,
        child: GestureDetector(
          onLongPress: ()  async {
         collections.holdFolderMode();
         collections.foldeToDeleteId = widget.id ;   
          },
          onTap: () {
            context.push('/words') ; 
          },
          child: Stack(
            children: [
              Image.asset("Assets/folders/folder_${widget.color}.png", height: 168, width: 168),
              Positioned(
                top: 50,
                left: 24,
                child: Text(widget.name, style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "roboto",
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 53, 53, 53)
                )),
              ),
              Positioned(
                bottom: 20,
                left: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.revised, style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 53, 53, 53)
                        )),
                        Text("/${widget.total}", style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 141, 141, 141)
                        )),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text("Recently opened: ${widget.last}", style: const TextStyle(
                          fontSize: 10,
                          fontFamily: "roboto",
                          
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 141, 141, 141)
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      
    ],
  );
} }