part of '../graph.core.dart';

class GraphWSEngine {
  final String wsUrl;
  final SocketClientConfig Function(dynamic initialPayload,
      {Function? onTokenInvalid}) wsConfig;

  GraphWSEngine({
    required this.wsUrl,
    SocketClientConfig Function(dynamic initialPayload,
            {Function? onTokenInvalid})?
        config,
  }) : wsConfig = config ?? _getConfig;

  static SocketClientConfig _getConfig(dynamic initialPayload,
      {Function? onTokenInvalid}) {
    return SocketClientConfig(
      inactivityTimeout: const Duration(minutes: 2),
      autoReconnect: false,
      connectFn: (url, protocols) => IOWebSocketChannel.connect(
        url,
        protocols: protocols,
      ).forGraphQL()
        ..stream.listen(
          (event) {
            try {
              final data = jsonDecode(event);
              if (data.containsKey('reason') &&
                  data['reason'] == 'Authorization token is invalid') {
                if (onTokenInvalid != null) onTokenInvalid();
              }
            } catch (err) {
              print('ChannelEvent: $event');
              print('ChannelError: $err');
            }
          },
        ),
      initialPayload: initialPayload,
    );
  }
}

