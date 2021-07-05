import 'package:flutter/material.dart';

import '../Data/Constants.dart';

class FoodListTile extends StatelessWidget {
  const FoodListTile({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    var advertisementData;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      elevation: 4.0,
      child: ExpansionTile(
        title: Text("Homeeee"),
        leading: Icon(
          Icons.bluetooth,
          color: Constants.primary,
        ),
        trailing: ElevatedButton(
          child: Text(
            'CONNECT',
            style: TextStyle(
                color: Constants.buttonTxt,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          onPressed: (advertisementData.connectable) ? onTap : null,
          style: ElevatedButton.styleFrom(
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            primary: Constants.primary,
          ),
        ),
        children: <Widget>[
          _buildAdvRow(context, 'Complete Local Name',
              advertisementData.advertisementData.localName),
          _buildAdvRow(context, 'Tx Power Level',
              '${advertisementData.advertisementData.txPowerLevel ?? 'N/A'}'),
          _buildAdvRow(
              context,
              'Manufacturer Data',
              getNiceManufacturerData(
                  advertisementData.advertisementData.manufacturerData)),
          _buildAdvRow(
              context,
              'Service UUIDs',
              (advertisementData.advertisementData.serviceUuids.isNotEmpty)
                  ? advertisementData.advertisementData.serviceUuids
                      .join(', ')
                      .toUpperCase()
                  : 'N/A'),
          _buildAdvRow(
              context,
              'Service Data',
              getNiceServiceData(
                  advertisementData.advertisementData.serviceData)),
        ],
      ),
    );
  }

/*  Widget _buildTitle(BuildContext context) {
    if (advertisementData.device.name.length > 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            advertisementData.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            advertisementData.device.id.toString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
    } else {
      return Text(advertisementData.device.id.toString());
    }
  }*/

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.caption),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.apply(color: Colors.black),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }
}
