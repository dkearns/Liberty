-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_AST_CLASS_MARKER

inherit
   LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
   make

feature {}
   first_keyword: FIXED_STRING
      local
         keyword: EIFFEL_TERMINAL_NODE
      do
         keyword ::= nodes.first
         Result := keyword.name
      end

feature {LIBERTY_AST_HANDLER}
   is_deferred: BOOLEAN
      do
         Result := count = 2 and then first_keyword.is_equal(once "KW deferred")
      end

   is_expanded: BOOLEAN
      do
         Result := count = 2 and then first_keyword.is_equal(once "KW expanded")
      end

   is_separate: BOOLEAN
      do
         Result := count = 2 and then first_keyword.is_equal(once "KW separate")
      end

feature {ANY}
   count: INTEGER
      do
         Result := nodes.count
      end

   name: STRING "Class_Marker"

feature {}
   possible_counts: SET[INTEGER]
      once
         Result := {AVL_SET[INTEGER] << 1, 2 >> }
      end

end
