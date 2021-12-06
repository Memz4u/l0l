-- "addons\\wiremod\\lua\\wire\\client\\e2descriptions.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if not E2Helper then return end

local name, short, type, typeid
timer.Simple(0.1, function()
	for k, v in pairs( wire_expression_types ) do
		if k == "NORMAL" then k = "NUMBER" end

		name = k:sub(1,1) .. k:sub(2):lower()
		short = name:Left(3)
		type = name:lower()
		typeid = v[1]
		-- tables
		E2Helper.Descriptions["insert"..name.."(t:n"..typeid..")"] = "Inserts the variable at the specified position. Moves all other indexes up one step to compensate"
		E2Helper.Descriptions["remove"..name.."(t:n)"] = "Removes the variable at the specified numerical index, with the specified type, and returns it. All sequential keys will be moved down to fill the gap"
		E2Helper.Descriptions["remove"..name.."(t:s)"] = "Removes the variable at the specified string index, with the specified type, and returns it"
		E2Helper.Descriptions["pop"..name.."(t:)"] = "Removes and returns the last variable"
		E2Helper.Descriptions["push"..name.."(t:"..typeid..")"] = "Adds the variable to the end of the table"
		E2Helper.Descriptions["unshift"..name.."(t:"..typeid..")"] = "Adds the data to the beginning of the table. Will move all other entries up one step to compensate"
		-- arrays
		E2Helper.Descriptions["insert"..name.."(r:n"..typeid..")"] = "Inserts the variable at the specified position. Moves all other indexes up one step to compensate"
		E2Helper.Descriptions["set"..name.."(r:n"..typeid..")"] = "Sets a variable at specified index. Deprecated, use R[N,"..type.."] = X instead"
		E2Helper.Descriptions[type.."(r:n)"] = "Returns the "..type.." stored in the array under specified index. Deprecated, use R[N,"..type.."] instead"
		E2Helper.Descriptions["pop"..name.."(r:)"] = "Deletes and returns the last entry in the array. Be sure not to use popNumber() on a vector or similar, as the data may be lost"
		E2Helper.Descriptions["push"..name.."(r:"..typeid..")"] = "Saves the data at the end of the array"
		E2Helper.Descriptions["unshift"..name.."(r:"..typeid..")"] = "Adds the data to the beginning of the array. Will move all other entries up one address"
		E2Helper.Descriptions["shift"..name.."(r:)"] = "Deletes and returns the first element of the array, moving other entries down one address to compensate"
		E2Helper.Descriptions["remove"..name.."(r:n)"] = "Deletes and returns the specified entry, moving subsequent entries down to compensate"
		-- gvars
		E2Helper.Descriptions["gRemoveAll"..name.."s()"] = "Removes all variables of the "..type.." type in your non-shared table"
		E2Helper.Descriptions["gRemoveAll"..name.."s(s)"] = "Removes all variables of the "..type.." type in your non-shared table in group S"
		E2Helper.Descriptions["gDeleteAll"..short.."()"] = "Exactly the same as gRemoveAll"..name.."s(S) (Except it removes in the group set by gSetGroup instead of using the group as an argument)"
		E2Helper.Descriptions["gDelete"..short.."(s)"] = "Removes and returns the variable of the "..type.." type at the index S in the current group"
		E2Helper.Descriptions["gDelete"..short.."(n)"] = "Exactly the same as gDelete"..short.."(N:toString())"
		E2Helper.Descriptions["gGet"..short.."(s)"] = "Gets a variable of the "..type.." type from index S in the current group"
		E2Helper.Descriptions["gGet"..short.."(n)"] = "Exactly the same as gGet"..short.."(N:toString())"
		E2Helper.Descriptions["gSet"..short.."(s"..typeid..")"] = "Sets a variable of the "..type.." type at index S in the current group"
		E2Helper.Descriptions["gSet"..short.."(n"..typeid..")"] = "Exactly the same as gSet"..short.."(N:toString(),"..type..")"
		E2Helper.Descriptions["remove"..name.."(xgt:s)"] = "Removes and returns the variable of the "..type.." type at the index S"
		-- self-aware
		E2Helper.Descriptions["ioGetInput"..name.."(s)"] = "Get the value of the input S of the E2"
		E2Helper.Descriptions["ioSetOutput(s"..typeid..")"] = "Trigger the output S of the E2 with the "..type.." value"
		E2Helper.Descriptions["select(n"..typeid.."...)"] = "Returns the Nth value given after the index, "..type.."'s zero element otherwise. If you mix types, the behaviour is undefined"
		-- datasignals
		E2Helper.Descriptions["dsGet"..name.."()"] = "Returns the received "..type
		-- wirelink
		E2Helper.Descriptions[type.."(xwl:s)"] = "Returns the "..type.." from the specified address of linked component. Deprecated, use XWL[S,"..type.."] instead"
		E2Helper.Descriptions["set"..name.."(xwl:s"..typeid..")"] = "Sets the component's input of the specified name equal to specified "..type..". Deprecated, use XWL[S,"..type.."] = X instead"
	end
end)

