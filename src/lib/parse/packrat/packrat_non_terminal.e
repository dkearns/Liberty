-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_NON_TERMINAL
   --
   -- A non-terminal meant to be put in a PARSE_TABLE.
   --

inherit
   PARSE_NON_TERMINAL[PACKRAT_PARSE_CONTEXT]

insert
   PACKRAT_INTERNAL
      redefine
         copy, is_equal, out_in_tagged_out_memory
      end

creation {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory is
      do
         tagged_out_memory.extend('{')
         pattern.out_in_tagged_out_memory
         tagged_out_memory.extend('}')
      end

   is_coherent: BOOLEAN is
      do
         Result := pattern.is_coherent
      end

feature {PARSER_FACET}
   parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE is
      do
         not_yet_implemented
      end

feature {PARSE_TABLE}
   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      do
         pattern.set_default_tree_builders(non_terminal_builder, terminal_builder)
      end

feature {ANY}
   copy (other: like Current) is
      do
         name := other.name
         pattern := other.pattern.twin
         pattern.set_nt(Current)
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := name.is_equal(other.name) and then pattern.is_equal(other.pattern)
      end

feature {}
   make (a_pattern: like pattern) is
      require
         a_pattern /= Void
         a_pattern.nt = Void
      do
         a_pattern.set_nt(Current)
         pattern := a_pattern
      ensure
         pattern = a_pattern
      end

feature {PACKRAT_NON_TERMINAL}
   pattern: PACKRAT_PATTERN

invariant
   pattern.nt = Current

end -- class PACKRAT_NON_TERMINAL
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
