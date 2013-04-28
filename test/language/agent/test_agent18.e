-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT18

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make is
      local
         f: FUNCTION[TUPLE[INTEGER, REAL], REAL]; d: REAL
      do
         f := agent multiply
         f.call([{INTEGER_32 3}, 1.5])
         --assert(f.last_result = 6) -- *** NOT YET IMPLEMENTED
         d := f.item([{INTEGER_32 3}, 2.0])
         assert(d = 6)
         assert(6 - f.item([{INTEGER_32 3}, 2.0]) = 0)
         --as argument (needed for io.put_double(f.item([3, 2]))
      end

   multiply (i: INTEGER; d: REAL): REAL is
      do
         Result := d * i
      end

end -- class TEST_AGENT18
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
