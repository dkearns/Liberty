-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GSL_VECTOR_LONG_DOUBLE_VIEW_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GSL_TYPES
feature {} -- Low-level setters

feature {} -- Low-level queries

	-- Unwrappable field vector.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__gsl_vector_long_double_view"
		}"
		end

end -- class GSL_VECTOR_LONG_DOUBLE_VIEW_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

