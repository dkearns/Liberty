-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PARSE_TERMINAL
   --
   -- A terminal meant to be put in a PARSE_TABLE.
   --

inherit
   PARSE_ATOM
      redefine
         out_in_tagged_out_memory
      end

insert
   LOGGING
      redefine
         out_in_tagged_out_memory
      end

creation {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory is
      do
         tagged_out_memory.append(once "TERMINAL")
      end

feature {PARSE_TABLE}
   is_coherent: BOOLEAN is True

   set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, TRAVERSABLE[FIXED_STRING]]]; terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]) is
      do
         if action = Void and then terminal_builder /= Void then
            action := agent call_terminal_builder(terminal_builder, ?)
         end
      end

feature {DESCENDING_PARSER, PARSE_NT_NODE}
   parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): TRISTATE is
      local
         memo: INTEGER; image: PARSER_IMAGE
         parse_action: PARSE_ACTION; error_message: STRING
      do
         memo := buffer.memo
         image := parser.item([buffer]) -- should clear the mark when necessary
         if image /= Void then
            create parse_action.make(agent call_action(image))
            debug ("parse")
               log.trace.put_string(once "%T==>%Tterminal ")
               print_error_position(log.trace, buffer)
               log.trace.put_character(' ')
               log.trace.put_character('"')
               log.trace.put_string(name)
               log.trace.put_string(once "%": ")
               log.trace.put_line(image.out)
               parse_action.set_name(once "Shift %"" + name + once "%": " + image.out)
            end
            actions.add_last(parse_action)
            Result := yes
         else
            if buffer.marked then
               -- The buffer end was reached while reading the image, a good sign that maybe the text could
               -- have continued (note that the mark is cleared by the keyword `parser' when judicious)
               Result := maybe
            else
               Result := no
            end
            error_message := "*** %""
            error_message.append(name)
            error_message.append(once "%" expected")
            buffer.set_last_error_message(error_message)
            debug ("parse")
               log.trace.put_string(once "** Expected terminal %"")
               log.trace.put_string(name)
               log.trace.put_string(once "%" ")
               print_error_position(log.trace, buffer)
               log.trace.put_new_line
            end
            buffer.restore(memo)
         end
      end

feature {}
   make (a_parser: like parser; a_action: like action) is
         -- `a_parser' is used to parse the input buffer; it must return Void if the terminal cannot be
         -- parsed, or a STRING containing the corresponding image that will be passed to the `action' if the
         -- terminal is reduced.
      require
         a_parser /= Void
      do
         parser := a_parser
         action := a_action
      ensure
         parser = a_parser
         action = a_action
      end

   parser: FUNCTION[TUPLE[MINI_PARSER_BUFFER], PARSER_IMAGE]

   action: PROCEDURE[TUPLE[PARSER_IMAGE]]

   call_action (image: PARSER_IMAGE) is
      require
         action /= Void
         image /= Void
      do
         action.call([image])
      end

   call_terminal_builder (terminal_builder: PROCEDURE[TUPLE[FIXED_STRING, PARSER_IMAGE]]; image: PARSER_IMAGE) is
      do
         terminal_builder.call([name, image])
      end

invariant
   parser /= Void

end -- class PARSE_TERMINAL
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