-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GBUS_NAME_OWNER_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_bus_name_owner_flags_allow_replacement_low_level)  or else
				(a_value = g_bus_name_owner_flags_none_low_level)  or else
				(a_value = g_bus_name_owner_flags_replace_low_level) )
		end

feature -- Setters
	default_create,
	set_g_bus_name_owner_flags_allow_replacement is
		do
			value := g_bus_name_owner_flags_allow_replacement_low_level
		end

	set_g_bus_name_owner_flags_none is
		do
			value := g_bus_name_owner_flags_none_low_level
		end

	set_g_bus_name_owner_flags_replace is
		do
			value := g_bus_name_owner_flags_replace_low_level
		end

feature -- Queries
	is_g_bus_name_owner_flags_allow_replacement: BOOLEAN is
		do
			Result := (value=g_bus_name_owner_flags_allow_replacement_low_level)
		end

	is_g_bus_name_owner_flags_none: BOOLEAN is
		do
			Result := (value=g_bus_name_owner_flags_none_low_level)
		end

	is_g_bus_name_owner_flags_replace: BOOLEAN is
		do
			Result := (value=g_bus_name_owner_flags_replace_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_bus_name_owner_flags_allow_replacement_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_NAME_OWNER_FLAGS_ALLOW_REPLACEMENT"
 			}"
 		end

	g_bus_name_owner_flags_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_NAME_OWNER_FLAGS_NONE"
 			}"
 		end

	g_bus_name_owner_flags_replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_BUS_NAME_OWNER_FLAGS_REPLACE"
 			}"
 		end


end -- class GBUS_NAME_OWNER_FLAGS_ENUM
