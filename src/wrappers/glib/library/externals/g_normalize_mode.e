-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_NORMALIZE_MODE

		--  Defines how a Unicode string is transformed in a canonical form,
		-- standardizing such issues as whether a character with an accent is represented as a
		-- base character and combining accent or as a single precomposed character.
		-- Unicode strings should generally be normalized before comparing them.
insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_normalize_default) or else 
				(a_value = g_normalize_nfd) or else 
				(a_value = g_normalize_default_compose) or else 
				(a_value = g_normalize_nfc) or else 
				(a_value = g_normalize_all) or else 
				(a_value = g_normalize_nfkd) or else 
				(a_value = g_normalize_all_compose) or else 
				(a_value = g_normalize_nfkc))
		end

feature -- Setters
	default_create,  set_default_external is
	
		do
			value := g_normalize_default
		end

	 set_nfd is
	
		do
			value := g_normalize_nfd
		end

	 set_default_compose is
	
		do
			value := g_normalize_default_compose
		end

	 set_nfc is
	
		do
			value := g_normalize_nfc
		end

	 set_all is
	
		do
			value := g_normalize_all
		end

	 set_nfkd is
	
		do
			value := g_normalize_nfkd
		end

	 set_all_compose is
	
		do
			value := g_normalize_all_compose
		end

	 set_nfkc is
	
		do
			value := g_normalize_nfkc
		end

feature -- Queries
	is_default_external: BOOLEAN is
		
		do
			Result := (value=g_normalize_default)
		end

	is_nfd: BOOLEAN is
		
		do
			Result := (value=g_normalize_nfd)
		end

	is_default_compose: BOOLEAN is
		
		do
			Result := (value=g_normalize_default_compose)
		end

	is_nfc: BOOLEAN is
		
		do
			Result := (value=g_normalize_nfc)
		end

	is_all: BOOLEAN is
		
		do
			Result := (value=g_normalize_all)
		end

	is_nfkd: BOOLEAN is
		
		do
			Result := (value=g_normalize_nfkd)
		end

	is_all_compose: BOOLEAN is
		
		do
			Result := (value=g_normalize_all_compose)
		end

	is_nfkc: BOOLEAN is
		
		do
			Result := (value=g_normalize_nfkc)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_normalize_default: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_DEFAULT"
 			}"
 		end

	g_normalize_nfd: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_NFD"
 			}"
 		end

	g_normalize_default_compose: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_DEFAULT_COMPOSE"
 			}"
 		end

	g_normalize_nfc: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_NFC"
 			}"
 		end

	g_normalize_all: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_ALL"
 			}"
 		end

	g_normalize_nfkd: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_NFKD"
 			}"
 		end

	g_normalize_all_compose: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_ALL_COMPOSE"
 			}"
 		end

	g_normalize_nfkc: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_NORMALIZE_NFKC"
 			}"
 		end

end

