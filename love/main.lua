-- <License Block>
-- love/main.lua
-- Neil Framework for Love2D
-- version: 21.01.28
-- Copyright (C) 2021 Jeroen P. Broks
-- This software is provided 'as-is', without any express or implied
-- warranty.  In no event will the authors be held liable for any damages
-- arising from the use of this software.
-- Permission is granted to anyone to use this software for any purpose,
-- including commercial applications, and to alter it and redistribute it
-- freely, subject to the following restrictions:
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software
-- in a product, an acknowledgment in the product documentation would be
-- appreciated but is not required.
-- 2. Altered source versions must be plainly marked as such, and must not be
-- misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
-- </License Block>


Neil = require "Neil"


local NG = Neil.Globals
local RealLove = love

local callbacks = {

   -- General
   "displayrotated", -- 	Called when the device display orientation changed. 	Added since 11.3 	
   "draw", -- 	Callback function used to draw on the screen every frame. 		
   "errhand", -- 	The error handler, used to display error messages. 		Deprecated in 11.0
   "errorhandler", -- 	The error handler, used to display error messages. 	Added since 11.0 	
   --"load", -- 	This function is called exactly once at the beginning of the game. 		
   "lowmemory", -- 	Callback function triggered when the system is running out of memory on mobile devices. 	Added since 0.10.0 	
   "quit", -- 	Callback function triggered when the game is closed. 	Added since 0.7.0 	
   --"run", -- 	The main function, containing the main loop. A sensible default is used when left out. 		
   "threaderror", -- 	Callback function triggered when a Thread encounters an error. 	Added since 0.9.0 	
   "update", -- 	Callback function used to update the state of the game every frame.
   
   -- Mouse
   "directorydropped", -- 	Callback function triggered when a directory is dragged and dropped onto the window. 	Added since 0.10.0 	
   "filedropped", -- 	Callback function triggered when a file is dragged and dropped onto the window. 	Added since 0.10.0 	
   "focus", -- 	Callback function triggered when window receives or loses focus. 	Added since 0.7.0 	
   "mousefocus", -- 	Callback function triggered when window receives or loses mouse focus. 	Added since 0.9.0 	
   "resize", -- 	Called when the window is resized. 	Added since 0.9.0 	
   "visible", -- 	Callback function triggered when window is shown or hidden. 	Added since 0.9.0 	

   -- Keyboard
   "keypressed 	", -- Callback function triggered when a key is pressed. 		
   "keyreleased 	", -- Callback function triggered when a keyboard key is released. 		
   "textedited 	", -- Called when the candidate text for an IME has changed. 	Added since 0.10.0 	
   "textinput 	", -- Called when text has been entered by the user. 	Added since 0.9.0 	
   
   -- Mouse
   "mousemoved 	", -- Callback function triggered when the mouse is moved. 	Added since 0.9.2 	
   "mousepressed 	", -- Callback function triggered when a mouse button is pressed. 		
   "mousereleased 	", -- Callback function triggered when a mouse button is released. 		
   "wheelmoved 	", -- Callback function triggered when the mouse wheel is moved. 	Added since 0.10.0 	
   
   -- Joystick
   "gamepadaxis 	", -- Called when a Joystick's virtual gamepad axis is moved. 	Added since 0.9.0 	
   "gamepadpressed 	", -- Called when a Joystick's virtual gamepad button is pressed. 	Added since 0.9.0 	
   "gamepadreleased 	", -- Called when a Joystick's virtual gamepad button is released. 	Added since 0.9.0 	
   "joystickadded 	", -- Called when a Joystick is connected. 	Added since 0.9.0 	
   "joystickaxis 	", -- Called when a joystick axis moves. 	Added since 0.9.0 	
   "joystickhat 	", -- Called when a joystick hat direction changes. 	Added since 0.9.0 	
   "joystickpressed 	", -- Called when a joystick button is pressed. 		
   "joystickreleased 	", -- Called when a joystick button is released. 		
   "joystickremoved 	", -- Called when a Joystick is disconnected. 	Added since 0.9.0 	

   -- Touch
   "touchmoved 	", -- Callback function triggered when a touch press moves inside the touch screen. 	Added since 0.10.0 	
   "touchpressed 	", -- Callback function triggered when the touch screen is touched. 	Added since 0.10.0 	
   "touchreleased 	"} -- Callback function triggered when the touch screen stops being touched. 	Added since 0.10.0 	
   
