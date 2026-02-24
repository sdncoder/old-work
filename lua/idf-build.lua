---lua
-- build ios idf template
--
io.input("idf-template.txt") -- read external file
build = {} -- create table

-- functions
function readFile(build)
local counter = 1 -- first index in table [1]

repeat
 temp = io.read("*line")  -- read next line when you call io.read()
 if temp ~= "" then -- not EOF
   build[counter] = temp -- write line into table
   counter = counter + 1
 end
until temp == nul
end

-- call functions
readFile(build)  -- pass file into build table
x=1  -- first index of table [1]
repeat
 print(build[x])
 x=x+1
 until build[x]==nul -- EOF