-- Number
E2Helper.Descriptions["finite(n)"] = "Returns 1 if given value is a finite number; otherwise 0."
E2Helper.Descriptions["isinf(n)"] = "Returns 1 if given value is a positive infinity or -1 if given value is a negative infinity; otherwise 0."
E2Helper.Descriptions["isnan(n)"] = "Returns 1 if given value is not a number (NaN); otherwise 0."
E2Helper.Descriptions["inf()"] = "Returns a huge constant (infinity)"
E2Helper.Descriptions["mod(nn)"] = "Modulo, returns the Remainder after Argument 1 has been divided by Argument 2. Note \"mod(-1, 3) = -1\""
E2Helper.Descriptions["sqrt(n)"] = "Returns the Square Root of the Argument"
E2Helper.Descriptions["cbrt(n)"] = "Returns the Cube Root of the Argument"
E2Helper.Descriptions["root(nn)"] = "Returns the Nth Root of the first Argument"
E2Helper.Descriptions["e()"] = "Returns Euler's Constant"
E2Helper.Descriptions["frexp(n)"] = "Returns the mantissa and exponent of the given floating-point number as a vector2 (X component holds a mantissa, and Y component holds an exponent)"
E2Helper.Descriptions["exp(n)"] = "Returns e to the power of the Argument (same as e()^N but shorter and faster this way)"
E2Helper.Descriptions["ln(n)"] = "Returns the logarithm to base e of the Argument"
E2Helper.Descriptions["log2(n)"] = "Returns the logarithm to base 2 of the Argument"
E2Helper.Descriptions["log10(n)"] = "Returns the logarithm to base 10 of the Argument"
E2Helper.Descriptions["log(nn)"] = "Returns the logarithm to base Argument 2 of Argument 1"
E2Helper.Descriptions["abs(n)"] = "Returns the Magnitude of the Argument"
E2Helper.Descriptions["ceil(n)"] = "Rounds the Argument up to the nearest Integer"
E2Helper.Descriptions["ceil(nn)"] = "Rounds Argument 1 up to Argument 2's decimal precision"
E2Helper.Descriptions["floor(n)"] = "Rounds the Argument down to the nearest Integer"
E2Helper.Descriptions["floor(nn)"] = "Rounds Argument 1 down to Argument 2's decimal precision"
E2Helper.Descriptions["round(n)"] = "Rounds the Argument to the nearest Integer"
E2Helper.Descriptions["round(nn)"] = "Rounds Argument 1 to Argument 2's decimal precision"
E2Helper.Descriptions["int(n)"] = "Returns the Integer part of the Argument (always rounds towards zero)"
E2Helper.Descriptions["frac(n)"] = "Returns the Fractional part (decimal places) of the Argument"
E2Helper.Descriptions["clamp(nnn)"] = "If Arg1 = Arg3 (max) returns Arg3; otherwise returns Arg1"
E2Helper.Descriptions["inrange(nnn)"] = "Returns 1 if N is in the interval [N2; N3], 0 otherwise. This means it is equivalent to ((N2 <= N) & (N <= N3))"
E2Helper.Descriptions["sign(n)"] = "Returns the sign of argument (-1,0,1) [sign(N) = N / abs(N) ]"
E2Helper.Descriptions["min(nn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["min(nnn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["min(nnnn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["max(nn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["max(nnn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["max(nnnn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["random()"] = "Returns a random floating-point number between 0 and 1 [0 <= x < 1 ]"
E2Helper.Descriptions["random(n)"] = "Returns a random floating-point number between 0 and the specified value [0 <= x < a ]"
E2Helper.Descriptions["random(nn)"] = "Returns a random floating-point number between the specified interval [a <= x < b ]"
E2Helper.Descriptions["randint(n)"] = "Returns a random integer from 1 to the specified value [1 <= x <= a ]"
E2Helper.Descriptions["randint(nn)"] = "Returns a random integer in the specified interval [a <= x <= b ]"
E2Helper.Descriptions["pi()"] = "Returns the constant PI"
E2Helper.Descriptions["toRad(n)"] = "Converts Degree angles to Radian angles"
E2Helper.Descriptions["toDeg(n)"] = "Converts Radian angles to Degree angles"
E2Helper.Descriptions["sin(n)"] = "Returns the sine of N degrees"
E2Helper.Descriptions["cos(n)"] = "Returns the cosine of N degrees"
E2Helper.Descriptions["tan(n)"] = "Returns the tangent of N degrees"
E2Helper.Descriptions["cot(n)"] = "Returns the cotangent of N degrees"
E2Helper.Descriptions["sec(n)"] = "Returns the secant of N degrees"
E2Helper.Descriptions["csc(n)"] = "Returns the cosecant of N degrees"
E2Helper.Descriptions["asin(n)"] = "Returns the inverse sine of the argument, in degrees"
E2Helper.Descriptions["acos(n)"] = "Returns the inverse cosine of the argument, in degrees"
E2Helper.Descriptions["atan(n)"] = "Returns the inverse tangent of the argument, in degrees"
E2Helper.Descriptions["atan(nn)"] = "Returns the inverse tangent of the arguments (arg1 / arg2), in degrees. This function accounts for positive/negative arguments, and arguments at or close to 0"
E2Helper.Descriptions["sinh(n)"] = "Returns the hyperbolic sine of N degrees"
E2Helper.Descriptions["cosh(n)"] = "Returns the hyperbolic cosine of N degrees"
E2Helper.Descriptions["tanh(n)"] = "Returns the hyperbolic tangent of N degrees"
E2Helper.Descriptions["coth(n)"] = "Returns the hyperbolic cotangent of N degrees"
E2Helper.Descriptions["sech(n)"] = "Returns the hyperbolic secant of N degrees"
E2Helper.Descriptions["csch(n)"] = "Returns the hyperbolic cosecant of N degrees"
E2Helper.Descriptions["sinr(n)"] = "Returns the sine of N radians"
E2Helper.Descriptions["cosr(n)"] = "Returns the cosine of N radians"
E2Helper.Descriptions["tanr(n)"] = "Returns the tangent of N radians"
E2Helper.Descriptions["cotr(n)"] = "Returns the cotangent of N radians"
E2Helper.Descriptions["secr(n)"] = "Returns the secant of N radians"
E2Helper.Descriptions["cscr(n)"] = "Returns the cosecant of N radians"
E2Helper.Descriptions["sinhr(n)"] = "Returns the hyperbolic sine of N radians"
E2Helper.Descriptions["coshr(n)"] = "Returns the hyperbolic cosine of N radians"
E2Helper.Descriptions["tanhr(n)"] = "Returns the hyperbolic tangent of N radians"
E2Helper.Descriptions["cothr(n)"] = "Returns the hyperbolic cotangent of N radians"
E2Helper.Descriptions["sechr(n)"] = "Returns the hyperbolic secant of N radians"
E2Helper.Descriptions["cschr(n)"] = "Returns the hyperbolic cosecant of N radians"
E2Helper.Descriptions["asinr(n)"] = "Returns the inverse sine of the argument, in radians"
E2Helper.Descriptions["acosr(n)"] = "Returns the inverse cosine of the argument, in radians"
E2Helper.Descriptions["atanr(n)"] = "Returns the inverse tangent of the argument, in radians"
E2Helper.Descriptions["atanr(nn)"] = "Returns the inverse tangent of the arguments (arg1 / arg2), in radians. This function accounts for positive/negative arguments, and arguments at or close to 0"
E2Helper.Descriptions["airDensity()"] = "Returns air density (affects how drag slows down props)"
E2Helper.Descriptions["speedLimit()"] = "Returns the speed limit"
E2Helper.Descriptions["angSpeedLimit()"] = "Returns the angular speed limit"
E2Helper.Descriptions["bearing(vav)"] = "Gets the bearing from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["elevation(vav)"] = "Gets the elevation from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["heading(vav)"] = "Gets the elevation and bearing from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["changed"] = "Checks if the value or variable was changed. Accepts any type except table and array"
E2Helper.Descriptions["wrap(nn)"] = "Performs (n1 + n2) % (n2 * 2) - n2"

-- String
E2Helper.Descriptions["index(s:n)"] = "Returns Nth letter of the string, formatted as a string"
E2Helper.Descriptions["length(s:)"] = "Returns the length of the string"
E2Helper.Descriptions["unicodeLength(s:)"] = "Returns the unicode length of the string"
E2Helper.Descriptions["upper(s:)"] = "All characters are made uppercase"
E2Helper.Descriptions["lower(s:)"] = "All characters are made lowercase"
E2Helper.Descriptions["sub(s:n)"] = "Returns a substring, starting at the number argument and ending at the end of the string"
E2Helper.Descriptions["sub(s:nn)"] = "Returns a substring, starting at the first number argument and ending at the second"
E2Helper.Descriptions["left(s:n)"] = "Returns N amount of characters starting from the leftmost character"
E2Helper.Descriptions["right(s:n)"] = "Returns N amount of characters starting from the rightmost character"
E2Helper.Descriptions["find(s:s)"] = "Returns the 1st occurrence of the string S, returns 0 if not found"
E2Helper.Descriptions["find(s:sn)"] = "Returns the 1st occurrence of the string S starting at N and going to the end of the string, returns 0 if not found"
E2Helper.Descriptions["findRE(s:s)"] = "Returns the 1st occurrence of the string S using REGEX functions, returns 0 if not found"
E2Helper.Descriptions["findRE(s:sn)"] = "Returns the 1st occurrence of the string S starting at N and going to the end of the string using REGEX functions, returns 0 if not found"
E2Helper.Descriptions["explode(s:s)"] = "Splits the string into an array, along the boundaries formed by the string S. See also String.Explode"
E2Helper.Descriptions["explodeRE(s:s)"] = "Splits the string into an array, along the boundaries formed by the string pattern S. See also String.Explode"
E2Helper.Descriptions["repeat(s:n)"] = "Repeats the input string N times"
E2Helper.Descriptions["trim(s:)"] = "Trims away spaces at the beginning and end of a string"
E2Helper.Descriptions["trimLeft(s:)"] = "Trims away opening spaces on the string"
E2Helper.Descriptions["trimRight(s:)"] = "Trims away spaces at the end of a string"
E2Helper.Descriptions["replace(s:ss)"] = "Finds and replaces every occurrence of the first argument with the second argument"
E2Helper.Descriptions["replaceRE(s:ss)"] = "Finds and replaces every occurrence of the first argument using REGEX with the second argument"
E2Helper.Descriptions["reverse(s:)"] = "Returns a reversed version of S"
E2Helper.Descriptions["toNumber(s:)"] = "Parses a number from a string"
E2Helper.Descriptions["toNumber(s:n)"] = "Parses a number from a string. The argument given is the base. I.e. toNumber(16) will parse hex"
E2Helper.Descriptions["toString(n:)"] = "Formats a number as a string. (Numbers may be concatenated into a string without using this function)"
E2Helper.Descriptions["toString(n)"] = "Formats a number as a string. (Numbers may be concatenated into a string without using this function)"
E2Helper.Descriptions["toString(n:n)"] = "Formats a number as a string, using argument 2 as the base. i.e. using 16 for base would convert the number to hex"
E2Helper.Descriptions["toString(nn)"] = "Formats a number as a string, using argument 2 as the base. i.e. using 16 for base would convert the number to hex"
E2Helper.Descriptions["toChar(n)"] = "Returns a one-character string from it's ASCII code, where 32 = argument 1 = 255. An empty string is returned for numbers outside that range"
E2Helper.Descriptions["toUnicodeChar(n)"] = "Returns a one-character string from it's UNICODE code"
E2Helper.Descriptions["toByte(s)"] = "Returns the ASCII code of the 1st character in the string"
E2Helper.Descriptions["toUnicodeByte(s)"] = "Returns the Unicode code of the 1st character in the string"
E2Helper.Descriptions["toByte(sn)"] = "Returns the ASCII code of the Nth character in the string"
E2Helper.Descriptions["format(s...)"] = "Formats a values exactly like Lua's [http://www.lua.org/manual/5.1/manual.html#pdf-string.format string.format]. Any number and type of parameter can be passed through the \"...\". Prints errors to the chat area"
E2Helper.Descriptions["match(s:s)"] = "runs string.match(S, S2) and returns the sub-captures as an array"
E2Helper.Descriptions["match(s:sn)"] = "runs string.match(S, S2, N) and returns the sub-captures as an array"
E2Helper.Descriptions["matchFirst(s:s)"] = "runs string.match(S, S2) and returns the first match or an empty string if the match failed"
E2Helper.Descriptions["matchFirst(s:sn)"] = "runs string.match(S, S2, N) and returns the first match or an empty string if the match failed"
E2Helper.Descriptions["gmatch(s:s)"] = "runs string.gmatch(S, S2) and returns the captures in arrays in a table"
E2Helper.Descriptions["gmatch(s:sn)"] = "runs string.gmatch(S, S2, N) and returns the captures in arrays in a table"

-- Entity/Player
E2Helper.Descriptions["entity(n)"] = "Gets the entity associated with the id"
E2Helper.Descriptions["owner()"] = "Gets the owner of the expression ( same as entity():owner() )"
E2Helper.Descriptions["id(e:)"] = "Gets the numeric id of an entity"
E2Helper.Descriptions["noentity()"] = "Returns an invalid entity"
E2Helper.Descriptions["world()"] = "Returns the world entity"
E2Helper.Descriptions["sunDirection()"] = "Returns the vector direction that points towards the sun"
E2Helper.Descriptions["type(e:)"] = "Gets the class of an entity"
E2Helper.Descriptions["model(e:)"] = "Gets the model of an entity"
E2Helper.Descriptions["keyvalues(e:)"] = "Returns the keyvalue table of an entity"
E2Helper.Descriptions["owner(e:)"] = "Gets the owner of an entity"
E2Helper.Descriptions["name(e:)"] = "Gets the name of a player"
E2Helper.Descriptions["steamID(e:)"] = "Gets the steam ID of the player"
E2Helper.Descriptions["steamID64(e:)"] = "Gets the Steam Community ID (aka Steam64) of the given player"
E2Helper.Descriptions["isSteamFriend(e:e)"] = "Returns if the given Entity is a steam friend of the first Entity"
E2Helper.Descriptions["steamFriends(e:)"] = "Returns a Array with E's steam friends on the server E is playing on"
E2Helper.Descriptions["pos(e:)"] = "Gets the position of the entity"
E2Helper.Descriptions["eye(e:)"] = "Gets a players view direction else entity forward direction"
E2Helper.Descriptions["eyeAngles(e:)"] = "Gets a players view direction"
E2Helper.Descriptions["eyeTrace(e:)"] = "Performs a quick trace from the player's eye. Equivalent to rangerOffset(16384, E:shootPos(), E:eye()), but faster. Does not respect filters or ranger flags"
E2Helper.Descriptions["eyeTraceCursor(e:)"] = "Same as eyeTrace, except it also works when the player (for example) is holding down C"
E2Helper.Descriptions["shootPos(e:)"] = "Returns a players shoot position"
E2Helper.Descriptions["aimEntity(e:)"] = "Returns the entity that the entity is aiming at"
E2Helper.Descriptions["aimBone(e:)"] = "Returns the bone the player is currently aiming at"
E2Helper.Descriptions["aimPos(e:)"] = "Returns the point that the entity is looking at"
E2Helper.Descriptions["aimNormal(e:)"] = "Returns a normalized directional vector perpendicular to the surface pointed at"
E2Helper.Descriptions["frags(e:)"] = "Returns the number of kills the player has made"
E2Helper.Descriptions["deaths(e:)"] = "Returns the number of times the player died"
E2Helper.Descriptions["team(e:)"] = "Returns the team number a player is on"
E2Helper.Descriptions["teamName(n)"] = "Returns the name of the team associated with the team number"
E2Helper.Descriptions["teamName(n:)"] = "Returns the name of the team associated with the team number"
E2Helper.Descriptions["teamColor(n)"] = "Returns the color of the team associated with the team number"
E2Helper.Descriptions["teamDeaths(n)"] = "Returns the number of deaths of the team associated with the team number"
E2Helper.Descriptions["teamDeaths(n:)"] = "Returns the number of deaths of the team associated with the team number"
E2Helper.Descriptions["teamFrags(n)"] = "Returns the number of kills of the team associated with the team number"
E2Helper.Descriptions["teamFrags(n:)"] = "Returns the number of kills of the team associated with the team number"
E2Helper.Descriptions["teamPlayers(n)"] = "Returns the number of players of the team associated with the team number"
E2Helper.Descriptions["teamPlayers(n:)"] = "Returns the number of players of the team associated with the team number"
E2Helper.Descriptions["teamScore(n)"] = "Returns the score of the team associated with the team number"
E2Helper.Descriptions["teamScore(n:)"] = "Returns the score of the team associated with the team number"
E2Helper.Descriptions["teams()"] = "Returns an array of all teams"
E2Helper.Descriptions["forward(e:)"] = "Gets the forward direction of the entity 2)"
E2Helper.Descriptions["right(e:)"] = "Gets the right direction of the entity"
E2Helper.Descriptions["up(e:)"] = "Gets the up direction of the entity"
E2Helper.Descriptions["vel(e:)"] = "Gets the velocity of the entity"
E2Helper.Descriptions["velL(e:)"] = "Gets the local velocity of the entity"
E2Helper.Descriptions["boxCenter(e:)"] = "Gets the center of the entity's bounding box, as a local position vector"
E2Helper.Descriptions["boxMax(e:)"] = "Gets the maximum local XYZ of the entity's bounding box (the \"highest\" corner), as a local position vector"
E2Helper.Descriptions["boxMin(e:)"] = "Gets the minimum local XYZ of the entity's bounding box (the \"lowest\" corner), as a local position vector"
E2Helper.Descriptions["boxSize(e:)"] = "Gets the dimensions of the entity's bounding box as a vector (length, width, height)"
E2Helper.Descriptions["toWorld(e:v)"] = "Transforms from a vector local to E to a world vector"
E2Helper.Descriptions["toLocal(e:v)"] = "Transforms from a world vector to a vector local to E"
E2Helper.Descriptions["toWorld(e:a)"] = "Transforms from an angle local to E to a world angle"
E2Helper.Descriptions["toLocal(e:a)"] = "Transforms from a world angle to an angle local to E"
E2Helper.Descriptions["toWorldAxis(e:v)"] = "Transforms an axis local to E to a global axis"
E2Helper.Descriptions["toLocalAxis(e:v)"] = "Transforms a world axis to an axis local to E"
E2Helper.Descriptions["angVel(e:)"] = "Gets the angular velocity of the entity"
E2Helper.Descriptions["angVelVector(e:)"] = "Returns rotation axis, velocity and direction given as the vector's direction, magnitude and sense"
E2Helper.Descriptions["angles(e:)"] = "Gets the pitch, yaw and roll of the entity"
E2Helper.Descriptions["radius(e:)"] = "Gets the size of the object (not precisely, but useful)"
E2Helper.Descriptions["height(e:)"] = "Gets the height of a player or npc"
E2Helper.Descriptions["bearing(e:v)"] = "Gets the bearing from the entity to the vector"
E2Helper.Descriptions["elevation(e:v)"] = "Gets the elevation from the entity to the vector"
E2Helper.Descriptions["heading(e:v)"] = "Gets the elevation and bearing from the entity to the vector"
E2Helper.Descriptions["health(e:)"] = "Gets the health of the entity"
E2Helper.Descriptions["maxHealth(e:)"] = "Gets the max health of the entity"
E2Helper.Descriptions["armor(e:)"] = "Gets the armor of the player"
E2Helper.Descriptions["volume(e:)"] = "Gets the volume of the entity"
E2Helper.Descriptions["surfaceArea(e:)"] = "Gets the surface area of the entity"
E2Helper.Descriptions["stress(e:)"] = "Gets the stress of the entity"
E2Helper.Descriptions["frictionSnapshot(e:)"] = "Returns current friction events of the entity as a table of tables [https://wiki.facepunch.com/gmod/PhysObj:GetFrictionSnapshot]"
E2Helper.Descriptions["mass(e:)"] = "Gets the mass of the entity"
E2Helper.Descriptions["timeConnected(e:)"] = "Returns a players time connected to a server"
E2Helper.Descriptions["creationTime(e:)"] = "Returns the time the entity was created on, relative to curtime."
E2Helper.Descriptions["massCenter(e:)"] = "Gets the Center of Mass of the entity"
E2Helper.Descriptions["massCenterL(e:)"] = "Gets the center of mass as a local vector"
E2Helper.Descriptions["setMass(n)"] = "Sets the mass of the E2 chip (between 0.001 and 50,000)"
E2Helper.Descriptions["setMass(e:n)"] = "Sets the mass of the entity (between 0.001 and 50,000)"
E2Helper.Descriptions["inertia(e:)"] = "Gets the principal components of the entity's inertia tensor in the form ( Ixx, Iyy, Izz )"
E2Helper.Descriptions["applyForce(v)"] = "Applies force to the E2 chip according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyForce(e:v)"] = "Applies force to the entity according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyOffsetForce(vv)"] = "Applies force to the E2 chip according to the first vector from the location of the second"
E2Helper.Descriptions["applyOffsetForce(e:vv)"] = "Applies force to the entity according to the first vector from the location of the second"
E2Helper.Descriptions["applyAngForce(a)"] = "Applies torque to the E2 chip according to the given angle"
E2Helper.Descriptions["applyAngForce(e:a)"] = "Applies torque to the entity according to the given angle"
E2Helper.Descriptions["applyTorque(v)"] = "Applies torque to the E2 chip according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["applyTorque(e:v)"] = "Applies torque to the entity according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["isPlayer(e:)"] = "Is the entity a player?"
E2Helper.Descriptions["isOnFire(e:)"] = "Is the entity on fire?"
E2Helper.Descriptions["isWeapon(e:)"] = "Is the entity a weapon?"
E2Helper.Descriptions["isNPC(e:)"] = "Is the entity a NPC?"
E2Helper.Descriptions["isFrozen(e:)"] = "Is the entity frozen?"
E2Helper.Descriptions["isVehicle(e:)"] = "Is the entity a vehicle?"
E2Helper.Descriptions["inVehicle(e:)"] = "Is the player in a vehicle?"
E2Helper.Descriptions["isWorld(e:)"] = "Is the entity the world?"
E2Helper.Descriptions["isOnGround(e:)"] = "Is the player/NPC resting on something?"
E2Helper.Descriptions["isUnderWater(e:)"] = "Is the entity under water?"
E2Helper.Descriptions["isPlayerHolding(e:)"] = "Is the entity being held by a player?"
E2Helper.Descriptions["isAdmin(e:)"] = "Is the player an admin?"
E2Helper.Descriptions["isSuperAdmin(e:)"] = "Is the player a super admin?"
E2Helper.Descriptions["isAlive(e:)"] = "Is the player or NPC alive?"
E2Helper.Descriptions["isCrouch(e:)"] = "Is the player crouching?"
E2Helper.Descriptions["isFlashlightOn(e:)"] = "Returns 1 if the player has flashlight on, 0 otherwise"
E2Helper.Descriptions["isTyping(e:)"] = "Is the player typing a message in chat?"
E2Helper.Descriptions["isValid(e:)"] = "Returns 1 if the entity is valid, 0 otherwise"
E2Helper.Descriptions["isValidPhysics(e:)"] = "Returns 1 if the entity has valid physics (players don't)"
E2Helper.Descriptions["inNoclip(e:)"] = "Is the player in noclip mode?"
E2Helper.Descriptions["friends(e:)"] = "Returns an array of players on the prop protection friends list"
E2Helper.Descriptions["trusts(e:e)"] = "Is E2 on the prop protection friends list of E?"
E2Helper.Descriptions["keyAttack1(e:)"] = "Is the player pressing their primary fire key?"
E2Helper.Descriptions["keyAttack2(e:)"] = "Is the player pressing their secondary fire key?"
E2Helper.Descriptions["keyDuck(e:)"] = "Is the player pressing their crouch key?"
E2Helper.Descriptions["keyForward(e:)"] = "Is the player pressing their forward key? (default W)"
E2Helper.Descriptions["keyJump(e:)"] = "Is the player pressing their jump key?"
E2Helper.Descriptions["keyLeft(e:)"] = "Is the player pressing their left key? (default A)"
E2Helper.Descriptions["keyLeftTurn(e:)"] = "Is the player pressing their Look left key?"
E2Helper.Descriptions["keyReload(e:)"] = "Is the player pressing their reload key?"
E2Helper.Descriptions["keyRight(e:)"] = "Is the player pressing their right key? (default D)"
E2Helper.Descriptions["keyRightTurn(e:)"] = "Is the player pressing their Look right key?"
E2Helper.Descriptions["keySprint(e:)"] = "Is the player pressing their sprint key?"
E2Helper.Descriptions["keyWalk(e:)"] = "Is the player pressing their walk key?"
E2Helper.Descriptions["keyZoom(e:)"] = "Is the player pressing their zoom key?"
E2Helper.Descriptions["keyUse(e:)"] = "Is the player pressing their use key?"
E2Helper.Descriptions["keyPressed(e:s)"] = "Is the player pressing the KEY_ enumeration [S]? For example, 'W', 'K', '4', 'COMMA'"
E2Helper.Descriptions["keyBack(e:)"] = "Is the player pressing their back key? (default S)"
E2Helper.Descriptions["driver(e:)"] = "Returns the driver of the vehicle if there is one, nil otherwise"
E2Helper.Descriptions["passenger(e:)"] = "Returns the passenger of the vehicle if there is one, in single seat pods this will return the driver"
E2Helper.Descriptions["vehicle(e:)"] = "Returns the entity of the vehicle that the specified player is in"
E2Helper.Descriptions["ejectPod(e:)"] = "Ejects player in vehicle"
E2Helper.Descriptions["lockPod(e:n)"] = "1 locks and 0 unlocks the vehicle"
E2Helper.Descriptions["killPod(e:)"] = "Kills player in vehicle"
E2Helper.Descriptions["podStripWeapons(e:)"] = "Strips player in vehicle"
E2Helper.Descriptions["weapon(e:s)"] = "Returns the weapon with specified class of player E"
E2Helper.Descriptions["weapon(e:)"] = "Returns the weapon that player E is currently holding"
E2Helper.Descriptions["weapons(e:)"] = "Returns the weapons that player E has"
E2Helper.Descriptions["clip1(e:)"] = "Returns the amount of ammo in the primary clip of weapon E, -1 if there is no primary clip"
E2Helper.Descriptions["clip2(e:)"] = "Returns the amount of ammo in the secondary clip of weapon E, -1 if there is no secondary clip 1)"
E2Helper.Descriptions["primaryAmmoType(e:)"] = "Returns the name of the primary weapon's ammo"
E2Helper.Descriptions["secondaryAmmoType(e:)"] = "Returns the name of the secondary weapon's ammo"
E2Helper.Descriptions["ammoCount(e:s)"] = "Returns the amount of stored ammo of type S on player E, excluding current clip"
E2Helper.Descriptions["tool(e:)"] = "returns the name of the tool the player E is currently holding"
E2Helper.Descriptions["nearestPoint(e:v)"] = "Returns the closest point on the edge of the entity's bounding box to the given vector"
E2Helper.Descriptions["boxCenterW(e:)"] = "Same as using E:toWorld(E:boxCenter()), but since Lua is faster, this is more efficient (also shorter to write)"
E2Helper.Descriptions["aabbMin(e:)"] = "Returns the entity's (min) axis-aligned bounding box"
E2Helper.Descriptions["aabbMax(e:)"] = "Returns the entity's (max) axis-aligned bounding box"
E2Helper.Descriptions["aabbSize(e:)"] = "Returns the entity's axis-aligned bounding box size"
E2Helper.Descriptions["aabbWorldMin(e:)"] = "Returns the rotated entity's min world-axis-aligned bounding box corner"
E2Helper.Descriptions["aabbWorldMax(e:)"] = "Returns the rotated entity's max world-axis-aligned bounding box corner"
E2Helper.Descriptions["aabbWorldSize(e:)"] = "Returns the rotated entity's world-axis-aligned bounding box size"
E2Helper.Descriptions["keyClk()"] = "Returns the player that pressed/released the key if the E2 was triggered by runOnKeys"
E2Helper.Descriptions["keyClk(e)"] = "Returns 1 if the E2 was triggered by the player pressing a key or -1 when releasing a key"
E2Helper.Descriptions["keyClkPressed()"] = "Returns the name of the pressed/released key that triggered the E2"
E2Helper.Descriptions["runOnUse(n)"] = "If set to 1, E2 will run when a player presses E on the E2"
E2Helper.Descriptions["useClk()"] = "Returns the player that used the E2, if the E2 was triggered by runOnUse"
E2Helper.Descriptions["setTrails(e:nnnsvn)"] = "StartSize, EndSize, Length, Material, Color (RGB), Alpha. Adds a trail to E with the specified attributes"
E2Helper.Descriptions["setTrails(e:nnnsvnnn)"] = "StartSize, EndSize, Length, Material, Color (RGB), Alpha, AttachmentID, Additive. Adds a trail to E with the specified attributes"
E2Helper.Descriptions["removeTrails(e:)"] = "Removes the trail from E"
E2Helper.Descriptions["runOnKeys(en)"] = "If set to 1, E2 will run when specified player presses/releases their key"
E2Helper.Descriptions["playerDisconnectClk()"] = "Returns 1 if the chip is being executed because of a player disconnect event. Returns 0 otherwise"
E2Helper.Descriptions["lastDisconnectedPlayer()"] = "Returns the last player to disconnect. Must be done while in a disconnectClk() as anytime after the player object is gone."
E2Helper.Descriptions["runOnPlayerDisconnect(n)"] = "If set to 0, the chip will no longer run on player disconnect events, otherwise it makes this chip execute when someone disconnects. Only needs to be called once, not in every execution"
E2Helper.Descriptions["playerConnectClk()"] = "Returns 1 if the chip is being executed because of a player connect event. Returns 0 otherwise"
E2Helper.Descriptions["lastConnectedPlayer()"] = "Returns the last player to connect."
E2Helper.Descriptions["runOnPlayerConnect(n)"] = "If set to 0, the chip will no longer run on player connect events, otherwise it makes this chip execute when someone connects. Only needs to be called once, not in every execution"
E2Helper.Descriptions["inGodMode(e:)"] = "Returns whether the player has god mode or not"

-- Attachment
E2Helper.Descriptions["lookupAttachment(e:s)"] = "Returns Es attachment ID associated with attachmentName"
E2Helper.Descriptions["attachmentPos(e:n)"] = "Returns Es attachment position associated with attachmentID"
E2Helper.Descriptions["attachmentAng(e:n)"] = "Returns Es attachment angle associated with attachmentID"
E2Helper.Descriptions["attachmentPos(e:s)"] = "Same as E:attachmentPos(E:lookupAttachment(attachmentName))"
E2Helper.Descriptions["attachmentAng(e:s)"] = "Same as E:attachmentAng(E:lookupAttachment(attachmentName))"
E2Helper.Descriptions["attachments(e:)"] = "Returns array of attachment names of the entity"

-- Vector
E2Helper.Descriptions["vec2(n)"] = "Makes a 2D vector"
E2Helper.Descriptions["vec2(nn)"] = "Makes a 2D vector"
E2Helper.Descriptions["vec2()"] = "Same as vec2(0,0)"
E2Helper.Descriptions["vec2(v)"] = "Converts a 3D vector into a 2D vector (the z component is dropped)"
E2Helper.Descriptions["vec2(xv4)"] = "Converts a 4D vector into a 2D vector (the z and w components are dropped)"
E2Helper.Descriptions["shift(xv2)"] = "Swaps the vector's x,y components"
E2Helper.Descriptions["toAngle(xv2:)"] = "Returns the 2D angle of the vector (given in degrees, -180 to 180)"
E2Helper.Descriptions["dehomogenized(v:)"] = "Converts a 2D homogeneous vector (x,y,w) into a 2D cartesian vector"
E2Helper.Descriptions["vec(n)"] = "Makes a 3D vector"
E2Helper.Descriptions["vec(nnn)"] = "Makes a 3D vector"
E2Helper.Descriptions["vec()"] = "Same as vec(0,0,0)"
E2Helper.Descriptions["vec(xv2)"] = "Converts a 2D vector into a 3D vector (the z component is set to 0)"
E2Helper.Descriptions["vec(xv2n)"] = "Converts a 2D vector into a 3D vector (the z component is set to the second argument)"
E2Helper.Descriptions["vec(xv4)"] = "Converts a 4D vector into a 3D vector (the w component is dropped)"
E2Helper.Descriptions["vec(a)"] = "Changes an angle variable into a vector variable. PYR become XYZ respectively"
E2Helper.Descriptions["randvec()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec2()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec4()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec2(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec4(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec2(xv2xv2)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["randvec(vv)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["randvec4(xv4xv4)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["shiftL(v)"] = "Shifts the vector's components left: shiftL( x,y,z ) = ( y,z,x )"
E2Helper.Descriptions["shiftR(v)"] = "Shifts the vector's components right: shiftR( x,y,z ) = ( z,x,y )"
E2Helper.Descriptions["rotate(v:a)"] = "Gets the rotated vector"
E2Helper.Descriptions["rotate(v:nnn)"] = "Gets the rotated vector"
E2Helper.Descriptions["rotate(xv2:n)"] = "Rotates a vector by the argument (given in degrees)"
E2Helper.Descriptions["toAngle(v:)"] = "Converts a direction vector into an angle"
E2Helper.Descriptions["toAngle(v:v)"] = "Converts a direction vector into an angle with roll being determined by the up vector"
E2Helper.Descriptions["toDeg(xv2)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toDeg(v)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toDeg(xv4)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toRad(xv2)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["toRad(v)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["toRad(xv4)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["dehomogenized(xv4:)"] = "Converts a 3D homogeneous vector (x,y,z,w) into a 3D cartesian vector"
E2Helper.Descriptions["isInWorld(v:)"] = "Returns 1 if the position vector is within the world, 0 if not"
E2Helper.Descriptions["vec4(n)"] = "Makes a 4D vector"
E2Helper.Descriptions["vec4(nnnn)"] = "Makes a 4D vector"
E2Helper.Descriptions["vec4()"] = "Same as vec4(0,0,0,0)"
E2Helper.Descriptions["vec4(xv2)"] = "Converts a 2D vector into a 4D vector (the z and w components are set to 0)"
E2Helper.Descriptions["vec4(xv2nn)"] = "Converts a 2D vector into a 4D vector (the z and w components are set to the second and third arguments)"
E2Helper.Descriptions["vec4(xv2xv2)"] = "Creates a 4D vector from two 2D vectors"
E2Helper.Descriptions["vec4(v)"] = "Converts a 3D vector into a 4D vector (the w component is set to 0)"
E2Helper.Descriptions["vec4(vn)"] = "Converts a 3D vector into a 4D vector (the w component is set to the second argument)"
E2Helper.Descriptions["shiftL(xv4)"] = "Shifts the vector's components left: shiftL( x,y,z,w ) = ( y,z,w,x )"
E2Helper.Descriptions["shiftR(xv4)"] = "Shifts the vector's components right: shiftR( x,y,z,w ) = ( w,x,y,z )"
E2Helper.Descriptions["ceil(xv2)"] = "Rounds XY up to the nearest integer"
E2Helper.Descriptions["ceil(v)"] = "Rounds XYZ up to the nearest integer"
E2Helper.Descriptions["ceil(xv4)"] = "Rounds XYZW up to the nearest integer"
E2Helper.Descriptions["ceil(xv2n)"] = "Rounds XY up to argument 2's decimal precision"
E2Helper.Descriptions["ceil(vn)"] = "Rounds XYZ up to argument 2's decimal precision"
E2Helper.Descriptions["ceil(xv4n)"] = "Rounds XYZW up to argument 2's decimal precision"
E2Helper.Descriptions["floor(xv2)"] = "Rounds XY down to the nearest integer"
E2Helper.Descriptions["floor(v)"] = "Rounds XYZ down to the nearest integer"
E2Helper.Descriptions["floor(xv4)"] = "Rounds XYZW down to the nearest integer"
E2Helper.Descriptions["floor(xv2n)"] = "Rounds XY down to argument 2's decimal precision"
E2Helper.Descriptions["floor(vn)"] = "Rounds XYZ down to argument 2's decimal precision"
E2Helper.Descriptions["floor(xv4n)"] = "Rounds XYZW down to argument 2's decimal precision"
E2Helper.Descriptions["round(xv2)"] = "Rounds XY to the nearest integer"
E2Helper.Descriptions["round(v)"] = "Rounds XYZ to the nearest integer"
E2Helper.Descriptions["round(xv4)"] = "Rounds XYZW to the nearest integer"
E2Helper.Descriptions["round(xv2n)"] = "Rounds XY to argument 2's decimal precision"
E2Helper.Descriptions["round(vn)"] = "Rounds XYZ to argument 2's decimal precision"
E2Helper.Descriptions["round(xv4n)"] = "Rounds XYZW to argument 2's decimal precision"
E2Helper.Descriptions["mod(xv2n)"] = "Returns the remainder after XY have been divided by argument 2"
E2Helper.Descriptions["mod(vn)"] = "Returns the remainder after XYZ have been divided by argument 2"
E2Helper.Descriptions["mod(xv4n)"] = "Returns the remainder after XYZW have been divided by argument 2"
E2Helper.Descriptions["mod(xv2xv2)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["mod(vv)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["mod(xv4xv4)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["clamp(xv2xv2xv2)"] = "Clamps vector 1's XY between the XY of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(vvv)"] = "Clamps vector 1's XYZ between the XYZ of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(xv4xv4xv4)"] = "Clamps vector 1's XYZW between the XYZW of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(xv2nn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["clamp(vnn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["clamp(xv4nn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["min(xv2xv2)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["min(vv)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["min(xv4xv4)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["max(xv2xv2)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["max(vv)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["max(xv4xv4)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["minVec(xv2xv2)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["minVec(vv)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["minVec(xv4xv4)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["maxVec(xv2xv2)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["maxVec(vv)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["maxVec(xv4xv4)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["mix(xv2xv2n)"] = "Combines vector 1's XY with vector 2's XY by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["mix(vvn)"] = "Combines vector 1's XYZ with vector 2's XYZ by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["mix(xv4xv4n)"] = "Combines vector 1's XYZW with vector 2's XYZW by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["positive(xv2)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["positive(v)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["positive(xv4)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["inrange(xv2xv2xv2)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["inrange(vvv)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["inrange(xv4xv4xv4)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["length(xv2:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length(v:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length(xv4:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length2(xv2:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["length2(v:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["length2(xv4:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["distance(xv2:xv2)"] = "Gets the distance between 2D vectors"
E2Helper.Descriptions["distance(v:v)"] = "Gets the distance between vectors"
E2Helper.Descriptions["distance(xv4:xv4)"] = "Gets the distance between 4D vectors"
E2Helper.Descriptions["distance2(xv2:xv2)"] = "Gets the squared distance between 2D vectors"
E2Helper.Descriptions["distance2(v:v)"] = "Gets the squared distance between vectors"
E2Helper.Descriptions["distance2(xv4:xv4)"] = "Gets the squared distance between 4D vectors"
E2Helper.Descriptions["normalized(xv2:)"] = "Gets the normalized vector"
E2Helper.Descriptions["normalized(v:)"] = "Gets the normalized vector"
E2Helper.Descriptions["normalized(xv4:)"] = "Gets the normalized vector"
E2Helper.Descriptions["dot(xv2:xv2)"] = "Gets the 2D vector dot (scalar) product"
E2Helper.Descriptions["dot(v:v)"] = "Gets the vector dot (scalar) product"
E2Helper.Descriptions["dot(xv4:xv4)"] = "Gets the 4D vector dot (scalar) product"
E2Helper.Descriptions["cross(xv2:xv2)"] = "Gets the 2D vector cross product/wedge product"
E2Helper.Descriptions["cross(v:v)"] = "Gets the vector cross product"
E2Helper.Descriptions["x(xv2:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["x(v:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["x(xv4:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["y(xv2:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["y(v:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["y(xv4:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["z(v:)"] = "Gets the z component of the vector"
E2Helper.Descriptions["z(xv4:)"] = "Gets the z component of the vector"
E2Helper.Descriptions["w(xv4:)"] = "Gets the w component of the vector"
E2Helper.Descriptions["setX(xv2:n)"] = "Returns a copy of the 2D vector with X replaced (use as Vec2 = Vec2:setX(...))"
E2Helper.Descriptions["setX(v:n)"] = "Returns a copy of the vector with X replaced (use as Vec = Vec:setX(...))"
E2Helper.Descriptions["setX(xv4:n)"] = "Returns a copy of the 4D vector with X replaced (use as Vec4 = Vec4:setX(...))"
E2Helper.Descriptions["setY(xv2:n)"] = "Returns a copy of the 2D vector with Y replaced (use as Vec2 = Vec2:setY(...))"
E2Helper.Descriptions["setY(v:n)"] = "Returns a copy of the vector with Y replaced (use as Vec = Vec:setY(...))"
E2Helper.Descriptions["setY(xv4:n)"] = "Returns a copy of the 4D vector with Y replaced (use as Vec4 = Vec4:setY(...))"
E2Helper.Descriptions["setZ(v:n)"] = "Returns a copy of the vector with Z replaced (use as Vec = Vec:setZ(...))"
E2Helper.Descriptions["setZ(xv4:n)"] = "Returns a copy of the 4D vector with Z replaced (use as Vec4 = Vec4:setZ(...))"
E2Helper.Descriptions["setW(xv4:n)"] = "Returns a copy of the 4D vector with W replaced (use as Vec4 = Vec4:setW(...))"
E2Helper.Descriptions["toString(xv2:)"] = "Gets the vector nicely formatted as a string \"[X,Y]\""
E2Helper.Descriptions["toString(xv2)"] = "Gets the vector nicely formatted as a string \"[X,Y]\""
E2Helper.Descriptions["toString(v:)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z]\""
E2Helper.Descriptions["toString(v)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z]\""
E2Helper.Descriptions["toString(xv4:)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z,W]\""
E2Helper.Descriptions["toString(xv4)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z,W]\""
E2Helper.Descriptions["toWorld(vava)"] = "Converts a local position/angle to a world position/angle and returns the position"
E2Helper.Descriptions["toWorldAng(vava)"] = "Converts a local position/angle to a world position/angle and returns the angle"
E2Helper.Descriptions["toWorldPosAng(vava)"] = "Converts a local position/angle to a world position/angle and returns both in an array"
E2Helper.Descriptions["toLocal(vava)"] = "Converts a world position/angle to a local position/angle and returns the position"
E2Helper.Descriptions["toLocalAng(vava)"] = "Converts a world position/angle to a local position/angle and returns the angle"
E2Helper.Descriptions["toLocalPosAng(vava)"] = "Converts a world position/angle to a local position/angle and returns both in an array"
E2Helper.Descriptions["outerProduct(v:v)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["outerProduct(xv2:xv2)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["outerProduct(xv4:xv4)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["pointContents(v)"] = "Returns a string with all the \"content\" types in the vector point, seperated by commas"
E2Helper.Descriptions["pointContentsArray(v)"] = "Returns an array with all the \"content\" types in the vector point"
E2Helper.Descriptions["pointHasContent(vs)"] = "'S' can be a string containing the last half of the CONTENTS_ enums (ie without the \"CONTENTS_\"). Multiple CONTENTS types can be seperated by a comma. Check: Enumeration_List:Contents for a full list. Examples: \"water,solid\" or \"empty,transparent\". The function returns 1 if any one of the types are found in the vector point"
E2Helper.Descriptions["bezier(xv2xv2xv2n)"] = "Returns the 2D position on the bezier curve between the starting and ending 2D vector, given by the ratio (value between 0 and 1)"
E2Helper.Descriptions["bezier(vvvn)"] = "Returns the 3D vector position on the bezier curve between the starting and ending 3D vector, given by the ratio (value between 0 and 1)"

-- Matrix
E2Helper.Descriptions["identity2()"] = "Creates a 2x2 identity matrix"
E2Helper.Descriptions["matrix2()"] = "Creates a 2x2 zero matrix"
E2Helper.Descriptions["matrix2(nnnn)"] = "Creates a matrix with values in order (i.j) of: (1,1), (1,2), (2,1), (2,2)"
E2Helper.Descriptions["matrix2(xv2xv2)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix2(m)"] = "Converts a 3x3 matrix into a 2x2 matrix - all (i,3) and (3,j) are omitted"
E2Helper.Descriptions["matrix2(xm4)"] = "Converts a 4x4 matrix into a 2x2 matrix - all (i,3), (i,4), (3,j) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(xm2:)"] = "Swaps rows"
E2Helper.Descriptions["swapColumns(xm2:)"] = "Swaps columns"
E2Helper.Descriptions["setRow(xm2:nnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j"
E2Helper.Descriptions["setRow(xm2:nxv2)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm2:nnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2"
E2Helper.Descriptions["setColumn(xm2:nxv2)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["identity2()"] = "Creates a 2x2 identity matrix"
E2Helper.Descriptions["matrix2()"] = "Creates a 2x2 zero matrix"
E2Helper.Descriptions["matrix2(nnnn)"] = "Creates a matrix with values in order (i.j) of: (1,1), (1,2), (2,1), (2,2)"
E2Helper.Descriptions["matrix2(xv2xv2)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix2(m)"] = "Converts a 3x3 matrix into a 2x2 matrix - all (i,3) and (3,j) are omitted"
E2Helper.Descriptions["matrix2(xm4)"] = "Converts a 4x4 matrix into a 2x2 matrix - all (i,3), (i,4), (3,j) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(xm2:)"] = "Swaps rows"
E2Helper.Descriptions["swapColumns(xm2:)"] = "Swaps columns"
E2Helper.Descriptions["setRow(xm2:nnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j"
E2Helper.Descriptions["setRow(xm2:nxv2)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm2:nnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2"
E2Helper.Descriptions["setColumn(xm2:nxv2)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["identity()"] = "Creates a 3x3 identity matrix"
E2Helper.Descriptions["matrix()"] = "Creates a 3x3 zero matrix"
E2Helper.Descriptions["matrix(nnnnnnnnn)"] = "Creates a matrix with 9 values in the following order (i.j): (1,1), (1,2), (1,3), (2,1) etc"
E2Helper.Descriptions["matrix(vvv)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix(xm2)"] = "Converts a 2x2 matrix into a 3x3 matrix - all (i,3) and (3,j) are filled with 0's"
E2Helper.Descriptions["matrix(xm4)"] = "Converts a 4x4 matrix into a 3x3 matrix - all (i,4) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(m:nn)"] = "Swaps the two rows specified"
E2Helper.Descriptions["swapColumns(m:nn)"] = "Swaps the two columns specified"
E2Helper.Descriptions["setRow(m:nnnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j, 3j"
E2Helper.Descriptions["setRow(m:nv)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(m:nnnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2, i3"
E2Helper.Descriptions["setColumn(m:nv)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["setDiagonal(m:nnn)"] = "Sets the elements of the leading diagonal"
E2Helper.Descriptions["setDiagonal(m:v)"] = "Sets the elements of the leading diagonal from the components of a vector"
E2Helper.Descriptions["matrix(e)"] = "Creates a reference frame matrix from an entity's local direction vectors by columns in the order ( x, y, z )"
E2Helper.Descriptions["matrix(a)"] = "Returns a 3x3 reference frame matrix as described by the angle A. Multiplying by this matrix will be the same as rotating by the given angle"
E2Helper.Descriptions["x(m:)"] = "Returns the local x direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(1) )"
E2Helper.Descriptions["y(m:)"] = "Returns the local y direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(2) )"
E2Helper.Descriptions["z(m:)"] = "Returns the local z direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(3) )"
E2Helper.Descriptions["mRotation(vn)"] = "Creates a 3x3 rotation matrix, where the vector is the axis of rotation, and the number is the angle (anti-clockwise) in degrees. Example*: to rotate a vector (7,8,9) by 50 degrees about the axis (1,1,0), you would write V = mRotation(vec(1,1,0), 50) * vec(7,8,9)"
E2Helper.Descriptions["identity4()"] = "Creates a 4x4 identity matrix"
E2Helper.Descriptions["matrix4()"] = "Creates a 4x4 zero matrix"
E2Helper.Descriptions["matrix4(nnnnnnnnnnnnnnnn)"] = "Creates a matrix with 16 values in the following order (i.j): (1,1), (1,2), (1,3), (1,4), (2,1) etc"
E2Helper.Descriptions["matrix4(xv4xv4xv4xv4)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix4(xm2)"] = "Converts a 2x2 matrix into a 4x4 matrix - all (i,3), (i,4), (3,j) and (4,j) are filled with 0's"
E2Helper.Descriptions["matrix4(xm2xm2xm2xm2)"] = "Constructs a 4x4 matrix from four 2x2 matrices"
E2Helper.Descriptions["matrix4(m)"] = "Converts a 3x3 matrix into a 4x4 matrix - all (i,4) and (4,j) are filled with 0's"
E2Helper.Descriptions["swapRows(xm4:nn)"] = "Swaps the two rows specified"
E2Helper.Descriptions["swapColumns(xm4:nn)"] = "Swaps the two columns specified"
E2Helper.Descriptions["setRow(xm4:nnnnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j, 3j, 4j"
E2Helper.Descriptions["setRow(xm4:nxv4)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm4:nnnnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2, i3, i4"
E2Helper.Descriptions["setColumn(xm4:nxv4)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["setDiagonal(xm4:nnnn)"] = "Sets the elements of the leading diagonal"
E2Helper.Descriptions["setDiagonal(xm4:xv4)"] = "Sets the elements of the leading diagonal from the components of a vector"
E2Helper.Descriptions["matrix4(e)"] = "Creates a 4x4 reference frame matrix from an entity's local direction vectors by columns in the order (x, y, z, pos), with the bottom row (0,0,0,1)"
E2Helper.Descriptions["matrix4(a)"] = "Returns a 4x4 reference frame matrix as described by the angle A. Multiplying by this matrix will be the same as rotating by the given angle"
E2Helper.Descriptions["matrix4(av)"] = "Returns a 4x4 reference frame matrix as described by the angle A and the position V. Multiplying by this matrix will be the same as rotating by the given angle and offsetting by the given vector"
E2Helper.Descriptions["x(xm4:)"] = "Returns the local x direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["y(xm4:)"] = "Returns the local y direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["z(xm4:)"] = "Returns the local z direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["pos(xm4:)"] = "Returns the position vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["inverseA(xm4)"] = "Finds the matrix inverse of a standard 4x4 affine transformation matrix ( the type created by matrix4(E) ). This should only be used on matrices with a particular format, where the top left 3x3 specifies rotation, the rightmost 3-column specifies translation, and the bottom row is (0,0,0,1)"
E2Helper.Descriptions["row(xm:n)"] = "Returns the row as a vector"
E2Helper.Descriptions["column(xm2:n)"] = "Returns the column as a 2D vector"
E2Helper.Descriptions["column(m:n)"] = "Returns the column as a vector"
E2Helper.Descriptions["column(xm4:n)"] = "Returns the column as a 4D vector"
E2Helper.Descriptions["element(xm2:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["element(m:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["element(xm4:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["setElement(xm2:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["setElement(m:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["setElement(xm4:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["swapElements(xm2:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["swapElements(m:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["swapElements(xm4:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["diagonal(xm2)"] = "Returns a 2D vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["diagonal(m)"] = "Returns a vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["diagonal(xm4)"] = "Returns a 4D vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["trace(xm2)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["trace(m)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["trace(xm4)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["det(xm2)"] = "Returns the determinant of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["det(m)"] = "Returns the determinant of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["transpose(xm2)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["transpose(m)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["transpose(xm4)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["adj(m)"] = "Returns the adjugate of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["adj(xm2)"] = "Returns the adjugate of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["row(xm2:n)"] = "Returns the row as a 2D vector"
E2Helper.Descriptions["row(m:n)"] = "Returns the row as a vector"
E2Helper.Descriptions["row(xm4:n)"] = "Returns the row as a 4D vector"
E2Helper.Descriptions["rowMatrix(vvv)"] = "Creates a 3x3 matrix with vectors by rows"
E2Helper.Descriptions["rowMatrix2(xv2xv2)"] = "Creates a 2x2 matrix with 2D vectors by rows"
E2Helper.Descriptions["rowMatrix4(xv4xv4xv4xv4)"] = "Creates a 4x4 matrix with 4D vectors by rows"
E2Helper.Descriptions["toAngle(m:)"] = "Returns an angle derived from a 3x3 rotation matrix"

-- Angle
E2Helper.Descriptions["ang(n)"] = "Makes an angle"
E2Helper.Descriptions["ang(nnn)"] = "Makes an angle"
E2Helper.Descriptions["ang()"] = "Same as ang(0,0,0)"
E2Helper.Descriptions["ang(v)"] = "Changes a vector variable into an angle variable. XYZ become PYR respectively"
E2Helper.Descriptions["ceil(a)"] = "Rounds PYR up to the nearest integer"
E2Helper.Descriptions["ceil(an)"] = "Rounds PYR up to argument 2's decimal precision"
E2Helper.Descriptions["floor(a)"] = "Rounds PYR down to the nearest integer"
E2Helper.Descriptions["floor(an)"] = "Rounds PYR down to argument 2's decimal precision"
E2Helper.Descriptions["round(a)"] = "Rounds PYR to the nearest integer"
E2Helper.Descriptions["round(an)"] = "Rounds PYR to argument 2's decimal precision"
E2Helper.Descriptions["mod(an)"] = "Returns the remainder after PYR have been divided by argument 2"
E2Helper.Descriptions["mod(aa)"] = "Returns the remainder after the components of angle 1 have been divided by the components of angle 2"
E2Helper.Descriptions["clamp(aaa)"] = "Clamps angle 1's PYR between the PYR of angle 2(min) and angle 3(max)"
E2Helper.Descriptions["clamp(ann)"] = "Clamps angle 1's PYR between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["mix(aan)"] = "Combines angle 1's PYR with angle 2's PYR by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["shiftL(a)"] = "Shifts the angle's components left: shiftL( p,y,r ) = ( y,r,p )"
E2Helper.Descriptions["shiftR(a)"] = "Shifts the angle's components right: shiftR( p,y,r ) = ( r,p,y )"
E2Helper.Descriptions["inrange(aaa)"] = "Returns 1 if each component of A is between (or is equal to) the components of Amin and Amax"
E2Helper.Descriptions["angnorm(a)"] = "Gets the normalized angle of an angle"
E2Helper.Descriptions["angnorm(n)"] = "Gets the normalized angle of a number"
E2Helper.Descriptions["pitch(a:)"] = "Gets the pitch of the angle"
E2Helper.Descriptions["yaw(a:)"] = "Gets the yaw of the angle"
E2Helper.Descriptions["roll(a:)"] = "Gets the roll of the angle"
E2Helper.Descriptions["setPitch(a:n)"] = "Returns a copy of the angle with Pitch replaced (use as Ang = Ang:setPitch(...))"
E2Helper.Descriptions["setYaw(a:n)"] = "Returns a copy of the angle with Yaw replaced (use as Ang = Ang:setYaw(...))"
E2Helper.Descriptions["setRoll(a:n)"] = "Returns a copy of the angle with Roll replaced (use as Ang = Ang:setRoll(...))"
E2Helper.Descriptions["toString(a)"] = "Gets the angle nicely formatted as a string \"[P,Y,R]\""
E2Helper.Descriptions["toString(a:)"] = "Gets the angle nicely formatted as a string \"[P,Y,R]\""
E2Helper.Descriptions["toDeg(a)"] = "Converts the angle's magnitude from radians to degrees"
E2Helper.Descriptions["toRad(a)"] = "Converts the angle's magnitude from radians to radians"
E2Helper.Descriptions["forward(a:)"] = "Gets the forward vector of the angle"
E2Helper.Descriptions["right(a:)"] = "Gets the right vector of the angle"
E2Helper.Descriptions["up(a:)"] = "Gets the up vector of the angle"
E2Helper.Descriptions["rotateAroundAxis(a:vn)"] = "Returns the angle A rotated around vector V by N degrees"
E2Helper.Descriptions["rotateAroundAxis(v:vn)"] = "Returns the vector V1 rotated around vector V2 by N degrees"

-- Bones
E2Helper.Descriptions["bone(e:n)"] = "Returns Es Nth bone"
E2Helper.Descriptions["bones(e:)"] = "Returns an array containing all of Es bones. This array's first element has the index 0!"
E2Helper.Descriptions["boneCount(e:)"] = "Returns Es number of bones"
E2Helper.Descriptions["nobone()"] = "Returns an invalid bone"
E2Helper.Descriptions["aimBone(e:)"] = "Returns the bone the player is currently aiming at"
E2Helper.Descriptions["entity(b:)"] = "Returns the entity B belongs to"
E2Helper.Descriptions["index(b:)"] = "Returns Bs index in the entity it belongs to. Returns -1 if the bone is invalid or an error occured"
E2Helper.Descriptions["pos(b:)"] = "Returns Bs position"
E2Helper.Descriptions["forward(b:)"] = "Returns a vector describing Bs forward direction"
E2Helper.Descriptions["right(b:)"] = "Returns a vector describing Bs right direction"
E2Helper.Descriptions["up(b:)"] = "Returns a vector describing Bs up direction"
E2Helper.Descriptions["vel(b:)"] = "Returns Bs velocity"
E2Helper.Descriptions["velL(b:)"] = "Returns Bs velocity in local coordinates"
E2Helper.Descriptions["toWorld(b:v)"] = "Transforms V from local coordinates (as seen from B) to world coordinates"
E2Helper.Descriptions["toLocal(b:v)"] = "Transforms V from world coordinates to local coordinates (as seen from B)"
E2Helper.Descriptions["angVel(b:)"] = "Returns Bs angular velocity"
E2Helper.Descriptions["angles(b:)"] = "Returns Bs pitch, yaw and roll angles"
E2Helper.Descriptions["bearing(b:v)"] = "Gets the bearing from the bone to the vector"
E2Helper.Descriptions["elevation(b:v)"] = "Gets the elevation from the bone to the vector"
E2Helper.Descriptions["heading(b:v)"] = "Gets the elevation and bearing from the bone to the vector"
E2Helper.Descriptions["mass(b:)"] = "Returns Bs mass"
E2Helper.Descriptions["massCenter(b:)"] = "Returns Bs Center of Mass"
E2Helper.Descriptions["massCenterL(b:)"] = "Returns Bs Center of Mass in local coordinates"
E2Helper.Descriptions["inertia(b:)"] = "Gets the principal components of Bs inertia tensor in the form vec(Ixx, Iyy, Izz)"
E2Helper.Descriptions["isFrozen(b:)"] = "Returns 1 if B is frozen, 0 otherwise"
E2Helper.Descriptions["angVelVector(b:)"] = "Returns rotation axis, velocity and direction given as the vector's direction, magnitude and sense"
E2Helper.Descriptions["applyOffsetForce(b:vv)"] = "Applies force to the bone according to the first vector from the location of the second"
E2Helper.Descriptions["applyForce(b:v)"] = "Applies force to the bone according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyAngForce(b:a)"] = "Applies torque to the bone according to the given angle"
E2Helper.Descriptions["applyTorque(b:v)"] = "Applies torque to the bone according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["setMass(b:n)"] = "Sets the mass of the bone (between 0.001 and 50,000)"
E2Helper.Descriptions["boneGravity(b:n)"] = "Enables/disables gravity on the bone."
E2Helper.Descriptions["toString(e:)"] = "Converts entity to string"
E2Helper.Descriptions["toString(e)"] = "Converts entity to string"
E2Helper.Descriptions["toString(b)"] = "Converts bone to string"

-- Wirelink
E2Helper.Descriptions["nowirelink()"] = "Returns an invalid wirelink"
E2Helper.Descriptions["wirelink()"] = "Returns wirelink to this E2"
E2Helper.Descriptions["isHiSpeed(xwl:)"] = "Returns true if the linked component is high-speed capable"
E2Helper.Descriptions["entity(xwl:)"] = "Returns the entity of the linked component"
E2Helper.Descriptions["hasInput(xwl:s)"] = "Returns true if the linked component has an input of the specified name"
E2Helper.Descriptions["hasOutput(xwl:s)"] = "Returns true if the linked component has an output of the specified name"
E2Helper.Descriptions["xyz(xwl:)"] = "Retrieves the X/Y/Z as the corresponding values in the vector"
E2Helper.Descriptions["writeString(xwl:ns)"] = "Writes a null-terminated string to the given address. Returns the next free address or 0 on failure"
E2Helper.Descriptions["writeString(xwl:snnv)"] = "Same as XWL:writeString(snn), with an extra argument for the text colour"
E2Helper.Descriptions["writeString(xwl:snnvn)"] = "Same as XWL:writeString(snnv), with an extra argument for background colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeString(xwl:snnvv)"] = "Same as XWL:writeString(snnv), with an extra argument for background colour"
E2Helper.Descriptions["writeString(xwl:snnn)"] = "Same as XWL:writeString(snn), with an extra argument for the text colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeString(xwl:snnvvn)"] = "Same as XWL:writeString(snnvv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snn)"] = "A helper function for using the Wired Console Screen. The string will be written to the screen in white text on black background. The number arguments specify the starting position - X/Horizontal (0-29 recommended) and Y/vertical (0-17)"
E2Helper.Descriptions["writeString(xwl:snnnnn)"] = "Same as XWL:writeString(snnnn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snnnn)"] = "Same as XWL:writeString(snnn), with an extra argument for background colour. 3-digit RGB again"
E2Helper.Descriptions["writeString(xwl:snnvnn)"] = "Same as XWL:writeString(snnvn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snnnv)"] = "Same as XWL:writeString(snnn), with an extra argument for background colour"
E2Helper.Descriptions["writeString(xwl:snnnvn)"] = "Same as XWL:writeString(snnnv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnv)"] = "Same as XWL:writeUnicodeString(snn), with an extra argument for the text colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvn)"] = "Same as XWL:writeUnicodeString(snnv), with an extra argument for background colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvv)"] = "Same as XWL:writeUnicodeString(snnv), with an extra argument for background colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnn)"] = "Same as XWL:writeUnicodeString(snn), with an extra argument for the text colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvvn)"] = "Same as XWL:writeUnicodeString(snnvv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snn)"] = "A helper function for using the Wired Console Screen. The unicode string will be written to the screen in white text on black background. The number arguments specify the starting position - X/Horizontal (0-29 recommended) and Y/vertical (0-17)"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnnn)"] = "Same as XWL:writeUnicodeString(snnnn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnn)"] = "Same as XWL:writeUnicodeString(snnn), with an extra argument for background colour. 3-digit RGB again"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvnn)"] = "Same as XWL:writeUnicodeString(snnvn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnv)"] = "Same as XWL:writeUnicodeString(snnn), with an extra argument for background colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnvn)"] = "Same as XWL:writeUnicodeString(snnnv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["readArray(xwl:nn)"] = "Reads an array's elements from a piece of memory. Strings and sub-tables (angles, vectors, matrices) are written as pointers to the actual data. Strings are written null-terminated"
E2Helper.Descriptions["writeCell(xwl:nn)"] = "Writes value into specified memory cell. Deprecated, use XWL[N] = X instead"
E2Helper.Descriptions["readCell(xwl:n)"] = "Returns contents of the specified memory cell. Deprecated, use XWL[N] instead"
E2Helper.Descriptions["readString(xwl:n)"] = "Reads a null-terminated string from the given address. Returns an empty string on failure"
E2Helper.Descriptions["writeArray(xwl:nr)"] = "Writes an array's elements into a piece of memory. Strings and sub-tables (angles, vectors, matrices) are written as pointers to the actual data. Strings are written null-terminated"
E2Helper.Descriptions["writeTable(xwl:nt)"] = "Same as writeArray, except it uses the numerically indexed variables of the table instead"
E2Helper.Descriptions["inputs(xwl:)"] = "Returns an array of all the inputs that XWL has without their types. Returns an empty array if it has none"
E2Helper.Descriptions["outputs(xwl:)"] = "Returns an array of all the outputs that XWL has without their types. Returns an empty array if it has none"
E2Helper.Descriptions["inputType(xwl:s)"] = "Returns the type of input that S is in lowercase. ( \"NORMAL\" is changed to \"number\" )"
E2Helper.Descriptions["outputType(xwl:s)"] = "Returns the type of output that S is in lowercase. ( \"NORMAL\" is changed to \"number\" )"
E2Helper.Descriptions["setXyz(xwl:v)"] = "Sets the X/Y/Z to the corresponding values in the vector"

-- Quaternions
E2Helper.Descriptions["comp()"] = "Returns complex zero"
E2Helper.Descriptions["comp(n)"] = "Converts a real number to complex (returns complex number with real part N and imaginary part 0)"
E2Helper.Descriptions["comp(nn)"] = "Returns a + b*i"
E2Helper.Descriptions["i()"] = "Returns the imaginary unit i"
E2Helper.Descriptions["i(n)"] = "Returns N*i"
E2Helper.Descriptions["abs(c)"] = "Returns the absolute value of C"
E2Helper.Descriptions["arg(c)"] = "Returns the argument of C"
E2Helper.Descriptions["conj(c)"] = "Returns the conjugate of C"
E2Helper.Descriptions["real(c)"] = "Returns the real part of C"
E2Helper.Descriptions["imag(c)"] = "Returns the imaginary part of C"
E2Helper.Descriptions["exp(c)"] = "Raises Euler's constant e to the power of C"
E2Helper.Descriptions["log(c)"] = "Calculates the natural logarithm of C"
E2Helper.Descriptions["log(cc)"] = "Calculates the logarithm of C2 to a complex base C"
E2Helper.Descriptions["log(nc)"] = "Calculates the logarithm of C to a real base N"
E2Helper.Descriptions["log2(c)"] = "Calculates the logarithm of C to base 2"
E2Helper.Descriptions["log10(c)"] = "Calculates the logarithm of C to base 10"
E2Helper.Descriptions["sqrt(c)"] = "Calculates the square root of C"
E2Helper.Descriptions["csqrt(n)"] = "Calculates the complex square root of the real number N"
E2Helper.Descriptions["sin(c)"] = "Calculates the sine of C"
E2Helper.Descriptions["cos(c)"] = "Calculates the cosine of C"
E2Helper.Descriptions["tan(c)"] = "Calculates the tangent of C"
E2Helper.Descriptions["cot(c)"] = "Calculates the cotangent of C"
E2Helper.Descriptions["sec(c)"] = "Calculates the secant of C"
E2Helper.Descriptions["csc(c)"] = "Calculates the cosecant of C"
E2Helper.Descriptions["asin(c)"] = "Calculates the inverse sine of C"
E2Helper.Descriptions["acos(c)"] = "Calculates the inverse cosine of C"
E2Helper.Descriptions["atan(c)"] = "Calculates the inverse tangent of C"
E2Helper.Descriptions["atan2(c)"] = "Calculates the principle value of C"
E2Helper.Descriptions["sinh(c)"] = "Calculates the hyperbolic sine of C"
E2Helper.Descriptions["cosh(c)"] = "Calculates the hyperbolic cosine of C"
E2Helper.Descriptions["tanh(c)"] = "Calculates the hyperbolic tangent of C"
E2Helper.Descriptions["coth(c)"] = "Calculates the hyperbolic cotangent of C"
E2Helper.Descriptions["sech(c)"] = "Calculates the hyperbolic secant of C"
E2Helper.Descriptions["csch(c)"] = "Calculates the hyperbolic cosecant of C"
E2Helper.Descriptions["toString(c)"] = "Formats C as a string"
E2Helper.Descriptions["toString(c:)"] = "The same as toString(C)"
E2Helper.Descriptions["quat()"] = "Creates a zero quaternion"
E2Helper.Descriptions["quat(n)"] = "Creates a quaternion with real part equal to N"
E2Helper.Descriptions["quat(c)"] = "Creates a quaternion with real and \"i\" parts equal to C"
E2Helper.Descriptions["quat(v)"] = "Converts a vector to a quaternion (returns V.x*i + V.y*j + V.z*k)"
E2Helper.Descriptions["quat(nnnn)"] = "Returns N+N2i+N3j+N4k"
E2Helper.Descriptions["quat(a)"] = "Converts A to a quaternion"
E2Helper.Descriptions["quat(vv)"] = "Creates a quaternion given forward (V) and up (V2) vectors"
E2Helper.Descriptions["quat(e)"] = "Converts angle of E to a quaternion"
E2Helper.Descriptions["qi()"] = "Returns quaternion i"
E2Helper.Descriptions["qi(n)"] = "Returns quaternion N*i"
E2Helper.Descriptions["qj()"] = "Returns j"
E2Helper.Descriptions["qj(n)"] = "Returns N*j"
E2Helper.Descriptions["qk()"] = "Returns k"
E2Helper.Descriptions["qk(n)"] = "Returns N*k"
E2Helper.Descriptions["dot(q:q)"] = "Returns dot product of Q with Q2"
E2Helper.Descriptions["abs(q)"] = "Returns absolute value of Q"
E2Helper.Descriptions["conj(q)"] = "Returns the conjugate of Q"
E2Helper.Descriptions["inv(q)"] = "Returns the inverse of Q"
E2Helper.Descriptions["real(q:)"] = "Returns the real component of the quaternion"
E2Helper.Descriptions["i(q:)"] = "Returns the i component of the quaternion"
E2Helper.Descriptions["j(q:)"] = "Returns the j component of the quaternion"
E2Helper.Descriptions["k(q:)"] = "Returns the k component of the quaternion"
E2Helper.Descriptions["exp(q)"] = "Raises Euler's constant e to the power Q"
E2Helper.Descriptions["log(q)"] = "Calculates natural logarithm of Q"
E2Helper.Descriptions["qMod(q)"] = "Changes quaternion Q so that the represented rotation is by an angle between 0 and 180 degrees (by coder0xff)"
E2Helper.Descriptions["nlerp(qqn)"] = "Performs linear interpolation between Q and Q2. Returns normalized Q for N=0, Q2 for N=1."
E2Helper.Descriptions["slerp(qqn)"] = "Performs spherical linear interpolation between Q and Q2. Returns Q for N=0, Q2 for N=1"
E2Helper.Descriptions["forward(q:)"] = "Returns vector pointing forward for Q"
E2Helper.Descriptions["right(q:)"] = "Returns vector pointing right for Q"
E2Helper.Descriptions["up(q:)"] = "Returns vector pointing up for Q"
E2Helper.Descriptions["normalized(q:)"] = "Returns new normalized quaternion for Q"
E2Helper.Descriptions["qRotation(vn)"] = "Returns quaternion for rotation about axis V by angle N"
E2Helper.Descriptions["qRotation(v)"] = "Construct a quaternion from the rotation vector V. Vector direction is axis of rotation, magnitude is angle in degress (by coder0xff)"
E2Helper.Descriptions["rotationAngle(q)"] = "Returns the angle of rotation in degrees (by coder0xff)"
E2Helper.Descriptions["rotationAxis(q)"] = "Returns the axis of rotation (by coder0xff)"
E2Helper.Descriptions["rotationVector(q)"] = "Returns the rotation vector - rotation axis where magnitude is the angle of rotation in degress (by coder0xff)"
E2Helper.Descriptions["vec(q)"] = "Converts Q to a vector by dropping the real component"
E2Helper.Descriptions["matrix(q)"] = "Converts Q to a transformation matrix"
E2Helper.Descriptions["toAngle(q:)"] = "Returns angle represented by Q"
E2Helper.Descriptions["toString(q)"] = "Formats Q as a string"
E2Helper.Descriptions["toString(q:)"] = "Formats Q as a string"

-- Selfaware
E2Helper.Descriptions["first()"] = "Returns 1 if the expression was spawned or reset"
E2Helper.Descriptions["duped()"] = "Returns 1 if the expression was duplicated"
E2Helper.Descriptions["dupefinished()"] = "Returns 1 when the contraption has finished duping."
E2Helper.Descriptions["inputClk()"] = "Returns 1 if the expression was triggered by an input"
E2Helper.Descriptions["last()"] = "Returns 1 if it is being called on the last execution of the expression gate before it is removed or reset. This execution must be requested with the runOnLast(1) command"
E2Helper.Descriptions["removing()"] = "Returns 1 if this is the last() execution and caused by the entity being removed"
E2Helper.Descriptions["ops()"] = "Returns how many ops are used every execution on average"
E2Helper.Descriptions["opcounter()"] = "Returns how many ops have been used so far in this execution plus the amount of hard quota used"
E2Helper.Descriptions["minquota()"] = "The ops left before soft quota is used up"
E2Helper.Descriptions["maxquota()"] = "The ops left before hard quota is exceeded and the expression shuts down"
E2Helper.Descriptions["softQuota()"] = "Returns the size of the soft quota"
E2Helper.Descriptions["hardQuota()"] = "Returns the size of the hard quota"
E2Helper.Descriptions["timeQuota()"] = "Returns the time quota in seconds"
E2Helper.Descriptions["perf()"] = "If used as a while loop condition, stabilizes the expression around hardquota used"
E2Helper.Descriptions["perf(n)"] = "If used as a while loop condition, stabilizes the expression around specified number (in %)"
E2Helper.Descriptions["entity()"] = "Gets the entity of the expression"
E2Helper.Descriptions["getName(e:)"] = "Get the name of another E2, compatible entity or wiremod component name"
E2Helper.Descriptions["setName(s)"] = "Set the name of the E2"
E2Helper.Descriptions["setName(e:s)"] = "Set the name of another E2 or component name for other entities"
E2Helper.Descriptions["cpuUsage()"] = "Returns the average time per tick the server spends running this E2, in seconds (multiply it by 1000000 to get the same value as is displayed on the E2 overlay)"
E2Helper.Descriptions["cpuUsage(e:)"] = "Returns the average time per tick the server spends running the specified E2, in seconds (multiply it by 1000000 to get the same value as is displayed on the E2 overlay)"
E2Helper.Descriptions["error(s)"] = "Shuts down the E2 with specified script error message"
E2Helper.Descriptions["assert(n)"] = "If the argument is 0, shut down the E2 with an error message"
E2Helper.Descriptions["assert(ns)"] = "If the first argument is 0, shut down the E2 with the given error message string"
E2Helper.Descriptions["reset()"] = "Reset the expression itself as if it was just spawned, stops execution"
E2Helper.Descriptions["exit()"] = "Stops the execution of any code after it"
E2Helper.Descriptions["getCode()"] = "Returns the code of the E2 as a string"
E2Helper.Descriptions["getCodeIncludes()"] = "Returns a table where indices (keys) are names of included files and entries are their codes"
E2Helper.Descriptions["remoteSetCode(e:s)"] = "Sets the E2's code with main file"
E2Helper.Descriptions["remoteSetCode(e:st)"] = "Sets the E2's code with main file & includes"
E2Helper.Descriptions["remoteUpload(e:s)"] = "Uploads the code from your computer to the server"
E2Helper.Descriptions["getCodeIncludes()"] = "Returns a table where indices (keys) are names of included files and entries are their codes"
E2Helper.Descriptions["hash()"] = "Returns a numerical hash using the code of the E2 itself (Including comments)"
E2Helper.Descriptions["hash(s)"] = "Returns a numerical hash using the string specified"
E2Helper.Descriptions["hashNoComments()"] = "Returns a numerical hash using the code of the E2 itself (Excluding comments)"
E2Helper.Descriptions["concmd(s)"] = "Takes a string and executes it in console. Returns 1 if it succeeded and 0 if it failed.The client must enable this in the console with \"wire_expression2_concmd 1\". \"wire_expression2_concmd_whitelist\" allows you to choose which commands can be used.[http://www.wiremod.com/forum/151800-post12.html]"
E2Helper.Descriptions["ioInputEntity(s)"] = "Returns the entity the input S is wired to"
E2Helper.Descriptions["ioOutputEntities(s)"] = "Returns an array of all entities wired to the output S"
E2Helper.Descriptions["runOnLast(n)"] = "If set to 1, the chip will run once when it is removed, setting the last() flag when it does"
E2Helper.Descriptions["selfDestruct()"] = "Removes the expression"
E2Helper.Descriptions["selfDestructAll()"] = "Removes the expression and all constrained props"

-- Debug
E2Helper.Descriptions["playerCanPrint()"] = "Returns whether or not the next print-message will be printed or omitted by antispam"
E2Helper.Descriptions["printDriver(e:s)"] = "Posts a string to the chat of Es driver. Returns 1 if the text was printed, 0 if not"
E2Helper.Descriptions["hintDriver(e:sn)"] = "Displays a hint popup to the driver of vehicle E, with message S for N seconds (N being clamped between 0.7 and 7). Same return value as printDriver"
E2Helper.Descriptions["printDriver(e:ns)"] = "Same as EE:printDriver(S), but can make the text show up in different places. N can be one of the following: _HUD_PRINTCENTER, _HUD_PRINTCONSOLE, _HUD_PRINTNOTIFY, _HUD_PRINTTALK"
E2Helper.Descriptions["hint(sn)"] = "Displays a hint popup with message S for N seconds (N being clamped between 0.7 and 7)"
E2Helper.Descriptions["print(ns)"] = "Same as print(S), but can make the text show up in different places. N can be one of the following: _HUD_PRINTCENTER, _HUD_PRINTCONSOLE, _HUD_PRINTNOTIFY, _HUD_PRINTTALK"
E2Helper.Descriptions["print(...)"] = "Prints all arguments to the chat area, seperated by a tab. Automatically does toString for you (Can print arrays but not tables). Works just like lua's print"
E2Helper.Descriptions["printColor(...)"] = "Works like chat.AddText(...). Parameters can be any amount and combination of numbers, strings, player entities, color vectors (both 3D and 4D)"
E2Helper.Descriptions["printColorC(...)"] = "Works like MsgC. Parameters can be any amount and combination of numbers, strings, player entities, color vectors (both 3D and 4D)"
E2Helper.Descriptions["printColor(r)"] = "Like printColor(...), except taking an array containing all the parameters"
E2Helper.Descriptions["printColorC(r)"] = "Like printColorC(...), except taking an array containing all the parameters"
E2Helper.Descriptions["printColorDriver(e:...)"] = "Like printColor but prints to the driver of a specified vehicle"
E2Helper.Descriptions["printColorDriver(e:r)"] = "Like printColorDriver but takes an array containing all the parameters"
E2Helper.Descriptions["printTable(t)"] = "Prints a table like the lua function PrintTable does, except to the chat area"
E2Helper.Descriptions["printTable(r)"] = "Prints an array like the lua function PrintTable does, except to the chat area"

-- Time
E2Helper.Descriptions["tickClk()"] = "Returns 1 if the current execution was caused by \"runOnTick\""
E2Helper.Descriptions["tickInterval()"] = "Returns the time (in seconds) between each server tick"
E2Helper.Descriptions["curtime()"] = "Returns the current game time since server-start in seconds"
E2Helper.Descriptions["realtime()"] = "Returns the current real time since server-start in seconds"
E2Helper.Descriptions["systime()"] = "Returns a highly accurate time (also in seconds) since the server was started. Ideal for benchmarking"
E2Helper.Descriptions["clk(s)"] = "Returns 1 if the current execution was caused by the inserted name"
E2Helper.Descriptions["clk()"] = "Returns 1 if the current execution was caused by the interval"
E2Helper.Descriptions["clkName()"] = "Returns the name of the timer that caused current execution"
E2Helper.Descriptions["getTimers()"] = "Returns an array of all timers used in the E2"
E2Helper.Descriptions["interval(n)"] = "Sets a one-time timer with name \"interval\" and delay in milliseconds (minimum delay for timers is 10ms)"
E2Helper.Descriptions["runOnTick(n)"] = "If set to 1, the expression will execute once every game tick"
E2Helper.Descriptions["timer(sn)"] = "Sets a one-time timer with entered name and delay in milliseconds"
E2Helper.Descriptions["stoptimer(s)"] = "Stops a timer, can stop interval with stoptimer(\"interval\")"
E2Helper.Descriptions["stopAllTimers()"] = "Stops all timers"

-- Unit conversion
E2Helper.Descriptions["toUnit(sn)"] = "Converts default garrysmod units to specified units"
E2Helper.Descriptions["fromUnit(sn)"] = "Converts specified units to default garrysmod units"
E2Helper.Descriptions["convertUnit(ssn)"] = "Converts between two units"

-- Steam ID conversion
E2Helper.Descriptions["steamIDFrom64(s)"] = "Converts Steam Community ID to Steam ID"
E2Helper.Descriptions["steamIDTo64(s)"] = "Converts Steam ID to Steam Community ID"

-- Server information
E2Helper.Descriptions["map()"] = "Returns the current map name"
E2Helper.Descriptions["hostname()"] = "Returns the Name of the server"
E2Helper.Descriptions["hostip()"] = "Returns the IP of the server"
E2Helper.Descriptions["isLan()"] = "Returns 1 if lan mode is enabled"
E2Helper.Descriptions["gamemode()"] = "Returns the name of the current gamemode"
E2Helper.Descriptions["gravity()"] = "Returns gravity"
E2Helper.Descriptions["ping(e:)"] = "Returns the latency for player E"
E2Helper.Descriptions["isSinglePlayer()"] = "Returns 1 if singleplayer, 0 if multiplayer"
E2Helper.Descriptions["isDedicated()"] = "Returns 1 if server is dedicated, 0 if listen"
E2Helper.Descriptions["players()"] = "Returns an array containing all players on the server"
E2Helper.Descriptions["playersAdmins()"] = "Returns an array containing all admins on the server"
E2Helper.Descriptions["playersSuperAdmins()"] = "Returns an array containing all super admins on the server"
E2Helper.Descriptions["numPlayers()"] = "Returns the number of players currently in the server"
E2Helper.Descriptions["maxPlayers()"] = "Returns the max number of players allowed in the server"
E2Helper.Descriptions["maxOfType(s)"] = "Returns the maximum allowed of a certain type of entity, i.e. maxOfType(\"wire_thrusters\"). Returns 0 if you enter an invalid parameter"
E2Helper.Descriptions["playerDamage()"] = "Returns 1 if player vs player damage is enabled on the server"
E2Helper.Descriptions["convar(s)"] = "Give a console command such as \"name\" and it returns the set value"
E2Helper.Descriptions["convarnum(s)"] = "Give a console command such as \"sbox_godmode\" and it returns the set value"
E2Helper.Descriptions["time()"] = "Returns the time in seconds"
E2Helper.Descriptions["time(s)"] = "Returns numerical time/date info from the server. Possible arguments: \"year\", \"month\", \"day\", \"hour\", \"min\", \"sec\", \"wday\" (weekday, Sunday is 1), \"yday\" (day of the year), and \"isdst\" (daylight saving flag 0/1)"
E2Helper.Descriptions["time(t)"] = "Attempts to construct the time from the data in the given table (same as lua's os.time). The table structure must be the same as in the date() functions. If any values are missing or of the wrong type, that value is ignored (it will be nil)"
E2Helper.Descriptions["date()"] = "Returns the server's current time and date"
E2Helper.Descriptions["dateUTC()"] = "Returns the server's current time and date in UTC"
E2Helper.Descriptions["date(n)"] = "Returns the specified unix time"
E2Helper.Descriptions["dateUTC(n)"] = "Returns the specified unix time in UTC"
E2Helper.Descriptions["maxFrictionMass()"] = "Returns how much friction influences props throughout the server"
E2Helper.Descriptions["minFrictionMass()"] = "Returns how much friction influences props throughout the server"

-- Constraints
E2Helper.Descriptions["getConstraints(e:)"] = "Returns an array with all entities directly or indirectly constrained to E, except E itself. Deprecated, use E:getConnectedEntities(...) instead."
E2Helper.Descriptions["getConnectedEntities(e:...)"] = "Returns an array with all entities directly or indirectly constrained or parented to E, including E itself."
E2Helper.Descriptions["getConnectedEntities(e:r)"] = "Returns an array with all entities directly or indirectly constrained or parented to E, including E itself."
E2Helper.Descriptions["hasConstraints(e:)"] = "Returns the number of the constraints E has"
E2Helper.Descriptions["hasConstraints(e:s)"] = "Returns the number of the constraints E has with the given constraint type"
E2Helper.Descriptions["isConstrained(e:)"] = "Returns 1 if E has constraints, 0 if not"
E2Helper.Descriptions["isWeldedTo(e:)"] = "Returns the first entity E was welded to"
E2Helper.Descriptions["isWeldedTo(e:n)"] = "Returns the Nth entity E was welded to"
E2Helper.Descriptions["isConstrainedTo(e:)"] = "Returns the first entity E was constrained to"
E2Helper.Descriptions["isConstrainedTo(e:n)"] = "Returns the Nth entity E was constrained to"
E2Helper.Descriptions["isConstrainedTo(e:s)"] = "Returns the first entity E was constrained to with the given constraint type (see the types list below)"
E2Helper.Descriptions["isConstrainedTo(e:sn)"] = "Returns the Nth entity E was constrained to with the given constraint type (see the types list below)"
E2Helper.Descriptions["parent(e:)"] = "Returns the entity E is parented to"
E2Helper.Descriptions["parentBone(e:)"] = "Returns the bone E is parented to"
E2Helper.Descriptions["children(e:)"] = "Returns an array containing all the children of the entity - that is, every entity whose parent is this entity"

-- Chat
E2Helper.Descriptions["chatClk()"] = "Returns 1 if the chip is being executed because of a chat event. Returns 0 otherwise"
E2Helper.Descriptions["chatClk(e)"] = "Returns 1 if the chip is being executed because of a chat event by player E. Returns 0 otherwise"
E2Helper.Descriptions["lastSpoke()"] = "Returns the last player to speak"
E2Helper.Descriptions["lastSaid()"] = "Returns the last message in the chat log"
E2Helper.Descriptions["lastSaidWhen()"] = "Returns the time the last message was sent"
E2Helper.Descriptions["lastSaidTeam()"] = "Returns 1 if the last message was sent in the team chat, 0 otherwise"
E2Helper.Descriptions["lastSaid(e:)"] = "Returns what the player E last said"
E2Helper.Descriptions["lastSaidWhen(e:)"] = "Returns when the given player last said something"
E2Helper.Descriptions["lastSaidTeam(e:)"] = "Returns 1 if the last message was sent in the team chat, 0 otherwise"
E2Helper.Descriptions["hideChat(n)"] = "Hides the chat messages written by E2 owner"
E2Helper.Descriptions["runOnChat(n)"] = "If set to 0, the chip will no longer run on chat events, otherwise it makes this chip execute when someone chats. Only needs to be called once, not in every execution"

-- Color
E2Helper.Descriptions["setBodygroup(e:nn)"] = "Group ID, Group SubID\nSets the bodygroups of the given entity"
E2Helper.Descriptions["getBodygroups(e:n)"] = "Group ID\nReturns the number of bodygroups in the Group ID of the given entity"
E2Helper.Descriptions["setColor(nnn)"] = "Sets the color of the E2 chip"
E2Helper.Descriptions["setColor(e:vn)"] = "Sets the color (as vector) and alpha (as number) of the entity"
E2Helper.Descriptions["setColor(e:xv4)"] = "Sets the color and alpha (as 4D vector) of the entity"
E2Helper.Descriptions["setColor(e:nnn)"] = "Sets the color of the entity"
E2Helper.Descriptions["setColor(e:v)"] = "Sets the color of the entity"
E2Helper.Descriptions["setColor(e:nnnn)"] = "Sets the color and alpha of the entity"
E2Helper.Descriptions["getColor(e:)"] = "Returns the color of an entity as a vector (R,G,B)"
E2Helper.Descriptions["getColor4(e:)"] = "Returns the color of an entity as a 4D vector (R,G,B,A)"
E2Helper.Descriptions["setAlpha(e:n)"] = "Sets the alpha of an entity"
E2Helper.Descriptions["getAlpha(e:)"] = "Returns the alpha of an entity"
E2Helper.Descriptions["setMaterial(e:s)"] = "Sets the material of an entity"
E2Helper.Descriptions["getMaterial(e:)"] = "Returns the material of an entity"
E2Helper.Descriptions["setSkin(e:n)"] = "Sets the skin of an entity"
E2Helper.Descriptions["getSkin(e:)"] = "Gets Es current skin number"
E2Helper.Descriptions["getSkinCount(e:)"] = "Gets Es number of skins"
E2Helper.Descriptions["setRenderMode(e:n)"] = "Sets the render mode of the entity (0 = Normal, 1 = TransColor, 2 = TransTexture, 3 = Glow, 4 = TransAlpha, 5 = TransAdd, 6 = Enviromental, 7 = TransAddFrameBlend, 8 = TransAlphaAdd, 9 = WorldGlow, 10 = None)"
E2Helper.Descriptions["getPlayerColor(e:)"] = "Returns the player's model color as a vector (R,G,B)"
E2Helper.Descriptions["getWeaponColor(e:)"] = "Returns the player's weapon color as a vector (R,G,B)"
E2Helper.Descriptions["hsl2rgb(v)"] = "Converts V from the HSL color space to the RGB color space"
E2Helper.Descriptions["hsl2rgb(nnn)"] = "Converts N,N,N from the HSL color space to the RGB color space"
E2Helper.Descriptions["hsv2rgb(v)"] = "Converts V from the HSV color space to the RGB color space"
E2Helper.Descriptions["hsv2rgb(nnn)"] = "Converts N,N,N from the HSV color space to the RGB color space"
E2Helper.Descriptions["rgb2hsv(v)"] = "Converts V from the RGB to the HSV color space"
E2Helper.Descriptions["rgb2hsv(nnn)"] = "Converts N,N,N from the RGB to the HSV color space"
E2Helper.Descriptions["rgb2digi(vn)"] = "Converts the RGB vector V to a number in digital screen format. N Specifies a mode, either 0, 2 or 3, corresponding to Digital Screen color modes"
E2Helper.Descriptions["rgb2digi(nnnn)"] = "Converts the RGB color (N,N2,N3) to a number in digital screen format. N4 Specifies a mode, either 0, 2 or 3, corresponding to Digital Screen color modes"
E2Helper.Descriptions["rgb2hsl(v)"] = "Converts V from RGB color space to the HSL color space"
E2Helper.Descriptions["rgb2hsl(nnn)"] = "Converts N,N,N from RGB color space to the HSL color space"

-- Entity Discovery
E2Helper.Descriptions["findUpdateRate()"] = "Returns the minimum delay between entity find events on a chip"
E2Helper.Descriptions["findPlayerUpdateRate()"] = "Returns the minimum delay between entity find events per player"
E2Helper.Descriptions["findCanQuery()"] = "Returns 1 if find functions can be used, 0 otherwise"
E2Helper.Descriptions["findInSphere(vn)"] = "Finds entities in a sphere around V with a radius of N, returns the number found after filtering"
E2Helper.Descriptions["findInCone(vvnn)"] = "Like findInSphere but with a http://mathworld.wolfram.com/SphericalCone.html Spherical cone, arguments are for position, direction, length, and degrees (works now)"
E2Helper.Descriptions["findInBox(vv)"] = "Like findInSphere but with a globally aligned box, the arguments are the diagonal corners of the box"
E2Helper.Descriptions["findByName(s)"] = "Find all entities with the given name"
E2Helper.Descriptions["findByModel(s)"] = "Find all entities with the given model"
E2Helper.Descriptions["findByClass(s)"] = "Find all entities with the given class"
E2Helper.Descriptions["findPlayerByName(s)"] = "Returns the player with the given name, this is an exception to the rule"
E2Helper.Descriptions["findPlayerBySteamID(s)"] = "Returns the player with the given SteamID32"
E2Helper.Descriptions["findPlayerBySteamID64(s)"] = "Returns the player with the given SteamID64"
E2Helper.Descriptions["findAllowBlockedClasses(n)"] = "Allows or disallows finding entities on the hardcoded class blocklist, including classes like \"prop_dynamic\", \"physgun_beam\" and \"gmod_ghost\"."
E2Helper.Descriptions["findResult(n)"] = "Returns the indexed entity from the previous find event (valid parameters are 1 to the number of entities found)"
E2Helper.Descriptions["findClosest(v)"] = "Returns the closest entity to the given point from the previous find event"
E2Helper.Descriptions["findToArray()"] = "Formats the query as an array, R[Index,entity] to get an entity"
E2Helper.Descriptions["find()"] = "Equivalent to findResult(1)"
E2Helper.Descriptions["findCount()"] = "Returns the remaining available find calls"
E2Helper.Descriptions["findMax()"] = "Returns the maximum number of finds per E2"
E2Helper.Descriptions["findSortByDistance(v)"] = "Sorts the entities from the last find event, index 1 is the closest to point V, returns the number of entities in the list"
E2Helper.Descriptions["findClipToClass(s)"] = "Filters the list of entities by removing all entities that are NOT of this class"
E2Helper.Descriptions["findClipFromClass(s)"] = "Filters the list of entities by removing all entities that are of this class"
E2Helper.Descriptions["findClipToEntities(r)"] = "Filters the list of entities by removing all entities that are NOT in this array"
E2Helper.Descriptions["findClipFromEntities(r)"] = "Filters the list of entities by removing all entities that are in this array"
E2Helper.Descriptions["findClipToEntity(e)"] = "Filters the list of entities by removing all except this entity"
E2Helper.Descriptions["findClipFromEntity(e)"] = "Filters the list of entities by removing this entity"
E2Helper.Descriptions["findClipToModel(s)"] = "Filters the list of entities by removing all entities that do NOT have this model"
E2Helper.Descriptions["findClipFromModel(s)"] = "Filters the list of entities by removing all entities that do have this model"
E2Helper.Descriptions["findClipToName(s)"] = "Filters the list of entities by removing all entities that do NOT have this name"
E2Helper.Descriptions["findClipFromName(s)"] = "Filters the list of entities by removing all entities that do have this name"
E2Helper.Descriptions["findClipToSphere(vn)"] = "Filters the list of entities by removing all entities NOT within the specified sphere (center, radius)"
E2Helper.Descriptions["findClipFromSphere(vn)"] = "Filters the list of entities by removing all entities within the specified sphere (center, radius)"
E2Helper.Descriptions["findClipToRegion(vv)"] = "Filters the list of entities by removing all entities NOT on the positive side of the defined plane. (Plane origin, vector perpendicular to the plane) You can define any convex hull using this"
E2Helper.Descriptions["findClipFromBox(vv)"] = "Filters the list of entities by removing all entities within the specified box"
E2Helper.Descriptions["findClipToBox(vv)"] = "Filters the list of entities by removing all entities NOT within the specified box"
E2Helper.Descriptions["findAllowClass(s)"] = "Remove entities with this class (or partial class name) from the blacklist"
E2Helper.Descriptions["findAllowEntities(r)"] = "Remove all entities in array from the blacklist"
E2Helper.Descriptions["findAllowEntity(e)"] = "Remove entity from the blacklist"
E2Helper.Descriptions["findAllowModel(s)"] = "Remove entities with this model (or partial model name) from the blacklist"
E2Helper.Descriptions["findAllowPlayer(s)"] = "Remove player with specified name from the entity blacklist"
E2Helper.Descriptions["findAllowPlayer(e)"] = "Remove specified player from the entity blacklist"
E2Helper.Descriptions["findAllowPlayerProps(s)"] = "Remove entities owned by player with specified name from the blacklist"
E2Helper.Descriptions["findAllowPlayerProps(e)"] = "Remove entities owned by specified player from the blacklist"
E2Helper.Descriptions["findClearBlackClassList()"] = "Clear all entries from the class blacklist"
E2Helper.Descriptions["findClearBlackEntityList()"] = "Clear all entries from the entity blacklist"
E2Helper.Descriptions["findClearBlackList()"] = "Clear all entries from the entire blacklist"
E2Helper.Descriptions["findClearBlackModelList()"] = "Clear all entries from the model blacklist"
E2Helper.Descriptions["findClearBlackPlayerPropList()"] = "Clear all entries from the prop owner blacklist"
E2Helper.Descriptions["findClearWhiteClassList()"] = "Clear all entries from the class whitelist"
E2Helper.Descriptions["findClearWhiteEntityList()"] = "Clear all entries from the player whitelist"
E2Helper.Descriptions["findClearWhiteList()"] = "Clear all entries from the entire whitelist"
E2Helper.Descriptions["findClearWhiteModelList()"] = "Clear all entries from the model whitelist"
E2Helper.Descriptions["findClearWhitePlayerPropList()"] = "Clear all entries from the prop owner whitelist"
E2Helper.Descriptions["findDisallowClass(s)"] = "Remove entities with this class (or partial class name) from the whitelist"
E2Helper.Descriptions["findDisallowEntities(r)"] = "Remove all entities in array from the whitelist"
E2Helper.Descriptions["findDisallowEntity(e)"] = "Remove entity from the whitelist"
E2Helper.Descriptions["findDisallowModel(s)"] = "Remove entities with this model (or partial model name) from the whitelist"
E2Helper.Descriptions["findDisallowPlayer(s)"] = "Remove player with specified name from the entity whitelist"
E2Helper.Descriptions["findDisallowPlayer(e)"] = "Remove specified player from the entity whitelist"
E2Helper.Descriptions["findDisallowPlayerProps(s)"] = "Remove entities owned by player with specified name from the whitelist"
E2Helper.Descriptions["findDisallowPlayerProps(e)"] = "Remove entities owned by specified player from the whitelist"
E2Helper.Descriptions["findExcludeClass(s)"] = "Exclude entities with this class (or partial class name) from future finds"
E2Helper.Descriptions["findExcludeEntities(r)"] = "Exclude all entities in array from future finds"
E2Helper.Descriptions["findExcludeEntity(e)"] = "Exclude entity from future finds"
E2Helper.Descriptions["findExcludeModel(s)"] = "Exclude entities with this model (or partial model name) from future finds"
E2Helper.Descriptions["findExcludePlayer(s)"] = "Exclude player with specified name from future finds (put it on the entity blacklist)"
E2Helper.Descriptions["findExcludePlayer(e)"] = "Exclude specified player from future finds (put it on the entity blacklist)"
E2Helper.Descriptions["findExcludePlayerProps(s)"] = "Exclude entities owned by player with specified name from future finds"
E2Helper.Descriptions["findExcludePlayerProps(e)"] = "Exclude entities owned by specified player from future finds"
E2Helper.Descriptions["findIncludeClass(s)"] = "Include entities with this class (or partial class name) in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeEntities(r)"] = "Include all entities in array in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeEntity(e)"] = "Include entity in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeModel(s)"] = "Include entities with this model (or partial model name) in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludePlayer(s)"] = "Include player with specified name in future finds, and remove other entities not in the entity whitelist"
E2Helper.Descriptions["findIncludePlayer(e)"] = "Include specified player in future finds, and remove other entities not in the entity whitelist"
E2Helper.Descriptions["findIncludePlayerProps(s)"] = "Include entities owned by player with specified name in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludePlayerProps(e)"] = "Include entities owned by specified player in future finds, and remove others not in the whitelist"

-- Ranger
E2Helper.Descriptions["rangerFlags()"] = "Returns the ranger flags as a string"
E2Helper.Descriptions["rangerFlags(s)"] = "Sets the ranger flags. S can be any combination of I=ignore world, W=hit water, E=hit entities and Z=default to zero"
E2Helper.Descriptions["rangerFilter(e)"] = "Feed entities you don't want the trace to hit"
E2Helper.Descriptions["rangerFilter(r)"] = "Feed an array of entities you don't want the trace to hit"
E2Helper.Descriptions["ranger(n)"] = "You input max range, it returns ranger data"
E2Helper.Descriptions["ranger(nnn)"] = "Same as above with added inputs for X and Y skew"
E2Helper.Descriptions["rangerAngle(nnn)"] = "You input the distance, x-angle and y-angle (both in degrees) it returns ranger data"
E2Helper.Descriptions["rangerOffset(vv)"] = "You input two vector points, it returns ranger data"
E2Helper.Descriptions["rangerOffset(nvv)"] = "You input the range, a position vector, and a direction vector and it returns ranger data"
E2Helper.Descriptions["ranger(en)"] = "Same as ranger(distance): You input max range, it returns ranger data, only used on another entity"
E2Helper.Descriptions["rangerHull(nv)"] = "Inputs: Distance, Hull BoxSize"
E2Helper.Descriptions["rangerHull(nvv)"] = "Input: Distance, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerHull(nnnv)"] = "Inputs: Distance, X Skew, Y Skew, Hull BoxSize"
E2Helper.Descriptions["rangerHull(nnnvv)"] = "Inputs: Distance, X Skew, Y Skew, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerAngleHull(nnnv)"] = "Inputs: Distance, X Angle, Y Angle, Hull BoxSize"
E2Helper.Descriptions["rangerAngleHull(nnnvv)"] = "Inputs: Distance, X Angle, Y Angle, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(vvv)"] = "Inputs: StartPos, EndPos, Hull BoxSize"
E2Helper.Descriptions["rangerOffsetHull(vvvv)"] = "Inputs: StartPos, EndPos, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(nvvv)"] = "Inputs: Distance, StartPos, Direction, Hull BoxSize"
E2Helper.Descriptions["rangerOffsetHull(nvvvv)"] = "Inputs: Distance, StartPos, Direction, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(evv)"] = "Use entity collision box for the ranger. Inputs: Entity, StartPos, EndPos"
E2Helper.Descriptions["distance(xrd:)"] = "Outputs the distance from the rangerdata input, else depends on rangerDefault"
E2Helper.Descriptions["position(xrd:)"] = "Outputs the position of the input ranger data trace IF it hit anything, else returns (0,0,0)"
E2Helper.Descriptions["fraction(xrd:)"] = "Returns a number between 0-1 which represents the percentage of the distance between the start & hit position of the trace. StartPos + (EndPos-StartPos):normalized() * RD:fraction() * (EndPos-StartPos):Length() is equal to RD:pos()"
E2Helper.Descriptions["entity(xrd:)"] = "Returns the entity of the input ranger data trace IF it hit an entity, else returns nil"
E2Helper.Descriptions["bone(xrd:)"] = "Returns the bone of the input ranger data trace IF it hit a bone, else returns nil"
E2Helper.Descriptions["hit(xrd:)"] = "Returns 1 if the input ranger data hit anything and 0 if it didn't"
E2Helper.Descriptions["hitNormal(xrd:)"] = "Outputs a normalized vector perpendicular to the surface the ranger is pointed at"
E2Helper.Descriptions["hitGroup(xrd:)"] = "Returns the hit group (ie chest, face, left arm, right leg, etc)"
E2Helper.Descriptions["hitSky(xrd:)"] = "Returns 1 if the trace hit the sky, 0 otherwise"
E2Helper.Descriptions["hitTexture(xrd:)"] = "Returns the texture of the surface the ranger is pointed at"
E2Helper.Descriptions["hitWorld(xrd:)"] = "Returns 1 if the trace hit the world, 0 otherwise"
E2Helper.Descriptions["distanceLeftSolid(xrd:)"] = "Returns the distance between the position at which the trace left the world and the trace's Start Position"
E2Helper.Descriptions["positionLeftSolid(xrd:)"] = "Returns the position at which the trace left the world, if it was started inside the world. Else return the trace's Start Position"
E2Helper.Descriptions["fractionLeftSolid(xrd:)"] = "Same as RD:fraction() except it represents the distance between the start position and the LeftSolid position"
E2Helper.Descriptions["startSolid(xrd:)"] = "Returns 1 if the trace was started inside the world, else 0"
E2Helper.Descriptions["matType(xrd:)"] = "Returns the material type (ie wood, metal, dirt, flesh, etc)"
E2Helper.Descriptions["noranger()"] = "Returns an invalid ranger"
E2Helper.Descriptions["pos(xrd:)"] = "Returns the hit position. The difference between this function and RD:position() is that if you start the trace inside the world, RD:position() will return the position at which the trace EXITS the world. RD:pos(), however, will continue on and return the hit position outside the wall you started the trace in"
E2Helper.Descriptions["rangerDefaultZero(n)"] = "If given any value other than 0 it will default the distance data to zero when nothing is hit"
E2Helper.Descriptions["rangerHitEntities(n)"] = "Default is 1, if value is given as 0 it will ignore entities"
E2Helper.Descriptions["rangerHitWater(n)"] = "Default is 0, if any other value is given it will hit water"
E2Helper.Descriptions["rangerIgnoreWorld(n)"] = "Default is 0, if any other value is given it will ignore world"
E2Helper.Descriptions["rangerPersist(n)"] = "Passing 0 (the default) resets all ranger flags and filters every execution and after calling ranger/rangerOffset. Passing anything else will make the flags and filters persist until they're changed again"
E2Helper.Descriptions["rangerReset()"] = "Resets all ranger flags and filters"
E2Helper.Descriptions["toTable(xrd:)"] = "Converts the trace data into an E2-style table and returns it. Remember that this returns the raw data, so for matType and hitGroup, it is recommend that you use the functions instead of this table"

-- NPCs
E2Helper.Descriptions["npcGetTarget(e:)"] = "Returns what the npc is currently targeting"
E2Helper.Descriptions["npcRelationship(e:esn)"] = "Will set the NPC's relationship to the specified entity to the S input, priority N. Priority is any number between 0 and 999. The relationship string can be either \"like\", \"neutral\", \"hate\" or \"fear\". Same goes for all other relationship functions"
E2Helper.Descriptions["npcRelationship(e:ssn)"] = "Same as E:npcRelationship(entity,string,number), but sets relationship to an entire class specified by the first string. Example: \"npc_manhack\", \"prop_physics\""
E2Helper.Descriptions["npcRelationshipByOwner(e:esn)"] = "Sets the NPC's relationship to all currently existing NPCs owned by player E. Returns number of entities added to relationships"
E2Helper.Descriptions["npcDisp(e:e)"] = "Returns the NPC's relationship to entity E"
E2Helper.Descriptions["npcAttack(e:)"] = "Tells the NPC to use their melee attack"
E2Helper.Descriptions["npcFace(e:v)"] = "This will rotate the NPC to face position V. This is purely aesthetic and can't be used to aim their weapon"
E2Helper.Descriptions["npcGiveWeapon(e:)"] = "Gives the NPC an SMG"
E2Helper.Descriptions["npcGiveWeapon(e:s)"] = "Gives the NPC a weapon. Example: E:npcGiveWeapon(\"pistol\"). Other arguments include \"ar2\", \"crowbar\", \"357\", \"shotgun\", \"crossbow\", \"rpg\", \"frag\", etc. Other such as the bugbait or slam may be buggy"
E2Helper.Descriptions["npcGoRun(e:v)"] = "Tells the NPC to run to position V"
E2Helper.Descriptions["npcGoWalk(e:v)"] = "Tells the NPC to walk to position V"
E2Helper.Descriptions["npcStop(e:)"] = "Stops any anything the NPC is doing, including things it decided to do by itself"
E2Helper.Descriptions["npcSetTarget(e:e)"] = "Sets the npcs current target"
E2Helper.Descriptions["npcGetTarget(e:)"] = "Returns what the npc is currently targeting"
E2Helper.Descriptions["npcShoot(e:)"] = "Tells the NPC to shoot their gun"

-- Signals
E2Helper.Descriptions["signalGetGroup()"] = "Gets the E-2's current signal group"
E2Helper.Descriptions["signalSetGroup(s)"] = "Sets the E-2's current signal group to S, this is applied during runOnSignal, signalSend, and signalSetOnRemove calls, so call it first"
E2Helper.Descriptions["signalSetOnRemove(sn)"] = "Sets the signal that the chip sends when it is removed from the world"
E2Helper.Descriptions["signalClk()"] = "Returns 1 if the chip was executed because of any signal, regardless of name, group or scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(s)"] = "Returns 1 if the chip was executed because the signal S was sent, regardless of group or scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(sn)"] = "Returns 1 if the chip was executed because the signal S was sent to the scope N, regardless of group. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(ss)"] = "Returns 1 if the chip was executed because the signal S2 was sent in the group S, regardless of scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(ssn)"] = "Returns 1 if the chip was executed because the signal S2 was sent in the group S to the scope N. Returns 0 otherwise"
E2Helper.Descriptions["signalName()"] = "Returns the name of the received signal"
E2Helper.Descriptions["signalGroup()"] = "Returns the group name of the received signal"
E2Helper.Descriptions["signalSend(sn)"] = "Sends signal S to scope N. Additional calls to this function with the same signal will overwrite the old call until the signal is issued"
E2Helper.Descriptions["signalSendDirect(se)"] = "Sends signal S to the given chip. Multiple calls for different chips do not overwrite each other"
E2Helper.Descriptions["signalSendToPlayer(se)"] = "Sends signal S to chips owned by the given player, multiple calls for different players do not overwrite each other"
E2Helper.Descriptions["signalSender()"] = "Returns the entity of the chip that sent the signal"
E2Helper.Descriptions["signalSenderId()"] = "Returns the entity ID of the chip that sent the signal. Useful if the entity doesn't exist anymore"
E2Helper.Descriptions["signalClearOnRemove()"] = "Clears the signal that the chip sends when it is removed from the world"

-- Holograms
E2Helper.Descriptions["holoAlpha(nn)"] = "Sets the transparency (0-255) of the hologram"
E2Helper.Descriptions["holoAng(na)"] = "Sets the angle of the hologram"
E2Helper.Descriptions["holoBodygroup(nnn)"] = "Index, Group ID, Group SubID\nSets the bodygroups of the given hologram"
E2Helper.Descriptions["holoBodygroups(nn)"] = "Index, Group ID\nReturns the number of bodygroups in the Group ID of the given hologram"
E2Helper.Descriptions["holoCanCreate()"] = "Returns 1 when holoCreate() will successfully create a new hologram until the Max limit is reached\nReplaces holoRemainingSpawns()"
E2Helper.Descriptions["holoColor(nxv4)"] = "Sets the color and alpha of the hologram"
E2Helper.Descriptions["holoColor(nv)"] = "Sets the color of the hologram"
E2Helper.Descriptions["holoColor(nvn)"] = "Sets the color and alpha of the hologram"
E2Helper.Descriptions["holoPlayerColor(nv)"] = "Sets the sub-color of a hologram with player model such as clothes or physgun"
E2Helper.Descriptions["holoCreate(nvvavs)"] = "Index, Position, Scale, Angle, Color (RGB), Model\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvaxv4s)"] = "Index, Position, Scale, Angle, Color (RGBA), Model\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvav)"] = "Index, Position, Scale, Angle, Color (RGB)\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvaxv4)"] = "Index, Position, Scale, Angle, Color (RGBA)\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvva)"] = "Index, Position, Scale, Angle\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvv)"] = "Index, Position, Scale\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nv)"] = "Index, Position\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(n)"] = "Index\nCreates a new hologram entity"
E2Helper.Descriptions["holoDelete(n)"] = "Removes a hologram"
E2Helper.Descriptions["holoDeleteAll()"] = "Removes all holograms made by this E2"
E2Helper.Descriptions["holoDisableShading(nn)"] = "If 1, supresses engine lighting when drawing this hologram"
E2Helper.Descriptions["holoEntity(n)"] = "Returns the entity corresponding to the hologram given by the specified index"
E2Helper.Descriptions["holoIndex(e)"] = "Returns the index of the given hologram entity"
E2Helper.Descriptions["holoMaterial(ns)"] = "Sets the overlay material of the hologram"
E2Helper.Descriptions["holoModel(ns)"] = "Sets the model.\nMust be from holoModelList unless wire_holograms_modelany is 1 (see holoModelAny())"
E2Helper.Descriptions["holoModel(nsn)"] = "Sets the model and skin.\nMust be from holoModelList unless wire_holograms_modelany is 1 (see holoModelAny())"
E2Helper.Descriptions["holoModelAny()"] = "Returns 1 if models outside of holoModelList can be used.\nReads convar 'wire_holograms_modelany'"
E2Helper.Descriptions["holoModelList()"] = "Returns the list of valid models\nSee holoModelAny()"
E2Helper.Descriptions["holoParent(ne)"] = "Parents the hologram to an entity"
E2Helper.Descriptions["holoParent(nn)"] = "Parents the hologram to another hologram"
E2Helper.Descriptions["holoParentAttachment(nes)"] = "Parents the hologram to an entity's bone by its attachment name"
E2Helper.Descriptions["holoUnparent(n)"] = "Un-parents the hologram"
E2Helper.Descriptions["holoPos(nv)"] = "Sets the position of the hologram"
E2Helper.Descriptions["holoRemainingSpawns()"] = "Returns how many holograms can be created this execution"
E2Helper.Descriptions["holoReset(nsvvs)"] = "Similar to holoCreate, but reusing the old entity"
E2Helper.Descriptions["holoScale(n)"] = "Returns the scale of the given hologram"
E2Helper.Descriptions["holoScale(nv)"] = "Sets the scale of the given hologram, as a multiplier"
E2Helper.Descriptions["holoBoneScale(nn)"] = "Returns the scale of the given hologram bone"
E2Helper.Descriptions["holoBoneScale(nnv)"] = "Sets the scale of the given hologram bone, as a multiplier"
E2Helper.Descriptions["holoBoneScale(ns)"] = "Returns the scale of the given hologram named bone"
E2Helper.Descriptions["holoBoneScale(nsv)"] = "Sets the scale of the given hologram named bone, as a multiplier"
E2Helper.Descriptions["holoScaleUnits(n)"] = "Returns the scale of the given hologram in source units"
E2Helper.Descriptions["holoScaleUnits(nv)"] = "Sets the scale of the given hologram, in source units"
E2Helper.Descriptions["holoShadow(nn)"] = "Enables the hologram's shadow"
E2Helper.Descriptions["holoVisible(nen)"] = "If 0, prevents a specific player from seeing the hologram"
E2Helper.Descriptions["holoVisible(nrn)"] = "If 0, prevents an array of players from seeing the hologram"
E2Helper.Descriptions["holoClip(nnvvn)"] = "Defines a plane used to clip a hologram specified by it's index, position, direction and number 1/0 whether the position should be global or local to the hologram"
E2Helper.Descriptions["holoClip(nvvn)"] = "Defines a plane used to clip a hologram specified by it's position, direction and number 1/0 whether the position should be global or local to the hologram"
E2Helper.Descriptions["holoClip(nnvve)"] = "Defines a plane used to clip a hologram specified by it's index, position, and direction local to the given entity"
E2Helper.Descriptions["holoClip(nvve)"] = "Defines a plane used to clip a hologram specified by it's position, and direction local to the given entity"
E2Helper.Descriptions["holoClipEnabled(nn)"] = "Enables / disables clipping for a hologram with specified index"
E2Helper.Descriptions["holoClipEnabled(nnn)"] = "Enables / disables clipping for a hologram with specified index. Clip index is for use with multiple clipping planes"
E2Helper.Descriptions["holoClipsAvailable()"] = "Returns the maximum number of clipping planes allowed per hologram"
E2Helper.Descriptions["holoRenderFX(nn)"] = "Changes the RenderFX for a hologram"
E2Helper.Descriptions["holoSkin(nn)"] = "Changes the skin of a hologram"

-- File
E2Helper.Descriptions["fileLoaded()"] = "Returns whether or not the file has been loaded onto the server"
E2Helper.Descriptions["fileRead()"] = "Returns the contents of the last uploaded file, or an empty string if there is no currently uploaded file"
E2Helper.Descriptions["fileReadList()"] = "Returns the contents of the last uploaded list"
E2Helper.Descriptions["fileClk(s)"] = "Returns whether the execution was run because a file finished uploading and was that file of a specific file name"
E2Helper.Descriptions["fileClk()"] = "Returns whether the execution was run because a file finished uploading"
E2Helper.Descriptions["fileLoadedList()"] = "If the list has been loaded and it is called, it will return 1. Any time after that until a new list is loaded it will return 0"
E2Helper.Descriptions["fileLoadingList()"] = "Returns whether a list is currently uploading"
E2Helper.Descriptions["fileList(s)"] = "Returns an array of file names that have been loaded"
E2Helper.Descriptions["fileListTable()"] = "Returns a table of file names that have been loaded. (Tbl[\"filename\"] = \"filename\")"
E2Helper.Descriptions["fileListClk(s)"] = "Returns whether the execution was run because a list with specified name was uploaded to the server"
E2Helper.Descriptions["fileListClk()"] = "Returns whether the execution was run because a list was uploaded to the server"
E2Helper.Descriptions["fileAppend(ss)"] = "Adds string data to the end of the file"
E2Helper.Descriptions["fileWrite(ss)"] = "Writes string data to the file overwriting it"
E2Helper.Descriptions["fileCanList()"] = "Returns 1 if the file list can be uploaded to the server"
E2Helper.Descriptions["fileCanLoad()"] = "Returns 1 if the file can be loaded"
E2Helper.Descriptions["fileCanWrite()"] = "Returns 1 if the file can be written"
E2Helper.Descriptions["fileLoad(s)"] = "Loads specified file to the server"
E2Helper.Descriptions["fileLoading()"] = "Returns whether a file is currently uploading"
E2Helper.Descriptions["fileMaxSize()"] = "Returns the maximum file size that can be uploaded or downloaded. Default is 300 KiB"
E2Helper.Descriptions["fileName()"] = "Returns the name of the last uploaded file, or an empty string if there is no currently uploaded file"
E2Helper.Descriptions["fileStatus()"] = "Returns the status of the upload in progress. Returns one of _FILE_UNKNOWN, _FILE_OK, _FILE_TIMEOUT, _FILE_404 or _FILE_TRANSFER_ERROR"
E2Helper.Descriptions["runOnFile(n)"] = "Specifies whether the E2 will run when a file finishes uploading"
E2Helper.Descriptions["runOnList(n)"] = "Specifies whether the E2 will run when a list finishes uploading"

-- Datasignals
E2Helper.Descriptions["dsSend"] = "Sends a datasignal to the specified group and scope"
E2Helper.Descriptions["dsSendDirect"] = "Sends a datasignal to the specified E2 (or use an array for several E2s)"
E2Helper.Descriptions["dsGetSender()"] = "Returns the entity of the E2 which sent the signal"
E2Helper.Descriptions["dsJoinGroup(s)"] = "Join the group to receive signals from it"
E2Helper.Descriptions["dsLeaveGroup(s)"] = "Leave the group to stop receiving signals from it"
E2Helper.Descriptions["dsClearGroups()"] = "Leave all groups"
E2Helper.Descriptions["dsClk()"] = "Returns 1 if the current execution was caused by a datasignal"
E2Helper.Descriptions["dsClk(s)"] = "Returns 1 if the current execution was caused by a datasignal with the specified signal name"
E2Helper.Descriptions["dsClkName()"] = "Returns the name of the signal"
E2Helper.Descriptions["dsGetType()"] = "Returns the type of the received data"
E2Helper.Descriptions["dsGetGroups()"] = "Returns an array of the groups the E2 is in"
E2Helper.Descriptions["dsGetGroup()"] = "Get the name of the group the signal was sent to"
E2Helper.Descriptions["dsProbe"] = "Returns an array of E2s the signal would have been sent to if it had been sent with the specified arguments"
E2Helper.Descriptions["dsSetScope(n)"] = "Sets the scope of the E2. Setting the scope determines which signals the E2 can receive. Check the wiki for more info about scopes"
E2Helper.Descriptions["dsGetScope()"] = "Returns the scope the E2 is currently in"
E2Helper.Descriptions["dsGetHash()"] = "Returns the hash of sending E2"
E2Helper.Descriptions["runOnSignal(snn)"] = "If N2 == 0 the chip will no longer run on this signal, otherwise it makes this chip execute when signal S is sent by someone in scope N"

-- gvars
E2Helper.Descriptions["gTable(sn)"] = "Returns the gTable. The string determines group, and the number determines wether or not the table should be shared"
E2Helper.Descriptions["gTable(s)"] = "Returns the gTable. The string determines group"
E2Helper.Descriptions["gTableSafe(n)"] = "Returns a safe gTable which group is a numerical hash created from the code of the E2 itself"
E2Helper.Descriptions["gRemoveAll()"] = "Removes all non-shared variables and group tables you have created"
E2Helper.Descriptions["clear(xgt:)"] = "Clears the gTable"
E2Helper.Descriptions["count(xgt:)"] = "Returns the number of entries in the gTable. Does not add the entries in subtables"
E2Helper.Descriptions["gGetGroup()"] = "Gets the E2's current group"
E2Helper.Descriptions["gSetGroup(s)"] = "Sets the E2's current group. Does persist"
E2Helper.Descriptions["gGetShare()"] = "Returns 1/0"
E2Helper.Descriptions["gResetGroup()"] = "Resets the group back to \"default\""
E2Helper.Descriptions["gShare(n)"] = "Sets wether or not you want to share the variables. (1/0) Remember that there are two tables for each group: one which is shared and one which is not; values do not transition between the two"
E2Helper.Descriptions["toTable(xgt:)"] = "Converts the GTable into a table"

-- tables
E2Helper.Descriptions["table"] = "Returns a table with the values specified in the array-part"
E2Helper.Descriptions["clear(t:)"] = "Clears the table"
E2Helper.Descriptions["count(t:)"] = "Returns the number of entries in the table. Does not add the entries in subtables"
E2Helper.Descriptions["ncount(t:)"] = "Returns the number of sequential numerical indexes"
E2Helper.Descriptions["depth(t:)"] = "Returns the depth at which the table is in, relative to its parents"
E2Helper.Descriptions["flip(t:)"] = "Returns a flipped copy of the table. Only affects string values in the array part and number values in the table part"
E2Helper.Descriptions["typeids(t:)"] = "Returns a new table with the typeids of the table"
E2Helper.Descriptions["clipToTypeid(t:s)"] = "Removes all entries not of the specified type"
E2Helper.Descriptions["clipFromTypeid(t:s)"] = "Removes all entries of the specified type"
E2Helper.Descriptions["min(t:)"] = "Returns the smallest numerical entry in the array-part"
E2Helper.Descriptions["max(t:)"] = "Returns the largest numerical entry in the array-part"
E2Helper.Descriptions["minIndex(t:)"] = "Returns the index of the smallest numerical entry in the array-part"
E2Helper.Descriptions["maxIndex(t:)"] = "Returns the index of the largest numerical entry in the array-part"
E2Helper.Descriptions["typeidsArray(t:)"] = "Returns an array with the typeids of the array-part of the table"
E2Helper.Descriptions["toArray(t:)"] = "Converts the table into an array. (Note that there is no R:totable() function because E2 arrays do not save typeids)"
E2Helper.Descriptions["findToTable()"] = "Inserts the finds from an entity discovery event into an table's array-part and returns it. (Basically the same as findToArray())"
E2Helper.Descriptions["toTable(t:)"] = "Converts the table into a table"
E2Helper.Descriptions["typeidsTable(t:)"] = "Returns a table with the typeids of the table-part of the table"
E2Helper.Descriptions["clone(t:)"] = "Returns a copy of the table"
E2Helper.Descriptions["concat(t:)"] = "Concatenates the array-part of the table"
E2Helper.Descriptions["concat(t:s)"] = "Concatenates the array-part of the table, with a string delimiter"
E2Helper.Descriptions["concat(t:n)"] = "Concatenates the array-part of the table, starting at index N"
E2Helper.Descriptions["concat(t:sn)"] = "Concatenates the array-part of the table, starting at index N, with string S in between each"
E2Helper.Descriptions["concat(t:nn)"] = "Concatenates the array-part of the table, starting at index N1 and ending at N2"
E2Helper.Descriptions["concat(t:snn)"] = "Concatenates the array-part of the table, starting at index N1 and ending at N2, with string S in between each"
E2Helper.Descriptions["toString(t)"] = "Formats the table as a human-readable string"
E2Helper.Descriptions["toString(t:)"] = "Formats the table as a human-readable string"
E2Helper.Descriptions["id(t:)"] = "Returns the unique ID of the table"
E2Helper.Descriptions["add(t:t)"] = "Adds the contents of the second table to the end of the first table. Returns new table"
E2Helper.Descriptions["difference(t:t)"] = "Removes all variables with keys that exist in T2"
E2Helper.Descriptions["intersect(t:t)"] = "Removes all variables with keys which don't exist in T2"
E2Helper.Descriptions["merge(t:t)"] = "Merges T2 with T. Any variables with the same indexes are overwritten by T2's variables"
E2Helper.Descriptions["exists(t:s)"] = "Returns 1 if the table contains any value at specified index"
E2Helper.Descriptions["exists(t:n)"] = "Returns 1 if the table contains any value at specified index"
E2Helper.Descriptions["invert(t)"] = "Inverts the table, creating a lookup table"
E2Helper.Descriptions["keys(t:)"] = "Returns an array with the keys of the table"
E2Helper.Descriptions["values(t:)"] = "Returns an array with the values of the table (tables and arrays, which arrays do not support, are discarded)"
E2Helper.Descriptions["pop(t:)"] = "Removes the last entry in the array-part and returns 1 if removed"
E2Helper.Descriptions["shift(t:)"] = "Removes the first element of the table; all other entries will move down one address and returns 1 if removed"
E2Helper.Descriptions["remove(t:n)"] = "Removes the specified entry from the array-part and returns 1 if removed"
E2Helper.Descriptions["remove(t:s)"] = "Removes the specified entry from the table-part and returns 1 if removed"
E2Helper.Descriptions["unset(t:n)"] = "Force removes the specified entry from the array-part, without moving subsequent entries down and returns 1 if removed"
E2Helper.Descriptions["unset(t:s)"] = "Force removes the specified entry from the table-part, without moving subsequent entries down and returns 1 if removed"

-- arrays
E2Helper.Descriptions["array(...)"] = "Creates an array"
E2Helper.Descriptions["add(r:r)"] = "Adds the contents of the second array to the end of the first array. Returns new array"
E2Helper.Descriptions["sum(r:)"] = "Adds all numbers in the array together and returns result"
E2Helper.Descriptions["average(r:)"] = "Gives the average of all numbers in array"
E2Helper.Descriptions["clear(r:)"] = "Clears the array"
E2Helper.Descriptions["clone(r:)"] = "Returns a copy of the array"
E2Helper.Descriptions["concat(r:)"] = "Concatenates all values in the array"
E2Helper.Descriptions["concat(r:s)"] = "Concatenates all values in the array with the specified string in between each"
E2Helper.Descriptions["concat(r:n)"] = "Concatenates all values in the array, starting at index N"
E2Helper.Descriptions["concat(r:sn)"] = "Concatenates all values in the array, starting at index N, with string S in between each"
E2Helper.Descriptions["concat(r:nn)"] = "Concatenates all values in the array, starting at index N1 and ending at N2"
E2Helper.Descriptions["concat(r:snn)"] = "Concatenates all values in the array, starting at index N1 and ending at N2, with string S in between each"
E2Helper.Descriptions["count(r:)"] = "Returns the number of entries in the array"
E2Helper.Descriptions["exists(r:n)"] = "Returns 1 if the array contains any value at specified index"
E2Helper.Descriptions["id(r:)"] = "Returns the unique ID of the array"
E2Helper.Descriptions["invert(r)"] = "Inverts the array, creating a lookup table"
E2Helper.Descriptions["min(r:)"] = "Returns the smallest number in array"
E2Helper.Descriptions["max(r:)"] = "Returns the largest number in array"
E2Helper.Descriptions["minIndex(r:)"] = "Returns the index of the smallest number in array"
E2Helper.Descriptions["maxIndex(r:)"] = "Returns the index of the largest number in array"
E2Helper.Descriptions["merge(r:r)"] = "Merges R2 with R. Any variables with the same indexes are overwritten by R2's variables"
E2Helper.Descriptions["pop(r:)"] = "Removes the last entry in the array and returns 1 if removed"
E2Helper.Descriptions["shift(r:)"] = "Removes the first element of the array; all other entries will move down one address and returns 1 if removed"
E2Helper.Descriptions["remove(r:n)"] = "Removes the specified entry, moving subsequent entries down to compensate and returns 1 if removed"
E2Helper.Descriptions["unset(r:n)"] = "Force removes the specified entry, without moving subsequent entries down and returns 1 if removed"

-- binary
E2Helper.Descriptions["bOr(nn)"] = "Performs bitwise OR against the two numbers"
E2Helper.Descriptions["bAnd(nn)"] = "Performs bitwise AND against the two numbers"
E2Helper.Descriptions["bXor(nn)"] = "Performs bitwise XOR against the two numbers"
E2Helper.Descriptions["bShl(nn)"] = "Performs bitwise shift left on the first number by the amount of the second"
E2Helper.Descriptions["bShr(nn)"] = "Performs bitwise shift right on the first number by the amount of the second"
E2Helper.Descriptions["bNot(n)"] = "Performs a binary Not"
E2Helper.Descriptions["bNot(nn)"] = "Performs a binary Not. The second argument is the length of the number you wish to perform Not on in bits"

-- EGP
E2Helper.Descriptions["egpAlign(xwl:nn)"] = "Changes the horizontal alignment. Works on: text and text layout. Number can be 0, 1 or 2"
E2Helper.Descriptions["egpAlign(xwl:nnn)"] = "Changes the horizontal and vertical alignment. Works on: text and text layout. Numbers can be 0, 1 or 2"
E2Helper.Descriptions["egpAlpha(xwl:nn)"] = "Changes the alpha (transparency) of an object"
E2Helper.Descriptions["egpAlpha(xwl:n)"] = "Returns the alpha of the object"
E2Helper.Descriptions["egpAngle(xwl:nn)"] = "Changes the angle of the object"
E2Helper.Descriptions["egpAngle(xwl:n)"] = "Returns the angle of the object"
E2Helper.Descriptions["egpAngle(xwl:nxv2xv2n)"] = "Rotates the object around the first vec2 with the second vec2 as offset at angle N"
E2Helper.Descriptions["egpColor(xwl:n)"] = "Returns the color of the object as 3D vector"
E2Helper.Descriptions["egpColor(xwl:nnnnn)"] = "Changes the color and alpha of the object"
E2Helper.Descriptions["egpColor(xwl:nxv4)"] = "Changes the color and alpha of the object"
E2Helper.Descriptions["egpColor(xwl:nv)"] = "Changes the color of the object"
E2Helper.Descriptions["egpColor4(xwl:n)"] = "Returns the color of the object as 4D vector (including alpha)"
E2Helper.Descriptions["egpFidelity(xwl:n)"] = "Returns the fidelity of the object"
E2Helper.Descriptions["egpFidelity(xwl:nn)"] = "Changes the fidelity of the object (the number of vertices the circle will use)"
E2Helper.Descriptions["egpFont(xwl:nsn)"] = "Changes the font and size of the text object"
E2Helper.Descriptions["egpFont(xwl:ns)"] = "Changes the font of the text object"
E2Helper.Descriptions["egpMaterial(xwl:n)"] = "Returns the material of the object"
E2Helper.Descriptions["egpMaterial(xwl:ns)"] = "Changes the material of the object"
E2Helper.Descriptions["egpMaterialFromScreen(xwl:ne)"] = "Sets the material of the object to a current snapshot of the target screen. Note that this only works for players which see both the egp as well the target screen at that time"
E2Helper.Descriptions["egpOrder(xwl:nn)"] = "Sets the order at which the object will be rendered"
E2Helper.Descriptions["egpOrder(xwl:n)"] = "Returns the order at which the object is rendered"
E2Helper.Descriptions["egpParent(xwl:n)"] = "Returns the index of the parent object"
E2Helper.Descriptions["egpParent(xwl:ne)"] = "Parents the 3D tracker object to an entity"
E2Helper.Descriptions["egpParent(xwl:nn)"] = "Parents the object to another object. Parented objects' positions are local to their parent"
E2Helper.Descriptions["egpParentToCursor(xwl:n)"] = "Parents the object to player's cursor"
E2Helper.Descriptions["egpUnParent(xwl:n)"] = "Un-parents the object"
E2Helper.Descriptions["egpPos(xwl:n)"] = "Returns the position of the object"
E2Helper.Descriptions["egpPos(xwl:nxv2)"] = "Changes the position of the object"
E2Helper.Descriptions["egpPos(xwl:nv)"] = "Changes the world position of the 3D tracker object"
E2Helper.Descriptions["egpQueue()"] = "Returns the number of items in your queue"
E2Helper.Descriptions["egpQueueClk(e)"] = "Returns 1 if the current execution was caused by the EGP queue system of specified screen"
E2Helper.Descriptions["egpQueueClk(xwl)"] = "Returns 1 if the current execution was caused by the EGP queue system of specified screen"
E2Helper.Descriptions["egpQueueClk()"] = "Returns 1 if the current execution was caused by the EGP queue system"
E2Helper.Descriptions["egpQueueClkPly(e)"] = "Returns 1 if the current execution was caused by the EGP queue system, and the player E was the player who ordered the items to be sent"
E2Helper.Descriptions["egpQueuePlayer()"] = "Returns the player which ordered the items to be sent"
E2Helper.Descriptions["egpQueueScreen()"] = "Returns the screen entity which the queue finished sending items for"
E2Helper.Descriptions["egpQueueScreenWirelink()"] = "Returns the screen wirelink which the queue finished sending items for"
E2Helper.Descriptions["egpRadius(xwl:nn)"] = "Changes the corner radius of the rounded box object"
E2Helper.Descriptions["egpRadius(xwl:n)"] = "Returns the corcner radius of the rounded box object"
E2Helper.Descriptions["egpRemove(xwl:n)"] = "Removes the object from the screen"
E2Helper.Descriptions["egpResolution(xwl:xv2xv2)"] = "Sets the scale of the screen such that the top left corner is equal to the first vector and the bottom right corner is equal to the second vector"
E2Helper.Descriptions["egpScale(xwl:xv2xv2)"] = "Sets the scale of the screen's X axis to the first vector and Y axis to the second vector"
E2Helper.Descriptions["egpScrH(e)"] = "Returns the player's screen resolution height"
E2Helper.Descriptions["egpScrW(e)"] = "Returns the player's screen resolution width"
E2Helper.Descriptions["egpScrSize(e)"] = "Returns the player's screen resolution size"
E2Helper.Descriptions["egpSetText(xwl:ns)"] = "Changes the text of the text object"
E2Helper.Descriptions["egpSize(xwl:n)"] = "Returns the size of the object"
E2Helper.Descriptions["egpSize(xwl:nn)"] = "Changes the size of the text/line/outline object"
E2Helper.Descriptions["egpSize(xwl:nxv2)"] = "Changes the size of the object"
E2Helper.Descriptions["egpSizeNum(xwl:n)"] = "Returns the size of the text/line/outline object"
E2Helper.Descriptions["egpToWorld(xwl:xv2)"] = "Converts a 2D vector on the screen or emitter into a 3D vector in the world"
E2Helper.Descriptions["egpTrackerParent(xwl:n)"] = "Returns the parent entity of the 3D tracker object"

--E2Helper.Descriptions["egpAddVertices(xwl:nr)"] = ""
--E2Helper.Descriptions["egpBytesLeft()"] = ""
E2Helper.Descriptions["egpCanSendUmsg()"] = "Returns 1 if you can send an usermessage at the moment, 0 otherwise"
E2Helper.Descriptions["egpClear(xwl:)"] = "Clears the EGP screen"
E2Helper.Descriptions["egpClearQueue()"] = "Clears your entire queue"
E2Helper.Descriptions["egpCopy(xwl:nn)"] = "Copies the settings of the second object into the first. If the first object does not exist, it's created"
E2Helper.Descriptions["egpCursor(xwl:e)"] = "Returns the specified player's aim position on the screen"
E2Helper.Descriptions["egpDrawTopLeft(xwl:n)"] = "Set to 1 to make boxes, outline boxes, rounded boxes, and rounded outline boxes draw from the top left corner instead of from the center"
E2Helper.Descriptions["egpGlobalPos(xwl:n)"] = "Returns the \"global\" (= it takes the parents' positions into consideration) position as a 3D vector. X and Y being the 2D X,Y coordinates, while Z is the angle"
E2Helper.Descriptions["egpGlobalVertices(xwl:n)"] = "Returns an array of 2D vectors with the \"global\" positions of the vertices in the object"
E2Helper.Descriptions["egpGlobalFiltering(xwl:n)"] = "Changes the texture filter used to draw all EGP Objects. Works only on EGP Screens. See _TEXFILTER constants (POINT=sharp, ANISOTROPIC=blurry/default)"
E2Helper.Descriptions["egpHasObject(xwl:n)"] = "Returns 1 if the object with specified index exists on the screen, 0 if not"
E2Helper.Descriptions["egpObjectContainsPoint(xwl:nxv2)"] = "Returns 1 if the object with specified index contains the specified point"
E2Helper.Descriptions["egpHudToggle(xwl:)"] = "Toggles the HUD on/off"
E2Helper.Descriptions["egpLoadFrame(xwl:n)"] = "Loads the frame with specified index"
E2Helper.Descriptions["egpLoadFrame(xwl:s)"] = "Loads the frame with specified name"
E2Helper.Descriptions["egpSaveFrame(xwl:n)"] = "Saves the frame under specified index"
E2Helper.Descriptions["egpSaveFrame(xwl:s)"] = "Saves the frame under specified name"
E2Helper.Descriptions["egpFiltering(xwl:nn)"] = "Changes the texture filter used to draw the object. Works on objects that draw a material. See _TEXFILTER constants (POINT=sharp, ANISOTROPIC=blurry/default)"
E2Helper.Descriptions["egpMaxObjects()"] = "Returns the maximum amount of objects you can have"
E2Helper.Descriptions["egpMaxUmsgPerSecond()"] = "Returns the maximum number of usermessages you can send per second"
E2Helper.Descriptions["egpNumObjects(xwl:)"] = "Returns the number of objects on the screen"
E2Helper.Descriptions["egpRunOnQueue(xwl:n)"] = "Set to 1 if you want your E2 to be triggered once the queue has finished sending all items in the queue for the screen"
E2Helper.Descriptions["egpVertices(xwl:n)"] = "Returns an array of the vertices of the object"
E2Helper.Descriptions["egpObjectIndexes(xwl:)"] = "Returns an array containing all object indexes being used"
E2Helper.Descriptions["egpObjectType(xwl:n)"] = "Returns the type of the object with specified index"
E2Helper.Descriptions["egpObjectTypes(xwl:)"] = "Returns an array whose keys are bound to object index, and value being the type of particular object"

E2Helper.Descriptions["egp3DTracker(xwl:nv)"] = "Creates a 3D tracker object at specified world position"
E2Helper.Descriptions["egpBox(xwl:nxv2xv2)"] = "Creates a box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpBoxOutline(xwl:nxv2xv2)"] = "Creates an outline box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpCircle(xwl:nxv2xv2)"] = "Creates a circle. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpCircleOutline(xwl:nxv2xv2)"] = "Creates an outline circle. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpLine(xwl:nxv2xv2)"] = "Creates a line. First 2D vector is the start position, second is end position"
E2Helper.Descriptions["egpLineStrip(xwl:n...)"] = "Creates a curve with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpLineStrip(xwl:nr)"] = "Creates a curve with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPoly(xwl:nr)"] = "Creates a polygon with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPoly(xwl:n...)"] = "Creates a polygon with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPolyOutline(xwl:nr)"] = "Creates a outline polygon with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPolyOutline(xwl:n...)"] = "Creates a outline polygon with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpRoundedBox(xwl:nxv2xv2)"] = "Creates a rounded box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpRoundedBoxOutline(xwl:nxv2xv2)"] = "Creates a rounded outline box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpText(xwl:nsxv2)"] = "Creates a text object"
E2Helper.Descriptions["egpTextLayout(xwl:nsxv2xv2)"] = "Creates a text layout object"
E2Helper.Descriptions["egpTriangle(xwl:nxv2xv2xv2)"] = "Creates a triangle with specified vertices"
E2Helper.Descriptions["egpTriangleOutline(xwl:nxv2xv2xv2)"] = "Creates a outline triangle with specified vertices"
E2Helper.Descriptions["egpWedge(xwl:nxv2xv2)"] = "Creates a wedge object. Wedge objects are like circles, except they have a cake-piece-like mouth which you can change using egpSize"
E2Helper.Descriptions["egpWedgeOutline(xwl:nxv2xv2)"] = "Creates a outline wedge object. Wedge objects are like circles, except they have a cake-piece-like mouth which you can change using egpSize"

