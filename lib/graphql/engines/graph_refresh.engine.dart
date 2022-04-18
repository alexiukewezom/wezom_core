part of '../graph.core.dart';

class GraphRefreshEngine {
  final Future<String?> Function() getRefreshToken;
  final Future<AppResponse> Function() sendRefresh;
  GraphRefreshEngine({
    required this.getRefreshToken,
    required this.sendRefresh,
  });
}