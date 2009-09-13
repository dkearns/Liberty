-- See the Copyright notice at the end of this file.
--
deferred class FILTER
	--
	-- A filter is something connected to a stream. It allows to add behavior (e.g. compression, encryption
	-- and any other codings).
	--
	-- There are two kinds of filters:
	-- * ''input'' filters (see FILTER_INPUT_STREAM)
	-- * ''output'' filters (see FILTER_OUTPUT_STREAM)
	--

feature {ANY}
	connect_to (a_stream: like stream) is
			-- Connect the filter to some underlying stream.
		require
			not is_connected
			a_stream.is_connected
			not a_stream.is_filtered
		do
			a_stream.set_filter(Current)
			stream := a_stream
		ensure
			is_connected
		end

	is_connected: BOOLEAN is
			-- True if the filter is connected to some underlying stream.
		do
			Result := stream /= Void and then stream.is_connected
		end

	disconnect is
			-- Disconnect from the underlying stream.
		require
			is_connected
			can_disconnect
		deferred
		ensure
			not is_connected
			stream = Void
		end

	can_disconnect: BOOLEAN is
		do
			Result := local_can_disconnect and then stream.can_disconnect
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := stream.filtered_descriptor
		end

	filtered_has_descriptor: BOOLEAN is
		do
			Result := stream.filtered_has_descriptor
		end

	filtered_stream_pointer: POINTER is
		do
			Result := stream.filtered_stream_pointer
		end

	filtered_has_stream_pointer: BOOLEAN is
		do
			Result := stream.filtered_has_stream_pointer
		end

feature {}
	local_can_disconnect: BOOLEAN is
			-- True if this stream can be safely disconnected (without data loss, etc.) without taking into
			-- account the state of the underlying stream.
		deferred
		end

	stream: FILTERABLE
			-- The underlying stream (i.e. the filtered one)

feature {STREAM}
	do_detach is
			-- Used by the underlying stream to require not to be filtered anymore
		deferred
		ensure
			stream = Void
		end

invariant
	stream /= Void implies stream.filter = Current

end -- class FILTER
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------