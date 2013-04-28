-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER77

insert
   EIFFELTEST_TOOLS
   NUMBER_TOOLS

create {}
   make

feature {ANY}
   make is
      local
         n1, n2, n3, n4: NUMBER
      do
         n1 := from_string("-4782969/134217728")
         assert(n1 #< 0)
         assert(n1 @< 0)
         n2 := from_string("-4782969/1073741824")
         assert(n2 #< 0)
         assert(n2.is_negative)
         assert(n2 @< 0)
         n3 := n1 + n2
         assert(n3 #< 0)
         assert(n3.is_negative)
         assert(n3 @< 0)
         n4 := from_string("-43046721/1073741824")
         --BUG    n5 := from_string ("-43046722/1073741824")
         assert(n3.is_equal(n4))
         --print (n1.to_string + " + " + n2.to_string + " = " + n3.to_string + "%N")
         --expected : "-4782969/134217728 + -4782969/1073741824 = -43046721/1073741824"
      end



end -- class TEST_NUMBER77
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
