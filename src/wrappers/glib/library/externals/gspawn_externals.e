-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GSPAWN_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_spawn_async_with_pipes (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER_32; a_child_setup: POINTER; an_user_data: POINTER; a_child_pid: POINTER; a_standard_input: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_async_with_pipes
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_async_with_pipes"
		}"
		end

	g_spawn_command_line_sync (a_command_line: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_exit_status: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_command_line_sync
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_command_line_sync"
		}"
		end

	g_spawn_async (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER_32; a_child_setup: POINTER; an_user_data: POINTER; a_child_pid: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_async
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_async"
		}"
		end

	g_spawn_command_line_async (a_command_line: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_command_line_async
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_command_line_async"
		}"
		end

	g_spawn_close_pid (a_pid: INTEGER_32) is
 		-- g_spawn_close_pid
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_close_pid"
		}"
		end

	g_spawn_sync (a_working_directory: POINTER; an_argv: POINTER; an_envp: POINTER; a_flags: INTEGER_32; a_child_setup: POINTER; an_user_data: POINTER; a_standard_output: POINTER; a_standard_error: POINTER; an_exit_status: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_spawn_sync
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_sync"
		}"
		end

	g_spawn_error_quark: NATURAL_32 is
 		-- g_spawn_error_quark
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_spawn_error_quark"
		}"
		end

end
