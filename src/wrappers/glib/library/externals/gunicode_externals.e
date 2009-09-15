-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GUNICODE_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_utf8_strup (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strup
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strup"
		}"
		end

	g_utf8_strncpy (a_dest: POINTER; a_src: POINTER; a_n: NATURAL_32): POINTER is
 		-- g_utf8_strncpy
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strncpy"
		}"
		end

	g_unichar_islower (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_islower
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_islower"
		}"
		end

	g_unichar_tolower (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_tolower
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_tolower"
		}"
		end

	g_unichar_isxdigit (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isxdigit
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isxdigit"
		}"
		end

	g_unichar_isdigit (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isdigit
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isdigit"
		}"
		end

	g_unichar_isdefined (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isdefined
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isdefined"
		}"
		end

	g_utf8_collate_key_for_filename (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_collate_key_for_filename
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_collate_key_for_filename"
		}"
		end

	g_utf16_to_ucs4 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf16_to_ucs4
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf16_to_ucs4"
		}"
		end

	g_unichar_xdigit_value (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_xdigit_value
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_xdigit_value"
		}"
		end

	g_unicode_canonical_decomposition (a_ch: NATURAL_32; a_result_len: POINTER): POINTER is
 		-- g_unicode_canonical_decomposition
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unicode_canonical_decomposition"
		}"
		end

	g_unichar_iswide_cjk (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iswide_cjk
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_iswide_cjk"
		}"
		end

	g_unichar_combining_class (an_uc: NATURAL_32): INTEGER_32 is
 		-- g_unichar_combining_class
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_combining_class"
		}"
		end

	g_utf8_find_prev_char (a_str: POINTER; a_p: POINTER): POINTER is
 		-- g_utf8_find_prev_char
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_find_prev_char"
		}"
		end

	g_utf8_find_next_char (a_p: POINTER; an_end_external: POINTER): POINTER is
 		-- g_utf8_find_next_char
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_find_next_char"
		}"
		end

	g_utf8_prev_char (a_p: POINTER): POINTER is
 		-- g_utf8_prev_char
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_prev_char"
		}"
		end

	g_unichar_validate (a_ch: NATURAL_32): INTEGER_32 is
 		-- g_unichar_validate
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_validate"
		}"
		end

	g_utf8_collate_key (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_collate_key
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_collate_key"
		}"
		end

	g_unichar_isalnum (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isalnum
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isalnum"
		}"
		end

	g_utf8_strrchr (a_p: POINTER; a_len: INTEGER_32; a_c: NATURAL_32): POINTER is
 		-- g_utf8_strrchr
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strrchr"
		}"
		end

	g_get_charset (a_charset: POINTER): INTEGER_32 is
 		-- g_get_charset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_get_charset"
		}"
		end

	g_unichar_type (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_type
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_type"
		}"
		end

	g_utf8_get_char (a_p: POINTER): NATURAL_32 is
 		-- g_utf8_get_char
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_get_char"
		}"
		end

	g_unichar_ispunct (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_ispunct
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_ispunct"
		}"
		end

	g_unicode_canonical_ordering (a_string: POINTER; a_len: NATURAL_32) is
 		-- g_unicode_canonical_ordering
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unicode_canonical_ordering"
		}"
		end

	g_unichar_break_type (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_break_type
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_break_type"
		}"
		end

	g_ucs4_to_utf8 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_ucs4_to_utf8
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ucs4_to_utf8"
		}"
		end

	g_utf8_strchr (a_p: POINTER; a_len: INTEGER_32; a_c: NATURAL_32): POINTER is
 		-- g_utf8_strchr
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strchr"
		}"
		end

	g_unichar_iswide (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iswide
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_iswide"
		}"
		end

	g_unichar_isgraph (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isgraph
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isgraph"
		}"
		end

	g_utf8_to_utf16 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf8_to_utf16
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_to_utf16"
		}"
		end

	g_utf8_get_char_validated (a_p: POINTER; a_max_len: INTEGER_32): NATURAL_32 is
 		-- g_utf8_get_char_validated
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_get_char_validated"
		}"
		end

	g_unichar_totitle (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_totitle
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_totitle"
		}"
		end

	g_unichar_iscntrl (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iscntrl
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_iscntrl"
		}"
		end

	g_unichar_istitle (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_istitle
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_istitle"
		}"
		end

	g_utf8_casefold (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_casefold
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_casefold"
		}"
		end

	g_unichar_isprint (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isprint
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isprint"
		}"
		end

	g_utf8_validate (a_str: POINTER; a_max_len: INTEGER_32; an_end_external: POINTER): INTEGER_32 is
 		-- g_utf8_validate
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_validate"
		}"
		end

	g_unichar_digit_value (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_digit_value
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_digit_value"
		}"
		end

	g_utf8_strdown (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strdown
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strdown"
		}"
		end

	g_utf8_strreverse (a_str: POINTER; a_len: INTEGER_32): POINTER is
 		-- g_utf8_strreverse
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strreverse"
		}"
		end

	g_unichar_get_script (a_ch: NATURAL_32): INTEGER_32 is
 		-- g_unichar_get_script
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_get_script"
		}"
		end

	g_utf8_normalize (a_str: POINTER; a_len: INTEGER_32; a_mode: INTEGER_32): POINTER is
 		-- g_utf8_normalize
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_normalize"
		}"
		end

	g_unichar_ismark (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_ismark
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_ismark"
		}"
		end

	g_utf8_pointer_to_offset (a_str: POINTER; a_pos: POINTER): INTEGER_32 is
 		-- g_utf8_pointer_to_offset
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_pointer_to_offset"
		}"
		end

	g_unichar_isupper (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isupper
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isupper"
		}"
		end

	g_unichar_toupper (a_c: NATURAL_32): NATURAL_32 is
 		-- g_unichar_toupper
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_toupper"
		}"
		end

	g_utf16_to_utf8 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf16_to_utf8
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf16_to_utf8"
		}"
		end

	g_unichar_isspace (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isspace
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isspace"
		}"
		end

	g_unichar_get_mirror_char (a_ch: NATURAL_32; a_mirrored_ch: POINTER): INTEGER_32 is
 		-- g_unichar_get_mirror_char
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_get_mirror_char"
		}"
		end

	g_unichar_isalpha (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_isalpha
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_isalpha"
		}"
		end

	g_utf8_collate (a_str1: POINTER; a_str2: POINTER): INTEGER_32 is
 		-- g_utf8_collate
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_collate"
		}"
		end

	g_unichar_to_utf8 (a_c: NATURAL_32; an_outbuf: POINTER): INTEGER_32 is
 		-- g_unichar_to_utf8
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_to_utf8"
		}"
		end

	g_utf8_to_ucs4 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_utf8_to_ucs4
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_to_ucs4"
		}"
		end

	g_unichar_iszerowidth (a_c: NATURAL_32): INTEGER_32 is
 		-- g_unichar_iszerowidth
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_unichar_iszerowidth"
		}"
		end

	g_ucs4_to_utf16 (a_str: POINTER; a_len: INTEGER_32; an_items_read: POINTER; an_items_written: POINTER; an_error: POINTER): POINTER is
 		-- g_ucs4_to_utf16
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ucs4_to_utf16"
		}"
		end

	g_utf8_strlen (a_p: POINTER; a_max: INTEGER_32): INTEGER_32 is
 		-- g_utf8_strlen
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_strlen"
		}"
		end

	g_utf8_to_ucs4_fast (a_str: POINTER; a_len: INTEGER_32; an_items_written: POINTER): POINTER is
 		-- g_utf8_to_ucs4_fast
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_to_ucs4_fast"
		}"
		end

	g_utf8_offset_to_pointer (a_str: POINTER; an_offset: INTEGER_32): POINTER is
 		-- g_utf8_offset_to_pointer
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_utf8_offset_to_pointer"
		}"
		end

end