local cbm = {}
for k,v in pairs(RealLove) do cbm[v] = v end
for _,v in ipairs(callbacks) do cbm[v] = "NLC" end

local NL_Meta = {}

local function Empty() end
function NL_Meta.__index(s,key)
	-- error("NL_Meta_Debug_ForceCrash:"..key.." >> "..type(RealLove[key]).." cbm:"..cbm[key])
	if not NG.GlobalExists("Love_CallBack") then 
		love.graphics.print("No Love_CallBack",0,0)-- debug only
		return nil 
	end
	if key:upper()=="REALLOVE" then return RealLove end
	if cbm[key] == "NLC" then		
		if key=="run" then
			if not NG.Love_CallBack[".hasmember"]("run") then return RealLove.run end
		else
			-- error("MLC - Force Crash: "..key.." >> "..tostring(NG.Love_CallBack[".hasmember"](key)))
			if NG.Love_CallBack[".hasmember"](key) then 
				-- error("Create callback >> "..key.." >> "..type(NG.Love_CallBack[key] ))
				return NG.Love_CallBack[key] 
			end
			return Empty
		end
	end
	-- error("Nothing")
	return RealLove[key]
end

function NL_Meta.__newindex(s,key,value)
	error("For safety reasons the \"LOVE\" library has been made read-only. Use Love.RealLove")
end


-- Neil.Load("const global var love = Lua.love","Love definition")

function Neil.FileExists(f)
	if love.filesystem.getInfo then
		local ret = love.filesystem.getInfo(f)
		if ret then
			return ret.type=="file" -- SymLinks are for security reasons not supported
		end
	else
		return love.filesystem.exists(f)
	end
end

function Neil.DirExists(f)
	if love.filesystem.getInfo then
		local ret = love.filesystem.getInfo(f)
		if ret then
			return ret.type=="directory" -- SymLinks are for security reasons not supported
		end
	else
		return false -- Unfortunately this will require all bundles to use Love 11.0 or higher 
	end
end

function Neil.ReadFile(f)
	local contents, size = love.filesystem.read( f )
	return contents
end

function Neil.ReadDir(f)
	local d = love.filesystem.getDirectoryItems(f)
	table.sort(d)
	-- I do not know if love does prefix the directory itself to the items (which is essential for Neil) if not that will need to be added
	return d
end



local mlove = setmetatable({},NL_Meta)
function love.load()
	--error("Force crash! (debug)")
	for _,v in ipairs(callbacks) do 
		if v~="load" and v~="run" then
			-- love[v] = mlove[v] 
			if NG.Love_CallBack[".hasmember"](v) then love[v] = NG.Love_CallBack[v] end
		end
	end
	-- if mlove.load then mlove.load() end
	if NG.Love_CallBack[".hasmember"]("load") then NG.Love_CallBack.load() end
end

function love.draw() --[[debug]] local x,y=0,0 for k,v in NG.SPairs(love) do love.graphics.print(type(v).." "..k,x,y) y = y + 20 if y>=600 then y=0 x=x+200 end end end
-- function love.draw() --[[debug]] love.graphics.print(tostring(NG.GlobalExists("Love_Callback"))..":"..tostring(NG.Love_CallBack)..":"..tostring(NG.Love_CallBack.Update)..":"..tostring(NG.Love_CallBack[".hasmember"]("Update"))..":mlove.update>"..tostring(mlove.update)..":love.update>"..tostring(love.update)) end

Neil.Use("love_main")