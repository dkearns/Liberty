deferred class BACKTRACKING_NODE_BINARY
	--
	-- Node for a sequence of 2 nodes
	--

inherit
	BACKTRACKING_NODE

feature {ANY}
	first: BACKTRACKING_NODE
			-- first node of the sequence

	second: BACKTRACKING_NODE
			-- second node of the sequence

	make (frst, scnd: BACKTRACKING_NODE) is
		require
			first_not_void: frst /= Void
			second_not_void: scnd /= Void
		do
			first := frst
			second := scnd
		ensure
			definition: first = frst and second = scnd
			first_not_void: first /= Void
			second_not_void: second /= Void
		end

	set_first (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			first := value
		ensure
			definition: first = value
			first_not_void: first /= Void
		end

	set_second (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			second := value
		ensure
			definition: second = value
			second_not_void: second /= Void
		end

invariant
	first_not_void: first /= Void
	second_not_void: second /= Void

end -- class BACKTRACKING_NODE_BINARY
