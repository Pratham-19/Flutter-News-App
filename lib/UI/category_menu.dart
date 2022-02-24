import 'package:flutter/material.dart';

class TopCategoryMenu extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function categoryChange;
  const TopCategoryMenu(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.categoryChange})
      : super(key: key);
  // const TopCategoryMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {
          categoryChange(title);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 160,
                width: 130,
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 160,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 17.5),
              ),
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }
}
