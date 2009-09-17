deferred class BIJECTIVE_DICTIONARY[V_, K_]
	--
	-- Bijective associative memory. As for ordinary DICTIONARY, Values of type `V_' are stored using Keys
	-- of type `K_', but, in a BIJECTIVE_DICTIONARY, given one value of type `V_', you can retrieve the unique
	--	corresponding key of type `K_'. In other words, with a BIJECTIVE_DICTIONARY, one key of type `K_' gives
	--	you access to one value of type `V_' which can be used to retrieve back the same unique original key.
	--
	-- At time being, the only one available implementation is the HASHED_BIJECTIVE_DICTIONARY class.
	--
	-- See also DICTIONARY class if you do not have a unique value for each key. By the way, also note that
	-- the interface of DICTIONARY is similar to the interface of BIJECTIVE_DICTIONARY in order to allow you to
	-- move from one to the other.
	--

inherit
	TRAVERSABLE[V_]
		rename
			new_iterator as new_iterator_on_items,
			do_all as do_all_xitems,
			for_all as for_all_items,
			exists as exists_item
		redefine is_equal, copy
		end

feature {ANY} -- Counting:
	is_empty: BOOLEAN is
			-- Is it empty ?
		do
			Result := count = 0
		end

feature {ANY} -- Basic access:
	has (k: K_): BOOLEAN is
			-- Is there a value currently associated with key `k'?
		require
			k /= Void
		deferred
		ensure
			Result implies has_value(at(k))
		end

	at (k: K_): V_ is
			-- Return the value associated to key `k'.
			-- (See also `reference_at' if V_ is a reference type.)
		require
			has(k)
		deferred
		ensure
			k.is_equal(key_at(Result))
		end

	reference_at (k: K_): V_ is
			-- Return Void or the value associated with key `k'. Actually, this feature is only useful 
			-- when the type of values (the type V_) is a reference type, to avoid using `has' just 
			-- followed by `at' to get the corresponding value.
		require
			k /= Void
			values_are_expanded: Result = Void
		deferred
		ensure
			has(k) implies Result = at(k)
		end

	fast_has (k: K_): BOOLEAN is
			-- Is there a value currently associated with key `k'?
		require
			k /= Void
		deferred
		ensure
			Result implies fast_has_value(fast_at(k))
		end

	fast_at (k: K_): V_ is
			-- Return the value associated to key `k'.
			-- (See also `reference_at' if V_ is a reference type.)
		require
			fast_has(k)
		deferred
		ensure
			Result = at(k)
			fast_key_at(Result) = k
		end

	fast_reference_at (k: K_): V_ is
			-- Return Void or the value associated with key `k'. Actually, this feature is useful only 
			-- when the type of values (the type V_) is a reference type, to avoid using `has' just 
			-- followed by `at' to get the corresponding value.
		require
			k /= Void
			values_are_not_expanded: Result = Void
		deferred
		ensure
			fast_has(k) implies Result = fast_at(k)
		end

	has_value (v: V_): BOOLEAN is
			-- Is there a value `v'?
		require
			v /= Void
		deferred
		ensure
			Result implies has(key_at(v))
		end

	key_at (v: V_): K_ is
			-- Retrieve the key used for value `v' using `is_equal' for comparison.
		require
			has_value(v)
		deferred
		ensure
			v.is_equal(at(Result))
		end

	fast_has_value (v: V_): BOOLEAN is
			-- Is there a value `v'?
		require
			v /= Void
		deferred
		ensure
			Result implies fast_has(fast_key_at(v))
		end

	fast_key_at (v: V_): K_ is
			-- Retrieve the key used for value `v' using `=' for comparison.
		require
			fast_has_value(v)
		deferred
		ensure
			Result = key_at(v)
			fast_at(Result) = v
		end