-- (de)serialization
E2Helper.Descriptions["glonDecode(s)"] = "Decodes a string into an array using GLON"
E2Helper.Descriptions["glonDecodeTable(s)"] = "Decodes a string into a table using GLON"
E2Helper.Descriptions["glonEncode(r)"] = "Encodes an array into a string using GLON"
E2Helper.Descriptions["glonEncode(t)"] = "Encodes a table into a string using GLON"
E2Helper.Descriptions["glonError()"] = "Returns the last glon error"

E2Helper.Descriptions["vonDecode(s)"] = "Decodes a string into an array using vON"
E2Helper.Descriptions["vonDecodeTable(s)"] = "Decodes a string into a table using vON"
E2Helper.Descriptions["vonEncode(r)"] = "Encodes an array into a string using vON"
E2Helper.Descriptions["vonEncode(t)"] = "Encodes a table into a string using vON"
E2Helper.Descriptions["vonError()"] = "Returns the last von error"

E2Helper.Descriptions["jsonDecode(s)"] = "Decodes a string into an array using json"
E2Helper.Descriptions["jsonDecodeTable(s)"] = "Decodes a string into a table using json"
E2Helper.Descriptions["jsonEncode(r)"] = "Encodes an array into a string using json"
E2Helper.Descriptions["jsonEncode(rn)"] = "Encodes an array into a string using json"
E2Helper.Descriptions["jsonEncode(t)"] = "Encodes a table into a string using json"
E2Helper.Descriptions["jsonEncode(tn)"] = "Encodes a table into a string using json"
E2Helper.Descriptions["jsonEncodeExternal(t)"] = "Encodes a table into a string using json, in a form that is suitable to be exported to external resources. Unfortunately, arrays are ignored because E2 contains many ambiguous types, and arrays don't keep track of those types. You will have to convert your array to a table manually before encoding it."
E2Helper.Descriptions["jsonEncodeExternal(tn)"] = "Encodes a table into a string using json, in a form that is suitable to be exported to external resources. Unfortunately, arrays are ignored because E2 contains many ambiguous types, and arrays don't keep track of those types. You will have to convert your array to a table manually before encoding it."
E2Helper.Descriptions["jsonDecodeTableExternal(s)"] = "Decodes a string into a table using json"
E2Helper.Descriptions["jsonError()"] = "Returns the last json error"

