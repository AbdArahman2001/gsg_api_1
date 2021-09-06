import 'package:flutter/material.dart';
import 'package:gsg_api_1/providers/main_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Get'),
          onPressed: () async {
            print('start');
            await Provider.of<MainProvider>(context, listen: false)
                .getCategoryProducts('women\'s clothing');
            print('end');
          },
        ),
      ),
    );
  }
}
