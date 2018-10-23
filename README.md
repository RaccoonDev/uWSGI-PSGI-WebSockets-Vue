# uWSGI-PSGI-WebSockets-Vue

That my playground repository to experiment with running Vue Front-End application with Dancer2, uWSGI, Nginx and WebSockets.

You can find here vagrant file and bunch of scripts to setup the environment, compile couple uWSGI binaries and prepare the services.

The main issue right now is that if websockets are used, Plack application will properly run under Twiggy server, but will close websocket immediately after processing handshake if you run it in uWSGI mode.

