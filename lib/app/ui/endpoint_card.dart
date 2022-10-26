import 'package:corona_api_app/app/services/api.dart';
import 'package:flutter/material.dart';

class EndpointCardData {
  EndpointCardData(
    this.title,
    this.assetsName,
    this.color,
  );
  final String title;
  final String assetsName;
  final Color color;
}

class EndpointCard extends StatelessWidget {
  const EndpointCard({Key? key, required this.endpoint, required this.value})
      : super(key: key);

  final Endpoint endpoint;
  final int value;

  static final Map<Endpoint, EndpointCardData> _cardData = {
    Endpoint.cases:
        EndpointCardData('Cases', 'assets/count.png', const Color(0xFFFFF492)),
    Endpoint.casesSuspected: EndpointCardData(
        'Suspected cases', 'assets/suspect.png', const Color(0xFFEEDA28)),
    Endpoint.casesConfirmed: EndpointCardData(
        'Confirmed cases', 'assets/fever.png', const Color(0xFFE99600)),
    Endpoint.deaths:
        EndpointCardData('Deaths', 'assets/death.png', const Color(0xFFE40000)),
    Endpoint.recovered: EndpointCardData(
        'Recovered', 'assets/patient.png', const Color(0xFF70A901)),
  };

  @override
  Widget build(BuildContext context) {
    final cardData = _cardData[endpoint];
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardData?.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: cardData?.color),
            ),
            const SizedBox(height: 4.0),
            SizedBox(
              height: 52.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    cardData?.assetsName ?? '',
                    color: cardData?.color,
                  ),
                  Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: cardData?.color,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
