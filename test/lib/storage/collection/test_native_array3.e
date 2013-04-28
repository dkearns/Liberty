-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY3

create {}
   make

feature {ANY}
   make is
      local
         a: NATIVE_ARRAY[BOOLEAN]
      do
         a := a.calloc(2)
         a.put(True, 0)
         a.put(False, 1)
         assert(a.item(0))
         assert(not a.item(1))
      end

   assert (b: BOOLEAN) is
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_NATIVE_ARRAY3: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_NATIVE_ARRAY3
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
