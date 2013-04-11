-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_PROPERTY_STATE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = new_value_low_level)  or else
				(a_value = delete_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_new_value is
		do
			value := new_value_low_level
		end

	set_delete is
		do
			value := delete_low_level
		end

feature {ANY} -- Queries
	new_value: BOOLEAN is
		do
			Result := (value=new_value_low_level)
		end

	delete: BOOLEAN is
		do
			Result := (value=delete_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	new_value_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_NEW_VALUE"
 			}"
 		end

	delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_DELETE"
 			}"
 		end


end -- class GDK_PROPERTY_STATE_ENUM
