import 'dart:io';

import 'package:corona_api_app/app/repositories/data_repository.dart';
import 'package:corona_api_app/app/repositories/endpoinat_data.dart';
import 'package:corona_api_app/app/services/api.dart';
import 'package:corona_api_app/app/ui/last_updated_status_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'endpoint_card.dart';
import 'show_alert_dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData? _endpointsData;

  Future<void> _updateData() async {
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointData();
      setState(() {
        _endpointsData = endpointsData;
      });
    } on SocketException catch (_) {
      showAlertDialog(
        context: context,
        title: 'Connection error',
        content: 'Couldn`t retrive data. Please try again later.',
        defaultActionText: 'OK',
      );
    } catch (_) {
      showAlertDialog(
        context: context,
        title: 'Unknown error',
        content: 'Contact support or try again later.',
        defaultActionText: 'OK',
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdatedDateFormatter(
        lastUpdated: _endpointsData?.values[Endpoint.cases]?.date);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coronavirus Tracker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: RefreshIndicator(
            onRefresh: _updateData,
            child: ListView(
              children: [
                LastUpdatedStatusText(text: formatter.lastUpdatedStatustext()),
                for (var endpoint in Endpoint.values)
                  EndpointCard(
                    endpoint: endpoint,
                    value: _endpointsData?.values[endpoint]?.value ?? 0,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
