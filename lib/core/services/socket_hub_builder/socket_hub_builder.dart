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
    final headers = Env.authHeaders();

    final hub = WebSocket(
      Uri.parse('$uri?access_token=$token'),
      headers: {
        'ApplicationId': Env.applicationId,
        ...headers,
      },
    );

    await hub.connection.firstWhere((e) => e is Connected);
    hub.send('{"protocol":"json","version":1}');

    return hub;
  }
}
