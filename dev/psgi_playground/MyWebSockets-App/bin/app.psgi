#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use MyWebSockets::App;

use Plack::Builder;

builder {
  enable sub {
        my $app = shift;
        sub {
            my $env = shift;
            # do preprocessing
	    $env->{'psgi.nonblocking'}=1;
            my $res = $app->($env);
            # do postprocessing
            return $res;
        };
    };
  mount (MyWebSockets::App->websocket_mount );
  mount '/' => MyWebSockets::App->to_app;
}


=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use MyWebSockets::App;
use Plack::Builder;

builder {
    enable 'Deflater';
    MyWebSockets::App->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use MyWebSockets::App;
use MyWebSockets::App_admin;

use Plack::Builder;

builder {
    mount '/'      => MyWebSockets::App->to_app;
    mount '/admin'      => MyWebSockets::App_admin->to_app;
}

=end comment

=cut

