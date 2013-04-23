-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_CALL_ASSIGNER
   --
   -- For instruction like :
   --                          foo.item := bar
   --                          foo.item := bar + 1
   --
   --

inherit
   INSTRUCTION

create {ANY}
   make

feature {ANY}
   left_side: PROCEDURE_CALL

   right_side: EXPRESSION

   end_mark_comment: BOOLEAN is False

   side_effect_free (type: TYPE): BOOLEAN is
      do
         check False end
      end

   simplify (type: TYPE): INSTRUCTION is
      do
         check False end
      end

   use_current (type: TYPE): BOOLEAN is
      do
         Result := left_side.use_current(type) or else right_side.use_current(type)
      end

   start_position: POSITION is
      do
         Result := left_side.start_position
      end

   specialize_in (type: TYPE): like Current is
      local
         l: PROCEDURE_CALL; r: EXPRESSION
      do
         l := left_side.specialize_in(type)
         r := right_side.specialize_in(type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      local
         l: PROCEDURE_CALL; r: EXPRESSION
      do
         l := left_side.specialize_thru(parent_type, parent_edge, new_type)
         r := right_side.specialize_thru(parent_type, parent_edge, new_type)
         if r = right_side and then l = left_side then
            Result := Current
         else
            create Result.make(l, r)
         end
      end

   specialize_2 (type: TYPE): INSTRUCTION is
      local
         l: PROCEDURE_CALL; r: EXPRESSION
         target_type: TYPE; fn: FEATURE_NAME
         fs_assigned: FEATURE_STAMP; af_assigned, af_assigner: ANONYMOUS_FEATURE
         pc_arguments, arguments: EFFECTIVE_ARG_LIST
         args: FAST_ARRAY[EXPRESSION]; i: INTEGER
         collected_actual_call: PROCEDURE_CALL
      do
         l ::= left_side.specialize_2(type)
         r := right_side.specialize_2(type)
         target_type := l.target.resolve_in(type)
         fs_assigned := l.feature_stamp
         check
            fs_assigned.has_anonymous_feature_for(target_type)
         end
         af_assigned := fs_assigned.anonymous_feature(target_type)
         af_assigner := af_assigned.assigner
         if af_assigner = Void then
            not_yet_implemented --| **** should never happen?
         end
         fn := af_assigner.names.first

         echo.put_string(once "Replacing assign to {")
         echo.put_string(target_type.canonical_type_mark.written_mark)
         echo.put_string(once "}.")
         echo.put_string(l.feature_name.to_string)
         echo.put_string(once " by a call to {")
         echo.put_string(target_type.canonical_type_mark.written_mark)
         echo.put_string(once "}.")
         echo.put_line(fn.to_string)

         pc_arguments := l.arguments
         if pc_arguments = Void then
            create arguments.make_1(r)
            create {PROCEDURE_CALL_1} collected_actual_call.make(l.target, fn, arguments)
         else
            create args.with_capacity(pc_arguments.count)
            from
               i := 1
            until
               i > pc_arguments.count
            loop
               args.add_last(pc_arguments.expression(i))
               i := i + 1
            end
            create arguments.make_n(r, args)
            create {PROCEDURE_CALL_N} collected_actual_call.make(l.target, fn, arguments)
         end

         Result := collected_actual_call.specialize_2(type)
         smart_eiffel.magic_count_increment
      end

   has_been_specialized: BOOLEAN is
      do
         Result := left_side.has_been_specialized and then right_side.has_been_specialized
      end

   safety_check (type: TYPE) is
      do
         check False end
      end

   pretty (indent_level: INTEGER) is
      do
         not_yet_implemented
      end

   accept (visitor: ASSIGNMENT_CALL_ASSIGNER_VISITOR) is
      do
         visitor.visit_assignment_call_assigner(Current)
      end

   collect (t: TYPE): TYPE is
      do
         check False end
      end

   adapt_for (t: TYPE): INSTRUCTION is
      do
         check False end
      end

feature {}
   make (ls: like left_side; rs: like right_side) is
         -- Note: this creation procedure is for example called by the `eiffel_parser' which is in charge
         -- of checking that `ls' is actually a writable entity.
      require
         not ls.start_position.is_unknown
         rs /= Void
      do
         left_side := ls
         right_side := rs
      ensure
         left_side = ls
         right_side = rs
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
      end

invariant
   left_side /= Void
   right_side /= Void

end -- class ASSIGNMENT_CALL_ASSIGNER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
