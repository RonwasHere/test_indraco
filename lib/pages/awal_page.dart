import 'package:flutter/material.dart';

class AwalPage extends StatelessWidget {
  const AwalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Test Apps - Ronald')),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 330,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/input');
                  },
                  child: Text(
                    'Input Box',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 330,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/camera');
                  },
                  child: Text(
                    'Camera',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 330,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/map');
                  },
                  child: Text(
                    'Map',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 330,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(width: 2, color: Colors.blue),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/api');
                  },
                  child: Text(
                    'Get Data From Api',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
