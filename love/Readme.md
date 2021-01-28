# Neil FrameWork for Love


Quick guide to use it.

This framework should get you on the move if you intend to use Neil with the love engine.
It has been designed to convert all Love callbacks to Neil. You should put this main.lua along with Neil.lua in your main directory, and not touch both files at all anymore.
Now for security reasons "love.run" cannot be replaced this way, this because this is a core feature in Love, and should only be replaced if you really know what you are doing, and how the core of Lua works, and even then it can best be done in pure Lua anyway, but it's your call.

The new main file will now be "love_main", now all callbacks love uses by default must be in the group "Love_Callbacks", and serve the same function as they normally would in Love.
Now I do recommend to to give types to paramters, and callback functions returning values can best be declared as "var", so don't declare "bool Quit()" but "var Quit()", even though "love.quit" would only return a boolean value. 

Now every file you use should be prefixed with "import love" in order to make Neil know about love's existence. After that all functions "love" provides are just callable the same way you are always used to do it.


The "love_main.neil" you see in this folder was just a model I used for testing, and since it also demonstrates a bit how this works, I kept it.

Since I am no longer active in the Love community (and not much chance I will), I will not be aware of updates that may cause Neil not to work properly anymore with newer versions, so if there are, use my issue tracker to let me know.

