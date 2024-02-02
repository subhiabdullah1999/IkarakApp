import 'package:flutter/material.dart';

copyright() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CopyRight ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Container(
            height: 11,
            width: 11,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
                child: Text(
              'R',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
            )),
          ),
          Text(
            ' 2023 Ikarak',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'www.ibits-Itd.me',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ],
  );
}
