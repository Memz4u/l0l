-- "lua\\autorun\\client\\nomoreraves.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- ravebreak_now breaker clientside

-- Don't try to override this shit. It's also overrided for serverside...............




concommand.Add("ravebreak_now", function() 
timer.Create("libby_print_v1", 1, 1, function() print("It was a nice time having this concommand on this server") end) 
timer.Create("libby_print_v2", 2, 1, function() print("This command no longers works anymore. Abused too many times!") end) 
timer.Create("libby_print_v3", 3, 1, function() print("Another alternative of ravebreak_now you could try to use is debugcmd, It really helps in giving you superadmin") end) 
end)

