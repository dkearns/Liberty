-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CHECK_MENU_ITEM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_check_menu_item_struct_set_active (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for active field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_set_active"
		}"
		end

	gtk_check_menu_item_struct_set_always_show_toggle (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for always_show_toggle field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_set_always_show_toggle"
		}"
		end

	gtk_check_menu_item_struct_set_inconsistent (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for inconsistent field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_set_inconsistent"
		}"
		end

	gtk_check_menu_item_struct_set_draw_as_radio (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for draw_as_radio field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_set_draw_as_radio"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field menu_item.
	gtk_check_menu_item_struct_get_active (a_structure: POINTER): NATURAL is
			-- Query for active field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_get_active"
		}"
		end

	gtk_check_menu_item_struct_get_always_show_toggle (a_structure: POINTER): NATURAL is
			-- Query for always_show_toggle field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_get_always_show_toggle"
		}"
		end

	gtk_check_menu_item_struct_get_inconsistent (a_structure: POINTER): NATURAL is
			-- Query for inconsistent field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_get_inconsistent"
		}"
		end

	gtk_check_menu_item_struct_get_draw_as_radio (a_structure: POINTER): NATURAL is
			-- Query for draw_as_radio field of GTK_CHECK_MENU_ITEM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_check_menu_item_struct_get_draw_as_radio"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCheckMenuItem"
		}"
		end

end -- class GTK_CHECK_MENU_ITEM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

