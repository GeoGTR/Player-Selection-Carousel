import 'package:flutter/material.dart';

Widget carouselItem(BuildContext context, String path, double width,
    double height, double opacity, String name) {
  return SafeArea(
    child: Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              opacity: opacity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            /* 
              İsteğe göre butona tıklanılıp seçim veya istatistik gösterimi 
              eklenebilir. Şimdilik sadece carouselin yapımını ele alıyoruz.
            */
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
            ),
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            minimumSize: Size(MediaQuery.of(context).size.width / 4.5,
                MediaQuery.of(context).size.height / 30),
            maximumSize: Size(MediaQuery.of(context).size.width / 4.5,
                MediaQuery.of(context).size.height / 20),
          ),
          child: Text(
            textAlign: TextAlign.center,
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
