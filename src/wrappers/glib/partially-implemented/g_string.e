note
	copyright: "(C) 2005,2010 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"

class G_STRING
	-- Automatically resized string provided by Glib.

	-- Currently it uses the implementation provided by ABSTRACT_STRING
	-- whenever possible. TODO: use underlying GLib's implementations when it
	-- may improve performances

	-- Note: this class is seldom used in other libraries.
inherit
	ABSTRACT_STRING

	C_STRUCT 
		undefine 
			is_equal,
			out_in_tagged_out_memory,
			print_on
		redefine
			copy,
			is_equal
		end 
	
	EIFFEL_OWNED
		undefine 
			is_equal,
			out_in_tagged_out_memory,
			print_on
		redefine
			copy,
			dispose,
			is_equal
		end 

insert
	GSTRING_EXTERNALS
		undefine 
			is_equal, 
			out_in_tagged_out_memory,
			print_on
		redefine is_equal
		end 

	GSTRING_STRUCT 
		undefine 
			is_equal,
			out_in_tagged_out_memory,
			print_on
		redefine is_equal
		end

	GLIB_STRING_UTILITY_FUNCTIONS 
		undefine 
			is_equal,
			out_in_tagged_out_memory,
			print_on
		redefine is_equal
		end


create {ANY}
	make, copy, make_empty, from_string
	
feature {ANY}
	count: INTEGER is
		do
			Result := gstring_struct_get_len(handle)
		end
		
	capacity: INTEGER is
		do
			Result := gstring_struct_get_allocated_len(handle)
		end
		
feature {ANY} -- Creation / Modification:
	make (needed_capacity: INTEGER) is
			-- Initialize the string to have at least `needed_capacity'
			-- characters of storage.
		do
			handle := g_string_sized_new (needed_capacity)
		ensure
			capacity >= needed_capacity
		end

	make_empty is
		-- Create an empty string.
	do
		make(0)
	ensure
		empty: count = 0
	end

	from_string (a_string: ABSTRACT_STRING) is
			-- Create a new G_STRING from `a_string'
		require a_string_not_void: a_string/=Void
		do
			handle := g_string_new (a_string.to_external)
		end
	
feature {ANY} 
	item (i: INTEGER): CHARACTER is
			-- Character at position `i'.
		require
			valid_index: i.in_range (lower, upper)
		do
			Result := array.item(i)
		end

	hash_code: INTEGER is
		do
			Result := g_string_hash(handle).hash_code
		end

	is_equal (other: ABSTRACT_STRING): BOOLEAN is
			-- Do both strings have the same character sequence?
			--
			-- See also `same_as'.
		local os: G_STRING; ci,oi: ITERATOR[CHARACTER]
		do
			os ?= other
			if os/=Void then
				Result := g_string_equal(handle, other.handle).to_boolean
			else -- different types
				Result:= count=other.count 
				from
					ci:=new_iterator; ci.start
					oi:=other.new_iterator; oi.start
				until not Result or else ci.is_off
				loop
					Result := (ci.item = oi.item)
					ci.next; oi.next
				end
				check ci.is_off implies oi.is_off end
			end
		end

	index_of (c: CHARACTER; start_index: INTEGER): INTEGER is
		local i: INTEGER; found: BOOLEAN
		do
			from i:=start_index until not found or else i<=upper
			loop
				if item(i)=c then found := True; Result :=i
				else i:=i+1
				end
			end
		end

	-- has_suffix (s: ABSTRACT_STRING): BOOLEAN is
	-- 		-- True if suffix of `Current' is `s'.
	-- 	do
	-- 		if {NATIVELY_STORED_STRING} ?:= s then 
	-- 			Result:=(g_str_has_suffix(handle, s.to_external)).to_boolean
	-- 		else 
	-- 			Result := Precursor(s)
	-- 		end
	-- 	end

	-- has_prefix (p: ABSTRACT_STRING): BOOLEAN is
	-- 		-- True if prefix of `Current' is `p'.
	-- 	do
	-- 		if {NATIVELY_STORED_STRING} ?:= s then 
	-- 			Result:=(g_str_has_prefix(handle, s.to_external)).to_boolean
	-- 		else 
	-- 			Result := Precursor(s)
	-- 		end
	-- 	end

feature {ANY} -- Modification:
	resize (new_count: NATURAL_32) is 
local
		do
			if new_count < count then g_string_truncate (handle, new_count)
			else handle := g_string_set_size (handle, new_count)
			end
		end

	clear is
		do
			handle := g_string_set_size (handle, 0.to_natural_32)
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
		do
			handle := g_string_new_len (gstring_struct_get_str(other.handle), gstring_struct_get_len(other.handle))
		end

	fill_with (c: CHARACTER) is
		local i:INTEGER
		do
			from i:=lower until i<upper loop put(c,i); i:=i+1 end
		end

	append (s: STRING) is
		do
			handle := g_string_append (handle, s.to_external)
		end

	prepend (other: STRING) is
		do
			handle:=g_string_prepend(handle, other.to_external)
		end

	put (c: CHARACTER; i: INTEGER) is
			-- Put `c' at index `i' (start counting with 1).
		require valid_index: i.in_range (1, count)
		do
			array.put(c, i-1)
		end
   
   add_last (c: CHARACTER) is
         -- append `c'
		local
         oc: INTEGER
		do
         oc := count
         resize ((count + 1).to_natural_32)
		 array.put(c, oc)         
      ensure
         increased: count = old count + 1
         value_set: item (count) = c
      end
   
feature {ANY} -- Conversion to STRING
	to_string: STRING is
			-- A string holding a copy of Current
		do
			create Result.from_external_copy (c_string)
		end

	as_string: FIXED_STRING is
			-- A string holding the very same content of Current
			-- (i.e. using the same memory area.)
		do
			create Result.from_external (c_string)
		end
	
feature {G_STRING}
	c_string: POINTER is
		-- Shortcut for gstring_struct_get_str(handle)
	do
		Result := gstring_struct_get_str(handle)
	end

	array: NATIVE_ARRAY[CHARACTER] is
		-- Direct access to content
	do
		Result := Result.from_pointer(c_string)
	end

feature {}
	dispose is
		local p: POINTER
		do
			p:=g_string_free(handle,1)
			handle := default_pointer -- make sure the C object is not used anymore
		end

end
	
