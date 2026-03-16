import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testproj/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:testproj/repositories/crypto_coins/models/crypto_coin.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, this.appBarColor});

  final Color? appBarColor;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Crypto List App')),
      body: (_cryptoCoinsList == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, i) {
                return CryptoCoinTile(coin: _cryptoCoinsList![i]);
              },
            ),
    );
  }

  void _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository(dio: Dio()).getCoinsList();
    setState(() {});
  }
}
