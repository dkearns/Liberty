-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ENTRY_COMPLETION_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_entry_completion_class_struct_set_match_selected (a_structure: POINTER; a_value: POINTER) is
			-- Setter for match_selected field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_set_match_selected"
		}"
		end

	gtk_entry_completion_class_struct_set_action_activated (a_structure: POINTER; a_value: POINTER) is
			-- Setter for action_activated field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_set_action_activated"
		}"
		end

	gtk_entry_completion_class_struct_set_insert_prefix (a_structure: POINTER; a_value: POINTER) is
			-- Setter for insert_prefix field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_set_insert_prefix"
		}"
		end

	gtk_entry_completion_class_struct_set_cursor_on_match (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cursor_on_match field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_set_cursor_on_match"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_entry_completion_class_struct_get_match_selected (a_structure: POINTER): POINTER is
			-- Query for match_selected field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_get_match_selected"
		}"
		end

	gtk_entry_completion_class_struct_get_action_activated (a_structure: POINTER): POINTER is
			-- Query for action_activated field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_get_action_activated"
		}"
		end

	gtk_entry_completion_class_struct_get_insert_prefix (a_structure: POINTER): POINTER is
			-- Query for insert_prefix field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_get_insert_prefix"
		}"
		end

	gtk_entry_completion_class_struct_get_cursor_on_match (a_structure: POINTER): POINTER is
			-- Query for cursor_on_match field of GTK_ENTRY_COMPLETION_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_entry_completion_class_struct_get_cursor_on_match"
		}"
		end

	-- Unwrappable field _gtk_reserved0.
	-- Unwrappable field _gtk_reserved1.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkEntryCompletionClass"
		}"
		end

end -- class GTK_ENTRY_COMPLETION_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