-- http
E2Helper.Descriptions["httpCanRequest()"] = "Returns whether you can make a new request (delay has been met or previous request timed out)"
E2Helper.Descriptions["httpClk()"] = "Returns whether the execution was run because of a completed request"
E2Helper.Descriptions["httpData()"] = "Returns the data received from the last request"
E2Helper.Descriptions["httpSuccess()"] = "Returns whether the previous request was successful"
E2Helper.Descriptions["httpRequest(s)"] = "Starts a new request"
E2Helper.Descriptions["httpRequestUrl()"] = "Returns the URL of the last request"
E2Helper.Descriptions["httpUrlDecode(s)"] = "Returns decoded URL data"
E2Helper.Descriptions["httpUrlEncode(s)"] = "Returns formatted string to be placed in the URL"
E2Helper.Descriptions["runOnHTTP(n)"] = "Sets whether to run the expression when a request finishes"

-- sound
E2Helper.Descriptions["soundDuration(s)"] = "soundDuration(string Path to File) Returns the duration of the sound. Note: If the server hasn't the file it returns 60"
E2Helper.Descriptions["soundPitch(sn)"] = "soundPitch(string Index, integer Pitch) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(nnn)"] = "soundPitch(integer Index, integer Pitch, integer Fadetime) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(snn)"] = "soundPitch(string Index, integer Pitch, integer Fadetime) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(nn)"] = "soundPitch(integer Index, integer Pitch) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPlay(e:sns)"] = "Plays sound from an entity. soundPlay(string Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(nns)"] = "Plays sound from the E2 chip. soundPlay(int Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(snsn)"] = "Plays sound from the E2 chip. soundPlay(string Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(sns)"] = "Plays sound from the E2 chip. soundPlay(string Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(nnsn)"] = "Plays sound from the E2 chip. soundPlay(int Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(e:nns)"] = "Plays sound from an entity. soundPlay(int Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(e:snsn)"] = "Plays sound from an entity. soundPlay(string Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(e:nnsn)"] = "Plays sound from an entity. soundPlay(int Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPurge()"] = "Clears the sound table and stops all sounds"
E2Helper.Descriptions["soundStop(n)"] = "Stops the sound stored at the integer index and removes the entry"
E2Helper.Descriptions["soundStop(s)"] = "Stops the sound stored at the string index and removes the entry"
E2Helper.Descriptions["soundStop(nn)"] = "Fades the sound stored at the first input's integer index in the second input's amount of seconds and removes the entry"
E2Helper.Descriptions["soundStop(sn)"] = "Fades the sound stored at the string index in the integer input's amount of seconds and removes the entry"
E2Helper.Descriptions["soundVolume(snn)"] = "soundVolume(string Index, Volume, FadeTime), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(sn)"] = "soundVolume(string Index, Volume), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(nn)"] = "soundVolume(integer Index, Volume), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(nnn)"] = "soundVolume(integer Index, Volume, FadeTime), where Volume is a number between 0 and 1. Default Volume is 1"

-- UTF-8
E2Helper.Descriptions["toUnicodeChar(...)"] = "Returns the UTF-8 string from the given Unicode code-points"
E2Helper.Descriptions["toUnicodeChar(r)"] = "Returns the UTF-8 string from the given Unicode code-points"
E2Helper.Descriptions["toUnicodeByte(s:nn)"] = "Returns the Unicode code-points from the given UTF-8 string"
E2Helper.Descriptions["unicodeLength(s:nn)"] = "Returns the length of the given UTF-8 string"

-- Damage
E2Helper.Descriptions["runOnDeath(n)"] = "If set to 0, chip won't run on players dying"
E2Helper.Descriptions["deathClk()"] = "Returns if the E2 was triggered by a death"
E2Helper.Descriptions["lastDeathTime()"] = "Returns the last time a player died"
E2Helper.Descriptions["lastDeathTime(e)"] = "Returns the last time given player died"
E2Helper.Descriptions["lastDeathInflictor()"] = "Returns the entity that inflicted the last death"
E2Helper.Descriptions["lastDeathInflictor(e)"] = "Returns the entity that inflicted the given player's last death"
E2Helper.Descriptions["lastDeathVictim()"] = "Returns the last player to die"
E2Helper.Descriptions["lastDeathAttacker()"] = "Returns the attacker who killed the last player to die"
E2Helper.Descriptions["lastDeathAttacker(e)"] = "Returns the attacker who killed the player provided in their last death"
--
E2Helper.Descriptions["runOnSpawn(n)"] = "If set to 0, chip won't run on players spawning"
E2Helper.Descriptions["spawnClk()"] = "Returns if the E2 was triggered by a player spawning"
E2Helper.Descriptions["lastSpawnTime()"] = "Returns the last time a player spawned"
E2Helper.Descriptions["lastSpawnTime(e)"] = "Returns the last time the given player spawned"
E2Helper.Descriptions["lastSpawnedPlayer()"] = "Returns the last player to spawn"

---- Custom ----
-- Effect
E2Helper.Descriptions["effect()"] = "Creates and returns new effect"
E2Helper.Descriptions["play(xef:s)"] = "Plays the effect with given name (eg. watersplash)"
E2Helper.Descriptions["setAngles(xef:a)"] = "Sets the angle of the effect"
E2Helper.Descriptions["setAttachment(xef:n)"] = "Creates new attachment ID for the effect"
E2Helper.Descriptions["setColor(xef:n)"] = "Sets the color of the effect. Color is represented by a byte"
E2Helper.Descriptions["setDamageType(xef:n)"] = "Sets the damage type of the effect. See DMG_ Enums on GMod Wiki"
E2Helper.Descriptions["setEntIndex(xef:n)"] = "Sets the entity of the effect via its index"
E2Helper.Descriptions["setEntity(xef:e)"] = "Sets the entity of the effect"
E2Helper.Descriptions["setFlags(xef:n)"] = "Sets the flags of the effect"
E2Helper.Descriptions["setHitBox(xef:n)"] = "Sets the hit box index of the effect"
E2Helper.Descriptions["setMagnitude(xef:n)"] = "Sets the magnitude of the effect"
E2Helper.Descriptions["setMaterialIndex(xef:n)"] = "Sets the material index of the effect"
E2Helper.Descriptions["setNormal(xef:v)"] = "Sets the normalized direction vector of the effect"
E2Helper.Descriptions["setOrigin(xef:v)"] = "Sets the origin of the effect"
E2Helper.Descriptions["setRadius(xef:n)"] = "Sets the radius of the effect"
E2Helper.Descriptions["setScale(xef:n)"] = "Sets the scale of the effect"
E2Helper.Descriptions["setStart(xef:v)"] = "Sets the start of the effect"
E2Helper.Descriptions["setSurfaceProp(xef:n)"] = "Sets the surface property index of the effect"


-- "addons\\wiremod\\lua\\wire\\client\\e2descriptions.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if not E2Helper then return end

