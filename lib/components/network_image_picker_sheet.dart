import 'package:flutter/material.dart';
import 'package:simple_application/models/image_model.dart';
import 'package:simple_application/repo/image_repository.dart';

class NetworkImagePickerBottomSheet extends StatelessWidget {
  const NetworkImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: FutureBuilder<List<ImageModel>>(
        future: ImageRepository.getNetworkImages(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return GridView.builder(
                  // this is fine cause we already made sure snapshor.data !- null
                  itemCount: snapshot.data!.length,
                  // a delegate controlls how the individual items inside
                  // the Grid view are laid out!
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return Image.network(snapshot.data![index].urlFullSize);
                  },
                );
              } else {
                return CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                );
              }
            },
      ),
    );
  }
}
