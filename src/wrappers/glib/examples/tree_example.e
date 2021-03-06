note
	
	copyright: "(C) 2007 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"

class TREE_EXAMPLE

create {ANY} make

feature {ANY}
	tree: G_TREE[G_DATE, G_STRING]
	first: G_STRING
feature {ANY}
	make is
		do
			setup
			test
		end

	setup is
		do
			create tree.make(agent compare)

			tree.insert_value (create {G_DATE}.make_dmy(1,1,1970),
									 create {G_STRING}.from_string("Epoch"))
			tree.insert_value (create {G_DATE}.make_dmy(10,3,1984),
									 create {G_STRING}.from_string("Gnu birthday"))
			tree.insert_value (create {G_DATE}.make_dmy(17,9,1991),
									 create {G_STRING}.from_string("Linux birthday"))
		end

	test is
		local
			a_date: G_DATE;
			test_dates: FAST_ARRAY[TUPLE[INTEGER_8,INTEGER_8,INTEGER_16]]; i: INTEGER
			event: G_STRING
		do
			test_dates:={FAST_ARRAY[TUPLE[INTEGER_8,INTEGER_8,INTEGER_16]]
			<< [17,9,1991],
				[10,7,1976],
				[10,3,1984] >> }
			from i:=test_dates.lower
			until i>test_dates.upper
			loop
				create a_date.from_tuple(test_dates.item(i))
				event:=tree.lookup(a_date)
				if event/=Void
				 then print (a_date.to_string+": "+event.to_string+"%N")
				else print ("No known events on "+a_date.to_string+"%N")
				end
				i:=i+1
			end
			-- from i:=list.get_new_iterator; i.start until i.is_off loop
			-- print (i.item.to_string) print (", ") i.next end print
			-- ("%N")
		end
					 
	compare(a_date,another_date: COMPARABLE_C_STRUCT): INTEGER is
		require 
			date_not_void: a_date/=Void
			another_not_void: another_date/=Void
		do
			Result:=a_date.compare(another_date)
		end
end

-- Copyright (C) 2007,2009 Paolo Redaelli, 2013 Cyril Adrian

-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hopeOA that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
 
