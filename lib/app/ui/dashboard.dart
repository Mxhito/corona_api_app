import 'package:corona_api_app/app/repositories/data_repository.dart';
import 'package:corona_api_app/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'endpoint_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int? _cases;

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final cases = await dataRepository.getEndpointData(Endpoint.cases);
    setState(() {
      _cases = cases;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coronavirus Tracker'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: _updateData,
            child: ListView(
              children: [
                EndpointCard(
                  endpoint: Endpoint.cases,
                  value: _cases ?? 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
