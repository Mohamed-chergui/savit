import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordsapp/Providers/collections.dart';
import 'package:wordsapp/widgets/utils/folder.dart';
import 'package:wordsapp/widgets/utils/last_folder.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  
  @override
  @override
Widget build(BuildContext context) {
  
  return Padding(
  padding: const EdgeInsets.only(top: 24.0, left: 24 , right: 24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "My collections",
        style: TextStyle(
          fontFamily: "roboto",
          fontSize: 21,
          fontWeight: FontWeight.w800,
          color: Color.fromARGB(255, 53, 53, 53),
        ),
      ),
      const SizedBox(height: 14),
      Consumer<Collection>(
            builder: (context, collectionData, child) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: collectionData.collectionsList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  if (index == collectionData.collectionsList.length) {
                    return const LastFolder();
                  }

                  final folderData = collectionData.collectionsList[index];
                  final String folderId = folderData['id'];

                  return Folder(
                    key: ValueKey(folderId),
                    name: folderData['name'],
                    color: folderData['color'],
                    last: folderData['last'],
                    revised: folderData['revised'],
                    total: folderData['total'],
                    best: folderData['best'],
                    index: index , 
                    id: folderId, 
                  );
                },
              );
            },
          ),

    ],
  ),
);
}
  }