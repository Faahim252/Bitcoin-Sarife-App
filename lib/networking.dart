import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = 'C6E34FD2-FA57-47D4-A8C1-101BC977927E';
const List<String> coinTypes = ['BTC', 'ETH', 'LTC'];

class NetworkHelper extends StatefulWidget {
  String value;
  NetworkHelper(this.value);
  @override
  _NetworkHelperState createState() => _NetworkHelperState();
}

class _NetworkHelperState extends State<NetworkHelper> {
  void initState() {
    getData();
  }

  void getData() async {
    List<String> exchangeData = ['', '', ''];
    for (int i = 0; i < coinTypes.length; i++) {
      String url =
          'https://rest.coinapi.io/v1/exchangerate/${coinTypes[i]}/${widget.value}?apikey=$apiKey';
      http.Response data = await http.get(Uri.parse(url));

      int temp = jsonDecode(data.body)['rate'].toInt();
      exchangeData[i] = temp.toString();
    }

    Navigator.pop(context, exchangeData);
    //return exchangeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Sarifo Coin'),
      ),
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50,
        ),
      ),
    );
  }
}
