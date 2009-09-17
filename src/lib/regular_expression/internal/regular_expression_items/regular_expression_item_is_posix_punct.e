class REGULAR_EXPRESSION_ITEM_IS_POSIX_PUNCT

inherit
	REGULAR_EXPRESSION_ITEM

feature {ANY}
	explore (matcher: BACKTRACKING_REGULAR_EXPRESSION) is
		do
			if matcher.valid_last_character and then matcher.last_character.code >= 32 and then not matcher.last_character.is_letter_or_digit then
				matcher.advance
				matcher.continue
			else
				matcher.backtrack
			end
		end

end -- class REGULAR_EXPRESSION_ITEM_IS_POSIX_PUNCT
