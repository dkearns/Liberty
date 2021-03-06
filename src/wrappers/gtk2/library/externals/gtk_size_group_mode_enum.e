-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SIZE_GROUP_MODE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_size_group_both_low_level)  or else
				(a_value = gtk_size_group_horizontal_low_level)  or else
				(a_value = gtk_size_group_none_low_level)  or else
				(a_value = gtk_size_group_vertical_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_size_group_both is
		do
			value := gtk_size_group_both_low_level
		end

	set_gtk_size_group_horizontal is
		do
			value := gtk_size_group_horizontal_low_level
		end

	set_gtk_size_group_none is
		do
			value := gtk_size_group_none_low_level
		end

	set_gtk_size_group_vertical is
		do
			value := gtk_size_group_vertical_low_level
		end

feature -- Queries
	is_gtk_size_group_both: BOOLEAN is
		do
			Result := (value=gtk_size_group_both_low_level)
		end

	is_gtk_size_group_horizontal: BOOLEAN is
		do
			Result := (value=gtk_size_group_horizontal_low_level)
		end

	is_gtk_size_group_none: BOOLEAN is
		do
			Result := (value=gtk_size_group_none_low_level)
		end

	is_gtk_size_group_vertical: BOOLEAN is
		do
			Result := (value=gtk_size_group_vertical_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_size_group_both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SIZE_GROUP_BOTH"
 			}"
 		end

	gtk_size_group_horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SIZE_GROUP_HORIZONTAL"
 			}"
 		end

	gtk_size_group_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SIZE_GROUP_NONE"
 			}"
 		end

	gtk_size_group_vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SIZE_GROUP_VERTICAL"
 			}"
 		end


end -- class GTK_SIZE_GROUP_MODE_ENUM