local name, short, type, typeid
timer.Simple(0.1, function()
	for k, v in pairs( wire_expression_types ) do
		if k == "NORMAL" then k = "NUMBER" end

		name = k:sub(1,1) .. k:sub(2):lower()
		short = name:Left(3)
		type = name:lower()
		typeid = v[1]
		-- tables
		E2Helper.Descriptions["insert"..name.."(t:n"..typeid..")"] = "Inserts the variable at the specified position. Moves all other indexes up one step to compensate"
		E2Helper.Descriptions["remove"..name.."(t:n)"] = "Removes the variable at the specified numerical index, with the specified type, and returns it. All sequential keys will be moved down to fill the gap"
		E2Helper.Descriptions["remove"..name.."(t:s)"] = "Removes the variable at the specified string index, with the specified type, and returns it"
		E2Helper.Descriptions["pop"..name.."(t:)"] = "Removes and returns the last variable"
		E2Helper.Descriptions["push"..name.."(t:"..typeid..")"] = "Adds the variable to the end of the table"
		E2Helper.Descriptions["unshift"..name.."(t:"..typeid..")"] = "Adds the data to the beginning of the table. Will move all other entries up one step to compensate"
		-- arrays
		E2Helper.Descriptions["insert"..name.."(r:n"..typeid..")"] = "Inserts the variable at the specified position. Moves all other indexes up one step to compensate"
		E2Helper.Descriptions["set"..name.."(r:n"..typeid..")"] = "Sets a variable at specified index. Deprecated, use R[N,"..type.."] = X instead"
		E2Helper.Descriptions[type.."(r:n)"] = "Returns the "..type.." stored in the array under specified index. Deprecated, use R[N,"..type.."] instead"
		E2Helper.Descriptions["pop"..name.."(r:)"] = "Deletes and returns the last entry in the array. Be sure not to use popNumber() on a vector or similar, as the data may be lost"
		E2Helper.Descriptions["push"..name.."(r:"..typeid..")"] = "Saves the data at the end of the array"
		E2Helper.Descriptions["unshift"..name.."(r:"..typeid..")"] = "Adds the data to the beginning of the array. Will move all other entries up one address"
		E2Helper.Descriptions["shift"..name.."(r:)"] = "Deletes and returns the first element of the array, moving other entries down one address to compensate"
		E2Helper.Descriptions["remove"..name.."(r:n)"] = "Deletes and returns the specified entry, moving subsequent entries down to compensate"
		-- gvars
		E2Helper.Descriptions["gRemoveAll"..name.."s()"] = "Removes all variables of the "..type.." type in your non-shared table"
		E2Helper.Descriptions["gRemoveAll"..name.."s(s)"] = "Removes all variables of the "..type.." type in your non-shared table in group S"
		E2Helper.Descriptions["gDeleteAll"..short.."()"] = "Exactly the same as gRemoveAll"..name.."s(S) (Except it removes in the group set by gSetGroup instead of using the group as an argument)"
		E2Helper.Descriptions["gDelete"..short.."(s)"] = "Removes and returns the variable of the "..type.." type at the index S in the current group"
		E2Helper.Descriptions["gDelete"..short.."(n)"] = "Exactly the same as gDelete"..short.."(N:toString())"
		E2Helper.Descriptions["gGet"..short.."(s)"] = "Gets a variable of the "..type.." type from index S in the current group"
		E2Helper.Descriptions["gGet"..short.."(n)"] = "Exactly the same as gGet"..short.."(N:toString())"
		E2Helper.Descriptions["gSet"..short.."(s"..typeid..")"] = "Sets a variable of the "..type.." type at index S in the current group"
		E2Helper.Descriptions["gSet"..short.."(n"..typeid..")"] = "Exactly the same as gSet"..short.."(N:toString(),"..type..")"
		E2Helper.Descriptions["remove"..name.."(xgt:s)"] = "Removes and returns the variable of the "..type.." type at the index S"
		-- self-aware
		E2Helper.Descriptions["ioGetInput"..name.."(s)"] = "Get the value of the input S of the E2"
		E2Helper.Descriptions["ioSetOutput(s"..typeid..")"] = "Trigger the output S of the E2 with the "..type.." value"
		E2Helper.Descriptions["select(n"..typeid.."...)"] = "Returns the Nth value given after the index, "..type.."'s zero element otherwise. If you mix types, the behaviour is undefined"
		-- datasignals
		E2Helper.Descriptions["dsGet"..name.."()"] = "Returns the received "..type
		-- wirelink
		E2Helper.Descriptions[type.."(xwl:s)"] = "Returns the "..type.." from the specified address of linked component. Deprecated, use XWL[S,"..type.."] instead"
		E2Helper.Descriptions["set"..name.."(xwl:s"..typeid..")"] = "Sets the component's input of the specified name equal to specified "..type..". Deprecated, use XWL[S,"..type.."] = X instead"
	end
end)

