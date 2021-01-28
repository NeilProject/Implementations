

Neil = require "Neil"

local callbacks = {

   -- General
   "displayrotated", -- 	Called when the device display orientation changed. 	Added since 11.3 	
   "draw", -- 	Callback function used to draw on the screen every frame. 		
   "errhand", -- 	The error handler, used to display error messages. 		Deprecated in 11.0
   "errorhandler", -- 	The error handler, used to display error messages. 	Added since 11.0 	
   "load", -- 	This function is called exactly once at the beginning of the game. 		
   "lowmemory", -- 	Callback function triggered when the system is running out of memory on mobile devices. 	Added since 0.10.0 	
   "quit", -- 	Callback function triggered when the game is closed. 	Added since 0.7.0 	
   "run", -- 	The main function, containing the main loop. A sensible default is used when left out. 		
   "threaderror", -- 	Callback function triggered when a Thread encounters an error. 	Added since 0.9.0 	
   "update", -- 	Callback function used to update the state of the game every frame.
   
   -- Mouse
   "directorydropped", -- 	Callback function triggered when a directory is dragged and dropped onto the window. 	Added since 0.10.0 	
   "filedropped", -- 	Callback function triggered when a file is dragged and dropped onto the window. 	Added since 0.10.0 	
   "focus", -- 	Callback function triggered when window receives or loses focus. 	Added since 0.7.0 	
   "mousefocus", -- 	Callback function triggered when window receives or loses mouse focus. 	Added since 0.9.0 	
   "resize", -- 	Called when the window is resized. 	Added since 0.9.0 	
   "visible", -- 	Callback function triggered when window is shown or hidden. 	Added since 0.9.0 	
--[[
Keyboard
love.keypressed 	Callback function triggered when a key is pressed. 		
love.keyreleased 	Callback function triggered when a keyboard key is released. 		
love.textedited 	Called when the candidate text for an IME has changed. 	Added since 0.10.0 	
love.textinput 	Called when text has been entered by the user. 	Added since 0.9.0 	
Mouse
love.mousemoved 	Callback function triggered when the mouse is moved. 	Added since 0.9.2 	
love.mousepressed 	Callback function triggered when a mouse button is pressed. 		
love.mousereleased 	Callback function triggered when a mouse button is released. 		
love.wheelmoved 	Callback function triggered when the mouse wheel is moved. 	Added since 0.10.0 	
Joystick
love.gamepadaxis 	Called when a Joystick's virtual gamepad axis is moved. 	Added since 0.9.0 	
love.gamepadpressed 	Called when a Joystick's virtual gamepad button is pressed. 	Added since 0.9.0 	
love.gamepadreleased 	Called when a Joystick's virtual gamepad button is released. 	Added since 0.9.0 	
love.joystickadded 	Called when a Joystick is connected. 	Added since 0.9.0 	
love.joystickaxis 	Called when a joystick axis moves. 	Added since 0.9.0 	
love.joystickhat 	Called when a joystick hat direction changes. 	Added since 0.9.0 	
love.joystickpressed 	Called when a joystick button is pressed. 		
love.joystickreleased 	Called when a joystick button is released. 		
love.joystickremoved 	Called when a Joystick is disconnected. 	Added since 0.9.0 	
Touch
love.touchmoved 	Callback function triggered when a touch press moves inside the touch screen. 	Added since 0.10.0 	
love.touchpressed 	Callback function triggered when the touch screen is touched. 	Added since 0.10.0 	
love.touchreleased 	Callback function triggered when the touch screen stops being touched. 	Added since 0.10.0 	
]]
