import 'package:corona_api_app/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key? key, required this.endpoint, required this.value})
      : super(key: key);

  final Endpoint endpoint;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Text(
              'Cases',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Positioned(
            left: 8.0,
            bottom: 8.0,
            child: Icon(Icons.calculate),
          ),
          Positioned(
            right: 8.0,
            bottom: 8.0,
            child: Text(
              value.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
