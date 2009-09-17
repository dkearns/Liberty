expanded class INTEGER_64

insert
	INTEGER_GENERAL

feature {ANY} -- Conversions:
	fit_integer_8: BOOLEAN is
			-- Does `Current' fit in INTEGER_8?
		do
			if Current >= -128 then
				Result := Current <= 127
			end
		ensure
			Result = Current.in_range(-128, 127)
		end

	to_integer_8: INTEGER_8 is
			-- Explicit conversion to INTEGER_8.
		require
			fit_integer_8
		external "built_in"
		ensure
			Current.is_equal(Result)
		end

	fit_integer_16: BOOLEAN is
			-- Does `Current' fit in INTEGER_16?
		do
			if Current >= -32768 then
				Result := Current <= 32767
			end
		ensure
			Result = Current.in_range(-32768, 32767)
		end

	to_integer_16: INTEGER_16 is
			-- Explicit conversion to INTEGER_16.
		require
			fit_integer_16
		external "built_in"
		ensure
			Current.is_equal(Result)
		end

	fit_integer_32: BOOLEAN is
			-- Does `Current' fit in INTEGER_32?
		do
			if Current >= -2147483648 then
				Result := Current <= 2147483647
			end
		ensure
			Result = Current.in_range(-2147483648, 2147483647)
		end

	to_integer_32: INTEGER_32 is
			-- Explicit conversion to INTEGER_32.
		require
			fit_integer_32
		external "built_in"
		ensure
			Current = Result
		end

	fit_natural_8: BOOLEAN is
			-- Does `Current' fit in NATURAL_8?
		do
			if Current >= 0 then
				Result := Current <= 255
			end
		ensure
			Result = Current.in_range(0, 255)
		end

	to_natural_8: NATURAL_8 is
			-- Explicit conversion to NATURAL_8.
		require
			fit_natural_8
		external "built_in"
		ensure
			Result.to_integer_16 = Current
		end
	
	fit_natural_16: BOOLEAN is
			-- Does `Current' fit in NATURAL_16?
		do
			if Current >= 0 then
				Result := Current <= 65535
			end
		ensure
			Result = Current.in_range(0, 65535)
		end

	to_natural_16: NATURAL_16 is
			-- Explicit conversion to NATURAL_16.
		require
			fit_natural_16
		external "built_in"
		ensure
			Result.to_integer_32 = Current
		end
	
	fit_natural_32: BOOLEAN is
			-- Does `Current' fit in NATURAL_32?
		do
			if Current >= 0 then
				Result := Current <= 4294967295
			end
		ensure
			Result = Current.in_range(0, 4294967295)
		end
	
	to_natural_32: NATURAL_32 is
			-- Explicit conversion to NATURAL_32.
		require
			fit_natural_32
		external "built_in"
		ensure
			Result.to_integer_64 = Current
		end
	
	to_natural_64: NATURAL_64 is
			-- Explicit conversion to NATURAL_64.
		require
			Current >= 0
		external "built_in"
		ensure
			Result.to_integer_64 = Current
		end
	
	force_to_real_32: REAL_32 is
			-- Forced conversion to REAL_32 (possible loss of precision).
			-- (See also `fit_real_32' and `to_real_32'.)
		external "built_in"
		end

	fit_real_32: BOOLEAN is
			-- Does `Current' fit in REAL_32?
		do
			Result := fit_integer_32 and then to_integer_32.fit_real_32
		end

	to_real_32: REAL_32 is
			-- Explicit conversion to REAL_32. (See also `force_to_real_32'.)
		require
			fit_real_32
		do
			Result := force_to_real_32
		ensure
			Result.force_to_integer_64 = Current
		end

	force_to_real_64: REAL_64 is
			-- Forced conversion to REAL_64 (possible loss of precision).
			-- (See also `fit_real_64' and `to_real_64'.)
		external "built_in"
		end

	fit_real_64: BOOLEAN is
			-- Does `Current' fit in REAL_64?
		do
			Result := integer_64_fit_real_64(Current)
		end

	to_real_64: REAL_64 is
			-- Explicit conversion to REAL_64. (See also `force_to_real_64'.)
		require
			fit_real_64
		do
			Result := force_to_real_64
		ensure
			Result.force_to_integer_64 = Current
		end

	to_number: NUMBER is
		local
			number_tools: NUMBER_TOOLS
		do
			Result := number_tools.from_integer_64(Current)
		ensure then
			Result @= Current
		end

	decimal_digit: CHARACTER is
		do
			Result := (Current.to_integer_32 + '0'.code).to_character
		end

	hexadecimal_digit: CHARACTER is
		do
			if Current <= 9 then
				Result := (to_integer_8 + '0'.code).to_character
			else
				Result := ('A'.code + (to_integer_8 - 10)).to_character
			end
		end

feature {ANY}
	low_32: INTEGER_32 is
			-- The 32 low bits of `Current' (i.e. the right-most part).
		external "built_in"
		end

	high_32: INTEGER_32 is
			-- The 32 high bits of `Current' (i.e. the left-most part).
		do
			Result := (Current |>> 32).low_32
		end

	one: INTEGER_8 is 1

	zero: INTEGER_8 is 0

	hash_code: INTEGER is
		do
			Result := Current.low_32 & 0x7FFFFFFF
		end

	sqrt: REAL is
		do
			Result := force_to_real_64.sqrt
		end

	log: REAL is
		do
			Result := force_to_real_64.log
		end

	log10: REAL is
		do
			Result := force_to_real_64.log10
		end

feature {}
	integer_64_fit_real_64 (integer_64: INTEGER_64): BOOLEAN is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "integer_fit_real"
			feature_name: "integer_64_fit_real_64"
			}"
		end

	bit_count: INTEGER_8 is 64
	
end -- class INTEGER_64
