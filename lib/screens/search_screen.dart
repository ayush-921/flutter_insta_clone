import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUser = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Search for a User',
          ),
          controller: searchController,
          onFieldSubmitted: (String _) {
            setState(() {
              isShowUser = true;
            });
          },
        ),
      ),
      body: isShowUser
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('user')
                  .where('username',
                      isGreaterThanOrEqualTo: searchController.text)
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data!.docs[index]['photoUrl'],
                        ),
                      ),
                      title: Text(
                        snapshot.data!.docs[index]['username'],
                      ),
                    );
                  },
                );
              },
            )
          : FutureBuilder(
              future: FirebaseFirestore.instance.collection('posts').get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return
                    //TODO: check if there is something better than MasonryGridView.builder
                    MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Image.network(
                    snapshot.data!.docs[index]['postUrl'],
                  ),
                );
              },
            ),
    );
  }
}
