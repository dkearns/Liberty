class ITERATOR_ON_UNICODE_STRING
	-- Please do not use this class directly. Look at `ITERATOR'.

inherit
	ITERATOR[INTEGER]

creation {ANY}
	make

feature {}
	string: UNICODE_STRING
			-- The one to be traversed.

	item_index: INTEGER
			--  Memorize the current position.

feature {ANY}
	make (s: UNICODE_STRING) is
		require
			s /= Void
		do
			string := s
			item_index := 1
		ensure
			string = s
		end

	start is
		do
			item_index := 1
		end

	is_off: BOOLEAN is
		do
			Result := item_index > string.count
		end

	item: INTEGER is
		do
			Result := string.item(item_index)
		end

	next is
		do
			item_index := item_index + 1
		end

end -- class ITERATOR_ON_UNICODE_STRING