-- Number
E2Helper.Descriptions["finite(n)"] = "Returns 1 if given value is a finite number; otherwise 0."
E2Helper.Descriptions["isinf(n)"] = "Returns 1 if given value is a positive infinity or -1 if given value is a negative infinity; otherwise 0."
E2Helper.Descriptions["isnan(n)"] = "Returns 1 if given value is not a number (NaN); otherwise 0."
E2Helper.Descriptions["inf()"] = "Returns a huge constant (infinity)"
E2Helper.Descriptions["mod(nn)"] = "Modulo, returns the Remainder after Argument 1 has been divided by Argument 2. Note \"mod(-1, 3) = -1\""
E2Helper.Descriptions["sqrt(n)"] = "Returns the Square Root of the Argument"
E2Helper.Descriptions["cbrt(n)"] = "Returns the Cube Root of the Argument"
E2Helper.Descriptions["root(nn)"] = "Returns the Nth Root of the first Argument"
E2Helper.Descriptions["e()"] = "Returns Euler's Constant"
E2Helper.Descriptions["frexp(n)"] = "Returns the mantissa and exponent of the given floating-point number as a vector2 (X component holds a mantissa, and Y component holds an exponent)"
E2Helper.Descriptions["exp(n)"] = "Returns e to the power of the Argument (same as e()^N but shorter and faster this way)"
E2Helper.Descriptions["ln(n)"] = "Returns the logarithm to base e of the Argument"
E2Helper.Descriptions["log2(n)"] = "Returns the logarithm to base 2 of the Argument"
E2Helper.Descriptions["log10(n)"] = "Returns the logarithm to base 10 of the Argument"
E2Helper.Descriptions["log(nn)"] = "Returns the logarithm to base Argument 2 of Argument 1"
E2Helper.Descriptions["abs(n)"] = "Returns the Magnitude of the Argument"
E2Helper.Descriptions["ceil(n)"] = "Rounds the Argument up to the nearest Integer"
E2Helper.Descriptions["ceil(nn)"] = "Rounds Argument 1 up to Argument 2's decimal precision"
E2Helper.Descriptions["floor(n)"] = "Rounds the Argument down to the nearest Integer"
E2Helper.Descriptions["floor(nn)"] = "Rounds Argument 1 down to Argument 2's decimal precision"
E2Helper.Descriptions["round(n)"] = "Rounds the Argument to the nearest Integer"
E2Helper.Descriptions["round(nn)"] = "Rounds Argument 1 to Argument 2's decimal precision"
E2Helper.Descriptions["int(n)"] = "Returns the Integer part of the Argument (always rounds towards zero)"
E2Helper.Descriptions["frac(n)"] = "Returns the Fractional part (decimal places) of the Argument"
E2Helper.Descriptions["clamp(nnn)"] = "If Arg1 = Arg3 (max) returns Arg3; otherwise returns Arg1"
E2Helper.Descriptions["inrange(nnn)"] = "Returns 1 if N is in the interval [N2; N3], 0 otherwise. This means it is equivalent to ((N2 <= N) & (N <= N3))"
E2Helper.Descriptions["sign(n)"] = "Returns the sign of argument (-1,0,1) [sign(N) = N / abs(N) ]"
E2Helper.Descriptions["min(nn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["min(nnn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["min(nnnn)"] = "Returns the lowest value Argument"
E2Helper.Descriptions["max(nn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["max(nnn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["max(nnnn)"] = "Returns the highest value Argument"
E2Helper.Descriptions["random()"] = "Returns a random floating-point number between 0 and 1 [0 <= x < 1 ]"
E2Helper.Descriptions["random(n)"] = "Returns a random floating-point number between 0 and the specified value [0 <= x < a ]"
E2Helper.Descriptions["random(nn)"] = "Returns a random floating-point number between the specified interval [a <= x < b ]"
E2Helper.Descriptions["randint(n)"] = "Returns a random integer from 1 to the specified value [1 <= x <= a ]"
E2Helper.Descriptions["randint(nn)"] = "Returns a random integer in the specified interval [a <= x <= b ]"
E2Helper.Descriptions["pi()"] = "Returns the constant PI"
E2Helper.Descriptions["toRad(n)"] = "Converts Degree angles to Radian angles"
E2Helper.Descriptions["toDeg(n)"] = "Converts Radian angles to Degree angles"
E2Helper.Descriptions["sin(n)"] = "Returns the sine of N degrees"
E2Helper.Descriptions["cos(n)"] = "Returns the cosine of N degrees"
E2Helper.Descriptions["tan(n)"] = "Returns the tangent of N degrees"
E2Helper.Descriptions["cot(n)"] = "Returns the cotangent of N degrees"
E2Helper.Descriptions["sec(n)"] = "Returns the secant of N degrees"
E2Helper.Descriptions["csc(n)"] = "Returns the cosecant of N degrees"
E2Helper.Descriptions["asin(n)"] = "Returns the inverse sine of the argument, in degrees"
E2Helper.Descriptions["acos(n)"] = "Returns the inverse cosine of the argument, in degrees"
E2Helper.Descriptions["atan(n)"] = "Returns the inverse tangent of the argument, in degrees"
E2Helper.Descriptions["atan(nn)"] = "Returns the inverse tangent of the arguments (arg1 / arg2), in degrees. This function accounts for positive/negative arguments, and arguments at or close to 0"
E2Helper.Descriptions["sinh(n)"] = "Returns the hyperbolic sine of N degrees"
E2Helper.Descriptions["cosh(n)"] = "Returns the hyperbolic cosine of N degrees"
E2Helper.Descriptions["tanh(n)"] = "Returns the hyperbolic tangent of N degrees"
E2Helper.Descriptions["coth(n)"] = "Returns the hyperbolic cotangent of N degrees"
E2Helper.Descriptions["sech(n)"] = "Returns the hyperbolic secant of N degrees"
E2Helper.Descriptions["csch(n)"] = "Returns the hyperbolic cosecant of N degrees"
E2Helper.Descriptions["sinr(n)"] = "Returns the sine of N radians"
E2Helper.Descriptions["cosr(n)"] = "Returns the cosine of N radians"
E2Helper.Descriptions["tanr(n)"] = "Returns the tangent of N radians"
E2Helper.Descriptions["cotr(n)"] = "Returns the cotangent of N radians"
E2Helper.Descriptions["secr(n)"] = "Returns the secant of N radians"
E2Helper.Descriptions["cscr(n)"] = "Returns the cosecant of N radians"
E2Helper.Descriptions["sinhr(n)"] = "Returns the hyperbolic sine of N radians"
E2Helper.Descriptions["coshr(n)"] = "Returns the hyperbolic cosine of N radians"
E2Helper.Descriptions["tanhr(n)"] = "Returns the hyperbolic tangent of N radians"
E2Helper.Descriptions["cothr(n)"] = "Returns the hyperbolic cotangent of N radians"
E2Helper.Descriptions["sechr(n)"] = "Returns the hyperbolic secant of N radians"
E2Helper.Descriptions["cschr(n)"] = "Returns the hyperbolic cosecant of N radians"
E2Helper.Descriptions["asinr(n)"] = "Returns the inverse sine of the argument, in radians"
E2Helper.Descriptions["acosr(n)"] = "Returns the inverse cosine of the argument, in radians"
E2Helper.Descriptions["atanr(n)"] = "Returns the inverse tangent of the argument, in radians"
E2Helper.Descriptions["atanr(nn)"] = "Returns the inverse tangent of the arguments (arg1 / arg2), in radians. This function accounts for positive/negative arguments, and arguments at or close to 0"
E2Helper.Descriptions["airDensity()"] = "Returns air density (affects how drag slows down props)"
E2Helper.Descriptions["speedLimit()"] = "Returns the speed limit"
E2Helper.Descriptions["angSpeedLimit()"] = "Returns the angular speed limit"
E2Helper.Descriptions["bearing(vav)"] = "Gets the bearing from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["elevation(vav)"] = "Gets the elevation from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["heading(vav)"] = "Gets the elevation and bearing from the first position, at the specified angle, to the second position"
E2Helper.Descriptions["changed"] = "Checks if the value or variable was changed. Accepts any type except table and array"
E2Helper.Descriptions["wrap(nn)"] = "Performs (n1 + n2) % (n2 * 2) - n2"

-- String
E2Helper.Descriptions["index(s:n)"] = "Returns Nth letter of the string, formatted as a string"
E2Helper.Descriptions["length(s:)"] = "Returns the length of the string"
E2Helper.Descriptions["unicodeLength(s:)"] = "Returns the unicode length of the string"
E2Helper.Descriptions["upper(s:)"] = "All characters are made uppercase"
E2Helper.Descriptions["lower(s:)"] = "All characters are made lowercase"
E2Helper.Descriptions["sub(s:n)"] = "Returns a substring, starting at the number argument and ending at the end of the string"
E2Helper.Descriptions["sub(s:nn)"] = "Returns a substring, starting at the first number argument and ending at the second"
E2Helper.Descriptions["left(s:n)"] = "Returns N amount of characters starting from the leftmost character"
E2Helper.Descriptions["right(s:n)"] = "Returns N amount of characters starting from the rightmost character"
E2Helper.Descriptions["find(s:s)"] = "Returns the 1st occurrence of the string S, returns 0 if not found"
E2Helper.Descriptions["find(s:sn)"] = "Returns the 1st occurrence of the string S starting at N and going to the end of the string, returns 0 if not found"
E2Helper.Descriptions["findRE(s:s)"] = "Returns the 1st occurrence of the string S using REGEX functions, returns 0 if not found"
E2Helper.Descriptions["findRE(s:sn)"] = "Returns the 1st occurrence of the string S starting at N and going to the end of the string using REGEX functions, returns 0 if not found"
E2Helper.Descriptions["explode(s:s)"] = "Splits the string into an array, along the boundaries formed by the string S. See also String.Explode"
E2Helper.Descriptions["explodeRE(s:s)"] = "Splits the string into an array, along the boundaries formed by the string pattern S. See also String.Explode"
E2Helper.Descriptions["repeat(s:n)"] = "Repeats the input string N times"
E2Helper.Descriptions["trim(s:)"] = "Trims away spaces at the beginning and end of a string"
E2Helper.Descriptions["trimLeft(s:)"] = "Trims away opening spaces on the string"
E2Helper.Descriptions["trimRight(s:)"] = "Trims away spaces at the end of a string"
E2Helper.Descriptions["replace(s:ss)"] = "Finds and replaces every occurrence of the first argument with the second argument"
E2Helper.Descriptions["replaceRE(s:ss)"] = "Finds and replaces every occurrence of the first argument using REGEX with the second argument"
E2Helper.Descriptions["reverse(s:)"] = "Returns a reversed version of S"
E2Helper.Descriptions["toNumber(s:)"] = "Parses a number from a string"
E2Helper.Descriptions["toNumber(s:n)"] = "Parses a number from a string. The argument given is the base. I.e. toNumber(16) will parse hex"
E2Helper.Descriptions["toString(n:)"] = "Formats a number as a string. (Numbers may be concatenated into a string without using this function)"
E2Helper.Descriptions["toString(n)"] = "Formats a number as a string. (Numbers may be concatenated into a string without using this function)"
E2Helper.Descriptions["toString(n:n)"] = "Formats a number as a string, using argument 2 as the base. i.e. using 16 for base would convert the number to hex"
E2Helper.Descriptions["toString(nn)"] = "Formats a number as a string, using argument 2 as the base. i.e. using 16 for base would convert the number to hex"
E2Helper.Descriptions["toChar(n)"] = "Returns a one-character string from it's ASCII code, where 32 = argument 1 = 255. An empty string is returned for numbers outside that range"
E2Helper.Descriptions["toUnicodeChar(n)"] = "Returns a one-character string from it's UNICODE code"
E2Helper.Descriptions["toByte(s)"] = "Returns the ASCII code of the 1st character in the string"
E2Helper.Descriptions["toUnicodeByte(s)"] = "Returns the Unicode code of the 1st character in the string"
E2Helper.Descriptions["toByte(sn)"] = "Returns the ASCII code of the Nth character in the string"
E2Helper.Descriptions["format(s...)"] = "Formats a values exactly like Lua's [http://www.lua.org/manual/5.1/manual.html#pdf-string.format string.format]. Any number and type of parameter can be passed through the \"...\". Prints errors to the chat area"
E2Helper.Descriptions["match(s:s)"] = "runs string.match(S, S2) and returns the sub-captures as an array"
E2Helper.Descriptions["match(s:sn)"] = "runs string.match(S, S2, N) and returns the sub-captures as an array"
E2Helper.Descriptions["matchFirst(s:s)"] = "runs string.match(S, S2) and returns the first match or an empty string if the match failed"
E2Helper.Descriptions["matchFirst(s:sn)"] = "runs string.match(S, S2, N) and returns the first match or an empty string if the match failed"
E2Helper.Descriptions["gmatch(s:s)"] = "runs string.gmatch(S, S2) and returns the captures in arrays in a table"
E2Helper.Descriptions["gmatch(s:sn)"] = "runs string.gmatch(S, S2, N) and returns the captures in arrays in a table"

-- Entity/Player
E2Helper.Descriptions["entity(n)"] = "Gets the entity associated with the id"
E2Helper.Descriptions["owner()"] = "Gets the owner of the expression ( same as entity():owner() )"
E2Helper.Descriptions["id(e:)"] = "Gets the numeric id of an entity"
E2Helper.Descriptions["noentity()"] = "Returns an invalid entity"
E2Helper.Descriptions["world()"] = "Returns the world entity"
E2Helper.Descriptions["sunDirection()"] = "Returns the vector direction that points towards the sun"
E2Helper.Descriptions["type(e:)"] = "Gets the class of an entity"
E2Helper.Descriptions["model(e:)"] = "Gets the model of an entity"
E2Helper.Descriptions["keyvalues(e:)"] = "Returns the keyvalue table of an entity"
E2Helper.Descriptions["owner(e:)"] = "Gets the owner of an entity"
E2Helper.Descriptions["name(e:)"] = "Gets the name of a player"
E2Helper.Descriptions["steamID(e:)"] = "Gets the steam ID of the player"
E2Helper.Descriptions["steamID64(e:)"] = "Gets the Steam Community ID (aka Steam64) of the given player"
E2Helper.Descriptions["isSteamFriend(e:e)"] = "Returns if the given Entity is a steam friend of the first Entity"
E2Helper.Descriptions["steamFriends(e:)"] = "Returns a Array with E's steam friends on the server E is playing on"
E2Helper.Descriptions["pos(e:)"] = "Gets the position of the entity"
E2Helper.Descriptions["eye(e:)"] = "Gets a players view direction else entity forward direction"
E2Helper.Descriptions["eyeAngles(e:)"] = "Gets a players view direction"
E2Helper.Descriptions["eyeTrace(e:)"] = "Performs a quick trace from the player's eye. Equivalent to rangerOffset(16384, E:shootPos(), E:eye()), but faster. Does not respect filters or ranger flags"
E2Helper.Descriptions["eyeTraceCursor(e:)"] = "Same as eyeTrace, except it also works when the player (for example) is holding down C"
E2Helper.Descriptions["shootPos(e:)"] = "Returns a players shoot position"
E2Helper.Descriptions["aimEntity(e:)"] = "Returns the entity that the entity is aiming at"
E2Helper.Descriptions["aimBone(e:)"] = "Returns the bone the player is currently aiming at"
E2Helper.Descriptions["aimPos(e:)"] = "Returns the point that the entity is looking at"
E2Helper.Descriptions["aimNormal(e:)"] = "Returns a normalized directional vector perpendicular to the surface pointed at"
E2Helper.Descriptions["frags(e:)"] = "Returns the number of kills the player has made"
E2Helper.Descriptions["deaths(e:)"] = "Returns the number of times the player died"
E2Helper.Descriptions["team(e:)"] = "Returns the team number a player is on"
E2Helper.Descriptions["teamName(n)"] = "Returns the name of the team associated with the team number"
E2Helper.Descriptions["teamName(n:)"] = "Returns the name of the team associated with the team number"
E2Helper.Descriptions["teamColor(n)"] = "Returns the color of the team associated with the team number"
E2Helper.Descriptions["teamDeaths(n)"] = "Returns the number of deaths of the team associated with the team number"
E2Helper.Descriptions["teamDeaths(n:)"] = "Returns the number of deaths of the team associated with the team number"
E2Helper.Descriptions["teamFrags(n)"] = "Returns the number of kills of the team associated with the team number"
E2Helper.Descriptions["teamFrags(n:)"] = "Returns the number of kills of the team associated with the team number"
E2Helper.Descriptions["teamPlayers(n)"] = "Returns the number of players of the team associated with the team number"
E2Helper.Descriptions["teamPlayers(n:)"] = "Returns the number of players of the team associated with the team number"
E2Helper.Descriptions["teamScore(n)"] = "Returns the score of the team associated with the team number"
E2Helper.Descriptions["teamScore(n:)"] = "Returns the score of the team associated with the team number"
E2Helper.Descriptions["teams()"] = "Returns an array of all teams"
E2Helper.Descriptions["forward(e:)"] = "Gets the forward direction of the entity 2)"
E2Helper.Descriptions["right(e:)"] = "Gets the right direction of the entity"
E2Helper.Descriptions["up(e:)"] = "Gets the up direction of the entity"
E2Helper.Descriptions["vel(e:)"] = "Gets the velocity of the entity"
E2Helper.Descriptions["velL(e:)"] = "Gets the local velocity of the entity"
E2Helper.Descriptions["boxCenter(e:)"] = "Gets the center of the entity's bounding box, as a local position vector"
E2Helper.Descriptions["boxMax(e:)"] = "Gets the maximum local XYZ of the entity's bounding box (the \"highest\" corner), as a local position vector"
E2Helper.Descriptions["boxMin(e:)"] = "Gets the minimum local XYZ of the entity's bounding box (the \"lowest\" corner), as a local position vector"
E2Helper.Descriptions["boxSize(e:)"] = "Gets the dimensions of the entity's bounding box as a vector (length, width, height)"
E2Helper.Descriptions["toWorld(e:v)"] = "Transforms from a vector local to E to a world vector"
E2Helper.Descriptions["toLocal(e:v)"] = "Transforms from a world vector to a vector local to E"
E2Helper.Descriptions["toWorld(e:a)"] = "Transforms from an angle local to E to a world angle"
E2Helper.Descriptions["toLocal(e:a)"] = "Transforms from a world angle to an angle local to E"
E2Helper.Descriptions["toWorldAxis(e:v)"] = "Transforms an axis local to E to a global axis"
E2Helper.Descriptions["toLocalAxis(e:v)"] = "Transforms a world axis to an axis local to E"
E2Helper.Descriptions["angVel(e:)"] = "Gets the angular velocity of the entity"
E2Helper.Descriptions["angVelVector(e:)"] = "Returns rotation axis, velocity and direction given as the vector's direction, magnitude and sense"
E2Helper.Descriptions["angles(e:)"] = "Gets the pitch, yaw and roll of the entity"
E2Helper.Descriptions["radius(e:)"] = "Gets the size of the object (not precisely, but useful)"
E2Helper.Descriptions["height(e:)"] = "Gets the height of a player or npc"
E2Helper.Descriptions["bearing(e:v)"] = "Gets the bearing from the entity to the vector"
E2Helper.Descriptions["elevation(e:v)"] = "Gets the elevation from the entity to the vector"
E2Helper.Descriptions["heading(e:v)"] = "Gets the elevation and bearing from the entity to the vector"
E2Helper.Descriptions["health(e:)"] = "Gets the health of the entity"
E2Helper.Descriptions["maxHealth(e:)"] = "Gets the max health of the entity"
E2Helper.Descriptions["armor(e:)"] = "Gets the armor of the player"
E2Helper.Descriptions["volume(e:)"] = "Gets the volume of the entity"
E2Helper.Descriptions["surfaceArea(e:)"] = "Gets the surface area of the entity"
E2Helper.Descriptions["stress(e:)"] = "Gets the stress of the entity"
E2Helper.Descriptions["frictionSnapshot(e:)"] = "Returns current friction events of the entity as a table of tables [https://wiki.facepunch.com/gmod/PhysObj:GetFrictionSnapshot]"
E2Helper.Descriptions["mass(e:)"] = "Gets the mass of the entity"
E2Helper.Descriptions["timeConnected(e:)"] = "Returns a players time connected to a server"
E2Helper.Descriptions["creationTime(e:)"] = "Returns the time the entity was created on, relative to curtime."
E2Helper.Descriptions["massCenter(e:)"] = "Gets the Center of Mass of the entity"
E2Helper.Descriptions["massCenterL(e:)"] = "Gets the center of mass as a local vector"
E2Helper.Descriptions["setMass(n)"] = "Sets the mass of the E2 chip (between 0.001 and 50,000)"
E2Helper.Descriptions["setMass(e:n)"] = "Sets the mass of the entity (between 0.001 and 50,000)"
E2Helper.Descriptions["inertia(e:)"] = "Gets the principal components of the entity's inertia tensor in the form ( Ixx, Iyy, Izz )"
E2Helper.Descriptions["applyForce(v)"] = "Applies force to the E2 chip according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyForce(e:v)"] = "Applies force to the entity according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyOffsetForce(vv)"] = "Applies force to the E2 chip according to the first vector from the location of the second"
E2Helper.Descriptions["applyOffsetForce(e:vv)"] = "Applies force to the entity according to the first vector from the location of the second"
E2Helper.Descriptions["applyAngForce(a)"] = "Applies torque to the E2 chip according to the given angle"
E2Helper.Descriptions["applyAngForce(e:a)"] = "Applies torque to the entity according to the given angle"
E2Helper.Descriptions["applyTorque(v)"] = "Applies torque to the E2 chip according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["applyTorque(e:v)"] = "Applies torque to the entity according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["isPlayer(e:)"] = "Is the entity a player?"
E2Helper.Descriptions["isOnFire(e:)"] = "Is the entity on fire?"
E2Helper.Descriptions["isWeapon(e:)"] = "Is the entity a weapon?"
E2Helper.Descriptions["isNPC(e:)"] = "Is the entity a NPC?"
E2Helper.Descriptions["isFrozen(e:)"] = "Is the entity frozen?"
E2Helper.Descriptions["isVehicle(e:)"] = "Is the entity a vehicle?"
E2Helper.Descriptions["inVehicle(e:)"] = "Is the player in a vehicle?"
E2Helper.Descriptions["isWorld(e:)"] = "Is the entity the world?"
E2Helper.Descriptions["isOnGround(e:)"] = "Is the player/NPC resting on something?"
E2Helper.Descriptions["isUnderWater(e:)"] = "Is the entity under water?"
E2Helper.Descriptions["isPlayerHolding(e:)"] = "Is the entity being held by a player?"
E2Helper.Descriptions["isAdmin(e:)"] = "Is the player an admin?"
E2Helper.Descriptions["isSuperAdmin(e:)"] = "Is the player a super admin?"
E2Helper.Descriptions["isAlive(e:)"] = "Is the player or NPC alive?"
E2Helper.Descriptions["isCrouch(e:)"] = "Is the player crouching?"
E2Helper.Descriptions["isFlashlightOn(e:)"] = "Returns 1 if the player has flashlight on, 0 otherwise"
E2Helper.Descriptions["isTyping(e:)"] = "Is the player typing a message in chat?"
E2Helper.Descriptions["isValid(e:)"] = "Returns 1 if the entity is valid, 0 otherwise"
E2Helper.Descriptions["isValidPhysics(e:)"] = "Returns 1 if the entity has valid physics (players don't)"
E2Helper.Descriptions["inNoclip(e:)"] = "Is the player in noclip mode?"
E2Helper.Descriptions["friends(e:)"] = "Returns an array of players on the prop protection friends list"
E2Helper.Descriptions["trusts(e:e)"] = "Is E2 on the prop protection friends list of E?"
E2Helper.Descriptions["keyAttack1(e:)"] = "Is the player pressing their primary fire key?"
E2Helper.Descriptions["keyAttack2(e:)"] = "Is the player pressing their secondary fire key?"
E2Helper.Descriptions["keyDuck(e:)"] = "Is the player pressing their crouch key?"
E2Helper.Descriptions["keyForward(e:)"] = "Is the player pressing their forward key? (default W)"
E2Helper.Descriptions["keyJump(e:)"] = "Is the player pressing their jump key?"
E2Helper.Descriptions["keyLeft(e:)"] = "Is the player pressing their left key? (default A)"
E2Helper.Descriptions["keyLeftTurn(e:)"] = "Is the player pressing their Look left key?"
E2Helper.Descriptions["keyReload(e:)"] = "Is the player pressing their reload key?"
E2Helper.Descriptions["keyRight(e:)"] = "Is the player pressing their right key? (default D)"
E2Helper.Descriptions["keyRightTurn(e:)"] = "Is the player pressing their Look right key?"
E2Helper.Descriptions["keySprint(e:)"] = "Is the player pressing their sprint key?"
E2Helper.Descriptions["keyWalk(e:)"] = "Is the player pressing their walk key?"
E2Helper.Descriptions["keyZoom(e:)"] = "Is the player pressing their zoom key?"
E2Helper.Descriptions["keyUse(e:)"] = "Is the player pressing their use key?"
E2Helper.Descriptions["keyPressed(e:s)"] = "Is the player pressing the KEY_ enumeration [S]? For example, 'W', 'K', '4', 'COMMA'"
E2Helper.Descriptions["keyBack(e:)"] = "Is the player pressing their back key? (default S)"
E2Helper.Descriptions["driver(e:)"] = "Returns the driver of the vehicle if there is one, nil otherwise"
E2Helper.Descriptions["passenger(e:)"] = "Returns the passenger of the vehicle if there is one, in single seat pods this will return the driver"
E2Helper.Descriptions["vehicle(e:)"] = "Returns the entity of the vehicle that the specified player is in"
E2Helper.Descriptions["ejectPod(e:)"] = "Ejects player in vehicle"
E2Helper.Descriptions["lockPod(e:n)"] = "1 locks and 0 unlocks the vehicle"
E2Helper.Descriptions["killPod(e:)"] = "Kills player in vehicle"
E2Helper.Descriptions["podStripWeapons(e:)"] = "Strips player in vehicle"
E2Helper.Descriptions["weapon(e:s)"] = "Returns the weapon with specified class of player E"
E2Helper.Descriptions["weapon(e:)"] = "Returns the weapon that player E is currently holding"
E2Helper.Descriptions["weapons(e:)"] = "Returns the weapons that player E has"
E2Helper.Descriptions["clip1(e:)"] = "Returns the amount of ammo in the primary clip of weapon E, -1 if there is no primary clip"
E2Helper.Descriptions["clip2(e:)"] = "Returns the amount of ammo in the secondary clip of weapon E, -1 if there is no secondary clip 1)"
E2Helper.Descriptions["primaryAmmoType(e:)"] = "Returns the name of the primary weapon's ammo"
E2Helper.Descriptions["secondaryAmmoType(e:)"] = "Returns the name of the secondary weapon's ammo"
E2Helper.Descriptions["ammoCount(e:s)"] = "Returns the amount of stored ammo of type S on player E, excluding current clip"
E2Helper.Descriptions["tool(e:)"] = "returns the name of the tool the player E is currently holding"
E2Helper.Descriptions["nearestPoint(e:v)"] = "Returns the closest point on the edge of the entity's bounding box to the given vector"
E2Helper.Descriptions["boxCenterW(e:)"] = "Same as using E:toWorld(E:boxCenter()), but since Lua is faster, this is more efficient (also shorter to write)"
E2Helper.Descriptions["aabbMin(e:)"] = "Returns the entity's (min) axis-aligned bounding box"
E2Helper.Descriptions["aabbMax(e:)"] = "Returns the entity's (max) axis-aligned bounding box"
E2Helper.Descriptions["aabbSize(e:)"] = "Returns the entity's axis-aligned bounding box size"
E2Helper.Descriptions["aabbWorldMin(e:)"] = "Returns the rotated entity's min world-axis-aligned bounding box corner"
E2Helper.Descriptions["aabbWorldMax(e:)"] = "Returns the rotated entity's max world-axis-aligned bounding box corner"
E2Helper.Descriptions["aabbWorldSize(e:)"] = "Returns the rotated entity's world-axis-aligned bounding box size"
E2Helper.Descriptions["keyClk()"] = "Returns the player that pressed/released the key if the E2 was triggered by runOnKeys"
E2Helper.Descriptions["keyClk(e)"] = "Returns 1 if the E2 was triggered by the player pressing a key or -1 when releasing a key"
E2Helper.Descriptions["keyClkPressed()"] = "Returns the name of the pressed/released key that triggered the E2"
E2Helper.Descriptions["runOnUse(n)"] = "If set to 1, E2 will run when a player presses E on the E2"
E2Helper.Descriptions["useClk()"] = "Returns the player that used the E2, if the E2 was triggered by runOnUse"
E2Helper.Descriptions["setTrails(e:nnnsvn)"] = "StartSize, EndSize, Length, Material, Color (RGB), Alpha. Adds a trail to E with the specified attributes"
E2Helper.Descriptions["setTrails(e:nnnsvnnn)"] = "StartSize, EndSize, Length, Material, Color (RGB), Alpha, AttachmentID, Additive. Adds a trail to E with the specified attributes"
E2Helper.Descriptions["removeTrails(e:)"] = "Removes the trail from E"
E2Helper.Descriptions["runOnKeys(en)"] = "If set to 1, E2 will run when specified player presses/releases their key"
E2Helper.Descriptions["playerDisconnectClk()"] = "Returns 1 if the chip is being executed because of a player disconnect event. Returns 0 otherwise"
E2Helper.Descriptions["lastDisconnectedPlayer()"] = "Returns the last player to disconnect. Must be done while in a disconnectClk() as anytime after the player object is gone."
E2Helper.Descriptions["runOnPlayerDisconnect(n)"] = "If set to 0, the chip will no longer run on player disconnect events, otherwise it makes this chip execute when someone disconnects. Only needs to be called once, not in every execution"
E2Helper.Descriptions["playerConnectClk()"] = "Returns 1 if the chip is being executed because of a player connect event. Returns 0 otherwise"
E2Helper.Descriptions["lastConnectedPlayer()"] = "Returns the last player to connect."
E2Helper.Descriptions["runOnPlayerConnect(n)"] = "If set to 0, the chip will no longer run on player connect events, otherwise it makes this chip execute when someone connects. Only needs to be called once, not in every execution"
E2Helper.Descriptions["inGodMode(e:)"] = "Returns whether the player has god mode or not"

-- Attachment
E2Helper.Descriptions["lookupAttachment(e:s)"] = "Returns Es attachment ID associated with attachmentName"
E2Helper.Descriptions["attachmentPos(e:n)"] = "Returns Es attachment position associated with attachmentID"
E2Helper.Descriptions["attachmentAng(e:n)"] = "Returns Es attachment angle associated with attachmentID"
E2Helper.Descriptions["attachmentPos(e:s)"] = "Same as E:attachmentPos(E:lookupAttachment(attachmentName))"
E2Helper.Descriptions["attachmentAng(e:s)"] = "Same as E:attachmentAng(E:lookupAttachment(attachmentName))"
E2Helper.Descriptions["attachments(e:)"] = "Returns array of attachment names of the entity"

-- Vector
E2Helper.Descriptions["vec2(n)"] = "Makes a 2D vector"
E2Helper.Descriptions["vec2(nn)"] = "Makes a 2D vector"
E2Helper.Descriptions["vec2()"] = "Same as vec2(0,0)"
E2Helper.Descriptions["vec2(v)"] = "Converts a 3D vector into a 2D vector (the z component is dropped)"
E2Helper.Descriptions["vec2(xv4)"] = "Converts a 4D vector into a 2D vector (the z and w components are dropped)"
E2Helper.Descriptions["shift(xv2)"] = "Swaps the vector's x,y components"
E2Helper.Descriptions["toAngle(xv2:)"] = "Returns the 2D angle of the vector (given in degrees, -180 to 180)"
E2Helper.Descriptions["dehomogenized(v:)"] = "Converts a 2D homogeneous vector (x,y,w) into a 2D cartesian vector"
E2Helper.Descriptions["vec(n)"] = "Makes a 3D vector"
E2Helper.Descriptions["vec(nnn)"] = "Makes a 3D vector"
E2Helper.Descriptions["vec()"] = "Same as vec(0,0,0)"
E2Helper.Descriptions["vec(xv2)"] = "Converts a 2D vector into a 3D vector (the z component is set to 0)"
E2Helper.Descriptions["vec(xv2n)"] = "Converts a 2D vector into a 3D vector (the z component is set to the second argument)"
E2Helper.Descriptions["vec(xv4)"] = "Converts a 4D vector into a 3D vector (the w component is dropped)"
E2Helper.Descriptions["vec(a)"] = "Changes an angle variable into a vector variable. PYR become XYZ respectively"
E2Helper.Descriptions["randvec()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec2()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec4()"] = "Returns a uniformly distributed, random, normalized direction vector"
E2Helper.Descriptions["randvec(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec2(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec4(nn)"] = "Returns a random vector with its components between N1 and N2"
E2Helper.Descriptions["randvec2(xv2xv2)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["randvec(vv)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["randvec4(xv4xv4)"] = "Returns a random vector between V1 and V2"
E2Helper.Descriptions["shiftL(v)"] = "Shifts the vector's components left: shiftL( x,y,z ) = ( y,z,x )"
E2Helper.Descriptions["shiftR(v)"] = "Shifts the vector's components right: shiftR( x,y,z ) = ( z,x,y )"
E2Helper.Descriptions["rotate(v:a)"] = "Gets the rotated vector"
E2Helper.Descriptions["rotate(v:nnn)"] = "Gets the rotated vector"
E2Helper.Descriptions["rotate(xv2:n)"] = "Rotates a vector by the argument (given in degrees)"
E2Helper.Descriptions["toAngle(v:)"] = "Converts a direction vector into an angle"
E2Helper.Descriptions["toAngle(v:v)"] = "Converts a direction vector into an angle with roll being determined by the up vector"
E2Helper.Descriptions["toDeg(xv2)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toDeg(v)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toDeg(xv4)"] = "Converts the vector's magnitude from radians to degrees"
E2Helper.Descriptions["toRad(xv2)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["toRad(v)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["toRad(xv4)"] = "Converts the vector's magnitude from radians to radians"
E2Helper.Descriptions["dehomogenized(xv4:)"] = "Converts a 3D homogeneous vector (x,y,z,w) into a 3D cartesian vector"
E2Helper.Descriptions["isInWorld(v:)"] = "Returns 1 if the position vector is within the world, 0 if not"
E2Helper.Descriptions["vec4(n)"] = "Makes a 4D vector"
E2Helper.Descriptions["vec4(nnnn)"] = "Makes a 4D vector"
E2Helper.Descriptions["vec4()"] = "Same as vec4(0,0,0,0)"
E2Helper.Descriptions["vec4(xv2)"] = "Converts a 2D vector into a 4D vector (the z and w components are set to 0)"
E2Helper.Descriptions["vec4(xv2nn)"] = "Converts a 2D vector into a 4D vector (the z and w components are set to the second and third arguments)"
E2Helper.Descriptions["vec4(xv2xv2)"] = "Creates a 4D vector from two 2D vectors"
E2Helper.Descriptions["vec4(v)"] = "Converts a 3D vector into a 4D vector (the w component is set to 0)"
E2Helper.Descriptions["vec4(vn)"] = "Converts a 3D vector into a 4D vector (the w component is set to the second argument)"
E2Helper.Descriptions["shiftL(xv4)"] = "Shifts the vector's components left: shiftL( x,y,z,w ) = ( y,z,w,x )"
E2Helper.Descriptions["shiftR(xv4)"] = "Shifts the vector's components right: shiftR( x,y,z,w ) = ( w,x,y,z )"
E2Helper.Descriptions["ceil(xv2)"] = "Rounds XY up to the nearest integer"
E2Helper.Descriptions["ceil(v)"] = "Rounds XYZ up to the nearest integer"
E2Helper.Descriptions["ceil(xv4)"] = "Rounds XYZW up to the nearest integer"
E2Helper.Descriptions["ceil(xv2n)"] = "Rounds XY up to argument 2's decimal precision"
E2Helper.Descriptions["ceil(vn)"] = "Rounds XYZ up to argument 2's decimal precision"
E2Helper.Descriptions["ceil(xv4n)"] = "Rounds XYZW up to argument 2's decimal precision"
E2Helper.Descriptions["floor(xv2)"] = "Rounds XY down to the nearest integer"
E2Helper.Descriptions["floor(v)"] = "Rounds XYZ down to the nearest integer"
E2Helper.Descriptions["floor(xv4)"] = "Rounds XYZW down to the nearest integer"
E2Helper.Descriptions["floor(xv2n)"] = "Rounds XY down to argument 2's decimal precision"
E2Helper.Descriptions["floor(vn)"] = "Rounds XYZ down to argument 2's decimal precision"
E2Helper.Descriptions["floor(xv4n)"] = "Rounds XYZW down to argument 2's decimal precision"
E2Helper.Descriptions["round(xv2)"] = "Rounds XY to the nearest integer"
E2Helper.Descriptions["round(v)"] = "Rounds XYZ to the nearest integer"
E2Helper.Descriptions["round(xv4)"] = "Rounds XYZW to the nearest integer"
E2Helper.Descriptions["round(xv2n)"] = "Rounds XY to argument 2's decimal precision"
E2Helper.Descriptions["round(vn)"] = "Rounds XYZ to argument 2's decimal precision"
E2Helper.Descriptions["round(xv4n)"] = "Rounds XYZW to argument 2's decimal precision"
E2Helper.Descriptions["mod(xv2n)"] = "Returns the remainder after XY have been divided by argument 2"
E2Helper.Descriptions["mod(vn)"] = "Returns the remainder after XYZ have been divided by argument 2"
E2Helper.Descriptions["mod(xv4n)"] = "Returns the remainder after XYZW have been divided by argument 2"
E2Helper.Descriptions["mod(xv2xv2)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["mod(vv)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["mod(xv4xv4)"] = "Returns the remainder after the components of vector 1 have been divided by the components of vector 2"
E2Helper.Descriptions["clamp(xv2xv2xv2)"] = "Clamps vector 1's XY between the XY of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(vvv)"] = "Clamps vector 1's XYZ between the XYZ of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(xv4xv4xv4)"] = "Clamps vector 1's XYZW between the XYZW of vector 2(min) and vector 3(max)"
E2Helper.Descriptions["clamp(xv2nn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["clamp(vnn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["clamp(xv4nn)"] = "Returns a vector in the same direction as vector 1, with length clamped between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["min(xv2xv2)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["min(vv)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["min(xv4xv4)"] = "Returns the vector with the smallest length"
E2Helper.Descriptions["max(xv2xv2)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["max(vv)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["max(xv4xv4)"] = "Returns the vector with the greatest length"
E2Helper.Descriptions["minVec(xv2xv2)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["minVec(vv)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["minVec(xv4xv4)"] = "Returns a vector combining the lowest value components of V1 and V2"
E2Helper.Descriptions["maxVec(xv2xv2)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["maxVec(vv)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["maxVec(xv4xv4)"] = "Returns the vector combining the highest value components of V1 and V2"
E2Helper.Descriptions["mix(xv2xv2n)"] = "Combines vector 1's XY with vector 2's XY by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["mix(vvn)"] = "Combines vector 1's XYZ with vector 2's XYZ by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["mix(xv4xv4n)"] = "Combines vector 1's XYZW with vector 2's XYZW by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["positive(xv2)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["positive(v)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["positive(xv4)"] = "Returns a vector containing the positive value of each vector component, equivalent to abs(N)"
E2Helper.Descriptions["inrange(xv2xv2xv2)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["inrange(vvv)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["inrange(xv4xv4xv4)"] = "Returns 1 if each component of V is between (or is equal to) the components of Vmin and Vmax"
E2Helper.Descriptions["length(xv2:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length(v:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length(xv4:)"] = "Gets the length of the vector"
E2Helper.Descriptions["length2(xv2:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["length2(v:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["length2(xv4:)"] = "Gets the squared length of the vector"
E2Helper.Descriptions["distance(xv2:xv2)"] = "Gets the distance between 2D vectors"
E2Helper.Descriptions["distance(v:v)"] = "Gets the distance between vectors"
E2Helper.Descriptions["distance(xv4:xv4)"] = "Gets the distance between 4D vectors"
E2Helper.Descriptions["distance2(xv2:xv2)"] = "Gets the squared distance between 2D vectors"
E2Helper.Descriptions["distance2(v:v)"] = "Gets the squared distance between vectors"
E2Helper.Descriptions["distance2(xv4:xv4)"] = "Gets the squared distance between 4D vectors"
E2Helper.Descriptions["normalized(xv2:)"] = "Gets the normalized vector"
E2Helper.Descriptions["normalized(v:)"] = "Gets the normalized vector"
E2Helper.Descriptions["normalized(xv4:)"] = "Gets the normalized vector"
E2Helper.Descriptions["dot(xv2:xv2)"] = "Gets the 2D vector dot (scalar) product"
E2Helper.Descriptions["dot(v:v)"] = "Gets the vector dot (scalar) product"
E2Helper.Descriptions["dot(xv4:xv4)"] = "Gets the 4D vector dot (scalar) product"
E2Helper.Descriptions["cross(xv2:xv2)"] = "Gets the 2D vector cross product/wedge product"
E2Helper.Descriptions["cross(v:v)"] = "Gets the vector cross product"
E2Helper.Descriptions["x(xv2:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["x(v:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["x(xv4:)"] = "Gets the x component of the vector"
E2Helper.Descriptions["y(xv2:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["y(v:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["y(xv4:)"] = "Gets the y component of the vector"
E2Helper.Descriptions["z(v:)"] = "Gets the z component of the vector"
E2Helper.Descriptions["z(xv4:)"] = "Gets the z component of the vector"
E2Helper.Descriptions["w(xv4:)"] = "Gets the w component of the vector"
E2Helper.Descriptions["setX(xv2:n)"] = "Returns a copy of the 2D vector with X replaced (use as Vec2 = Vec2:setX(...))"
E2Helper.Descriptions["setX(v:n)"] = "Returns a copy of the vector with X replaced (use as Vec = Vec:setX(...))"
E2Helper.Descriptions["setX(xv4:n)"] = "Returns a copy of the 4D vector with X replaced (use as Vec4 = Vec4:setX(...))"
E2Helper.Descriptions["setY(xv2:n)"] = "Returns a copy of the 2D vector with Y replaced (use as Vec2 = Vec2:setY(...))"
E2Helper.Descriptions["setY(v:n)"] = "Returns a copy of the vector with Y replaced (use as Vec = Vec:setY(...))"
E2Helper.Descriptions["setY(xv4:n)"] = "Returns a copy of the 4D vector with Y replaced (use as Vec4 = Vec4:setY(...))"
E2Helper.Descriptions["setZ(v:n)"] = "Returns a copy of the vector with Z replaced (use as Vec = Vec:setZ(...))"
E2Helper.Descriptions["setZ(xv4:n)"] = "Returns a copy of the 4D vector with Z replaced (use as Vec4 = Vec4:setZ(...))"
E2Helper.Descriptions["setW(xv4:n)"] = "Returns a copy of the 4D vector with W replaced (use as Vec4 = Vec4:setW(...))"
E2Helper.Descriptions["toString(xv2:)"] = "Gets the vector nicely formatted as a string \"[X,Y]\""
E2Helper.Descriptions["toString(xv2)"] = "Gets the vector nicely formatted as a string \"[X,Y]\""
E2Helper.Descriptions["toString(v:)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z]\""
E2Helper.Descriptions["toString(v)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z]\""
E2Helper.Descriptions["toString(xv4:)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z,W]\""
E2Helper.Descriptions["toString(xv4)"] = "Gets the vector nicely formatted as a string \"[X,Y,Z,W]\""
E2Helper.Descriptions["toWorld(vava)"] = "Converts a local position/angle to a world position/angle and returns the position"
E2Helper.Descriptions["toWorldAng(vava)"] = "Converts a local position/angle to a world position/angle and returns the angle"
E2Helper.Descriptions["toWorldPosAng(vava)"] = "Converts a local position/angle to a world position/angle and returns both in an array"
E2Helper.Descriptions["toLocal(vava)"] = "Converts a world position/angle to a local position/angle and returns the position"
E2Helper.Descriptions["toLocalAng(vava)"] = "Converts a world position/angle to a local position/angle and returns the angle"
E2Helper.Descriptions["toLocalPosAng(vava)"] = "Converts a world position/angle to a local position/angle and returns both in an array"
E2Helper.Descriptions["outerProduct(v:v)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["outerProduct(xv2:xv2)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["outerProduct(xv4:xv4)"] = "Gets the outer product (tensor product) and returns a matrix (tensor)"
E2Helper.Descriptions["pointContents(v)"] = "Returns a string with all the \"content\" types in the vector point, seperated by commas"
E2Helper.Descriptions["pointContentsArray(v)"] = "Returns an array with all the \"content\" types in the vector point"
E2Helper.Descriptions["pointHasContent(vs)"] = "'S' can be a string containing the last half of the CONTENTS_ enums (ie without the \"CONTENTS_\"). Multiple CONTENTS types can be seperated by a comma. Check: Enumeration_List:Contents for a full list. Examples: \"water,solid\" or \"empty,transparent\". The function returns 1 if any one of the types are found in the vector point"
E2Helper.Descriptions["bezier(xv2xv2xv2n)"] = "Returns the 2D position on the bezier curve between the starting and ending 2D vector, given by the ratio (value between 0 and 1)"
E2Helper.Descriptions["bezier(vvvn)"] = "Returns the 3D vector position on the bezier curve between the starting and ending 3D vector, given by the ratio (value between 0 and 1)"

-- Matrix
E2Helper.Descriptions["identity2()"] = "Creates a 2x2 identity matrix"
E2Helper.Descriptions["matrix2()"] = "Creates a 2x2 zero matrix"
E2Helper.Descriptions["matrix2(nnnn)"] = "Creates a matrix with values in order (i.j) of: (1,1), (1,2), (2,1), (2,2)"
E2Helper.Descriptions["matrix2(xv2xv2)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix2(m)"] = "Converts a 3x3 matrix into a 2x2 matrix - all (i,3) and (3,j) are omitted"
E2Helper.Descriptions["matrix2(xm4)"] = "Converts a 4x4 matrix into a 2x2 matrix - all (i,3), (i,4), (3,j) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(xm2:)"] = "Swaps rows"
E2Helper.Descriptions["swapColumns(xm2:)"] = "Swaps columns"
E2Helper.Descriptions["setRow(xm2:nnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j"
E2Helper.Descriptions["setRow(xm2:nxv2)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm2:nnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2"
E2Helper.Descriptions["setColumn(xm2:nxv2)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["identity2()"] = "Creates a 2x2 identity matrix"
E2Helper.Descriptions["matrix2()"] = "Creates a 2x2 zero matrix"
E2Helper.Descriptions["matrix2(nnnn)"] = "Creates a matrix with values in order (i.j) of: (1,1), (1,2), (2,1), (2,2)"
E2Helper.Descriptions["matrix2(xv2xv2)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix2(m)"] = "Converts a 3x3 matrix into a 2x2 matrix - all (i,3) and (3,j) are omitted"
E2Helper.Descriptions["matrix2(xm4)"] = "Converts a 4x4 matrix into a 2x2 matrix - all (i,3), (i,4), (3,j) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(xm2:)"] = "Swaps rows"
E2Helper.Descriptions["swapColumns(xm2:)"] = "Swaps columns"
E2Helper.Descriptions["setRow(xm2:nnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j"
E2Helper.Descriptions["setRow(xm2:nxv2)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm2:nnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2"
E2Helper.Descriptions["setColumn(xm2:nxv2)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["identity()"] = "Creates a 3x3 identity matrix"
E2Helper.Descriptions["matrix()"] = "Creates a 3x3 zero matrix"
E2Helper.Descriptions["matrix(nnnnnnnnn)"] = "Creates a matrix with 9 values in the following order (i.j): (1,1), (1,2), (1,3), (2,1) etc"
E2Helper.Descriptions["matrix(vvv)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix(xm2)"] = "Converts a 2x2 matrix into a 3x3 matrix - all (i,3) and (3,j) are filled with 0's"
E2Helper.Descriptions["matrix(xm4)"] = "Converts a 4x4 matrix into a 3x3 matrix - all (i,4) and (4,j) are omitted"
E2Helper.Descriptions["swapRows(m:nn)"] = "Swaps the two rows specified"
E2Helper.Descriptions["swapColumns(m:nn)"] = "Swaps the two columns specified"
E2Helper.Descriptions["setRow(m:nnnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j, 3j"
E2Helper.Descriptions["setRow(m:nv)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(m:nnnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2, i3"
E2Helper.Descriptions["setColumn(m:nv)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["setDiagonal(m:nnn)"] = "Sets the elements of the leading diagonal"
E2Helper.Descriptions["setDiagonal(m:v)"] = "Sets the elements of the leading diagonal from the components of a vector"
E2Helper.Descriptions["matrix(e)"] = "Creates a reference frame matrix from an entity's local direction vectors by columns in the order ( x, y, z )"
E2Helper.Descriptions["matrix(a)"] = "Returns a 3x3 reference frame matrix as described by the angle A. Multiplying by this matrix will be the same as rotating by the given angle"
E2Helper.Descriptions["x(m:)"] = "Returns the local x direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(1) )"
E2Helper.Descriptions["y(m:)"] = "Returns the local y direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(2) )"
E2Helper.Descriptions["z(m:)"] = "Returns the local z direction vector from a 3x3 coordinate reference frame matrix ( same as M:column(3) )"
E2Helper.Descriptions["mRotation(vn)"] = "Creates a 3x3 rotation matrix, where the vector is the axis of rotation, and the number is the angle (anti-clockwise) in degrees. Example*: to rotate a vector (7,8,9) by 50 degrees about the axis (1,1,0), you would write V = mRotation(vec(1,1,0), 50) * vec(7,8,9)"
E2Helper.Descriptions["identity4()"] = "Creates a 4x4 identity matrix"
E2Helper.Descriptions["matrix4()"] = "Creates a 4x4 zero matrix"
E2Helper.Descriptions["matrix4(nnnnnnnnnnnnnnnn)"] = "Creates a matrix with 16 values in the following order (i.j): (1,1), (1,2), (1,3), (1,4), (2,1) etc"
E2Helper.Descriptions["matrix4(xv4xv4xv4xv4)"] = "Creates a matrix with vectors by columns"
E2Helper.Descriptions["matrix4(xm2)"] = "Converts a 2x2 matrix into a 4x4 matrix - all (i,3), (i,4), (3,j) and (4,j) are filled with 0's"
E2Helper.Descriptions["matrix4(xm2xm2xm2xm2)"] = "Constructs a 4x4 matrix from four 2x2 matrices"
E2Helper.Descriptions["matrix4(m)"] = "Converts a 3x3 matrix into a 4x4 matrix - all (i,4) and (4,j) are filled with 0's"
E2Helper.Descriptions["swapRows(xm4:nn)"] = "Swaps the two rows specified"
E2Helper.Descriptions["swapColumns(xm4:nn)"] = "Swaps the two columns specified"
E2Helper.Descriptions["setRow(xm4:nnnnn)"] = "Sets the values of a row. The first argument given specifies the row(j), the following arguments are the values 1j, 2j, 3j, 4j"
E2Helper.Descriptions["setRow(xm4:nxv4)"] = "Sets the values of a row. The first argument given specifies the row, the vector contains the values to set"
E2Helper.Descriptions["setColumn(xm4:nnnnn)"] = "Sets the values of a column. The first argument given specifies the column(i), the following arguments are the values i1, i2, i3, i4"
E2Helper.Descriptions["setColumn(xm4:nxv4)"] = "Sets the values of a column. The first argument given specifies the column, the vector contains the values to set"
E2Helper.Descriptions["setDiagonal(xm4:nnnn)"] = "Sets the elements of the leading diagonal"
E2Helper.Descriptions["setDiagonal(xm4:xv4)"] = "Sets the elements of the leading diagonal from the components of a vector"
E2Helper.Descriptions["matrix4(e)"] = "Creates a 4x4 reference frame matrix from an entity's local direction vectors by columns in the order (x, y, z, pos), with the bottom row (0,0,0,1)"
E2Helper.Descriptions["matrix4(a)"] = "Returns a 4x4 reference frame matrix as described by the angle A. Multiplying by this matrix will be the same as rotating by the given angle"
E2Helper.Descriptions["matrix4(av)"] = "Returns a 4x4 reference frame matrix as described by the angle A and the position V. Multiplying by this matrix will be the same as rotating by the given angle and offsetting by the given vector"
E2Helper.Descriptions["x(xm4:)"] = "Returns the local x direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["y(xm4:)"] = "Returns the local y direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["z(xm4:)"] = "Returns the local z direction vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["pos(xm4:)"] = "Returns the position vector from a 4x4 coordinate reference frame matrix"
E2Helper.Descriptions["inverseA(xm4)"] = "Finds the matrix inverse of a standard 4x4 affine transformation matrix ( the type created by matrix4(E) ). This should only be used on matrices with a particular format, where the top left 3x3 specifies rotation, the rightmost 3-column specifies translation, and the bottom row is (0,0,0,1)"
E2Helper.Descriptions["row(xm:n)"] = "Returns the row as a vector"
E2Helper.Descriptions["column(xm2:n)"] = "Returns the column as a 2D vector"
E2Helper.Descriptions["column(m:n)"] = "Returns the column as a vector"
E2Helper.Descriptions["column(xm4:n)"] = "Returns the column as a 4D vector"
E2Helper.Descriptions["element(xm2:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["element(m:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["element(xm4:nn)"] = "Returns the element with indices (i,j)"
E2Helper.Descriptions["setElement(xm2:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["setElement(m:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["setElement(xm4:nnn)"] = "Sets an element's value. The first two arguments specify the indices (i,j), the third argument is the value to set it to"
E2Helper.Descriptions["swapElements(xm2:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["swapElements(m:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["swapElements(xm4:nnnn)"] = "Swaps two elements, specified by indices ( i1, j1, i2, j2 )"
E2Helper.Descriptions["diagonal(xm2)"] = "Returns a 2D vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["diagonal(m)"] = "Returns a vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["diagonal(xm4)"] = "Returns a 4D vector comprising the elements along the leading diagonal"
E2Helper.Descriptions["trace(xm2)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["trace(m)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["trace(xm4)"] = "Returns the trace of a matrix"
E2Helper.Descriptions["det(xm2)"] = "Returns the determinant of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["det(m)"] = "Returns the determinant of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["transpose(xm2)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["transpose(m)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["transpose(xm4)"] = "Returns the transpose of a matrix"
E2Helper.Descriptions["adj(m)"] = "Returns the adjugate of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["adj(xm2)"] = "Returns the adjugate of a matrix (Does not work for 4x4 matrices)"
E2Helper.Descriptions["row(xm2:n)"] = "Returns the row as a 2D vector"
E2Helper.Descriptions["row(m:n)"] = "Returns the row as a vector"
E2Helper.Descriptions["row(xm4:n)"] = "Returns the row as a 4D vector"
E2Helper.Descriptions["rowMatrix(vvv)"] = "Creates a 3x3 matrix with vectors by rows"
E2Helper.Descriptions["rowMatrix2(xv2xv2)"] = "Creates a 2x2 matrix with 2D vectors by rows"
E2Helper.Descriptions["rowMatrix4(xv4xv4xv4xv4)"] = "Creates a 4x4 matrix with 4D vectors by rows"
E2Helper.Descriptions["toAngle(m:)"] = "Returns an angle derived from a 3x3 rotation matrix"

-- Angle
E2Helper.Descriptions["ang(n)"] = "Makes an angle"
E2Helper.Descriptions["ang(nnn)"] = "Makes an angle"
E2Helper.Descriptions["ang()"] = "Same as ang(0,0,0)"
E2Helper.Descriptions["ang(v)"] = "Changes a vector variable into an angle variable. XYZ become PYR respectively"
E2Helper.Descriptions["ceil(a)"] = "Rounds PYR up to the nearest integer"
E2Helper.Descriptions["ceil(an)"] = "Rounds PYR up to argument 2's decimal precision"
E2Helper.Descriptions["floor(a)"] = "Rounds PYR down to the nearest integer"
E2Helper.Descriptions["floor(an)"] = "Rounds PYR down to argument 2's decimal precision"
E2Helper.Descriptions["round(a)"] = "Rounds PYR to the nearest integer"
E2Helper.Descriptions["round(an)"] = "Rounds PYR to argument 2's decimal precision"
E2Helper.Descriptions["mod(an)"] = "Returns the remainder after PYR have been divided by argument 2"
E2Helper.Descriptions["mod(aa)"] = "Returns the remainder after the components of angle 1 have been divided by the components of angle 2"
E2Helper.Descriptions["clamp(aaa)"] = "Clamps angle 1's PYR between the PYR of angle 2(min) and angle 3(max)"
E2Helper.Descriptions["clamp(ann)"] = "Clamps angle 1's PYR between argument 2(min) and argument 3(max)"
E2Helper.Descriptions["mix(aan)"] = "Combines angle 1's PYR with angle 2's PYR by a proportion given by argument 3 (between 0 and 1)"
E2Helper.Descriptions["shiftL(a)"] = "Shifts the angle's components left: shiftL( p,y,r ) = ( y,r,p )"
E2Helper.Descriptions["shiftR(a)"] = "Shifts the angle's components right: shiftR( p,y,r ) = ( r,p,y )"
E2Helper.Descriptions["inrange(aaa)"] = "Returns 1 if each component of A is between (or is equal to) the components of Amin and Amax"
E2Helper.Descriptions["angnorm(a)"] = "Gets the normalized angle of an angle"
E2Helper.Descriptions["angnorm(n)"] = "Gets the normalized angle of a number"
E2Helper.Descriptions["pitch(a:)"] = "Gets the pitch of the angle"
E2Helper.Descriptions["yaw(a:)"] = "Gets the yaw of the angle"
E2Helper.Descriptions["roll(a:)"] = "Gets the roll of the angle"
E2Helper.Descriptions["setPitch(a:n)"] = "Returns a copy of the angle with Pitch replaced (use as Ang = Ang:setPitch(...))"
E2Helper.Descriptions["setYaw(a:n)"] = "Returns a copy of the angle with Yaw replaced (use as Ang = Ang:setYaw(...))"
E2Helper.Descriptions["setRoll(a:n)"] = "Returns a copy of the angle with Roll replaced (use as Ang = Ang:setRoll(...))"
E2Helper.Descriptions["toString(a)"] = "Gets the angle nicely formatted as a string \"[P,Y,R]\""
E2Helper.Descriptions["toString(a:)"] = "Gets the angle nicely formatted as a string \"[P,Y,R]\""
E2Helper.Descriptions["toDeg(a)"] = "Converts the angle's magnitude from radians to degrees"
E2Helper.Descriptions["toRad(a)"] = "Converts the angle's magnitude from radians to radians"
E2Helper.Descriptions["forward(a:)"] = "Gets the forward vector of the angle"
E2Helper.Descriptions["right(a:)"] = "Gets the right vector of the angle"
E2Helper.Descriptions["up(a:)"] = "Gets the up vector of the angle"
E2Helper.Descriptions["rotateAroundAxis(a:vn)"] = "Returns the angle A rotated around vector V by N degrees"
E2Helper.Descriptions["rotateAroundAxis(v:vn)"] = "Returns the vector V1 rotated around vector V2 by N degrees"

-- Bones
E2Helper.Descriptions["bone(e:n)"] = "Returns Es Nth bone"
E2Helper.Descriptions["bones(e:)"] = "Returns an array containing all of Es bones. This array's first element has the index 0!"
E2Helper.Descriptions["boneCount(e:)"] = "Returns Es number of bones"
E2Helper.Descriptions["nobone()"] = "Returns an invalid bone"
E2Helper.Descriptions["aimBone(e:)"] = "Returns the bone the player is currently aiming at"
E2Helper.Descriptions["entity(b:)"] = "Returns the entity B belongs to"
E2Helper.Descriptions["index(b:)"] = "Returns Bs index in the entity it belongs to. Returns -1 if the bone is invalid or an error occured"
E2Helper.Descriptions["pos(b:)"] = "Returns Bs position"
E2Helper.Descriptions["forward(b:)"] = "Returns a vector describing Bs forward direction"
E2Helper.Descriptions["right(b:)"] = "Returns a vector describing Bs right direction"
E2Helper.Descriptions["up(b:)"] = "Returns a vector describing Bs up direction"
E2Helper.Descriptions["vel(b:)"] = "Returns Bs velocity"
E2Helper.Descriptions["velL(b:)"] = "Returns Bs velocity in local coordinates"
E2Helper.Descriptions["toWorld(b:v)"] = "Transforms V from local coordinates (as seen from B) to world coordinates"
E2Helper.Descriptions["toLocal(b:v)"] = "Transforms V from world coordinates to local coordinates (as seen from B)"
E2Helper.Descriptions["angVel(b:)"] = "Returns Bs angular velocity"
E2Helper.Descriptions["angles(b:)"] = "Returns Bs pitch, yaw and roll angles"
E2Helper.Descriptions["bearing(b:v)"] = "Gets the bearing from the bone to the vector"
E2Helper.Descriptions["elevation(b:v)"] = "Gets the elevation from the bone to the vector"
E2Helper.Descriptions["heading(b:v)"] = "Gets the elevation and bearing from the bone to the vector"
E2Helper.Descriptions["mass(b:)"] = "Returns Bs mass"
E2Helper.Descriptions["massCenter(b:)"] = "Returns Bs Center of Mass"
E2Helper.Descriptions["massCenterL(b:)"] = "Returns Bs Center of Mass in local coordinates"
E2Helper.Descriptions["inertia(b:)"] = "Gets the principal components of Bs inertia tensor in the form vec(Ixx, Iyy, Izz)"
E2Helper.Descriptions["isFrozen(b:)"] = "Returns 1 if B is frozen, 0 otherwise"
E2Helper.Descriptions["angVelVector(b:)"] = "Returns rotation axis, velocity and direction given as the vector's direction, magnitude and sense"
E2Helper.Descriptions["applyOffsetForce(b:vv)"] = "Applies force to the bone according to the first vector from the location of the second"
E2Helper.Descriptions["applyForce(b:v)"] = "Applies force to the bone according to the given vector's direction and magnitude"
E2Helper.Descriptions["applyAngForce(b:a)"] = "Applies torque to the bone according to the given angle"
E2Helper.Descriptions["applyTorque(b:v)"] = "Applies torque to the bone according to the given vector, representing the torque axis, magnitude and direction"
E2Helper.Descriptions["setMass(b:n)"] = "Sets the mass of the bone (between 0.001 and 50,000)"
E2Helper.Descriptions["boneGravity(b:n)"] = "Enables/disables gravity on the bone."
E2Helper.Descriptions["toString(e:)"] = "Converts entity to string"
E2Helper.Descriptions["toString(e)"] = "Converts entity to string"
E2Helper.Descriptions["toString(b)"] = "Converts bone to string"

-- Wirelink
E2Helper.Descriptions["nowirelink()"] = "Returns an invalid wirelink"
E2Helper.Descriptions["wirelink()"] = "Returns wirelink to this E2"
E2Helper.Descriptions["isHiSpeed(xwl:)"] = "Returns true if the linked component is high-speed capable"
E2Helper.Descriptions["entity(xwl:)"] = "Returns the entity of the linked component"
E2Helper.Descriptions["hasInput(xwl:s)"] = "Returns true if the linked component has an input of the specified name"
E2Helper.Descriptions["hasOutput(xwl:s)"] = "Returns true if the linked component has an output of the specified name"
E2Helper.Descriptions["xyz(xwl:)"] = "Retrieves the X/Y/Z as the corresponding values in the vector"
E2Helper.Descriptions["writeString(xwl:ns)"] = "Writes a null-terminated string to the given address. Returns the next free address or 0 on failure"
E2Helper.Descriptions["writeString(xwl:snnv)"] = "Same as XWL:writeString(snn), with an extra argument for the text colour"
E2Helper.Descriptions["writeString(xwl:snnvn)"] = "Same as XWL:writeString(snnv), with an extra argument for background colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeString(xwl:snnvv)"] = "Same as XWL:writeString(snnv), with an extra argument for background colour"
E2Helper.Descriptions["writeString(xwl:snnn)"] = "Same as XWL:writeString(snn), with an extra argument for the text colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeString(xwl:snnvvn)"] = "Same as XWL:writeString(snnvv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snn)"] = "A helper function for using the Wired Console Screen. The string will be written to the screen in white text on black background. The number arguments specify the starting position - X/Horizontal (0-29 recommended) and Y/vertical (0-17)"
E2Helper.Descriptions["writeString(xwl:snnnnn)"] = "Same as XWL:writeString(snnnn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snnnn)"] = "Same as XWL:writeString(snnn), with an extra argument for background colour. 3-digit RGB again"
E2Helper.Descriptions["writeString(xwl:snnvnn)"] = "Same as XWL:writeString(snnvn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeString(xwl:snnnv)"] = "Same as XWL:writeString(snnn), with an extra argument for background colour"
E2Helper.Descriptions["writeString(xwl:snnnvn)"] = "Same as XWL:writeString(snnnv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnv)"] = "Same as XWL:writeUnicodeString(snn), with an extra argument for the text colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvn)"] = "Same as XWL:writeUnicodeString(snnv), with an extra argument for background colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvv)"] = "Same as XWL:writeUnicodeString(snnv), with an extra argument for background colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnn)"] = "Same as XWL:writeUnicodeString(snn), with an extra argument for the text colour. This is in the form of a 3-digit RGB code. 0 is black, while 999 is white, 900 is pure red and so on"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvvn)"] = "Same as XWL:writeUnicodeString(snnvv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snn)"] = "A helper function for using the Wired Console Screen. The unicode string will be written to the screen in white text on black background. The number arguments specify the starting position - X/Horizontal (0-29 recommended) and Y/vertical (0-17)"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnnn)"] = "Same as XWL:writeUnicodeString(snnnn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnn)"] = "Same as XWL:writeUnicodeString(snnn), with an extra argument for background colour. 3-digit RGB again"
E2Helper.Descriptions["writeUnicodeString(xwl:snnvnn)"] = "Same as XWL:writeUnicodeString(snnvn), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnv)"] = "Same as XWL:writeUnicodeString(snnn), with an extra argument for background colour"
E2Helper.Descriptions["writeUnicodeString(xwl:snnnvn)"] = "Same as XWL:writeUnicodeString(snnnv), with an extra argument for flashing text. 0 or 1 is recommended"
E2Helper.Descriptions["readArray(xwl:nn)"] = "Reads an array's elements from a piece of memory. Strings and sub-tables (angles, vectors, matrices) are written as pointers to the actual data. Strings are written null-terminated"
E2Helper.Descriptions["writeCell(xwl:nn)"] = "Writes value into specified memory cell. Deprecated, use XWL[N] = X instead"
E2Helper.Descriptions["readCell(xwl:n)"] = "Returns contents of the specified memory cell. Deprecated, use XWL[N] instead"
E2Helper.Descriptions["readString(xwl:n)"] = "Reads a null-terminated string from the given address. Returns an empty string on failure"
E2Helper.Descriptions["writeArray(xwl:nr)"] = "Writes an array's elements into a piece of memory. Strings and sub-tables (angles, vectors, matrices) are written as pointers to the actual data. Strings are written null-terminated"
E2Helper.Descriptions["writeTable(xwl:nt)"] = "Same as writeArray, except it uses the numerically indexed variables of the table instead"
E2Helper.Descriptions["inputs(xwl:)"] = "Returns an array of all the inputs that XWL has without their types. Returns an empty array if it has none"
E2Helper.Descriptions["outputs(xwl:)"] = "Returns an array of all the outputs that XWL has without their types. Returns an empty array if it has none"
E2Helper.Descriptions["inputType(xwl:s)"] = "Returns the type of input that S is in lowercase. ( \"NORMAL\" is changed to \"number\" )"
E2Helper.Descriptions["outputType(xwl:s)"] = "Returns the type of output that S is in lowercase. ( \"NORMAL\" is changed to \"number\" )"
E2Helper.Descriptions["setXyz(xwl:v)"] = "Sets the X/Y/Z to the corresponding values in the vector"

-- Quaternions
E2Helper.Descriptions["comp()"] = "Returns complex zero"
E2Helper.Descriptions["comp(n)"] = "Converts a real number to complex (returns complex number with real part N and imaginary part 0)"
E2Helper.Descriptions["comp(nn)"] = "Returns a + b*i"
E2Helper.Descriptions["i()"] = "Returns the imaginary unit i"
E2Helper.Descriptions["i(n)"] = "Returns N*i"
E2Helper.Descriptions["abs(c)"] = "Returns the absolute value of C"
E2Helper.Descriptions["arg(c)"] = "Returns the argument of C"
E2Helper.Descriptions["conj(c)"] = "Returns the conjugate of C"
E2Helper.Descriptions["real(c)"] = "Returns the real part of C"
E2Helper.Descriptions["imag(c)"] = "Returns the imaginary part of C"
E2Helper.Descriptions["exp(c)"] = "Raises Euler's constant e to the power of C"
E2Helper.Descriptions["log(c)"] = "Calculates the natural logarithm of C"
E2Helper.Descriptions["log(cc)"] = "Calculates the logarithm of C2 to a complex base C"
E2Helper.Descriptions["log(nc)"] = "Calculates the logarithm of C to a real base N"
E2Helper.Descriptions["log2(c)"] = "Calculates the logarithm of C to base 2"
E2Helper.Descriptions["log10(c)"] = "Calculates the logarithm of C to base 10"
E2Helper.Descriptions["sqrt(c)"] = "Calculates the square root of C"
E2Helper.Descriptions["csqrt(n)"] = "Calculates the complex square root of the real number N"
E2Helper.Descriptions["sin(c)"] = "Calculates the sine of C"
E2Helper.Descriptions["cos(c)"] = "Calculates the cosine of C"
E2Helper.Descriptions["tan(c)"] = "Calculates the tangent of C"
E2Helper.Descriptions["cot(c)"] = "Calculates the cotangent of C"
E2Helper.Descriptions["sec(c)"] = "Calculates the secant of C"
E2Helper.Descriptions["csc(c)"] = "Calculates the cosecant of C"
E2Helper.Descriptions["asin(c)"] = "Calculates the inverse sine of C"
E2Helper.Descriptions["acos(c)"] = "Calculates the inverse cosine of C"
E2Helper.Descriptions["atan(c)"] = "Calculates the inverse tangent of C"
E2Helper.Descriptions["atan2(c)"] = "Calculates the principle value of C"
E2Helper.Descriptions["sinh(c)"] = "Calculates the hyperbolic sine of C"
E2Helper.Descriptions["cosh(c)"] = "Calculates the hyperbolic cosine of C"
E2Helper.Descriptions["tanh(c)"] = "Calculates the hyperbolic tangent of C"
E2Helper.Descriptions["coth(c)"] = "Calculates the hyperbolic cotangent of C"
E2Helper.Descriptions["sech(c)"] = "Calculates the hyperbolic secant of C"
E2Helper.Descriptions["csch(c)"] = "Calculates the hyperbolic cosecant of C"
E2Helper.Descriptions["toString(c)"] = "Formats C as a string"
E2Helper.Descriptions["toString(c:)"] = "The same as toString(C)"
E2Helper.Descriptions["quat()"] = "Creates a zero quaternion"
E2Helper.Descriptions["quat(n)"] = "Creates a quaternion with real part equal to N"
E2Helper.Descriptions["quat(c)"] = "Creates a quaternion with real and \"i\" parts equal to C"
E2Helper.Descriptions["quat(v)"] = "Converts a vector to a quaternion (returns V.x*i + V.y*j + V.z*k)"
E2Helper.Descriptions["quat(nnnn)"] = "Returns N+N2i+N3j+N4k"
E2Helper.Descriptions["quat(a)"] = "Converts A to a quaternion"
E2Helper.Descriptions["quat(vv)"] = "Creates a quaternion given forward (V) and up (V2) vectors"
E2Helper.Descriptions["quat(e)"] = "Converts angle of E to a quaternion"
E2Helper.Descriptions["qi()"] = "Returns quaternion i"
E2Helper.Descriptions["qi(n)"] = "Returns quaternion N*i"
E2Helper.Descriptions["qj()"] = "Returns j"
E2Helper.Descriptions["qj(n)"] = "Returns N*j"
E2Helper.Descriptions["qk()"] = "Returns k"
E2Helper.Descriptions["qk(n)"] = "Returns N*k"
E2Helper.Descriptions["dot(q:q)"] = "Returns dot product of Q with Q2"
E2Helper.Descriptions["abs(q)"] = "Returns absolute value of Q"
E2Helper.Descriptions["conj(q)"] = "Returns the conjugate of Q"
E2Helper.Descriptions["inv(q)"] = "Returns the inverse of Q"
E2Helper.Descriptions["real(q:)"] = "Returns the real component of the quaternion"
E2Helper.Descriptions["i(q:)"] = "Returns the i component of the quaternion"
E2Helper.Descriptions["j(q:)"] = "Returns the j component of the quaternion"
E2Helper.Descriptions["k(q:)"] = "Returns the k component of the quaternion"
E2Helper.Descriptions["exp(q)"] = "Raises Euler's constant e to the power Q"
E2Helper.Descriptions["log(q)"] = "Calculates natural logarithm of Q"
E2Helper.Descriptions["qMod(q)"] = "Changes quaternion Q so that the represented rotation is by an angle between 0 and 180 degrees (by coder0xff)"
E2Helper.Descriptions["nlerp(qqn)"] = "Performs linear interpolation between Q and Q2. Returns normalized Q for N=0, Q2 for N=1."
E2Helper.Descriptions["slerp(qqn)"] = "Performs spherical linear interpolation between Q and Q2. Returns Q for N=0, Q2 for N=1"
E2Helper.Descriptions["forward(q:)"] = "Returns vector pointing forward for Q"
E2Helper.Descriptions["right(q:)"] = "Returns vector pointing right for Q"
E2Helper.Descriptions["up(q:)"] = "Returns vector pointing up for Q"
E2Helper.Descriptions["normalized(q:)"] = "Returns new normalized quaternion for Q"
E2Helper.Descriptions["qRotation(vn)"] = "Returns quaternion for rotation about axis V by angle N"
E2Helper.Descriptions["qRotation(v)"] = "Construct a quaternion from the rotation vector V. Vector direction is axis of rotation, magnitude is angle in degress (by coder0xff)"
E2Helper.Descriptions["rotationAngle(q)"] = "Returns the angle of rotation in degrees (by coder0xff)"
E2Helper.Descriptions["rotationAxis(q)"] = "Returns the axis of rotation (by coder0xff)"
E2Helper.Descriptions["rotationVector(q)"] = "Returns the rotation vector - rotation axis where magnitude is the angle of rotation in degress (by coder0xff)"
E2Helper.Descriptions["vec(q)"] = "Converts Q to a vector by dropping the real component"
E2Helper.Descriptions["matrix(q)"] = "Converts Q to a transformation matrix"
E2Helper.Descriptions["toAngle(q:)"] = "Returns angle represented by Q"
E2Helper.Descriptions["toString(q)"] = "Formats Q as a string"
E2Helper.Descriptions["toString(q:)"] = "Formats Q as a string"

-- Selfaware
E2Helper.Descriptions["first()"] = "Returns 1 if the expression was spawned or reset"
E2Helper.Descriptions["duped()"] = "Returns 1 if the expression was duplicated"
E2Helper.Descriptions["dupefinished()"] = "Returns 1 when the contraption has finished duping."
E2Helper.Descriptions["inputClk()"] = "Returns 1 if the expression was triggered by an input"
E2Helper.Descriptions["last()"] = "Returns 1 if it is being called on the last execution of the expression gate before it is removed or reset. This execution must be requested with the runOnLast(1) command"
E2Helper.Descriptions["removing()"] = "Returns 1 if this is the last() execution and caused by the entity being removed"
E2Helper.Descriptions["ops()"] = "Returns how many ops are used every execution on average"
E2Helper.Descriptions["opcounter()"] = "Returns how many ops have been used so far in this execution plus the amount of hard quota used"
E2Helper.Descriptions["minquota()"] = "The ops left before soft quota is used up"
E2Helper.Descriptions["maxquota()"] = "The ops left before hard quota is exceeded and the expression shuts down"
E2Helper.Descriptions["softQuota()"] = "Returns the size of the soft quota"
E2Helper.Descriptions["hardQuota()"] = "Returns the size of the hard quota"
E2Helper.Descriptions["timeQuota()"] = "Returns the time quota in seconds"
E2Helper.Descriptions["perf()"] = "If used as a while loop condition, stabilizes the expression around hardquota used"
E2Helper.Descriptions["perf(n)"] = "If used as a while loop condition, stabilizes the expression around specified number (in %)"
E2Helper.Descriptions["entity()"] = "Gets the entity of the expression"
E2Helper.Descriptions["getName(e:)"] = "Get the name of another E2, compatible entity or wiremod component name"
E2Helper.Descriptions["setName(s)"] = "Set the name of the E2"
E2Helper.Descriptions["setName(e:s)"] = "Set the name of another E2 or component name for other entities"
E2Helper.Descriptions["cpuUsage()"] = "Returns the average time per tick the server spends running this E2, in seconds (multiply it by 1000000 to get the same value as is displayed on the E2 overlay)"
E2Helper.Descriptions["cpuUsage(e:)"] = "Returns the average time per tick the server spends running the specified E2, in seconds (multiply it by 1000000 to get the same value as is displayed on the E2 overlay)"
E2Helper.Descriptions["error(s)"] = "Shuts down the E2 with specified script error message"
E2Helper.Descriptions["assert(n)"] = "If the argument is 0, shut down the E2 with an error message"
E2Helper.Descriptions["assert(ns)"] = "If the first argument is 0, shut down the E2 with the given error message string"
E2Helper.Descriptions["reset()"] = "Reset the expression itself as if it was just spawned, stops execution"
E2Helper.Descriptions["exit()"] = "Stops the execution of any code after it"
E2Helper.Descriptions["getCode()"] = "Returns the code of the E2 as a string"
E2Helper.Descriptions["getCodeIncludes()"] = "Returns a table where indices (keys) are names of included files and entries are their codes"
E2Helper.Descriptions["remoteSetCode(e:s)"] = "Sets the E2's code with main file"
E2Helper.Descriptions["remoteSetCode(e:st)"] = "Sets the E2's code with main file & includes"
E2Helper.Descriptions["remoteUpload(e:s)"] = "Uploads the code from your computer to the server"
E2Helper.Descriptions["getCodeIncludes()"] = "Returns a table where indices (keys) are names of included files and entries are their codes"
E2Helper.Descriptions["hash()"] = "Returns a numerical hash using the code of the E2 itself (Including comments)"
E2Helper.Descriptions["hash(s)"] = "Returns a numerical hash using the string specified"
E2Helper.Descriptions["hashNoComments()"] = "Returns a numerical hash using the code of the E2 itself (Excluding comments)"
E2Helper.Descriptions["concmd(s)"] = "Takes a string and executes it in console. Returns 1 if it succeeded and 0 if it failed.The client must enable this in the console with \"wire_expression2_concmd 1\". \"wire_expression2_concmd_whitelist\" allows you to choose which commands can be used.[http://www.wiremod.com/forum/151800-post12.html]"
E2Helper.Descriptions["ioInputEntity(s)"] = "Returns the entity the input S is wired to"
E2Helper.Descriptions["ioOutputEntities(s)"] = "Returns an array of all entities wired to the output S"
E2Helper.Descriptions["runOnLast(n)"] = "If set to 1, the chip will run once when it is removed, setting the last() flag when it does"
E2Helper.Descriptions["selfDestruct()"] = "Removes the expression"
E2Helper.Descriptions["selfDestructAll()"] = "Removes the expression and all constrained props"

-- Debug
E2Helper.Descriptions["playerCanPrint()"] = "Returns whether or not the next print-message will be printed or omitted by antispam"
E2Helper.Descriptions["printDriver(e:s)"] = "Posts a string to the chat of Es driver. Returns 1 if the text was printed, 0 if not"
E2Helper.Descriptions["hintDriver(e:sn)"] = "Displays a hint popup to the driver of vehicle E, with message S for N seconds (N being clamped between 0.7 and 7). Same return value as printDriver"
E2Helper.Descriptions["printDriver(e:ns)"] = "Same as EE:printDriver(S), but can make the text show up in different places. N can be one of the following: _HUD_PRINTCENTER, _HUD_PRINTCONSOLE, _HUD_PRINTNOTIFY, _HUD_PRINTTALK"
E2Helper.Descriptions["hint(sn)"] = "Displays a hint popup with message S for N seconds (N being clamped between 0.7 and 7)"
E2Helper.Descriptions["print(ns)"] = "Same as print(S), but can make the text show up in different places. N can be one of the following: _HUD_PRINTCENTER, _HUD_PRINTCONSOLE, _HUD_PRINTNOTIFY, _HUD_PRINTTALK"
E2Helper.Descriptions["print(...)"] = "Prints all arguments to the chat area, seperated by a tab. Automatically does toString for you (Can print arrays but not tables). Works just like lua's print"
E2Helper.Descriptions["printColor(...)"] = "Works like chat.AddText(...). Parameters can be any amount and combination of numbers, strings, player entities, color vectors (both 3D and 4D)"
E2Helper.Descriptions["printColorC(...)"] = "Works like MsgC. Parameters can be any amount and combination of numbers, strings, player entities, color vectors (both 3D and 4D)"
E2Helper.Descriptions["printColor(r)"] = "Like printColor(...), except taking an array containing all the parameters"
E2Helper.Descriptions["printColorC(r)"] = "Like printColorC(...), except taking an array containing all the parameters"
E2Helper.Descriptions["printColorDriver(e:...)"] = "Like printColor but prints to the driver of a specified vehicle"
E2Helper.Descriptions["printColorDriver(e:r)"] = "Like printColorDriver but takes an array containing all the parameters"
E2Helper.Descriptions["printTable(t)"] = "Prints a table like the lua function PrintTable does, except to the chat area"
E2Helper.Descriptions["printTable(r)"] = "Prints an array like the lua function PrintTable does, except to the chat area"

-- Time
E2Helper.Descriptions["tickClk()"] = "Returns 1 if the current execution was caused by \"runOnTick\""
E2Helper.Descriptions["tickInterval()"] = "Returns the time (in seconds) between each server tick"
E2Helper.Descriptions["curtime()"] = "Returns the current game time since server-start in seconds"
E2Helper.Descriptions["realtime()"] = "Returns the current real time since server-start in seconds"
E2Helper.Descriptions["systime()"] = "Returns a highly accurate time (also in seconds) since the server was started. Ideal for benchmarking"
E2Helper.Descriptions["clk(s)"] = "Returns 1 if the current execution was caused by the inserted name"
E2Helper.Descriptions["clk()"] = "Returns 1 if the current execution was caused by the interval"
E2Helper.Descriptions["clkName()"] = "Returns the name of the timer that caused current execution"
E2Helper.Descriptions["getTimers()"] = "Returns an array of all timers used in the E2"
E2Helper.Descriptions["interval(n)"] = "Sets a one-time timer with name \"interval\" and delay in milliseconds (minimum delay for timers is 10ms)"
E2Helper.Descriptions["runOnTick(n)"] = "If set to 1, the expression will execute once every game tick"
E2Helper.Descriptions["timer(sn)"] = "Sets a one-time timer with entered name and delay in milliseconds"
E2Helper.Descriptions["stoptimer(s)"] = "Stops a timer, can stop interval with stoptimer(\"interval\")"
E2Helper.Descriptions["stopAllTimers()"] = "Stops all timers"

-- Unit conversion
E2Helper.Descriptions["toUnit(sn)"] = "Converts default garrysmod units to specified units"
E2Helper.Descriptions["fromUnit(sn)"] = "Converts specified units to default garrysmod units"
E2Helper.Descriptions["convertUnit(ssn)"] = "Converts between two units"

-- Steam ID conversion
E2Helper.Descriptions["steamIDFrom64(s)"] = "Converts Steam Community ID to Steam ID"
E2Helper.Descriptions["steamIDTo64(s)"] = "Converts Steam ID to Steam Community ID"

-- Server information
E2Helper.Descriptions["map()"] = "Returns the current map name"
E2Helper.Descriptions["hostname()"] = "Returns the Name of the server"
E2Helper.Descriptions["hostip()"] = "Returns the IP of the server"
E2Helper.Descriptions["isLan()"] = "Returns 1 if lan mode is enabled"
E2Helper.Descriptions["gamemode()"] = "Returns the name of the current gamemode"
E2Helper.Descriptions["gravity()"] = "Returns gravity"
E2Helper.Descriptions["ping(e:)"] = "Returns the latency for player E"
E2Helper.Descriptions["isSinglePlayer()"] = "Returns 1 if singleplayer, 0 if multiplayer"
E2Helper.Descriptions["isDedicated()"] = "Returns 1 if server is dedicated, 0 if listen"
E2Helper.Descriptions["players()"] = "Returns an array containing all players on the server"
E2Helper.Descriptions["playersAdmins()"] = "Returns an array containing all admins on the server"
E2Helper.Descriptions["playersSuperAdmins()"] = "Returns an array containing all super admins on the server"
E2Helper.Descriptions["numPlayers()"] = "Returns the number of players currently in the server"
E2Helper.Descriptions["maxPlayers()"] = "Returns the max number of players allowed in the server"
E2Helper.Descriptions["maxOfType(s)"] = "Returns the maximum allowed of a certain type of entity, i.e. maxOfType(\"wire_thrusters\"). Returns 0 if you enter an invalid parameter"
E2Helper.Descriptions["playerDamage()"] = "Returns 1 if player vs player damage is enabled on the server"
E2Helper.Descriptions["convar(s)"] = "Give a console command such as \"name\" and it returns the set value"
E2Helper.Descriptions["convarnum(s)"] = "Give a console command such as \"sbox_godmode\" and it returns the set value"
E2Helper.Descriptions["time()"] = "Returns the time in seconds"
E2Helper.Descriptions["time(s)"] = "Returns numerical time/date info from the server. Possible arguments: \"year\", \"month\", \"day\", \"hour\", \"min\", \"sec\", \"wday\" (weekday, Sunday is 1), \"yday\" (day of the year), and \"isdst\" (daylight saving flag 0/1)"
E2Helper.Descriptions["time(t)"] = "Attempts to construct the time from the data in the given table (same as lua's os.time). The table structure must be the same as in the date() functions. If any values are missing or of the wrong type, that value is ignored (it will be nil)"
E2Helper.Descriptions["date()"] = "Returns the server's current time and date"
E2Helper.Descriptions["dateUTC()"] = "Returns the server's current time and date in UTC"
E2Helper.Descriptions["date(n)"] = "Returns the specified unix time"
E2Helper.Descriptions["dateUTC(n)"] = "Returns the specified unix time in UTC"
E2Helper.Descriptions["maxFrictionMass()"] = "Returns how much friction influences props throughout the server"
E2Helper.Descriptions["minFrictionMass()"] = "Returns how much friction influences props throughout the server"

-- Constraints
E2Helper.Descriptions["getConstraints(e:)"] = "Returns an array with all entities directly or indirectly constrained to E, except E itself. Deprecated, use E:getConnectedEntities(...) instead."
E2Helper.Descriptions["getConnectedEntities(e:...)"] = "Returns an array with all entities directly or indirectly constrained or parented to E, including E itself."
E2Helper.Descriptions["getConnectedEntities(e:r)"] = "Returns an array with all entities directly or indirectly constrained or parented to E, including E itself."
E2Helper.Descriptions["hasConstraints(e:)"] = "Returns the number of the constraints E has"
E2Helper.Descriptions["hasConstraints(e:s)"] = "Returns the number of the constraints E has with the given constraint type"
E2Helper.Descriptions["isConstrained(e:)"] = "Returns 1 if E has constraints, 0 if not"
E2Helper.Descriptions["isWeldedTo(e:)"] = "Returns the first entity E was welded to"
E2Helper.Descriptions["isWeldedTo(e:n)"] = "Returns the Nth entity E was welded to"
E2Helper.Descriptions["isConstrainedTo(e:)"] = "Returns the first entity E was constrained to"
E2Helper.Descriptions["isConstrainedTo(e:n)"] = "Returns the Nth entity E was constrained to"
E2Helper.Descriptions["isConstrainedTo(e:s)"] = "Returns the first entity E was constrained to with the given constraint type (see the types list below)"
E2Helper.Descriptions["isConstrainedTo(e:sn)"] = "Returns the Nth entity E was constrained to with the given constraint type (see the types list below)"
E2Helper.Descriptions["parent(e:)"] = "Returns the entity E is parented to"
E2Helper.Descriptions["parentBone(e:)"] = "Returns the bone E is parented to"
E2Helper.Descriptions["children(e:)"] = "Returns an array containing all the children of the entity - that is, every entity whose parent is this entity"

-- Chat
E2Helper.Descriptions["chatClk()"] = "Returns 1 if the chip is being executed because of a chat event. Returns 0 otherwise"
E2Helper.Descriptions["chatClk(e)"] = "Returns 1 if the chip is being executed because of a chat event by player E. Returns 0 otherwise"
E2Helper.Descriptions["lastSpoke()"] = "Returns the last player to speak"
E2Helper.Descriptions["lastSaid()"] = "Returns the last message in the chat log"
E2Helper.Descriptions["lastSaidWhen()"] = "Returns the time the last message was sent"
E2Helper.Descriptions["lastSaidTeam()"] = "Returns 1 if the last message was sent in the team chat, 0 otherwise"
E2Helper.Descriptions["lastSaid(e:)"] = "Returns what the player E last said"
E2Helper.Descriptions["lastSaidWhen(e:)"] = "Returns when the given player last said something"
E2Helper.Descriptions["lastSaidTeam(e:)"] = "Returns 1 if the last message was sent in the team chat, 0 otherwise"
E2Helper.Descriptions["hideChat(n)"] = "Hides the chat messages written by E2 owner"
E2Helper.Descriptions["runOnChat(n)"] = "If set to 0, the chip will no longer run on chat events, otherwise it makes this chip execute when someone chats. Only needs to be called once, not in every execution"

-- Color
E2Helper.Descriptions["setBodygroup(e:nn)"] = "Group ID, Group SubID\nSets the bodygroups of the given entity"
E2Helper.Descriptions["getBodygroups(e:n)"] = "Group ID\nReturns the number of bodygroups in the Group ID of the given entity"
E2Helper.Descriptions["setColor(nnn)"] = "Sets the color of the E2 chip"
E2Helper.Descriptions["setColor(e:vn)"] = "Sets the color (as vector) and alpha (as number) of the entity"
E2Helper.Descriptions["setColor(e:xv4)"] = "Sets the color and alpha (as 4D vector) of the entity"
E2Helper.Descriptions["setColor(e:nnn)"] = "Sets the color of the entity"
E2Helper.Descriptions["setColor(e:v)"] = "Sets the color of the entity"
E2Helper.Descriptions["setColor(e:nnnn)"] = "Sets the color and alpha of the entity"
E2Helper.Descriptions["getColor(e:)"] = "Returns the color of an entity as a vector (R,G,B)"
E2Helper.Descriptions["getColor4(e:)"] = "Returns the color of an entity as a 4D vector (R,G,B,A)"
E2Helper.Descriptions["setAlpha(e:n)"] = "Sets the alpha of an entity"
E2Helper.Descriptions["getAlpha(e:)"] = "Returns the alpha of an entity"
E2Helper.Descriptions["setMaterial(e:s)"] = "Sets the material of an entity"
E2Helper.Descriptions["getMaterial(e:)"] = "Returns the material of an entity"
E2Helper.Descriptions["setSkin(e:n)"] = "Sets the skin of an entity"
E2Helper.Descriptions["getSkin(e:)"] = "Gets Es current skin number"
E2Helper.Descriptions["getSkinCount(e:)"] = "Gets Es number of skins"
E2Helper.Descriptions["setRenderMode(e:n)"] = "Sets the render mode of the entity (0 = Normal, 1 = TransColor, 2 = TransTexture, 3 = Glow, 4 = TransAlpha, 5 = TransAdd, 6 = Enviromental, 7 = TransAddFrameBlend, 8 = TransAlphaAdd, 9 = WorldGlow, 10 = None)"
E2Helper.Descriptions["getPlayerColor(e:)"] = "Returns the player's model color as a vector (R,G,B)"
E2Helper.Descriptions["getWeaponColor(e:)"] = "Returns the player's weapon color as a vector (R,G,B)"
E2Helper.Descriptions["hsl2rgb(v)"] = "Converts V from the HSL color space to the RGB color space"
E2Helper.Descriptions["hsl2rgb(nnn)"] = "Converts N,N,N from the HSL color space to the RGB color space"
E2Helper.Descriptions["hsv2rgb(v)"] = "Converts V from the HSV color space to the RGB color space"
E2Helper.Descriptions["hsv2rgb(nnn)"] = "Converts N,N,N from the HSV color space to the RGB color space"
E2Helper.Descriptions["rgb2hsv(v)"] = "Converts V from the RGB to the HSV color space"
E2Helper.Descriptions["rgb2hsv(nnn)"] = "Converts N,N,N from the RGB to the HSV color space"
E2Helper.Descriptions["rgb2digi(vn)"] = "Converts the RGB vector V to a number in digital screen format. N Specifies a mode, either 0, 2 or 3, corresponding to Digital Screen color modes"
E2Helper.Descriptions["rgb2digi(nnnn)"] = "Converts the RGB color (N,N2,N3) to a number in digital screen format. N4 Specifies a mode, either 0, 2 or 3, corresponding to Digital Screen color modes"
E2Helper.Descriptions["rgb2hsl(v)"] = "Converts V from RGB color space to the HSL color space"
E2Helper.Descriptions["rgb2hsl(nnn)"] = "Converts N,N,N from RGB color space to the HSL color space"

-- Entity Discovery
E2Helper.Descriptions["findUpdateRate()"] = "Returns the minimum delay between entity find events on a chip"
E2Helper.Descriptions["findPlayerUpdateRate()"] = "Returns the minimum delay between entity find events per player"
E2Helper.Descriptions["findCanQuery()"] = "Returns 1 if find functions can be used, 0 otherwise"
E2Helper.Descriptions["findInSphere(vn)"] = "Finds entities in a sphere around V with a radius of N, returns the number found after filtering"
E2Helper.Descriptions["findInCone(vvnn)"] = "Like findInSphere but with a http://mathworld.wolfram.com/SphericalCone.html Spherical cone, arguments are for position, direction, length, and degrees (works now)"
E2Helper.Descriptions["findInBox(vv)"] = "Like findInSphere but with a globally aligned box, the arguments are the diagonal corners of the box"
E2Helper.Descriptions["findByName(s)"] = "Find all entities with the given name"
E2Helper.Descriptions["findByModel(s)"] = "Find all entities with the given model"
E2Helper.Descriptions["findByClass(s)"] = "Find all entities with the given class"
E2Helper.Descriptions["findPlayerByName(s)"] = "Returns the player with the given name, this is an exception to the rule"
E2Helper.Descriptions["findPlayerBySteamID(s)"] = "Returns the player with the given SteamID32"
E2Helper.Descriptions["findPlayerBySteamID64(s)"] = "Returns the player with the given SteamID64"
E2Helper.Descriptions["findAllowBlockedClasses(n)"] = "Allows or disallows finding entities on the hardcoded class blocklist, including classes like \"prop_dynamic\", \"physgun_beam\" and \"gmod_ghost\"."
E2Helper.Descriptions["findResult(n)"] = "Returns the indexed entity from the previous find event (valid parameters are 1 to the number of entities found)"
E2Helper.Descriptions["findClosest(v)"] = "Returns the closest entity to the given point from the previous find event"
E2Helper.Descriptions["findToArray()"] = "Formats the query as an array, R[Index,entity] to get an entity"
E2Helper.Descriptions["find()"] = "Equivalent to findResult(1)"
E2Helper.Descriptions["findCount()"] = "Returns the remaining available find calls"
E2Helper.Descriptions["findMax()"] = "Returns the maximum number of finds per E2"
E2Helper.Descriptions["findSortByDistance(v)"] = "Sorts the entities from the last find event, index 1 is the closest to point V, returns the number of entities in the list"
E2Helper.Descriptions["findClipToClass(s)"] = "Filters the list of entities by removing all entities that are NOT of this class"
E2Helper.Descriptions["findClipFromClass(s)"] = "Filters the list of entities by removing all entities that are of this class"
E2Helper.Descriptions["findClipToEntities(r)"] = "Filters the list of entities by removing all entities that are NOT in this array"
E2Helper.Descriptions["findClipFromEntities(r)"] = "Filters the list of entities by removing all entities that are in this array"
E2Helper.Descriptions["findClipToEntity(e)"] = "Filters the list of entities by removing all except this entity"
E2Helper.Descriptions["findClipFromEntity(e)"] = "Filters the list of entities by removing this entity"
E2Helper.Descriptions["findClipToModel(s)"] = "Filters the list of entities by removing all entities that do NOT have this model"
E2Helper.Descriptions["findClipFromModel(s)"] = "Filters the list of entities by removing all entities that do have this model"
E2Helper.Descriptions["findClipToName(s)"] = "Filters the list of entities by removing all entities that do NOT have this name"
E2Helper.Descriptions["findClipFromName(s)"] = "Filters the list of entities by removing all entities that do have this name"
E2Helper.Descriptions["findClipToSphere(vn)"] = "Filters the list of entities by removing all entities NOT within the specified sphere (center, radius)"
E2Helper.Descriptions["findClipFromSphere(vn)"] = "Filters the list of entities by removing all entities within the specified sphere (center, radius)"
E2Helper.Descriptions["findClipToRegion(vv)"] = "Filters the list of entities by removing all entities NOT on the positive side of the defined plane. (Plane origin, vector perpendicular to the plane) You can define any convex hull using this"
E2Helper.Descriptions["findClipFromBox(vv)"] = "Filters the list of entities by removing all entities within the specified box"
E2Helper.Descriptions["findClipToBox(vv)"] = "Filters the list of entities by removing all entities NOT within the specified box"
E2Helper.Descriptions["findAllowClass(s)"] = "Remove entities with this class (or partial class name) from the blacklist"
E2Helper.Descriptions["findAllowEntities(r)"] = "Remove all entities in array from the blacklist"
E2Helper.Descriptions["findAllowEntity(e)"] = "Remove entity from the blacklist"
E2Helper.Descriptions["findAllowModel(s)"] = "Remove entities with this model (or partial model name) from the blacklist"
E2Helper.Descriptions["findAllowPlayer(s)"] = "Remove player with specified name from the entity blacklist"
E2Helper.Descriptions["findAllowPlayer(e)"] = "Remove specified player from the entity blacklist"
E2Helper.Descriptions["findAllowPlayerProps(s)"] = "Remove entities owned by player with specified name from the blacklist"
E2Helper.Descriptions["findAllowPlayerProps(e)"] = "Remove entities owned by specified player from the blacklist"
E2Helper.Descriptions["findClearBlackClassList()"] = "Clear all entries from the class blacklist"
E2Helper.Descriptions["findClearBlackEntityList()"] = "Clear all entries from the entity blacklist"
E2Helper.Descriptions["findClearBlackList()"] = "Clear all entries from the entire blacklist"
E2Helper.Descriptions["findClearBlackModelList()"] = "Clear all entries from the model blacklist"
E2Helper.Descriptions["findClearBlackPlayerPropList()"] = "Clear all entries from the prop owner blacklist"
E2Helper.Descriptions["findClearWhiteClassList()"] = "Clear all entries from the class whitelist"
E2Helper.Descriptions["findClearWhiteEntityList()"] = "Clear all entries from the player whitelist"
E2Helper.Descriptions["findClearWhiteList()"] = "Clear all entries from the entire whitelist"
E2Helper.Descriptions["findClearWhiteModelList()"] = "Clear all entries from the model whitelist"
E2Helper.Descriptions["findClearWhitePlayerPropList()"] = "Clear all entries from the prop owner whitelist"
E2Helper.Descriptions["findDisallowClass(s)"] = "Remove entities with this class (or partial class name) from the whitelist"
E2Helper.Descriptions["findDisallowEntities(r)"] = "Remove all entities in array from the whitelist"
E2Helper.Descriptions["findDisallowEntity(e)"] = "Remove entity from the whitelist"
E2Helper.Descriptions["findDisallowModel(s)"] = "Remove entities with this model (or partial model name) from the whitelist"
E2Helper.Descriptions["findDisallowPlayer(s)"] = "Remove player with specified name from the entity whitelist"
E2Helper.Descriptions["findDisallowPlayer(e)"] = "Remove specified player from the entity whitelist"
E2Helper.Descriptions["findDisallowPlayerProps(s)"] = "Remove entities owned by player with specified name from the whitelist"
E2Helper.Descriptions["findDisallowPlayerProps(e)"] = "Remove entities owned by specified player from the whitelist"
E2Helper.Descriptions["findExcludeClass(s)"] = "Exclude entities with this class (or partial class name) from future finds"
E2Helper.Descriptions["findExcludeEntities(r)"] = "Exclude all entities in array from future finds"
E2Helper.Descriptions["findExcludeEntity(e)"] = "Exclude entity from future finds"
E2Helper.Descriptions["findExcludeModel(s)"] = "Exclude entities with this model (or partial model name) from future finds"
E2Helper.Descriptions["findExcludePlayer(s)"] = "Exclude player with specified name from future finds (put it on the entity blacklist)"
E2Helper.Descriptions["findExcludePlayer(e)"] = "Exclude specified player from future finds (put it on the entity blacklist)"
E2Helper.Descriptions["findExcludePlayerProps(s)"] = "Exclude entities owned by player with specified name from future finds"
E2Helper.Descriptions["findExcludePlayerProps(e)"] = "Exclude entities owned by specified player from future finds"
E2Helper.Descriptions["findIncludeClass(s)"] = "Include entities with this class (or partial class name) in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeEntities(r)"] = "Include all entities in array in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeEntity(e)"] = "Include entity in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludeModel(s)"] = "Include entities with this model (or partial model name) in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludePlayer(s)"] = "Include player with specified name in future finds, and remove other entities not in the entity whitelist"
E2Helper.Descriptions["findIncludePlayer(e)"] = "Include specified player in future finds, and remove other entities not in the entity whitelist"
E2Helper.Descriptions["findIncludePlayerProps(s)"] = "Include entities owned by player with specified name in future finds, and remove others not in the whitelist"
E2Helper.Descriptions["findIncludePlayerProps(e)"] = "Include entities owned by specified player in future finds, and remove others not in the whitelist"

-- Ranger
E2Helper.Descriptions["rangerFlags()"] = "Returns the ranger flags as a string"
E2Helper.Descriptions["rangerFlags(s)"] = "Sets the ranger flags. S can be any combination of I=ignore world, W=hit water, E=hit entities and Z=default to zero"
E2Helper.Descriptions["rangerFilter(e)"] = "Feed entities you don't want the trace to hit"
E2Helper.Descriptions["rangerFilter(r)"] = "Feed an array of entities you don't want the trace to hit"
E2Helper.Descriptions["ranger(n)"] = "You input max range, it returns ranger data"
E2Helper.Descriptions["ranger(nnn)"] = "Same as above with added inputs for X and Y skew"
E2Helper.Descriptions["rangerAngle(nnn)"] = "You input the distance, x-angle and y-angle (both in degrees) it returns ranger data"
E2Helper.Descriptions["rangerOffset(vv)"] = "You input two vector points, it returns ranger data"
E2Helper.Descriptions["rangerOffset(nvv)"] = "You input the range, a position vector, and a direction vector and it returns ranger data"
E2Helper.Descriptions["ranger(en)"] = "Same as ranger(distance): You input max range, it returns ranger data, only used on another entity"
E2Helper.Descriptions["rangerHull(nv)"] = "Inputs: Distance, Hull BoxSize"
E2Helper.Descriptions["rangerHull(nvv)"] = "Input: Distance, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerHull(nnnv)"] = "Inputs: Distance, X Skew, Y Skew, Hull BoxSize"
E2Helper.Descriptions["rangerHull(nnnvv)"] = "Inputs: Distance, X Skew, Y Skew, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerAngleHull(nnnv)"] = "Inputs: Distance, X Angle, Y Angle, Hull BoxSize"
E2Helper.Descriptions["rangerAngleHull(nnnvv)"] = "Inputs: Distance, X Angle, Y Angle, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(vvv)"] = "Inputs: StartPos, EndPos, Hull BoxSize"
E2Helper.Descriptions["rangerOffsetHull(vvvv)"] = "Inputs: StartPos, EndPos, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(nvvv)"] = "Inputs: Distance, StartPos, Direction, Hull BoxSize"
E2Helper.Descriptions["rangerOffsetHull(nvvvv)"] = "Inputs: Distance, StartPos, Direction, Hull MinSize, Hull MaxSize"
E2Helper.Descriptions["rangerOffsetHull(evv)"] = "Use entity collision box for the ranger. Inputs: Entity, StartPos, EndPos"
E2Helper.Descriptions["distance(xrd:)"] = "Outputs the distance from the rangerdata input, else depends on rangerDefault"
E2Helper.Descriptions["position(xrd:)"] = "Outputs the position of the input ranger data trace IF it hit anything, else returns (0,0,0)"
E2Helper.Descriptions["fraction(xrd:)"] = "Returns a number between 0-1 which represents the percentage of the distance between the start & hit position of the trace. StartPos + (EndPos-StartPos):normalized() * RD:fraction() * (EndPos-StartPos):Length() is equal to RD:pos()"
E2Helper.Descriptions["entity(xrd:)"] = "Returns the entity of the input ranger data trace IF it hit an entity, else returns nil"
E2Helper.Descriptions["bone(xrd:)"] = "Returns the bone of the input ranger data trace IF it hit a bone, else returns nil"
E2Helper.Descriptions["hit(xrd:)"] = "Returns 1 if the input ranger data hit anything and 0 if it didn't"
E2Helper.Descriptions["hitNormal(xrd:)"] = "Outputs a normalized vector perpendicular to the surface the ranger is pointed at"
E2Helper.Descriptions["hitGroup(xrd:)"] = "Returns the hit group (ie chest, face, left arm, right leg, etc)"
E2Helper.Descriptions["hitSky(xrd:)"] = "Returns 1 if the trace hit the sky, 0 otherwise"
E2Helper.Descriptions["hitTexture(xrd:)"] = "Returns the texture of the surface the ranger is pointed at"
E2Helper.Descriptions["hitWorld(xrd:)"] = "Returns 1 if the trace hit the world, 0 otherwise"
E2Helper.Descriptions["distanceLeftSolid(xrd:)"] = "Returns the distance between the position at which the trace left the world and the trace's Start Position"
E2Helper.Descriptions["positionLeftSolid(xrd:)"] = "Returns the position at which the trace left the world, if it was started inside the world. Else return the trace's Start Position"
E2Helper.Descriptions["fractionLeftSolid(xrd:)"] = "Same as RD:fraction() except it represents the distance between the start position and the LeftSolid position"
E2Helper.Descriptions["startSolid(xrd:)"] = "Returns 1 if the trace was started inside the world, else 0"
E2Helper.Descriptions["matType(xrd:)"] = "Returns the material type (ie wood, metal, dirt, flesh, etc)"
E2Helper.Descriptions["noranger()"] = "Returns an invalid ranger"
E2Helper.Descriptions["pos(xrd:)"] = "Returns the hit position. The difference between this function and RD:position() is that if you start the trace inside the world, RD:position() will return the position at which the trace EXITS the world. RD:pos(), however, will continue on and return the hit position outside the wall you started the trace in"
E2Helper.Descriptions["rangerDefaultZero(n)"] = "If given any value other than 0 it will default the distance data to zero when nothing is hit"
E2Helper.Descriptions["rangerHitEntities(n)"] = "Default is 1, if value is given as 0 it will ignore entities"
E2Helper.Descriptions["rangerHitWater(n)"] = "Default is 0, if any other value is given it will hit water"
E2Helper.Descriptions["rangerIgnoreWorld(n)"] = "Default is 0, if any other value is given it will ignore world"
E2Helper.Descriptions["rangerPersist(n)"] = "Passing 0 (the default) resets all ranger flags and filters every execution and after calling ranger/rangerOffset. Passing anything else will make the flags and filters persist until they're changed again"
E2Helper.Descriptions["rangerReset()"] = "Resets all ranger flags and filters"
E2Helper.Descriptions["toTable(xrd:)"] = "Converts the trace data into an E2-style table and returns it. Remember that this returns the raw data, so for matType and hitGroup, it is recommend that you use the functions instead of this table"

-- NPCs
E2Helper.Descriptions["npcGetTarget(e:)"] = "Returns what the npc is currently targeting"
E2Helper.Descriptions["npcRelationship(e:esn)"] = "Will set the NPC's relationship to the specified entity to the S input, priority N. Priority is any number between 0 and 999. The relationship string can be either \"like\", \"neutral\", \"hate\" or \"fear\". Same goes for all other relationship functions"
E2Helper.Descriptions["npcRelationship(e:ssn)"] = "Same as E:npcRelationship(entity,string,number), but sets relationship to an entire class specified by the first string. Example: \"npc_manhack\", \"prop_physics\""
E2Helper.Descriptions["npcRelationshipByOwner(e:esn)"] = "Sets the NPC's relationship to all currently existing NPCs owned by player E. Returns number of entities added to relationships"
E2Helper.Descriptions["npcDisp(e:e)"] = "Returns the NPC's relationship to entity E"
E2Helper.Descriptions["npcAttack(e:)"] = "Tells the NPC to use their melee attack"
E2Helper.Descriptions["npcFace(e:v)"] = "This will rotate the NPC to face position V. This is purely aesthetic and can't be used to aim their weapon"
E2Helper.Descriptions["npcGiveWeapon(e:)"] = "Gives the NPC an SMG"
E2Helper.Descriptions["npcGiveWeapon(e:s)"] = "Gives the NPC a weapon. Example: E:npcGiveWeapon(\"pistol\"). Other arguments include \"ar2\", \"crowbar\", \"357\", \"shotgun\", \"crossbow\", \"rpg\", \"frag\", etc. Other such as the bugbait or slam may be buggy"
E2Helper.Descriptions["npcGoRun(e:v)"] = "Tells the NPC to run to position V"
E2Helper.Descriptions["npcGoWalk(e:v)"] = "Tells the NPC to walk to position V"
E2Helper.Descriptions["npcStop(e:)"] = "Stops any anything the NPC is doing, including things it decided to do by itself"
E2Helper.Descriptions["npcSetTarget(e:e)"] = "Sets the npcs current target"
E2Helper.Descriptions["npcGetTarget(e:)"] = "Returns what the npc is currently targeting"
E2Helper.Descriptions["npcShoot(e:)"] = "Tells the NPC to shoot their gun"

-- Signals
E2Helper.Descriptions["signalGetGroup()"] = "Gets the E-2's current signal group"
E2Helper.Descriptions["signalSetGroup(s)"] = "Sets the E-2's current signal group to S, this is applied during runOnSignal, signalSend, and signalSetOnRemove calls, so call it first"
E2Helper.Descriptions["signalSetOnRemove(sn)"] = "Sets the signal that the chip sends when it is removed from the world"
E2Helper.Descriptions["signalClk()"] = "Returns 1 if the chip was executed because of any signal, regardless of name, group or scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(s)"] = "Returns 1 if the chip was executed because the signal S was sent, regardless of group or scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(sn)"] = "Returns 1 if the chip was executed because the signal S was sent to the scope N, regardless of group. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(ss)"] = "Returns 1 if the chip was executed because the signal S2 was sent in the group S, regardless of scope. Returns 0 otherwise"
E2Helper.Descriptions["signalClk(ssn)"] = "Returns 1 if the chip was executed because the signal S2 was sent in the group S to the scope N. Returns 0 otherwise"
E2Helper.Descriptions["signalName()"] = "Returns the name of the received signal"
E2Helper.Descriptions["signalGroup()"] = "Returns the group name of the received signal"
E2Helper.Descriptions["signalSend(sn)"] = "Sends signal S to scope N. Additional calls to this function with the same signal will overwrite the old call until the signal is issued"
E2Helper.Descriptions["signalSendDirect(se)"] = "Sends signal S to the given chip. Multiple calls for different chips do not overwrite each other"
E2Helper.Descriptions["signalSendToPlayer(se)"] = "Sends signal S to chips owned by the given player, multiple calls for different players do not overwrite each other"
E2Helper.Descriptions["signalSender()"] = "Returns the entity of the chip that sent the signal"
E2Helper.Descriptions["signalSenderId()"] = "Returns the entity ID of the chip that sent the signal. Useful if the entity doesn't exist anymore"
E2Helper.Descriptions["signalClearOnRemove()"] = "Clears the signal that the chip sends when it is removed from the world"

-- Holograms
E2Helper.Descriptions["holoAlpha(nn)"] = "Sets the transparency (0-255) of the hologram"
E2Helper.Descriptions["holoAng(na)"] = "Sets the angle of the hologram"
E2Helper.Descriptions["holoBodygroup(nnn)"] = "Index, Group ID, Group SubID\nSets the bodygroups of the given hologram"
E2Helper.Descriptions["holoBodygroups(nn)"] = "Index, Group ID\nReturns the number of bodygroups in the Group ID of the given hologram"
E2Helper.Descriptions["holoCanCreate()"] = "Returns 1 when holoCreate() will successfully create a new hologram until the Max limit is reached\nReplaces holoRemainingSpawns()"
E2Helper.Descriptions["holoColor(nxv4)"] = "Sets the color and alpha of the hologram"
E2Helper.Descriptions["holoColor(nv)"] = "Sets the color of the hologram"
E2Helper.Descriptions["holoColor(nvn)"] = "Sets the color and alpha of the hologram"
E2Helper.Descriptions["holoPlayerColor(nv)"] = "Sets the sub-color of a hologram with player model such as clothes or physgun"
E2Helper.Descriptions["holoCreate(nvvavs)"] = "Index, Position, Scale, Angle, Color (RGB), Model\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvaxv4s)"] = "Index, Position, Scale, Angle, Color (RGBA), Model\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvav)"] = "Index, Position, Scale, Angle, Color (RGB)\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvvaxv4)"] = "Index, Position, Scale, Angle, Color (RGBA)\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvva)"] = "Index, Position, Scale, Angle\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nvv)"] = "Index, Position, Scale\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(nv)"] = "Index, Position\nCreates a new hologram entity"
E2Helper.Descriptions["holoCreate(n)"] = "Index\nCreates a new hologram entity"
E2Helper.Descriptions["holoDelete(n)"] = "Removes a hologram"
E2Helper.Descriptions["holoDeleteAll()"] = "Removes all holograms made by this E2"
E2Helper.Descriptions["holoDisableShading(nn)"] = "If 1, supresses engine lighting when drawing this hologram"
E2Helper.Descriptions["holoEntity(n)"] = "Returns the entity corresponding to the hologram given by the specified index"
E2Helper.Descriptions["holoIndex(e)"] = "Returns the index of the given hologram entity"
E2Helper.Descriptions["holoMaterial(ns)"] = "Sets the overlay material of the hologram"
E2Helper.Descriptions["holoModel(ns)"] = "Sets the model.\nMust be from holoModelList unless wire_holograms_modelany is 1 (see holoModelAny())"
E2Helper.Descriptions["holoModel(nsn)"] = "Sets the model and skin.\nMust be from holoModelList unless wire_holograms_modelany is 1 (see holoModelAny())"
E2Helper.Descriptions["holoModelAny()"] = "Returns 1 if models outside of holoModelList can be used.\nReads convar 'wire_holograms_modelany'"
E2Helper.Descriptions["holoModelList()"] = "Returns the list of valid models\nSee holoModelAny()"
E2Helper.Descriptions["holoParent(ne)"] = "Parents the hologram to an entity"
E2Helper.Descriptions["holoParent(nn)"] = "Parents the hologram to another hologram"
E2Helper.Descriptions["holoParentAttachment(nes)"] = "Parents the hologram to an entity's bone by its attachment name"
E2Helper.Descriptions["holoUnparent(n)"] = "Un-parents the hologram"
E2Helper.Descriptions["holoPos(nv)"] = "Sets the position of the hologram"
E2Helper.Descriptions["holoRemainingSpawns()"] = "Returns how many holograms can be created this execution"
E2Helper.Descriptions["holoReset(nsvvs)"] = "Similar to holoCreate, but reusing the old entity"
E2Helper.Descriptions["holoScale(n)"] = "Returns the scale of the given hologram"
E2Helper.Descriptions["holoScale(nv)"] = "Sets the scale of the given hologram, as a multiplier"
E2Helper.Descriptions["holoBoneScale(nn)"] = "Returns the scale of the given hologram bone"
E2Helper.Descriptions["holoBoneScale(nnv)"] = "Sets the scale of the given hologram bone, as a multiplier"
E2Helper.Descriptions["holoBoneScale(ns)"] = "Returns the scale of the given hologram named bone"
E2Helper.Descriptions["holoBoneScale(nsv)"] = "Sets the scale of the given hologram named bone, as a multiplier"
E2Helper.Descriptions["holoScaleUnits(n)"] = "Returns the scale of the given hologram in source units"
E2Helper.Descriptions["holoScaleUnits(nv)"] = "Sets the scale of the given hologram, in source units"
E2Helper.Descriptions["holoShadow(nn)"] = "Enables the hologram's shadow"
E2Helper.Descriptions["holoVisible(nen)"] = "If 0, prevents a specific player from seeing the hologram"
E2Helper.Descriptions["holoVisible(nrn)"] = "If 0, prevents an array of players from seeing the hologram"
E2Helper.Descriptions["holoClip(nnvvn)"] = "Defines a plane used to clip a hologram specified by it's index, position, direction and number 1/0 whether the position should be global or local to the hologram"
E2Helper.Descriptions["holoClip(nvvn)"] = "Defines a plane used to clip a hologram specified by it's position, direction and number 1/0 whether the position should be global or local to the hologram"
E2Helper.Descriptions["holoClip(nnvve)"] = "Defines a plane used to clip a hologram specified by it's index, position, and direction local to the given entity"
E2Helper.Descriptions["holoClip(nvve)"] = "Defines a plane used to clip a hologram specified by it's position, and direction local to the given entity"
E2Helper.Descriptions["holoClipEnabled(nn)"] = "Enables / disables clipping for a hologram with specified index"
E2Helper.Descriptions["holoClipEnabled(nnn)"] = "Enables / disables clipping for a hologram with specified index. Clip index is for use with multiple clipping planes"
E2Helper.Descriptions["holoClipsAvailable()"] = "Returns the maximum number of clipping planes allowed per hologram"
E2Helper.Descriptions["holoRenderFX(nn)"] = "Changes the RenderFX for a hologram"
E2Helper.Descriptions["holoSkin(nn)"] = "Changes the skin of a hologram"

-- File
E2Helper.Descriptions["fileLoaded()"] = "Returns whether or not the file has been loaded onto the server"
E2Helper.Descriptions["fileRead()"] = "Returns the contents of the last uploaded file, or an empty string if there is no currently uploaded file"
E2Helper.Descriptions["fileReadList()"] = "Returns the contents of the last uploaded list"
E2Helper.Descriptions["fileClk(s)"] = "Returns whether the execution was run because a file finished uploading and was that file of a specific file name"
E2Helper.Descriptions["fileClk()"] = "Returns whether the execution was run because a file finished uploading"
E2Helper.Descriptions["fileLoadedList()"] = "If the list has been loaded and it is called, it will return 1. Any time after that until a new list is loaded it will return 0"
E2Helper.Descriptions["fileLoadingList()"] = "Returns whether a list is currently uploading"
E2Helper.Descriptions["fileList(s)"] = "Returns an array of file names that have been loaded"
E2Helper.Descriptions["fileListTable()"] = "Returns a table of file names that have been loaded. (Tbl[\"filename\"] = \"filename\")"
E2Helper.Descriptions["fileListClk(s)"] = "Returns whether the execution was run because a list with specified name was uploaded to the server"
E2Helper.Descriptions["fileListClk()"] = "Returns whether the execution was run because a list was uploaded to the server"
E2Helper.Descriptions["fileAppend(ss)"] = "Adds string data to the end of the file"
E2Helper.Descriptions["fileWrite(ss)"] = "Writes string data to the file overwriting it"
E2Helper.Descriptions["fileCanList()"] = "Returns 1 if the file list can be uploaded to the server"
E2Helper.Descriptions["fileCanLoad()"] = "Returns 1 if the file can be loaded"
E2Helper.Descriptions["fileCanWrite()"] = "Returns 1 if the file can be written"
E2Helper.Descriptions["fileLoad(s)"] = "Loads specified file to the server"
E2Helper.Descriptions["fileLoading()"] = "Returns whether a file is currently uploading"
E2Helper.Descriptions["fileMaxSize()"] = "Returns the maximum file size that can be uploaded or downloaded. Default is 300 KiB"
E2Helper.Descriptions["fileName()"] = "Returns the name of the last uploaded file, or an empty string if there is no currently uploaded file"
E2Helper.Descriptions["fileStatus()"] = "Returns the status of the upload in progress. Returns one of _FILE_UNKNOWN, _FILE_OK, _FILE_TIMEOUT, _FILE_404 or _FILE_TRANSFER_ERROR"
E2Helper.Descriptions["runOnFile(n)"] = "Specifies whether the E2 will run when a file finishes uploading"
E2Helper.Descriptions["runOnList(n)"] = "Specifies whether the E2 will run when a list finishes uploading"

-- Datasignals
E2Helper.Descriptions["dsSend"] = "Sends a datasignal to the specified group and scope"
E2Helper.Descriptions["dsSendDirect"] = "Sends a datasignal to the specified E2 (or use an array for several E2s)"
E2Helper.Descriptions["dsGetSender()"] = "Returns the entity of the E2 which sent the signal"
E2Helper.Descriptions["dsJoinGroup(s)"] = "Join the group to receive signals from it"
E2Helper.Descriptions["dsLeaveGroup(s)"] = "Leave the group to stop receiving signals from it"
E2Helper.Descriptions["dsClearGroups()"] = "Leave all groups"
E2Helper.Descriptions["dsClk()"] = "Returns 1 if the current execution was caused by a datasignal"
E2Helper.Descriptions["dsClk(s)"] = "Returns 1 if the current execution was caused by a datasignal with the specified signal name"
E2Helper.Descriptions["dsClkName()"] = "Returns the name of the signal"
E2Helper.Descriptions["dsGetType()"] = "Returns the type of the received data"
E2Helper.Descriptions["dsGetGroups()"] = "Returns an array of the groups the E2 is in"
E2Helper.Descriptions["dsGetGroup()"] = "Get the name of the group the signal was sent to"
E2Helper.Descriptions["dsProbe"] = "Returns an array of E2s the signal would have been sent to if it had been sent with the specified arguments"
E2Helper.Descriptions["dsSetScope(n)"] = "Sets the scope of the E2. Setting the scope determines which signals the E2 can receive. Check the wiki for more info about scopes"
E2Helper.Descriptions["dsGetScope()"] = "Returns the scope the E2 is currently in"
E2Helper.Descriptions["dsGetHash()"] = "Returns the hash of sending E2"
E2Helper.Descriptions["runOnSignal(snn)"] = "If N2 == 0 the chip will no longer run on this signal, otherwise it makes this chip execute when signal S is sent by someone in scope N"

-- gvars
E2Helper.Descriptions["gTable(sn)"] = "Returns the gTable. The string determines group, and the number determines wether or not the table should be shared"
E2Helper.Descriptions["gTable(s)"] = "Returns the gTable. The string determines group"
E2Helper.Descriptions["gTableSafe(n)"] = "Returns a safe gTable which group is a numerical hash created from the code of the E2 itself"
E2Helper.Descriptions["gRemoveAll()"] = "Removes all non-shared variables and group tables you have created"
E2Helper.Descriptions["clear(xgt:)"] = "Clears the gTable"
E2Helper.Descriptions["count(xgt:)"] = "Returns the number of entries in the gTable. Does not add the entries in subtables"
E2Helper.Descriptions["gGetGroup()"] = "Gets the E2's current group"
E2Helper.Descriptions["gSetGroup(s)"] = "Sets the E2's current group. Does persist"
E2Helper.Descriptions["gGetShare()"] = "Returns 1/0"
E2Helper.Descriptions["gResetGroup()"] = "Resets the group back to \"default\""
E2Helper.Descriptions["gShare(n)"] = "Sets wether or not you want to share the variables. (1/0) Remember that there are two tables for each group: one which is shared and one which is not; values do not transition between the two"
E2Helper.Descriptions["toTable(xgt:)"] = "Converts the GTable into a table"

-- tables
E2Helper.Descriptions["table"] = "Returns a table with the values specified in the array-part"
E2Helper.Descriptions["clear(t:)"] = "Clears the table"
E2Helper.Descriptions["count(t:)"] = "Returns the number of entries in the table. Does not add the entries in subtables"
E2Helper.Descriptions["ncount(t:)"] = "Returns the number of sequential numerical indexes"
E2Helper.Descriptions["depth(t:)"] = "Returns the depth at which the table is in, relative to its parents"
E2Helper.Descriptions["flip(t:)"] = "Returns a flipped copy of the table. Only affects string values in the array part and number values in the table part"
E2Helper.Descriptions["typeids(t:)"] = "Returns a new table with the typeids of the table"
E2Helper.Descriptions["clipToTypeid(t:s)"] = "Removes all entries not of the specified type"
E2Helper.Descriptions["clipFromTypeid(t:s)"] = "Removes all entries of the specified type"
E2Helper.Descriptions["min(t:)"] = "Returns the smallest numerical entry in the array-part"
E2Helper.Descriptions["max(t:)"] = "Returns the largest numerical entry in the array-part"
E2Helper.Descriptions["minIndex(t:)"] = "Returns the index of the smallest numerical entry in the array-part"
E2Helper.Descriptions["maxIndex(t:)"] = "Returns the index of the largest numerical entry in the array-part"
E2Helper.Descriptions["typeidsArray(t:)"] = "Returns an array with the typeids of the array-part of the table"
E2Helper.Descriptions["toArray(t:)"] = "Converts the table into an array. (Note that there is no R:totable() function because E2 arrays do not save typeids)"
E2Helper.Descriptions["findToTable()"] = "Inserts the finds from an entity discovery event into an table's array-part and returns it. (Basically the same as findToArray())"
E2Helper.Descriptions["toTable(t:)"] = "Converts the table into a table"
E2Helper.Descriptions["typeidsTable(t:)"] = "Returns a table with the typeids of the table-part of the table"
E2Helper.Descriptions["clone(t:)"] = "Returns a copy of the table"
E2Helper.Descriptions["concat(t:)"] = "Concatenates the array-part of the table"
E2Helper.Descriptions["concat(t:s)"] = "Concatenates the array-part of the table, with a string delimiter"
E2Helper.Descriptions["concat(t:n)"] = "Concatenates the array-part of the table, starting at index N"
E2Helper.Descriptions["concat(t:sn)"] = "Concatenates the array-part of the table, starting at index N, with string S in between each"
E2Helper.Descriptions["concat(t:nn)"] = "Concatenates the array-part of the table, starting at index N1 and ending at N2"
E2Helper.Descriptions["concat(t:snn)"] = "Concatenates the array-part of the table, starting at index N1 and ending at N2, with string S in between each"
E2Helper.Descriptions["toString(t)"] = "Formats the table as a human-readable string"
E2Helper.Descriptions["toString(t:)"] = "Formats the table as a human-readable string"
E2Helper.Descriptions["id(t:)"] = "Returns the unique ID of the table"
E2Helper.Descriptions["add(t:t)"] = "Adds the contents of the second table to the end of the first table. Returns new table"
E2Helper.Descriptions["difference(t:t)"] = "Removes all variables with keys that exist in T2"
E2Helper.Descriptions["intersect(t:t)"] = "Removes all variables with keys which don't exist in T2"
E2Helper.Descriptions["merge(t:t)"] = "Merges T2 with T. Any variables with the same indexes are overwritten by T2's variables"
E2Helper.Descriptions["exists(t:s)"] = "Returns 1 if the table contains any value at specified index"
E2Helper.Descriptions["exists(t:n)"] = "Returns 1 if the table contains any value at specified index"
E2Helper.Descriptions["invert(t)"] = "Inverts the table, creating a lookup table"
E2Helper.Descriptions["keys(t:)"] = "Returns an array with the keys of the table"
E2Helper.Descriptions["values(t:)"] = "Returns an array with the values of the table (tables and arrays, which arrays do not support, are discarded)"
E2Helper.Descriptions["pop(t:)"] = "Removes the last entry in the array-part and returns 1 if removed"
E2Helper.Descriptions["shift(t:)"] = "Removes the first element of the table; all other entries will move down one address and returns 1 if removed"
E2Helper.Descriptions["remove(t:n)"] = "Removes the specified entry from the array-part and returns 1 if removed"
E2Helper.Descriptions["remove(t:s)"] = "Removes the specified entry from the table-part and returns 1 if removed"
E2Helper.Descriptions["unset(t:n)"] = "Force removes the specified entry from the array-part, without moving subsequent entries down and returns 1 if removed"
E2Helper.Descriptions["unset(t:s)"] = "Force removes the specified entry from the table-part, without moving subsequent entries down and returns 1 if removed"

-- arrays
E2Helper.Descriptions["array(...)"] = "Creates an array"
E2Helper.Descriptions["add(r:r)"] = "Adds the contents of the second array to the end of the first array. Returns new array"
E2Helper.Descriptions["sum(r:)"] = "Adds all numbers in the array together and returns result"
E2Helper.Descriptions["average(r:)"] = "Gives the average of all numbers in array"
E2Helper.Descriptions["clear(r:)"] = "Clears the array"
E2Helper.Descriptions["clone(r:)"] = "Returns a copy of the array"
E2Helper.Descriptions["concat(r:)"] = "Concatenates all values in the array"
E2Helper.Descriptions["concat(r:s)"] = "Concatenates all values in the array with the specified string in between each"
E2Helper.Descriptions["concat(r:n)"] = "Concatenates all values in the array, starting at index N"
E2Helper.Descriptions["concat(r:sn)"] = "Concatenates all values in the array, starting at index N, with string S in between each"
E2Helper.Descriptions["concat(r:nn)"] = "Concatenates all values in the array, starting at index N1 and ending at N2"
E2Helper.Descriptions["concat(r:snn)"] = "Concatenates all values in the array, starting at index N1 and ending at N2, with string S in between each"
E2Helper.Descriptions["count(r:)"] = "Returns the number of entries in the array"
E2Helper.Descriptions["exists(r:n)"] = "Returns 1 if the array contains any value at specified index"
E2Helper.Descriptions["id(r:)"] = "Returns the unique ID of the array"
E2Helper.Descriptions["invert(r)"] = "Inverts the array, creating a lookup table"
E2Helper.Descriptions["min(r:)"] = "Returns the smallest number in array"
E2Helper.Descriptions["max(r:)"] = "Returns the largest number in array"
E2Helper.Descriptions["minIndex(r:)"] = "Returns the index of the smallest number in array"
E2Helper.Descriptions["maxIndex(r:)"] = "Returns the index of the largest number in array"
E2Helper.Descriptions["merge(r:r)"] = "Merges R2 with R. Any variables with the same indexes are overwritten by R2's variables"
E2Helper.Descriptions["pop(r:)"] = "Removes the last entry in the array and returns 1 if removed"
E2Helper.Descriptions["shift(r:)"] = "Removes the first element of the array; all other entries will move down one address and returns 1 if removed"
E2Helper.Descriptions["remove(r:n)"] = "Removes the specified entry, moving subsequent entries down to compensate and returns 1 if removed"
E2Helper.Descriptions["unset(r:n)"] = "Force removes the specified entry, without moving subsequent entries down and returns 1 if removed"

-- binary
E2Helper.Descriptions["bOr(nn)"] = "Performs bitwise OR against the two numbers"
E2Helper.Descriptions["bAnd(nn)"] = "Performs bitwise AND against the two numbers"
E2Helper.Descriptions["bXor(nn)"] = "Performs bitwise XOR against the two numbers"
E2Helper.Descriptions["bShl(nn)"] = "Performs bitwise shift left on the first number by the amount of the second"
E2Helper.Descriptions["bShr(nn)"] = "Performs bitwise shift right on the first number by the amount of the second"
E2Helper.Descriptions["bNot(n)"] = "Performs a binary Not"
E2Helper.Descriptions["bNot(nn)"] = "Performs a binary Not. The second argument is the length of the number you wish to perform Not on in bits"

-- EGP
E2Helper.Descriptions["egpAlign(xwl:nn)"] = "Changes the horizontal alignment. Works on: text and text layout. Number can be 0, 1 or 2"
E2Helper.Descriptions["egpAlign(xwl:nnn)"] = "Changes the horizontal and vertical alignment. Works on: text and text layout. Numbers can be 0, 1 or 2"
E2Helper.Descriptions["egpAlpha(xwl:nn)"] = "Changes the alpha (transparency) of an object"
E2Helper.Descriptions["egpAlpha(xwl:n)"] = "Returns the alpha of the object"
E2Helper.Descriptions["egpAngle(xwl:nn)"] = "Changes the angle of the object"
E2Helper.Descriptions["egpAngle(xwl:n)"] = "Returns the angle of the object"
E2Helper.Descriptions["egpAngle(xwl:nxv2xv2n)"] = "Rotates the object around the first vec2 with the second vec2 as offset at angle N"
E2Helper.Descriptions["egpColor(xwl:n)"] = "Returns the color of the object as 3D vector"
E2Helper.Descriptions["egpColor(xwl:nnnnn)"] = "Changes the color and alpha of the object"
E2Helper.Descriptions["egpColor(xwl:nxv4)"] = "Changes the color and alpha of the object"
E2Helper.Descriptions["egpColor(xwl:nv)"] = "Changes the color of the object"
E2Helper.Descriptions["egpColor4(xwl:n)"] = "Returns the color of the object as 4D vector (including alpha)"
E2Helper.Descriptions["egpFidelity(xwl:n)"] = "Returns the fidelity of the object"
E2Helper.Descriptions["egpFidelity(xwl:nn)"] = "Changes the fidelity of the object (the number of vertices the circle will use)"
E2Helper.Descriptions["egpFont(xwl:nsn)"] = "Changes the font and size of the text object"
E2Helper.Descriptions["egpFont(xwl:ns)"] = "Changes the font of the text object"
E2Helper.Descriptions["egpMaterial(xwl:n)"] = "Returns the material of the object"
E2Helper.Descriptions["egpMaterial(xwl:ns)"] = "Changes the material of the object"
E2Helper.Descriptions["egpMaterialFromScreen(xwl:ne)"] = "Sets the material of the object to a current snapshot of the target screen. Note that this only works for players which see both the egp as well the target screen at that time"
E2Helper.Descriptions["egpOrder(xwl:nn)"] = "Sets the order at which the object will be rendered"
E2Helper.Descriptions["egpOrder(xwl:n)"] = "Returns the order at which the object is rendered"
E2Helper.Descriptions["egpParent(xwl:n)"] = "Returns the index of the parent object"
E2Helper.Descriptions["egpParent(xwl:ne)"] = "Parents the 3D tracker object to an entity"
E2Helper.Descriptions["egpParent(xwl:nn)"] = "Parents the object to another object. Parented objects' positions are local to their parent"
E2Helper.Descriptions["egpParentToCursor(xwl:n)"] = "Parents the object to player's cursor"
E2Helper.Descriptions["egpUnParent(xwl:n)"] = "Un-parents the object"
E2Helper.Descriptions["egpPos(xwl:n)"] = "Returns the position of the object"
E2Helper.Descriptions["egpPos(xwl:nxv2)"] = "Changes the position of the object"
E2Helper.Descriptions["egpPos(xwl:nv)"] = "Changes the world position of the 3D tracker object"
E2Helper.Descriptions["egpQueue()"] = "Returns the number of items in your queue"
E2Helper.Descriptions["egpQueueClk(e)"] = "Returns 1 if the current execution was caused by the EGP queue system of specified screen"
E2Helper.Descriptions["egpQueueClk(xwl)"] = "Returns 1 if the current execution was caused by the EGP queue system of specified screen"
E2Helper.Descriptions["egpQueueClk()"] = "Returns 1 if the current execution was caused by the EGP queue system"
E2Helper.Descriptions["egpQueueClkPly(e)"] = "Returns 1 if the current execution was caused by the EGP queue system, and the player E was the player who ordered the items to be sent"
E2Helper.Descriptions["egpQueuePlayer()"] = "Returns the player which ordered the items to be sent"
E2Helper.Descriptions["egpQueueScreen()"] = "Returns the screen entity which the queue finished sending items for"
E2Helper.Descriptions["egpQueueScreenWirelink()"] = "Returns the screen wirelink which the queue finished sending items for"
E2Helper.Descriptions["egpRadius(xwl:nn)"] = "Changes the corner radius of the rounded box object"
E2Helper.Descriptions["egpRadius(xwl:n)"] = "Returns the corcner radius of the rounded box object"
E2Helper.Descriptions["egpRemove(xwl:n)"] = "Removes the object from the screen"
E2Helper.Descriptions["egpResolution(xwl:xv2xv2)"] = "Sets the scale of the screen such that the top left corner is equal to the first vector and the bottom right corner is equal to the second vector"
E2Helper.Descriptions["egpScale(xwl:xv2xv2)"] = "Sets the scale of the screen's X axis to the first vector and Y axis to the second vector"
E2Helper.Descriptions["egpScrH(e)"] = "Returns the player's screen resolution height"
E2Helper.Descriptions["egpScrW(e)"] = "Returns the player's screen resolution width"
E2Helper.Descriptions["egpScrSize(e)"] = "Returns the player's screen resolution size"
E2Helper.Descriptions["egpSetText(xwl:ns)"] = "Changes the text of the text object"
E2Helper.Descriptions["egpSize(xwl:n)"] = "Returns the size of the object"
E2Helper.Descriptions["egpSize(xwl:nn)"] = "Changes the size of the text/line/outline object"
E2Helper.Descriptions["egpSize(xwl:nxv2)"] = "Changes the size of the object"
E2Helper.Descriptions["egpSizeNum(xwl:n)"] = "Returns the size of the text/line/outline object"
E2Helper.Descriptions["egpToWorld(xwl:xv2)"] = "Converts a 2D vector on the screen or emitter into a 3D vector in the world"
E2Helper.Descriptions["egpTrackerParent(xwl:n)"] = "Returns the parent entity of the 3D tracker object"

--E2Helper.Descriptions["egpAddVertices(xwl:nr)"] = ""
--E2Helper.Descriptions["egpBytesLeft()"] = ""
E2Helper.Descriptions["egpCanSendUmsg()"] = "Returns 1 if you can send an usermessage at the moment, 0 otherwise"
E2Helper.Descriptions["egpClear(xwl:)"] = "Clears the EGP screen"
E2Helper.Descriptions["egpClearQueue()"] = "Clears your entire queue"
E2Helper.Descriptions["egpCopy(xwl:nn)"] = "Copies the settings of the second object into the first. If the first object does not exist, it's created"
E2Helper.Descriptions["egpCursor(xwl:e)"] = "Returns the specified player's aim position on the screen"
E2Helper.Descriptions["egpDrawTopLeft(xwl:n)"] = "Set to 1 to make boxes, outline boxes, rounded boxes, and rounded outline boxes draw from the top left corner instead of from the center"
E2Helper.Descriptions["egpGlobalPos(xwl:n)"] = "Returns the \"global\" (= it takes the parents' positions into consideration) position as a 3D vector. X and Y being the 2D X,Y coordinates, while Z is the angle"
E2Helper.Descriptions["egpGlobalVertices(xwl:n)"] = "Returns an array of 2D vectors with the \"global\" positions of the vertices in the object"
E2Helper.Descriptions["egpGlobalFiltering(xwl:n)"] = "Changes the texture filter used to draw all EGP Objects. Works only on EGP Screens. See _TEXFILTER constants (POINT=sharp, ANISOTROPIC=blurry/default)"
E2Helper.Descriptions["egpHasObject(xwl:n)"] = "Returns 1 if the object with specified index exists on the screen, 0 if not"
E2Helper.Descriptions["egpObjectContainsPoint(xwl:nxv2)"] = "Returns 1 if the object with specified index contains the specified point"
E2Helper.Descriptions["egpHudToggle(xwl:)"] = "Toggles the HUD on/off"
E2Helper.Descriptions["egpLoadFrame(xwl:n)"] = "Loads the frame with specified index"
E2Helper.Descriptions["egpLoadFrame(xwl:s)"] = "Loads the frame with specified name"
E2Helper.Descriptions["egpSaveFrame(xwl:n)"] = "Saves the frame under specified index"
E2Helper.Descriptions["egpSaveFrame(xwl:s)"] = "Saves the frame under specified name"
E2Helper.Descriptions["egpFiltering(xwl:nn)"] = "Changes the texture filter used to draw the object. Works on objects that draw a material. See _TEXFILTER constants (POINT=sharp, ANISOTROPIC=blurry/default)"
E2Helper.Descriptions["egpMaxObjects()"] = "Returns the maximum amount of objects you can have"
E2Helper.Descriptions["egpMaxUmsgPerSecond()"] = "Returns the maximum number of usermessages you can send per second"
E2Helper.Descriptions["egpNumObjects(xwl:)"] = "Returns the number of objects on the screen"
E2Helper.Descriptions["egpRunOnQueue(xwl:n)"] = "Set to 1 if you want your E2 to be triggered once the queue has finished sending all items in the queue for the screen"
E2Helper.Descriptions["egpVertices(xwl:n)"] = "Returns an array of the vertices of the object"
E2Helper.Descriptions["egpObjectIndexes(xwl:)"] = "Returns an array containing all object indexes being used"
E2Helper.Descriptions["egpObjectType(xwl:n)"] = "Returns the type of the object with specified index"
E2Helper.Descriptions["egpObjectTypes(xwl:)"] = "Returns an array whose keys are bound to object index, and value being the type of particular object"

E2Helper.Descriptions["egp3DTracker(xwl:nv)"] = "Creates a 3D tracker object at specified world position"
E2Helper.Descriptions["egpBox(xwl:nxv2xv2)"] = "Creates a box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpBoxOutline(xwl:nxv2xv2)"] = "Creates an outline box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpCircle(xwl:nxv2xv2)"] = "Creates a circle. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpCircleOutline(xwl:nxv2xv2)"] = "Creates an outline circle. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpLine(xwl:nxv2xv2)"] = "Creates a line. First 2D vector is the start position, second is end position"
E2Helper.Descriptions["egpLineStrip(xwl:n...)"] = "Creates a curve with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpLineStrip(xwl:nr)"] = "Creates a curve with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPoly(xwl:nr)"] = "Creates a polygon with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPoly(xwl:n...)"] = "Creates a polygon with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPolyOutline(xwl:nr)"] = "Creates a outline polygon with specified points as array of 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpPolyOutline(xwl:n...)"] = "Creates a outline polygon with specified points as 2D/4D vectors (x,y)/(x,y,u,v)"
E2Helper.Descriptions["egpRoundedBox(xwl:nxv2xv2)"] = "Creates a rounded box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpRoundedBoxOutline(xwl:nxv2xv2)"] = "Creates a rounded outline box. First 2D vector is the position, second is size"
E2Helper.Descriptions["egpText(xwl:nsxv2)"] = "Creates a text object"
E2Helper.Descriptions["egpTextLayout(xwl:nsxv2xv2)"] = "Creates a text layout object"
E2Helper.Descriptions["egpTriangle(xwl:nxv2xv2xv2)"] = "Creates a triangle with specified vertices"
E2Helper.Descriptions["egpTriangleOutline(xwl:nxv2xv2xv2)"] = "Creates a outline triangle with specified vertices"
E2Helper.Descriptions["egpWedge(xwl:nxv2xv2)"] = "Creates a wedge object. Wedge objects are like circles, except they have a cake-piece-like mouth which you can change using egpSize"
E2Helper.Descriptions["egpWedgeOutline(xwl:nxv2xv2)"] = "Creates a outline wedge object. Wedge objects are like circles, except they have a cake-piece-like mouth which you can change using egpSize"

