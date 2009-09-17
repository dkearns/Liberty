class PARSE_TERMINAL
	--
	-- A terminal meant to be put in a PARSE_TABLE.
	--

inherit
	PARSE_ATOM

creation {ANY}
	make

feature {PARSE_TABLE}
	is_coherent: BOOLEAN is True

	set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		terminal_builder: PROCEDURE[TUPLE[STRING, PARSER_IMAGE]]) is
		do
			if action = Void and then terminal_builder /= Void then
				action := agent call_terminal_builder(terminal_builder, ?)
			end
		end

feature {DESCENDING_PARSER, PARSE_NT_NODE}
	parse (buffer: MINI_PARSER_BUFFER; actions: COLLECTION[PARSE_ACTION]): BOOLEAN is
		local
			old_index: INTEGER; image: PARSER_IMAGE
			parse_action: PARSE_ACTION; error_message: STRING
		do
			old_index := buffer.current_index
			image := parser.item([buffer])
			if image /= Void then
				create parse_action.make(agent call_action(image))
				debug ("parse")
					std_error.put_string(once "%T==>%Tterminal ")
					print_error_position(std_error, buffer)
					std_error.put_character(' ')
					std_error.put_character('"')
					std_error.put_string(name)
					std_error.put_string(once "%": ")
					std_error.put_line(image.out)
					parse_action.set_name(once "Shift %"" + name + once "%": " + image.out)
				end
				actions.add_last(parse_action)
				Result := True
			else
				error_message := "*** %""
				error_message.append(name)
				error_message.append(once "%" expected")
				buffer.set_last_error_message(error_message)
				debug ("parse")
					std_error.put_string(once "** Expected terminal %"")
					std_error.put_string(name)
					std_error.put_string(once "%" ")
					print_error_position(std_error, buffer)
					std_error.put_new_line
				end
				buffer.set_current_index(old_index)
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

	call_terminal_builder (terminal_builder: PROCEDURE[TUPLE[STRING, PARSER_IMAGE]]; image: PARSER_IMAGE) is
		do
			terminal_builder.call([name, image])
		end

invariant
	parser /= Void

end -- class PARSE_TERMINAL
