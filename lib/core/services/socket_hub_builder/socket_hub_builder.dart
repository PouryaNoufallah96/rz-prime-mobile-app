import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart' as crypto;
import 'package:gainx/core/env.dart';
import 'package:web_socket_client/web_socket_client.dart';

class SocketHubBuilder {
  const SocketHubBuilder({
    required this.uri,
    required this.token,
  });

  final String uri;
  final String token;

  Future<WebSocket> build() async {
    final nonce = DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000000000).toString();

    final key = utf8.encode(Env.publicSignature);
    final bytes = utf8.encode(nonce);

    final hmacSha256 = crypto.Hmac(crypto.sha256, key);
    final digest = hmacSha256.convert(bytes);

    final signature = base64Encode(digest.bytes);


    final hub = WebSocket(
      Uri.parse('$uri?access_token=$token'),
                headers: {
            'ApplicationId': Env.applicationId,
            'Nonce': nonce,
            'signature': signature,
          },
    );

    await hub.connection.firstWhere((e) => e is Connected);
    hub.send('{"protocol":"json","version":1}');

    return hub;
  }
}

// {"target":"RegisterWallet","arguments":["0x55304995141dc954d7cb8bA77302b16fe7d629A4"],"invocationId":"0","type":1}
// {"type":1,"target":"NotifyInventory","arguments":[{"JEWELRY":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19992.5560,"price":{"tokenAddress":"0xd85df7190cdc09a42d7a2567f68812128c71e9a7","tokenName":"JEWELRY","tokenNetwork":"BSC","price":27.2290251081157,"liquidityUsd":50035020.9413,"volume24hUsd":14087.8495245631,"poolFeeRate":null,"reserveBaseUsd":1362404841.49575254608330841,"reserveQuoteUsd":123529419.569373198769079257,"quoteTokenPriceUsd":2.46885915595589},"lastUpdated":"2025-08-26T09:17:52.1105945Z"},"RZ":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19997.1435,"price":{"tokenAddress":"0x771e1c638a9409bfc93158588f1745f638f4d10b","tokenName":"RZ","tokenNetwork":"BSC","price":71.4336032759635,"liquidityUsd":46479962.4292,"volume24hUsd":76685.3226358289,"poolFeeRate":null,"reserveBaseUsd":3320231196.44916151943053420,"reserveQuoteUsd":115031397.818100438583855016,"quoteTokenPriceUsd":2.47485995698298},"lastUpdated":"2025-08-26T09:16:51.7449182Z"},"REALESTATE":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19993.4739,"price":{"tokenAddress":"0x16a009f23333d5ae1db85a69cb231f85102c517c","tokenName":"REALESTATE","tokenNetwork":"BSC","price":15.665336376915,"liquidityUsd":29043842.8724,"volume24hUsd":9444.0644017259,"poolFeeRate":null,"reserveBaseUsd":454981568.2744111626506460,"reserveQuoteUsd":71772853.465309562291478976,"quoteTokenPriceUsd":2.47118997925424},"lastUpdated":"2025-08-26T09:16:51.9328259Z"},"MGC":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19917.3844,"price":{"tokenAddress":"0xc08019ea4988bcce9dc4c2ee983e431a885d2f1a","tokenName":"MGC","tokenNetwork":"BSC","price":2.47062454118785,"liquidityUsd":1045735.4885,"volume24hUsd":185580.610691374,"poolFeeRate":null,"reserveBaseUsd":2583619.761479164690014725,"reserveQuoteUsd":881209924.094295,"quoteTokenPriceUsd":842.67},"lastUpdated":"2025-08-26T09:16:51.9355111Z"},"INDUSTRIAL":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19974.3236,"price":{"tokenAddress":"0xd5916c07de3ffbb728a07e118fa89b5452ea9602","tokenName":"INDUSTRIAL","tokenNetwork":"BSC","price":19.7857645816983,"liquidityUsd":36604038.39,"volume24hUsd":2861.9972947007,"poolFeeRate":null,"reserveBaseUsd":724238886.323986864597737,"reserveQuoteUsd":90747279.0551085714189219,"quoteTokenPriceUsd":2.47916030707421},"lastUpdated":"2025-08-26T09:16:51.7385369Z"},"TRIP":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19975.6639,"price":{"tokenAddress":"0xd3f9cc1955b05a6c18e115bd1749a9784a7c4b87","tokenName":"TRIP","tokenNetwork":"BSC","price":16.5463157023857,"liquidityUsd":26465867.4331,"volume24hUsd":8229.0886862892,"poolFeeRate":null,"reserveBaseUsd":437912597.88556084960514667,"reserveQuoteUsd":65827992.636704166157911333,"quoteTokenPriceUsd":2.48727886222143},"lastUpdated":"2025-08-26T09:16:51.9496859Z"},"INSURANCE":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19997.8572,"price":{"tokenAddress":"0x85cce3b0717b1ad14bf87b0130d2e58ece479ecb","tokenName":"INSURANCE","tokenNetwork":"BSC","price":94.2008931989036,"liquidityUsd":66059384.3877,"volume24hUsd":19257.1910065635,"poolFeeRate":null,"reserveBaseUsd":6222853013.49104758459732572,"reserveQuoteUsd":163736201.831964235587416688,"quoteTokenPriceUsd":2.47862136999344},"lastUpdated":"2025-08-26T09:16:51.7302532Z"},"CAR":{"fakeAddress":"0x770d44CF92625cf835D2919F98aE3Bbf8fBeA466","quantity":19987.3445,"price":{"tokenAddress":"0x73cf9558356b268507b8b1d1aaf752efc1cd1207","tokenName":"CAR","tokenNetwork":"BSC","price":23.6407395929052,"liquidityUsd":38289623.5122,"volume24hUsd":5940.1183759508,"poolFeeRate":null,"reserveBaseUsd":905195018.56230040222564344,"reserveQuoteUsd":94941917.554954760278817898,"quoteTokenPriceUsd":2.47957302386909},"lastUpdated":"2025-08-26T09:16:51.9497956Z"}}]}
// NotifyPaidOrder
// RegisterWallet