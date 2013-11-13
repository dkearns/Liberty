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
class LIBERTY_INTERPRETER_EXTERNAL_USER_TYPE_BUILTINS

insert
   LIBERTY_INTERPRETER_EXTERNAL_BUILTINS_CALLER

create {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   make

feature {LIBERTY_INTERPRETER_EXTERNAL_BUILTIN_CALL}
   call (builtin_call: LIBERTY_INTERPRETER_FEATURE_CALL): LIBERTY_INTERPRETER_OBJECT is
      do
         last_call_failed := True
      end

end -- class LIBERTY_INTERPRETER_EXTERNAL_USER_TYPE_BUILTINS
