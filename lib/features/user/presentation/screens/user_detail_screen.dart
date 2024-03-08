import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final UserPreview userPreviewModel;
  const UserDetailScreen({
    super.key,
    required this.userPreviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(userPreviewModel.firstName),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(userPreviewModel.picture),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
