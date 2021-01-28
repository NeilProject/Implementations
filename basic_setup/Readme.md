# Basic Setup

This is a basic setup which should work in all Lua based engines as long as they have access to Lua's io library and all the file reading function the library provides.

It will basically read all Neil files from the current work directory whenever a "#use" clause if found.
This may not be the most ideal setup for all engines, especially not the ones who primarily use their own file systems, such as systems based on zip or JCR, but at least this is something that should otherwise always work.

