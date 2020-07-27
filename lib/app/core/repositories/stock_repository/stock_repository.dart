import 'package:stocks_io/app/core/repositories/stock_repository/stock_repository_interface.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StockRepository implements IStockRepository{
  @override
  WebSocketChannel fetchStockStream() {
    return IOWebSocketChannel.connect("ws://localhost:8080/quotes");
  }
}