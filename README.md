
Http\_Error\_Log
================

A Ruby gem to turn an error log (eg Nginx error.log) into
a Ruby data structure.

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

