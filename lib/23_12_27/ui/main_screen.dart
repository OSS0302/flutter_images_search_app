import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/model/image_item.dart';
import 'package:flutter_image_search_app/repository/image_item_repository.dart';
import 'package:flutter_image_search_app/widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();
  final repository = PixabayImageItemRepository();
  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
    print(query);
    setState(() {

      isLoading = true;
    });
    imageItems = await repository.getImageItems(query);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Color(0xFF4FB6B2)),
                    onPressed: () =>
                        searchImage(searchTextEditingController.text),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: GridView.builder(
                  itemCount: imageItems.length,
                  itemBuilder: (context, index) {
                    final imageItem = imageItems[index];
                    return ImageItemWidget(imageItem: imageItem);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
