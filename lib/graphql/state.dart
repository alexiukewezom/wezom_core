part of 'graph.core.dart';

enum _RefreshTokenStatus { refreshing, ready, rotten }

class GraphCoreState {
  final _RefreshTokenStatus refreshTokenStatus;
  final Map<String, String> headers;
  final String baseUrl;
  final String? wsUrl;

  GraphCoreState({
    this.refreshTokenStatus = _RefreshTokenStatus.ready,
    required this.baseUrl,
    this.headers = const {},
    this.wsUrl,
  });

  GraphCoreState copyWith({
    _RefreshTokenStatus? refreshTokenStatus,
    Map<String, String>? headers,
    String? baseUrl,
    String? wsUrl,
  }) {
    return GraphCoreState(
      refreshTokenStatus: refreshTokenStatus ?? this.refreshTokenStatus,
      headers: headers ?? this.headers,
      baseUrl: baseUrl ?? this.baseUrl,
      wsUrl: wsUrl ?? this.wsUrl,
    );
  }
}
