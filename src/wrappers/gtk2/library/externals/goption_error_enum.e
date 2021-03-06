-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_option_error_bad_value_low_level)  or else
				(a_value = g_option_error_failed_low_level)  or else
				(a_value = g_option_error_unknown_option_low_level) )
		end

feature -- Setters
	default_create,
	set_g_option_error_bad_value is
		do
			value := g_option_error_bad_value_low_level
		end

	set_g_option_error_failed is
		do
			value := g_option_error_failed_low_level
		end

	set_g_option_error_unknown_option is
		do
			value := g_option_error_unknown_option_low_level
		end

feature -- Queries
	is_g_option_error_bad_value: BOOLEAN is
		do
			Result := (value=g_option_error_bad_value_low_level)
		end

	is_g_option_error_failed: BOOLEAN is
		do
			Result := (value=g_option_error_failed_low_level)
		end

	is_g_option_error_unknown_option: BOOLEAN is
		do
			Result := (value=g_option_error_unknown_option_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_error_bad_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ERROR_BAD_VALUE"
 			}"
 		end

	g_option_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ERROR_FAILED"
 			}"
 		end

	g_option_error_unknown_option_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ERROR_UNKNOWN_OPTION"
 			}"
 		end


end -- class GOPTION_ERROR_ENUM