-- (de)serialization
E2Helper.Descriptions["glonDecode(s)"] = "Decodes a string into an array using GLON"
E2Helper.Descriptions["glonDecodeTable(s)"] = "Decodes a string into a table using GLON"
E2Helper.Descriptions["glonEncode(r)"] = "Encodes an array into a string using GLON"
E2Helper.Descriptions["glonEncode(t)"] = "Encodes a table into a string using GLON"
E2Helper.Descriptions["glonError()"] = "Returns the last glon error"

E2Helper.Descriptions["vonDecode(s)"] = "Decodes a string into an array using vON"
E2Helper.Descriptions["vonDecodeTable(s)"] = "Decodes a string into a table using vON"
E2Helper.Descriptions["vonEncode(r)"] = "Encodes an array into a string using vON"
E2Helper.Descriptions["vonEncode(t)"] = "Encodes a table into a string using vON"
E2Helper.Descriptions["vonError()"] = "Returns the last von error"

E2Helper.Descriptions["jsonDecode(s)"] = "Decodes a string into an array using json"
E2Helper.Descriptions["jsonDecodeTable(s)"] = "Decodes a string into a table using json"
E2Helper.Descriptions["jsonEncode(r)"] = "Encodes an array into a string using json"
E2Helper.Descriptions["jsonEncode(rn)"] = "Encodes an array into a string using json"
E2Helper.Descriptions["jsonEncode(t)"] = "Encodes a table into a string using json"
E2Helper.Descriptions["jsonEncode(tn)"] = "Encodes a table into a string using json"
E2Helper.Descriptions["jsonEncodeExternal(t)"] = "Encodes a table into a string using json, in a form that is suitable to be exported to external resources. Unfortunately, arrays are ignored because E2 contains many ambiguous types, and arrays don't keep track of those types. You will have to convert your array to a table manually before encoding it."
E2Helper.Descriptions["jsonEncodeExternal(tn)"] = "Encodes a table into a string using json, in a form that is suitable to be exported to external resources. Unfortunately, arrays are ignored because E2 contains many ambiguous types, and arrays don't keep track of those types. You will have to convert your array to a table manually before encoding it."
E2Helper.Descriptions["jsonDecodeTableExternal(s)"] = "Decodes a string into a table using json"
E2Helper.Descriptions["jsonError()"] = "Returns the last json error"

