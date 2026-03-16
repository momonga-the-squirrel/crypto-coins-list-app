import 'package:dio/dio.dart';
import 'package:testproj/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:testproj/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  final Dio dio;

  CryptoCoinsRepository({required this.dio});

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,USDC,SOL,USDT&tsyms=USD,&api_key=c697a679cc7e45c1c2142884d8f753b222cd5d59e9b65d8b86775d176a61a67f',
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = double.parse(usdData['PRICE'].toStringAsFixed(2));
      final imageUrl = 'https://www.cryptocompare.com/${usdData['IMAGEURL']}';

      return CryptoCoin(name: e.key, imageUrl: imageUrl, priceInUSD: price);
    }).toList();
    return cryptoCoinsList;
  }
}
