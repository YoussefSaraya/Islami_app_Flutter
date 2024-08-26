import 'package:flutter/material.dart';
import 'package:islami/Providers/app_config_provider.dart';
import 'package:islami/app_colors.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double angle = 0;

  // String content='سبحان الله';
  List<String> Tasbeeh = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ',
    'الْلَّهُ أَكْبَرُ ',
    'لاَ إِلَهَ إِلاَّ اللَّهَ',
    'استغفر الله العظيم و اتوب اليه',
    'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ ِ ',
    'لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ',
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
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
                      top: MediaQuery.of(context).size.height * 0.03,
                      child: Image.asset('assets/images/sebha_head.png')),
                  GestureDetector(
                      onTap: onTap,
                      child: Transform.rotate(
                          angle: angle,
                          child: Image.asset('assets/images/sebha_body.png'))),
                ],
              )),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              "$counter",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(
              Tasbeeh[index],
              style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  onTap() {
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == Tasbeeh.length) {
      index = 0;
    }
    angle += 360 / 30;

    setState(() {});
  }
}