-- http
E2Helper.Descriptions["httpCanRequest()"] = "Returns whether you can make a new request (delay has been met or previous request timed out)"
E2Helper.Descriptions["httpClk()"] = "Returns whether the execution was run because of a completed request"
E2Helper.Descriptions["httpData()"] = "Returns the data received from the last request"
E2Helper.Descriptions["httpSuccess()"] = "Returns whether the previous request was successful"
E2Helper.Descriptions["httpRequest(s)"] = "Starts a new request"
E2Helper.Descriptions["httpRequestUrl()"] = "Returns the URL of the last request"
E2Helper.Descriptions["httpUrlDecode(s)"] = "Returns decoded URL data"
E2Helper.Descriptions["httpUrlEncode(s)"] = "Returns formatted string to be placed in the URL"
E2Helper.Descriptions["runOnHTTP(n)"] = "Sets whether to run the expression when a request finishes"

-- sound
E2Helper.Descriptions["soundDuration(s)"] = "soundDuration(string Path to File) Returns the duration of the sound. Note: If the server hasn't the file it returns 60"
E2Helper.Descriptions["soundPitch(sn)"] = "soundPitch(string Index, integer Pitch) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(nnn)"] = "soundPitch(integer Index, integer Pitch, integer Fadetime) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(snn)"] = "soundPitch(string Index, integer Pitch, integer Fadetime) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPitch(nn)"] = "soundPitch(integer Index, integer Pitch) Default Pitch is 100, max is 255. Pitch is scaled linearly (like frequency), rather than by octave"
E2Helper.Descriptions["soundPlay(e:sns)"] = "Plays sound from an entity. soundPlay(string Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(nns)"] = "Plays sound from the E2 chip. soundPlay(int Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(snsn)"] = "Plays sound from the E2 chip. soundPlay(string Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(sns)"] = "Plays sound from the E2 chip. soundPlay(string Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(nnsn)"] = "Plays sound from the E2 chip. soundPlay(int Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(e:nns)"] = "Plays sound from an entity. soundPlay(int Index, int Duration, string Path to File)"
E2Helper.Descriptions["soundPlay(e:snsn)"] = "Plays sound from an entity. soundPlay(string Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPlay(e:nnsn)"] = "Plays sound from an entity. soundPlay(int Index, int Duration, string Path to File, int FadeTime)"
E2Helper.Descriptions["soundPurge()"] = "Clears the sound table and stops all sounds"
E2Helper.Descriptions["soundStop(n)"] = "Stops the sound stored at the integer index and removes the entry"
E2Helper.Descriptions["soundStop(s)"] = "Stops the sound stored at the string index and removes the entry"
E2Helper.Descriptions["soundStop(nn)"] = "Fades the sound stored at the first input's integer index in the second input's amount of seconds and removes the entry"
E2Helper.Descriptions["soundStop(sn)"] = "Fades the sound stored at the string index in the integer input's amount of seconds and removes the entry"
E2Helper.Descriptions["soundVolume(snn)"] = "soundVolume(string Index, Volume, FadeTime), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(sn)"] = "soundVolume(string Index, Volume), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(nn)"] = "soundVolume(integer Index, Volume), where Volume is a number between 0 and 1. Default Volume is 1"
E2Helper.Descriptions["soundVolume(nnn)"] = "soundVolume(integer Index, Volume, FadeTime), where Volume is a number between 0 and 1. Default Volume is 1"

-- UTF-8
E2Helper.Descriptions["toUnicodeChar(...)"] = "Returns the UTF-8 string from the given Unicode code-points"
E2Helper.Descriptions["toUnicodeChar(r)"] = "Returns the UTF-8 string from the given Unicode code-points"
E2Helper.Descriptions["toUnicodeByte(s:nn)"] = "Returns the Unicode code-points from the given UTF-8 string"
E2Helper.Descriptions["unicodeLength(s:nn)"] = "Returns the length of the given UTF-8 string"

-- Damage
E2Helper.Descriptions["runOnDeath(n)"] = "If set to 0, chip won't run on players dying"
E2Helper.Descriptions["deathClk()"] = "Returns if the E2 was triggered by a death"
E2Helper.Descriptions["lastDeathTime()"] = "Returns the last time a player died"
E2Helper.Descriptions["lastDeathTime(e)"] = "Returns the last time given player died"
E2Helper.Descriptions["lastDeathInflictor()"] = "Returns the entity that inflicted the last death"
E2Helper.Descriptions["lastDeathInflictor(e)"] = "Returns the entity that inflicted the given player's last death"
E2Helper.Descriptions["lastDeathVictim()"] = "Returns the last player to die"
E2Helper.Descriptions["lastDeathAttacker()"] = "Returns the attacker who killed the last player to die"
E2Helper.Descriptions["lastDeathAttacker(e)"] = "Returns the attacker who killed the player provided in their last death"
--
E2Helper.Descriptions["runOnSpawn(n)"] = "If set to 0, chip won't run on players spawning"
E2Helper.Descriptions["spawnClk()"] = "Returns if the E2 was triggered by a player spawning"
E2Helper.Descriptions["lastSpawnTime()"] = "Returns the last time a player spawned"
E2Helper.Descriptions["lastSpawnTime(e)"] = "Returns the last time the given player spawned"
E2Helper.Descriptions["lastSpawnedPlayer()"] = "Returns the last player to spawn"

---- Custom ----
-- Effect
E2Helper.Descriptions["effect()"] = "Creates and returns new effect"
E2Helper.Descriptions["play(xef:s)"] = "Plays the effect with given name (eg. watersplash)"
E2Helper.Descriptions["setAngles(xef:a)"] = "Sets the angle of the effect"
E2Helper.Descriptions["setAttachment(xef:n)"] = "Creates new attachment ID for the effect"
E2Helper.Descriptions["setColor(xef:n)"] = "Sets the color of the effect. Color is represented by a byte"
E2Helper.Descriptions["setDamageType(xef:n)"] = "Sets the damage type of the effect. See DMG_ Enums on GMod Wiki"
E2Helper.Descriptions["setEntIndex(xef:n)"] = "Sets the entity of the effect via its index"
E2Helper.Descriptions["setEntity(xef:e)"] = "Sets the entity of the effect"
E2Helper.Descriptions["setFlags(xef:n)"] = "Sets the flags of the effect"
E2Helper.Descriptions["setHitBox(xef:n)"] = "Sets the hit box index of the effect"
E2Helper.Descriptions["setMagnitude(xef:n)"] = "Sets the magnitude of the effect"
E2Helper.Descriptions["setMaterialIndex(xef:n)"] = "Sets the material index of the effect"
E2Helper.Descriptions["setNormal(xef:v)"] = "Sets the normalized direction vector of the effect"
E2Helper.Descriptions["setOrigin(xef:v)"] = "Sets the origin of the effect"
E2Helper.Descriptions["setRadius(xef:n)"] = "Sets the radius of the effect"
E2Helper.Descriptions["setScale(xef:n)"] = "Sets the scale of the effect"
E2Helper.Descriptions["setStart(xef:v)"] = "Sets the start of the effect"
E2Helper.Descriptions["setSurfaceProp(xef:n)"] = "Sets the surface property index of the effect"