feature {ANY}
	put (v: V_; k: K_) is
			-- Change some existing entry or `add' the new one. If there is
			-- as yet no key `k' in the dictionary, enter it with item `v'.
			-- Otherwise overwrite the item associated with key `k'.
		require
			bijection_guard_key: has(k) implies key_at(at(k)).is_equal(k)
			bijection_guard_value: has_value(v) implies key_at(v).is_equal(k)
		deferred
		ensure
			value_updated: v = fast_at(k)
			key_updated: k = fast_key_at(v)
		end

	add (v: V_; k: K_) is
			-- To add a new entry `k' with its associated value `v'. Actually, this is equivalent to call
			-- `put', but may run a little bit faster.
		require
			not has(k)
			not has_value(v)
		deferred
		ensure
			count = 1 + old count
			v = fast_at(k)
			k = fast_key_at(v)
		end

feature {ANY} -- Removing:
	remove (k: K_) is
			-- Remove entry `k' (which may exist or not before this call).
		require
			k /= Void
		deferred
		ensure
			not has(k)
		end

	clear_count is
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' is not changed
			-- by this call. See also `clear_count_and_capacity' to select the most appropriate.
		deferred
		ensure
			is_empty: count = 0
			capacity = old capacity
		end

	clear_count_and_capacity is
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call. See also `clear_count' to select the most appropriate.
		deferred
		ensure
			is_empty: count = 0
			capacity <= old capacity
		end

	capacity: INTEGER is
			-- Approximation of the actual internal storage `capacity'. The `capacity' will grow automatically
			-- when needed (i.e. `capacity' is not a limit for the number of values stored). Also note that
			-- the `capacity' value may not be always accurate depending of the implementation (anyway, this
			-- `capacity' value is at least equals to `count').
		deferred
		end

feature {ANY} -- To provide iterating facilities:
	lower: INTEGER is 1

	upper: INTEGER is
		do
			Result := count
		ensure
			Result = count
		end

	item (index: INTEGER): V_ is
		deferred
		ensure
			Result = at(key(index))
		end

	key (index: INTEGER): K_ is
		require
			valid_index(index)
		deferred
		ensure
			Result = key_at(item(index))
		end

	first: V_ is
		do
			Result := item(lower)
		end
	
	last: V_ is
		do
			Result := item(upper)
		end
	
	new_iterator_on_items: ITERATOR[V_] is
		do
			create {ITERATOR_ON_BIJECTIVE_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
		ensure then
			Result /= Void
		end

	new_iterator_on_keys: ITERATOR[K_] is
		do
			create {ITERATOR_ON_BIJECTIVE_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
		ensure
			Result /= Void
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
			-- Do both dictionaries have the same set of associations?
			-- Both keys and values are compared with `is_equal'.
		local
			i: INTEGER; k: K_
		do
			if Current = other then
				Result := True
			elseif count = other.count then
				from
					Result := True
					i := 1
				until
					not Result or else i > count
				loop
					k := key(i)
					if other.has(k) then
						if other.at(k).is_equal(item(i)) then
							i := i + 1
						else
							Result := False
						end
					else
						Result := False
					end
				end
			end
		ensure then
			Result implies count = other.count
		end

	copy (other: like Current) is
			-- Reinitialize by copying all associations of `other'.
		deferred
		end

feature {ANY} -- Agents based features:
	do_all (action: ROUTINE[TUPLE[V_, K_]]) is
			-- Apply `action' to every [V_, K_] associations of `Current'.
			--
			-- See also `for_all', `exists'.
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				i := lower
			until
				i > upper
			loop
				v := item(i)
				k := key(i)
				action.call([v, k])
				i := i + 1
			end
		end

	for_all (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN is
			-- Do all [V_, K_] associations satisfy `test'?
			--
			-- See also `do_all', `exists'.
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				Result := True
				i := lower
			until
				not Result or else i > upper
			loop
				v := item(i)
				k := key(i)
				Result := test.item([v, k])
				i := i + 1
			end
		end

	exists (test: PREDICATE[TUPLE[V_, K_]]): BOOLEAN is
			-- Does at least one [V_, K_] association satisfy `test'?
			--
			-- See also `do_all', `for_all'.
		local
			i: INTEGER; v: V_; k: K_
		do
			from
				i := lower
			until
				Result or else i > upper
			loop
				v := item(i)
				k := key(i)
				Result := test.item([v, k])
				i := i + 1
			end
		end

feature {ANY} -- Other features:
	internal_key (k: K_): K_ is
			-- Retrieve the internal key object which correspond to the existing
			-- entry `k' (the one memorized into the `Current' dictionary).
		require
			has(k)
		deferred
		ensure
			Result.is_equal(k)
			internal_key(Result) = Result
			at(k) = fast_at(Result)
		end

feature {}

	frozen key_safe_equal (k1, k2: K_): BOOLEAN is
			-- Because keys are never Void, we do not rely on the SAFE_EQUAL class.
		require
			k1 /= Void
			k2 /= Void
		do
			if k1 = k2 then
				Result := True
			elseif k1.same_dynamic_type(k2) then
				Result := k1.is_equal(k2)
			end
		end

	frozen val_safe_equal (v1, v2: V_): BOOLEAN is
			-- Because values are never Void, we do not rely on the SAFE_EQUAL class.
		require
			v1 /= Void
			v2 /= Void
		do
			if v1 = v2 then
				Result := True
			elseif v1.same_dynamic_type(v2) then
				Result := v1.is_equal(v2)
			end
		end

feature {} -- Implement manifest generic creation:
	manifest_put (index: INTEGER; v: V_; k: K_) is
		require
			v /= Void
			k /= Void
			not has(k)
		do
			add(v, k)
		end

	manifest_semicolon_check: INTEGER is 2
			-- Put semicolons between successive value-key pairs.

end -- class BIJECTIVE_DICTIONARY
