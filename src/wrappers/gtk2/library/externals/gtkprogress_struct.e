-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkprogress_struct_set_adjustment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for adjustment field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_adjustment"
		}"
		end

	gtkprogress_struct_set_offscreen_pixmap (a_structure: POINTER; a_value: POINTER) is
			-- Setter for offscreen_pixmap field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_offscreen_pixmap"
		}"
		end

	gtkprogress_struct_set_format (a_structure: POINTER; a_value: POINTER) is
			-- Setter for format field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_format"
		}"
		end

	gtkprogress_struct_set_x_align (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for x_align field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_x_align"
		}"
		end

	gtkprogress_struct_set_y_align (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for y_align field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_y_align"
		}"
		end

	gtkprogress_struct_set_show_text (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for show_text field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_show_text"
		}"
		end

	gtkprogress_struct_set_activity_mode (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for activity_mode field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_activity_mode"
		}"
		end

	gtkprogress_struct_set_use_text_format (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for use_text_format field of GTKPROGRESS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_set_use_text_format"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtkprogress_struct_get_adjustment (a_structure: POINTER): POINTER is
			-- Query for adjustment field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_adjustment"
		}"
		end

	gtkprogress_struct_get_offscreen_pixmap (a_structure: POINTER): POINTER is
			-- Query for offscreen_pixmap field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_offscreen_pixmap"
		}"
		end

	gtkprogress_struct_get_format (a_structure: POINTER): POINTER is
			-- Query for format field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_format"
		}"
		end

	gtkprogress_struct_get_x_align (a_structure: POINTER): REAL_32 is
			-- Query for x_align field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_x_align"
		}"
		end

	gtkprogress_struct_get_y_align (a_structure: POINTER): REAL_32 is
			-- Query for y_align field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_y_align"
		}"
		end

	gtkprogress_struct_get_show_text (a_structure: POINTER): NATURAL_32 is
			-- Query for show_text field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_show_text"
		}"
		end

	gtkprogress_struct_get_activity_mode (a_structure: POINTER): NATURAL_32 is
			-- Query for activity_mode field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_activity_mode"
		}"
		end

	gtkprogress_struct_get_use_text_format (a_structure: POINTER): NATURAL_32 is
			-- Query for use_text_format field of GTKPROGRESS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkprogress_struct_get_use_text_format"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkProgress"
		}"
		end

end -- class GTKPROGRESS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

