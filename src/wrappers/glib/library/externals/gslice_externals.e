-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GSLICE_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_slice_free_chain_with_offset (a_block_size: NATURAL_32; a_mem_chain: POINTER; a_next_offset: NATURAL_32) is
 		-- g_slice_free_chain_with_offset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_free_chain_with_offset"
		}"
		end

	g_slice_free1 (a_block_size: NATURAL_32; a_mem_block: POINTER) is
 		-- g_slice_free1
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_free1"
		}"
		end

	g_slice_set_config (a_ckey: INTEGER_32; a_value: INTEGER_64) is
 		-- g_slice_set_config
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_set_config"
		}"
		end

	g_slice_alloc (a_block_size: NATURAL_32): POINTER is
 		-- g_slice_alloc
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_alloc"
		}"
		end

	g_slice_get_config_state (a_ckey: INTEGER_32; an_address: INTEGER_64; a_n_values: POINTER): POINTER is
 		-- g_slice_get_config_state
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_get_config_state"
		}"
		end

	g_slice_alloc0 (a_block_size: NATURAL_32): POINTER is
 		-- g_slice_alloc0
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_alloc0"
		}"
		end

	g_slice_get_config (a_ckey: INTEGER_32): INTEGER_64 is
 		-- g_slice_get_config
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_get_config"
		}"
		end

	g_slice_copy (a_block_size: NATURAL_32; a_mem_block: POINTER): POINTER is
 		-- g_slice_copy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_slice_copy"
		}"
		end

end
