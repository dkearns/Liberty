-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PAGE_ORIENTATION_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_page_orientation_landscape_low_level)  or else
				(a_value = gtk_page_orientation_portrait_low_level)  or else
				(a_value = gtk_page_orientation_reverse_landscape_low_level)  or else
				(a_value = gtk_page_orientation_reverse_portrait_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_page_orientation_landscape is
		do
			value := gtk_page_orientation_landscape_low_level
		end

	set_gtk_page_orientation_portrait is
		do
			value := gtk_page_orientation_portrait_low_level
		end

	set_gtk_page_orientation_reverse_landscape is
		do
			value := gtk_page_orientation_reverse_landscape_low_level
		end

	set_gtk_page_orientation_reverse_portrait is
		do
			value := gtk_page_orientation_reverse_portrait_low_level
		end

feature -- Queries
	is_gtk_page_orientation_landscape: BOOLEAN is
		do
			Result := (value=gtk_page_orientation_landscape_low_level)
		end

	is_gtk_page_orientation_portrait: BOOLEAN is
		do
			Result := (value=gtk_page_orientation_portrait_low_level)
		end

	is_gtk_page_orientation_reverse_landscape: BOOLEAN is
		do
			Result := (value=gtk_page_orientation_reverse_landscape_low_level)
		end

	is_gtk_page_orientation_reverse_portrait: BOOLEAN is
		do
			Result := (value=gtk_page_orientation_reverse_portrait_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_page_orientation_landscape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_LANDSCAPE"
 			}"
 		end

	gtk_page_orientation_portrait_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_PORTRAIT"
 			}"
 		end

	gtk_page_orientation_reverse_landscape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE"
 			}"
 		end

	gtk_page_orientation_reverse_portrait_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT"
 			}"
 		end


end -- class GTK_PAGE_ORIENTATION_ENUM
