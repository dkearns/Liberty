-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_VARIANT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_variant_normal_low_level)  or else
				(a_value = pango_variant_small_caps_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_variant_normal is
		do
			value := pango_variant_normal_low_level
		end

	set_pango_variant_small_caps is
		do
			value := pango_variant_small_caps_low_level
		end

feature -- Queries
	is_pango_variant_normal: BOOLEAN is
		do
			Result := (value=pango_variant_normal_low_level)
		end

	is_pango_variant_small_caps: BOOLEAN is
		do
			Result := (value=pango_variant_small_caps_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_variant_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_VARIANT_NORMAL"
 			}"
 		end

	pango_variant_small_caps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_VARIANT_SMALL_CAPS"
 			}"
 		end


end -- class PANGO_VARIANT_ENUM
