import 'package:flutter/material.dart';
import 'package:flutter_image_search_app/23_12_28/model/image_item.dart';
import 'package:flutter_image_search_app/23_12_28/repository/image_item_repository.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  final searchTextEditingController = TextEditingController();

  final repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];
  bool isLoading = false;

  Future<void> searchImage(String query) async {
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
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2),
                    ),
                    onPressed: () =>
                        searchImage(searchTextEditingController.text),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FutureBuilder<List<ImageItem>>(
                future: PixabayImageItemRepository()
                    .getImageItems(searchTextEditingController.text),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  final imageImages = snapshot.data!;
                  print(imageImages);
                  return Expanded(
                    child: GridView.builder(
                      itemCount: imageItems.length,
                      itemBuilder: (context, index) {
                        final imageItem = imageItems[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            imageItem.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 32,
                        mainAxisSpacing: 32,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
