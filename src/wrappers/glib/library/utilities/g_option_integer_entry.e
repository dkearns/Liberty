indexing
	description: "."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, Glib developers
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"

class G_OPTION_INTEGER_ENTRY
	-- A boolean GOptionEntry.

inherit 
	G_OPTION_ENTRY redefine make, fill_tagged_out_memory end 

	-- REFERENCE[INTEGER]

creation make

feature
	make (a_long_name: STRING; a_short_name: CHARACTER; a_description: STRING) is
		local t: like argument_type
		do
			Precursor (a_long_name,a_short_name, a_description)
			goptionentry_struct_set_arg(handle, t.g_option_arg_int)
			goptionentry_struct_set_arg_data(handle, $item) 
		end

feature -- Queries
	item: INTEGER

	set_item (a_value: like item) is
		do
			item:=a_value
		end

	fill_tagged_out_memory is
		do
			Precursor
			item.append_in(tagged_out_memory)
		end
end -- class G_OPTION_INTEGER_ENTRY

