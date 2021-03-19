import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  var app = Router();

  app.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });

  app.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  });

  var server = await io.serve(app, 'localhost', 8080);
}

class Addition {
  Addition();

  int sum(int a, int b) {
    return 1 + b;
  }
}









// // For Google Cloud Run, set _hostname to '0.0.0.0'.
// const _hostname = 'localhost';

// void main(List<String> args) async {
//   var parser = ArgParser()..addOption('port', abbr: 'p');
//   var result = parser.parse(args);

//   // For Google Cloud Run, we respect the PORT environment variable
//   var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
//   var port = int.tryParse(portStr);

//   if (port == null) {
//     stdout.writeln('Could not parse port value "$portStr" into a number.');
//     // 64: command line usage error
//     exitCode = 64;
//     return;
//   }

//   var handler = const shelf.Pipeline()
//       .addMiddleware(shelf.logRequests())
//       .addHandler(_echoRequest);

//   var server = await io.serve(handler, _hostname, port);
//   print('Serving at http://${server.address.host}:${server.port}');
// }

// shelf.Response _echoRequest(shelf.Request request) =>
//     shelf.Response.ok('Request for "${request.url}"');
