-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GMOUNT_UNMOUNT_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_mount_unmount_force_low_level)  or else
				(a_value = g_mount_unmount_none_low_level) )
		end

feature -- Setters
	default_create,
	set_g_mount_unmount_force is
		do
			value := g_mount_unmount_force_low_level
		end

	set_g_mount_unmount_none is
		do
			value := g_mount_unmount_none_low_level
		end

feature -- Queries
	is_g_mount_unmount_force: BOOLEAN is
		do
			Result := (value=g_mount_unmount_force_low_level)
		end

	is_g_mount_unmount_none: BOOLEAN is
		do
			Result := (value=g_mount_unmount_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_mount_unmount_force_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_UNMOUNT_FORCE"
 			}"
 		end

	g_mount_unmount_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_MOUNT_UNMOUNT_NONE"
 			}"
 		end


end -- class GMOUNT_UNMOUNT_FLAGS_ENUM
