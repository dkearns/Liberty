-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PROP_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_prop_mode_append_low_level)  or else
				(a_value = gdk_prop_mode_prepend_low_level)  or else
				(a_value = gdk_prop_mode_replace_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_prop_mode_append is
		do
			value := gdk_prop_mode_append_low_level
		end

	set_gdk_prop_mode_prepend is
		do
			value := gdk_prop_mode_prepend_low_level
		end

	set_gdk_prop_mode_replace is
		do
			value := gdk_prop_mode_replace_low_level
		end

feature -- Queries
	is_gdk_prop_mode_append: BOOLEAN is
		do
			Result := (value=gdk_prop_mode_append_low_level)
		end

	is_gdk_prop_mode_prepend: BOOLEAN is
		do
			Result := (value=gdk_prop_mode_prepend_low_level)
		end

	is_gdk_prop_mode_replace: BOOLEAN is
		do
			Result := (value=gdk_prop_mode_replace_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_prop_mode_append_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_APPEND"
 			}"
 		end

	gdk_prop_mode_prepend_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_PREPEND"
 			}"
 		end

	gdk_prop_mode_replace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROP_MODE_REPLACE"
 			}"
 		end


end -- class GDK_PROP_MODE_ENUM
