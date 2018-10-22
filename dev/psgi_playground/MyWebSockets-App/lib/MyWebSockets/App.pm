package MyWebSockets::App;
use Dancer2;

our $VERSION = '0.1';

use Dancer2::Plugin::WebSocket;
 
websocket_on_message sub {
  my( $conn, $message ) = @_;
  $conn->send( $message . ' world!' );
};
 
get '/' => sub {
  my $ws_url = websocket_url;
  return <<"END";
    <html>
      <head><script>
          var urlMySocket = "$ws_url";
 
          var mySocket = new WebSocket(urlMySocket);
 
          mySocket.onmessage = function (evt) {
            console.log( "Got message " + evt.data );
          };
 
          mySocket.onopen = function(evt) {
            console.log("opening");
            setTimeout( function() {
              mySocket.send('hello'); }, 2000 );
          };
 
    </script></head>
    <body><h1>WebSocket client</h1></body>
  </html>
END
};

true;
