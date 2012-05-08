
Http\_Error\_Log
================

A Ruby gem to turn an error log (eg Nginx error.log) into
Ruby data structures:

    2012/01/01 01:01:01 [error] 11563#0: *183 connect() failed (111: Connection refused) while connecting to upstream, client: 11.11.11.11, server: test.test.com, request: "GET /stylesheets/en-us/, , .css?time=1286211794 HTTP/1.1", upstream: "http://127.0.0.1:4567/test/en-us/Test-Page.css?time=1234.5678", host: "www.test.com", referrer: "http://www.test.com/"

    # ->
    [ { :created_at=>Time, :upstreatm=>String, ...} ]

Installation
------------

    gem install Http_Error_Log

Usage
------

    require "Http_Error_Log"
    
    Http_Error_Log "/my/nginx/error.log"
    # -->  [ Hash, Hash, Hash ]

Each Hash object has:

    :line        => 12   # Integer
    :created_at  => Time.parse(str)  # Time object.
    :backtrace   => [ "file:num:[error] 11563#0"] 
    :message     => "*183 connect() failed (111: Connection refused) while connecting to upstream"

Skip records using a date/time string:

    Http_Error_Log "err.log", '2012/04/04 04:04:04'
    
    # --> Skips records that are less OR equal to:
    #     '2012/04/04 04:04:04'

Run Tests
---------

    git clone git@github.com:da99/Http_Error_Log.git
    cd Http_Error_Log
    bundle update
    bundle exec bacon spec/lib/main.rb

"I hate writing."
-----------------------------

If you know of existing software that makes the above redundant,
please tell me. The last thing I want to do is maintain code.

