import 'package:flutter/material.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_off,
              size: 60,
              color: Colors.black45,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'No internet connection',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please check your connection and try again.',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(alignment: Alignment.center),
              child: const Text(
                'Retry',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
