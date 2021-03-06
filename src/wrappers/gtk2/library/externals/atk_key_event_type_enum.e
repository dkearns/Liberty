-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_KEY_EVENT_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_key_event_last_defined_low_level)  or else
				(a_value = atk_key_event_press_low_level)  or else
				(a_value = atk_key_event_release_low_level) )
		end

feature -- Setters
	default_create,
	set_atk_key_event_last_defined is
		do
			value := atk_key_event_last_defined_low_level
		end

	set_atk_key_event_press is
		do
			value := atk_key_event_press_low_level
		end

	set_atk_key_event_release is
		do
			value := atk_key_event_release_low_level
		end

feature -- Queries
	is_atk_key_event_last_defined: BOOLEAN is
		do
			Result := (value=atk_key_event_last_defined_low_level)
		end

	is_atk_key_event_press: BOOLEAN is
		do
			Result := (value=atk_key_event_press_low_level)
		end

	is_atk_key_event_release: BOOLEAN is
		do
			Result := (value=atk_key_event_release_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_key_event_last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_LAST_DEFINED"
 			}"
 		end

	atk_key_event_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_PRESS"
 			}"
 		end

	atk_key_event_release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_RELEASE"
 			}"
 		end


end -- class ATK_KEY_EVENT_TYPE_ENUM
