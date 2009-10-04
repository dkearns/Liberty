-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LLVMVISIBILITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = defaultvisibility_low_level)  or else
				(a_value = protectedvisibility_low_level) )
		end

feature -- Setters
	default_create,
	set_defaultvisibility is
		do
			value := defaultvisibility_low_level
		end

	set_protectedvisibility is
		do
			value := protectedvisibility_low_level
		end

feature -- Queries
	is_defaultvisibility: BOOLEAN is
		do
			Result := (value=defaultvisibility_low_level)
		end

	is_protectedvisibility: BOOLEAN is
		do
			Result := (value=protectedvisibility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	defaultvisibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMDefaultVisibility"
 			}"
 		end

	protectedvisibility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "LLVMProtectedVisibility"
 			}"
 		end


end -- class LLVMVISIBILITY_ENUM