-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GIOSTATUS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = again_low_level)  or else
				(a_value = eof_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = normal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_again
               do
                       value := again_low_level
               end

	set_eof
               do
                       value := eof_low_level
               end

	set_error
               do
                       value := error_low_level
               end

	set_normal
               do
                       value := normal_low_level
               end

feature {ANY} -- Queries
       is_again: BOOLEAN
               do
                       Result := (value=again_low_level)
               end

       is_eof: BOOLEAN
               do
                       Result := (value=eof_low_level)
               end

       is_error: BOOLEAN
               do
                       Result := (value=error_low_level)
               end

       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     again_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_STATUS_AGAIN"
                       }"
               end

     eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_STATUS_EOF"
                       }"
               end

     error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_STATUS_ERROR"
                       }"
               end

     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_IO_STATUS_NORMAL"
                       }"
               end


end -- class GIOSTATUS_ENUM
