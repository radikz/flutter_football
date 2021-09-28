import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red.withOpacity(0.7),),
          SizedBox(height: 10,),
          Text('Failed to load data', style: TextStyle(color: Colors.black.withOpacity(0.7)),),
        ],
      ),
    );
  }
}
