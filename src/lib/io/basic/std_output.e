class STD_OUTPUT
	--
	-- To use the standard output file. As for UNIX, the default standard output is the screen.
	--
	-- Note: only one instance of this class should be necessary.  Access it through ANY.std_output.
	--
	-- See also STANDARD_STREAMS, STD_INPUT_OUTPUT
	--

inherit
	TERMINAL_OUTPUT_STREAM
		redefine
			put_line, dispose
		end

insert
	REDIRECTION_TOOLS
		rename
			restore_default as restore_default_output
		redefine
			restore_default_output
		end

creation {ANY}
	make

feature {ANY}
	is_connected: BOOLEAN is True

	disconnect is
		do
			filter := Void
		end

feature {}
	make is
		do
			buffer := buffer.calloc(4096)
			capacity := 4096
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			if buffer_position >= 4096 then
				write_buffer
			end
			buffer.put(c, buffer_position)
			buffer_position := buffer_position + 1
			if c = '%N' then
				write_buffer
			end
		end

	filtered_flush is
		do
			if buffer_position > 0 then
				write_buffer
			end
			io_flush(stdout)
		end

feature {ANY}
	put_line (s: STRING) is
		require
			s /= Void
		local
			unused_result: INTEGER
		do
			write_buffer
			s.add_last('%N')
			unused_result := io_fwrite(s.storage, s.count, stdout)
			s.remove_last
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := sequencer_descriptor(stdout)
		end

	filtered_has_descriptor: BOOLEAN is True

	filtered_stream_pointer: POINTER is
		do
			Result := stdout
		end

	filtered_has_stream_pointer: BOOLEAN is True

feature {STREAM_HANDLER}
	redirect_to (file_name: STRING) is
			-- Redirect standard output to `file_name' instead of the default standard output.  If `file_name'
			-- does not exist, it is created.  If it exists, its previous content is erased.
			--
			-- See also `redirection_succeeded'
		do
			redirect(open_descriptor_for_create(file_name.to_external))
		end

	redirect_append_to (file_name: STRING) is
			-- Redirect standard output to `file_name' instead of the default standard output.  If `file_name'
			-- does not exist, it is created.  If it exists, the new output is appended to it.
			--
			-- See also `redirection_succeeded'
		do
			redirect(open_descriptor_for_append(file_name.to_external))
		end

	restore_default_output is
			-- Restore standard output to go to the default standard output.
		do
			Precursor
		end

feature {}
	buffer_position: INTEGER

	buffer: NATIVE_ARRAY[CHARACTER]

	capacity: INTEGER

	write_buffer is
		local
			unused_result: INTEGER
		do
			if buffer_position > 0 then
				unused_result := io_fwrite(buffer, buffer_position, stdout)
				buffer_position := 0
			end
		end

	stdout: POINTER is
		external "plug_in"
		alias "{
			location: "${sys}/plugins"
			module_name: "io"
			feature_name: "stdout"
			}"
		end

	dispose is
		do
			check
				std_output = Current
			end
			-- Nothing to dispode for `std_output'.
		end	
	
end -- class STD_OUTPUT
