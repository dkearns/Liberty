class TEST
creation make
feature
	make is
		do
			create plugin
			plugin.initialize("./cplugin.so")
			if plugin.is_initialized then
				plugin.symbol("procedure")
			else print(once "Couldn't load library%N")
			end	
		end

		plugin: PLUGGABLE 
	end
