class MIN_STAND
obsolete "In release 2.3, the new name for this class is MINIMAL_RANDOM_NUMBER_GENERATOR.%N%
         %Update your code. (January 10th 2006.)%N"
			
	--
	-- Implements the Minimal Standard generator from Press et. al.
	-- Numerical Recipies.
	--

inherit
	GEN_RAND

creation {ANY}
	make, with_seed

feature {ANY}
	im: INTEGER is 2147483647

feature {}
	ia: INTEGER is 16807

	iq: INTEGER is 127773

	ir: INTEGER is 2836

	seed: INTEGER

feature {ANY}
	make is
		local
			seed_init: INTEGER
		do
			seed_init := clock_based_random_seed
			from
			until
				seed_init < im
			loop
				seed_init := seed_init - iq
			end
			with_seed(seed_init)
		end

	with_seed (seed_value: INTEGER) is
		require
			valid_seed: seed_value > 0 and seed_value < im
		do
			seed := seed_value
			next
		end

	next is
		local
			k: INTEGER
		do
			k := seed #// iq
			seed := ia * (seed - k * iq) - ir * k
			if seed < 0 then
				seed := seed + im
			end
		end

	last_real: REAL is
		do
			Result := seed / im
		end

	last_integer (n: INTEGER): INTEGER is
		do
			Result := seed #\\ n + 1
		end

invariant
	good_seed: seed > 0 and seed < im

end -- class MIN_STAND
