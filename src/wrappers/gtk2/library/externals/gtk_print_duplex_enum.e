-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_DUPLEX_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_print_duplex_horizontal_low_level)  or else
				(a_value = gtk_print_duplex_simplex_low_level)  or else
				(a_value = gtk_print_duplex_vertical_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_print_duplex_horizontal is
		do
			value := gtk_print_duplex_horizontal_low_level
		end

	set_gtk_print_duplex_simplex is
		do
			value := gtk_print_duplex_simplex_low_level
		end

	set_gtk_print_duplex_vertical is
		do
			value := gtk_print_duplex_vertical_low_level
		end

feature -- Queries
	is_gtk_print_duplex_horizontal: BOOLEAN is
		do
			Result := (value=gtk_print_duplex_horizontal_low_level)
		end

	is_gtk_print_duplex_simplex: BOOLEAN is
		do
			Result := (value=gtk_print_duplex_simplex_low_level)
		end

	is_gtk_print_duplex_vertical: BOOLEAN is
		do
			Result := (value=gtk_print_duplex_vertical_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_print_duplex_horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_HORIZONTAL"
 			}"
 		end

	gtk_print_duplex_simplex_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_SIMPLEX"
 			}"
 		end

	gtk_print_duplex_vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_VERTICAL"
 			}"
 		end


end -- class GTK_PRINT_DUPLEX_ENUM
