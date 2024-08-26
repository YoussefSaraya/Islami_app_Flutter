import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.2,
                        child: Image.asset('assets/images/Radio_image.png')),
                  ],
                )),
            Text(
              "اذاعه القرأن الكريم",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.first_page,
                  color: AppColors.goldColor,
                  size: 75,
                ),
                Icon(
                  Icons.play_arrow,
                  color: AppColors.goldColor,
                  size: 75,
                ),
                Icon(
                  Icons.last_page,
                  color: AppColors.goldColor,
                  size: 75,
                ),
              ],
            )
          ],
        ));
  }
}
