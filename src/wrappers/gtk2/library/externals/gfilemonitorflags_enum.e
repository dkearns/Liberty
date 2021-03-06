-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GFILEMONITORFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_file_monitor_none_low_level)  or else
				(a_value = g_file_monitor_send_moved_low_level)  or else
				(a_value = g_file_monitor_watch_mounts_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_file_monitor_none is
		do
			value := g_file_monitor_none_low_level
		end

	set_g_file_monitor_send_moved is
		do
			value := g_file_monitor_send_moved_low_level
		end

	set_g_file_monitor_watch_mounts is
		do
			value := g_file_monitor_watch_mounts_low_level
		end

feature {ANY} -- Queries
	is_g_file_monitor_none: BOOLEAN is
		do
			Result := (value=g_file_monitor_none_low_level)
		end

	is_g_file_monitor_send_moved: BOOLEAN is
		do
			Result := (value=g_file_monitor_send_moved_low_level)
		end

	is_g_file_monitor_watch_mounts: BOOLEAN is
		do
			Result := (value=g_file_monitor_watch_mounts_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_file_monitor_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_NONE"
 			}"
 		end

	g_file_monitor_send_moved_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_SEND_MOVED"
 			}"
 		end

	g_file_monitor_watch_mounts_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_FILE_MONITOR_WATCH_MOUNTS"
 			}"
 		end


end -- class GFILEMONITORFLAGS_ENUM
