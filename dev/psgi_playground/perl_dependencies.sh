#!/bin/bash

cpan install App::cpanminus
cpanm Dancer2
cpanm Coro
cpanm Async::Interrupt
cpanm Dancer2::Plugin::WebSocket
