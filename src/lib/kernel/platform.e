expanded class PLATFORM

insert
	ANY

feature {} -- Maximum:
	Maximum_character_code: INTEGER_16 is
			-- Largest supported code for CHARACTER values.
		external "built_in"
		ensure
			meaningful: Result >= 127
		end

	Maximum_integer_8: INTEGER_8 is 127
			-- Largest supported value of type INTEGER_8.

	Maximum_integer_16: INTEGER_16 is 32767
			-- Largest supported value of type INTEGER_16.

	Maximum_integer, Maximum_integer_32: INTEGER is 2147483647
			-- Largest supported value of type INTEGER/INTEGER_32.

	Maximum_integer_64: INTEGER_64 is 9223372036854775807
			-- Largest supported value of type INTEGER_64.

	Maximum_real_32: REAL_32 is {REAL_32 3.4028234663852885981170418348451692544e+38}
			-- Largest non-special (no NaNs nor infinity) supported value of type REAL_32.

	Maximum_real, Maximum_real_64: REAL_64 is
			-- Largest non-special (no NaNs nor infinity) supported value of type REAL.
			-- Just to give an idea of this value: 1.79769313486231570....e+308
		external "built_in"
		end

	Maximum_real_80: REAL_80 is
			-- Largest supported value of type REAL_80.
		external "built_in"
		ensure
			meaningful: Result >= Maximum_real
		end

feature {} -- Minimum:
	Minimum_character_code: INTEGER_16 is
			-- Smallest supported code for CHARACTER values.
		external "built_in"
		ensure
			meaningful: Result <= 0
		end

	Minimum_integer_8: INTEGER_8 is -128
			-- Smallest supported value of type INTEGER_8.

	Minimum_integer_16: INTEGER_16 is -32768
			-- Smallest supported value of type INTEGER_16.

	Minimum_integer, Minimum_integer_32: INTEGER is -2147483648
			-- Smallest supported value of type INTEGER/INTEGER_32.

	Minimum_integer_64: INTEGER_64 is -9223372036854775808
			-- Smallest supported value of type INTEGER_64.

	Minimum_real_32: REAL_32 is {REAL_32 -3.40282346638528859811704183484516925440e+38}
			-- Smallest non-special (no NaNs nor infinity) supported value of type REAL_32.

	Minimum_real, Minimum_real_64: REAL_64 is
			-- Smallest non-special (no NaNs nor infinity) supported value of type REAL.
			-- Just to give an idea of this value: -1.79769313486231570....e+308
		external "built_in"
		end

	Minimum_real_80: REAL is
			-- Smallest supported value of type REAL_80.
		external "built_in"
		ensure
			meaningful: Result <= 0.0
		end

feature {} -- Bits:
	Boolean_bits: INTEGER is
			-- Number of bits in a value of type BOOLEAN.
		external "built_in"
		ensure
			meaningful: Result >= 1
		end

	Character_bits: INTEGER is
			-- Number of bits in a value of type CHARACTER.
		external "built_in"
		ensure
			meaningful: Result >= 1
			large_enough: {INTEGER_32 2 } ^ Result >= Maximum_character_code
		end

	Integer_bits: INTEGER is
			-- Number of bits in a value of type INTEGER.
		external "built_in"
		ensure
			integer_definition: Result = 32
		end

	Real_bits: INTEGER is 64
			-- Number of bits in a value of type REAL.

	Pointer_bits: INTEGER is
			-- Number of bits in a value of type POINTER.
		external "built_in"
		end

end -- class PLATFORM
