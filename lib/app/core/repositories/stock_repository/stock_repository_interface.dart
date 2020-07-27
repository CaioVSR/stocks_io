import 'package:web_socket_channel/web_socket_channel.dart';

abstract class IStockRepository {
  WebSocketChannel fetchStockStream();
}
