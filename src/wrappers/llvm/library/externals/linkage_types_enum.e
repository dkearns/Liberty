-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class LINKAGE_TYPES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = external_linkage_low_level)  or else
				(a_value = link_once_any_linkage_low_level)  or else
				(a_value = link_once_odrlinkage_low_level)  or else
				(a_value = weak_any_linkage_low_level)  or else
				(a_value = weak_odrlinkage_low_level)  or else
				(a_value = appending_linkage_low_level)  or else
				(a_value = internal_linkage_low_level)  or else
				(a_value = private_linkage_low_level)  or else
				(a_value = linker_private_linkage_low_level)  or else
				(a_value = dllimport_linkage_low_level)  or else
				(a_value = dllexport_linkage_low_level)  or else
				(a_value = external_weak_linkage_low_level)  or else
				(a_value = ghost_linkage_low_level)  or else
				(a_value = common_linkage_low_level) )
		end

feature -- Setters
	default_create,
	set_external_linkage is
		do
			value := external_linkage_low_level
		end

	set_link_once_any_linkage is
		do
			value := link_once_any_linkage_low_level
		end

	set_link_once_odrlinkage is
		do
			value := link_once_odrlinkage_low_level
		end

	set_weak_any_linkage is
		do
			value := weak_any_linkage_low_level
		end

	set_weak_odrlinkage is
		do
			value := weak_odrlinkage_low_level
		end

	set_appending_linkage is
		do
			value := appending_linkage_low_level
		end

	set_internal_linkage is
		do
			value := internal_linkage_low_level
		end

	set_private_linkage is
		do
			value := private_linkage_low_level
		end

	set_linker_private_linkage is
		do
			value := linker_private_linkage_low_level
		end

	set_dllimport_linkage is
		do
			value := dllimport_linkage_low_level
		end

	set_dllexport_linkage is
		do
			value := dllexport_linkage_low_level
		end

	set_external_weak_linkage is
		do
			value := external_weak_linkage_low_level
		end

	set_ghost_linkage is
		do
			value := ghost_linkage_low_level
		end

	set_common_linkage is
		do
			value := common_linkage_low_level
		end

feature -- Queries
	is_external_linkage: BOOLEAN is
		do
			Result := (value=external_linkage_low_level)
		end

	is_link_once_any_linkage: BOOLEAN is
		do
			Result := (value=link_once_any_linkage_low_level)
		end

	is_link_once_odrlinkage: BOOLEAN is
		do
			Result := (value=link_once_odrlinkage_low_level)
		end

	is_weak_any_linkage: BOOLEAN is
		do
			Result := (value=weak_any_linkage_low_level)
		end

	is_weak_odrlinkage: BOOLEAN is
		do
			Result := (value=weak_odrlinkage_low_level)
		end

	is_appending_linkage: BOOLEAN is
		do
			Result := (value=appending_linkage_low_level)
		end

	is_internal_linkage: BOOLEAN is
		do
			Result := (value=internal_linkage_low_level)
		end

	is_private_linkage: BOOLEAN is
		do
			Result := (value=private_linkage_low_level)
		end

	is_linker_private_linkage: BOOLEAN is
		do
			Result := (value=linker_private_linkage_low_level)
		end

	is_dllimport_linkage: BOOLEAN is
		do
			Result := (value=dllimport_linkage_low_level)
		end

	is_dllexport_linkage: BOOLEAN is
		do
			Result := (value=dllexport_linkage_low_level)
		end

	is_external_weak_linkage: BOOLEAN is
		do
			Result := (value=external_weak_linkage_low_level)
		end

	is_ghost_linkage: BOOLEAN is
		do
			Result := (value=ghost_linkage_low_level)
		end

	is_common_linkage: BOOLEAN is
		do
			Result := (value=common_linkage_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	external_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExternalLinkage"
 			}"
 		end

	link_once_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkOnceAnyLinkage"
 			}"
 		end

	link_once_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkOnceODRLinkage"
 			}"
 		end

	weak_any_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "WeakAnyLinkage"
 			}"
 		end

	weak_odrlinkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "WeakODRLinkage"
 			}"
 		end

	appending_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "AppendingLinkage"
 			}"
 		end

	internal_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "InternalLinkage"
 			}"
 		end

	private_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PrivateLinkage"
 			}"
 		end

	linker_private_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "LinkerPrivateLinkage"
 			}"
 		end

	dllimport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DLLImportLinkage"
 			}"
 		end

	dllexport_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "DLLExportLinkage"
 			}"
 		end

	external_weak_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ExternalWeakLinkage"
 			}"
 		end

	ghost_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GhostLinkage"
 			}"
 		end

	common_linkage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "CommonLinkage"
 			}"
 		end


end -- class LINKAGE_TYPES_ENUM
