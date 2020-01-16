import 'package:admin_balaji_temple_ahmedabad/constants.dart';
import 'package:flutter/material.dart';

class CarouselListTile extends StatelessWidget {
  CarouselListTile({
    @required this.imageId,
    @required this.imageUrl,
    @required this.imageUploadDate,
    @required this.delFn,
  });
  final String imageId;
  final String imageUrl;
  final DateTime imageUploadDate;
  final Function delFn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: mainColor,
          ),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Image.network(
                imageUrl,
                height: 100,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  return progress == null
                      ? child
                      : CircularProgressIndicator(
                          backgroundColor: mainColor,
                        );
                },
              ),
            ),
          ),
          title: Text('Upload date:' +
              imageUploadDate.day.toString() +
              '/' +
              imageUploadDate.month.toString() +
              '/' +
              imageUploadDate.year.toString()),
          trailing: GestureDetector(
            onTap: delFn,
            child: Icon(
              Icons.cancel,
              color: mainColor,
            ),
          ),
        ),
      ),
    );
  }
}
