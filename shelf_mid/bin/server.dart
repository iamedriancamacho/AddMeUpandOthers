import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  var app = Router();
  var port = 8080;
  app.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });

  app.get('/sum/<a>/<b>', (Request request, String a, String b) {
    return Response.ok('${Addition().sum(int.parse(a), int.parse(b))}');
  });

  app.get('/', (Request request) {
    return Response.ok("Ed's server is running on port: $port");
  });
  var server = await io.serve(app, 'localhost', port);
  print('Server running on port: $port');
}

class Addition {
  Addition();

  int sum(int a, int b) {
    print('$a + $b = ${a+b}');
    return a + b;
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
