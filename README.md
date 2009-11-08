Snarl
=====

Snarl is JavaScript in disguise, bridging Ruby and Rhino. JRuby required.

Copyright 2009, Jon Crosby. MIT Licensed.

Synopsis
--------

    context = Snarl::JavascriptContext.new
    context.eval("1+1") # => 2

    context.eval("var increment = function(i){ return i+1 };")
    context.eval("increment(3)") # => 4

    context.load("/path/to/js/lib.js") # allows use of lib.js

    context.put("foo", "bar")
    context.get("foo") # => "bar"

Testing
-------

Run "rake"
