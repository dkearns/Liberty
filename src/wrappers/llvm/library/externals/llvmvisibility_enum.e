-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVISIBILITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = default_visibility_low_level)  or else
				(a_value = hidden_visibility_low_level)  or else
				(a_value = protected_visibility_low_level) )
		end

feature -- Setters
	default_create,
	set_default_visibility is
		do
			value := default_visibility_low_level
		end

	set_hidden_visibility is
		do
			value := hidden_visibility_low_level
		end

	set_protected_visibility is
		do
			value := protected_visibility_low_level
		end

feature -- Queries
	default_visibility: BOOLEAN is
		do
			Result := (value=default_visibility_low_level)
		end

	hidden_visibility: BOOLEAN is
		do
			Result := (value=hidden_visibility_low_level)
		end

	protected_visibility: BOOLEAN is
		do
			Result := (value=protected_visibility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	default_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMDefaultVisibility"
 			}"
 		end

	hidden_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMHiddenVisibility"
 			}"
 		end

	protected_visibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LLVMProtectedVisibility"
 			}"
 		end


end -- class LLVMVISIBILITY_ENUM