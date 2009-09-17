deferred class SET[E_]
	--
	-- Definition of a mathematical set of objects. All common operations on mathematical sets are available.
	--
	-- Well knowned implementations are HASHED_SET and AVL_SET.
	--

inherit
	TRAVERSABLE[E_]
		redefine is_equal, copy
		end

insert
	SAFE_EQUAL[E_]
		redefine is_equal, copy
		end

feature {ANY} -- Counting:
	is_empty: BOOLEAN is
			-- Is the set empty?
		do
			Result := count = 0
		end

feature {ANY} -- Adding and removing:
	add (e: like item) is
			-- Add new item `e' to the set. The mathematical definition of adding in a set is followed, i.e. the
			-- element `e' is added only and only if it is not yet present in the set.
			-- As this `add' feature is actually using `is_equal', you may consider to use `fast_add' for expanded
			-- objects as well while trying to get the very best performances.
		require
			e /= Void
		deferred
		ensure
			added: has(e)
			not_in_then_added: not old has(e) implies count = old count + 1
			in_then_not_added: old has(e) implies count = old count
		end

	fast_add (e: like item) is
			-- Same job as `add', but uses basic `=' for comparison.
		require
			e /= Void
		deferred
		ensure
			added: has(e)
			not_in_then_added: not old has(e) implies count = old count + 1
			in_then_not_added: old has(e) implies count = old count
		end

	remove (e: like item) is
			-- Remove item `e' from the set: the mathematical definition of
			-- removing from a set is followed.
		require
			e /= Void
		deferred
		ensure
			removed: not has(e)
			not_in_not_removed: not old has(e) implies count = old count
			in_then_removed: old has(e) implies count = old count - 1
		end

	fast_remove (e: like item) is
			-- Same job as `remove', but uses basic `=' for comparison.
		require
			e /= Void
		deferred
		ensure
			removed: not has(e)
			not_in_not_removed: not old has(e) implies count = old count
			in_then_removed: old has(e) implies count = old count - 1
		end

	clear_count is
			-- Empty the current set (`is_empty' is True after that call). If possible, the actual implementation
			-- is supposed to keep its internal storage area in order to refill `Current' in an efficient way.
			-- See also `clear_count_and_capacity' to select the most appropriate.
		deferred
		ensure
			is_empty: count = 0
		end

	clear_count_and_capacity is
			-- Empty the current set (`is_empty' is True after that call). If possible, the actual implementation
			-- is supposed to release its internal storage area for this memory to be used by other objects.
			-- See also `clear_count' to select the most appropriate.
		deferred
		ensure
			is_empty: count = 0
		end

feature {ANY} -- Looking and searching:
	has (e: like item): BOOLEAN is
			-- Is element `e' in the set?
			-- As this query is actually using `is_equal', you may consider to use `fast_has' for expanded
			-- objects as well while trying to get the very best performances.
		require
			e /= Void
		deferred
		ensure
			Result implies not is_empty
		end

	fast_has (e: like item): BOOLEAN is
			-- Is element `e' actually stored in the set?
			-- Warning: this query is using basic `=' for comparison. See also `has' when dealing with reference
			-- types.
		require
			e /= Void
		deferred
		ensure
			Result implies e = reference_at(e)
		end

	reference_at (e: like item): like item is
			-- Non Void when `e' is in the set. In such a situation, `Result' is the object which is actually
			-- stored in the `Current' set (see ensure assertion).
		require
			e /= Void
			elements_are_not_expanded: Result = Void
		deferred
		ensure
			has(e) implies Result.is_equal(e)
		end

feature {ANY} -- To provide iterating facilities:
	lower: INTEGER is 1

	upper: INTEGER is
		do
			Result := count
		ensure
			Result = count
		end

	item (index: INTEGER): E_ is
			-- Item at the corresponding index `i'.
			--
			-- See also `lower', `upper', `valid_index'.
			--
			-- SETs are intrinsically unordered, so there is no guarantee that `item'(i) after performing an `add'
			-- or `remove' operation is related in any way to `item'(i) before that operation.
		deferred
		ensure
			has(Result)
		end

	first: E_ is
		do
			Result := item(lower)
		end
	
	last: E_ is
		do
			Result := item(upper)
		end
	
	new_iterator: ITERATOR[E_] is
		do
			create {ITERATOR_ON_SET[E_]} Result.make(Current)
		end

feature {ANY} -- Mathematical operations:
	union (other: like Current) is
			-- Make the union of the `Current' set with `other'.
		require
			other /= Void
		local
			i: INTEGER; e: like item
		do
			from
				i := 1
			until
				i > other.count
			loop
				e := other.item(i)
				if not has(e) then
					add(e)
				end
				i := i + 1
			end
		ensure
			count <= old count + other.count
		end

	infix "+" (other: like Current): like Current is
			-- Return the union of the `Current' set with `other'.
		require
			other /= Void
		do
			Result := twin
			Result.union(other)
		ensure
			Result.count <= count + other.count
			Current.is_subset_of(Result) and then other.is_subset_of(Result)
		end

	intersection (other: like Current) is
			-- Make the intersection of the `Current' set with `other'.
		require
			other /= Void
		local
			i: INTEGER; e: like item
		do
			from
				i := upper
			until
				i < lower
			loop
				e := item(i)
				if not other.has(e) then
					remove(e)
				end
				i := i - 1
			end
		ensure
			count <= other.count.min(old count)
		end

	infix "^" (other: like Current): like Current is
			-- Return the intersection of the `Current' set with `other'.
		require
			other /= Void
		do
			Result := twin
			Result.intersection(other)
		ensure
			Result.count <= other.count.min(count)
			Result.is_subset_of(Current) and then Result.is_subset_of(other)
		end

	minus (other: like Current) is
			-- Make the set `Current' - `other'.
		require
			other /= Void
		local
			i: INTEGER
		do
			if other = Current then
				clear_count
			else
				from
					i := 1
				until
					i > other.count
				loop
					remove(other.item(i))
					i := i + 1
				end
			end
		ensure
			count <= old count
		end

	infix "-" (other: like Current): like Current is
			-- Return  the set `Current' - `other'.
		require
			other /= Void
		do
			Result := twin
			Result.minus(other)
		ensure
			Result.count <= count
			Result.is_subset_of(Current)
		end

feature {ANY} -- Comparison:
	is_subset_of (other: like Current): BOOLEAN is
			-- Is the `Current' set a subset of `other'?
		require
			other /= Void
		local
			i: INTEGER
		do
			if Current = other then
				Result := True
			elseif count <= other.count then
				from
					Result := True
					i := 1
				until
					not Result or else i > count
				loop
					Result := other.has(item(i))
					i := i + 1
				end
			end
		ensure
			Result implies count <= other.count
		end

	is_disjoint_from (other: like Current): BOOLEAN is
			-- Is the `Current' set disjoint from `other' ?
		require
			other /= Void
		local
			i: INTEGER
		do
			if Current /= other then
				Result := True
				i := 1
				if count <= other.count then
					from
					until
						not Result or else i > count
					loop
						Result := not other.has(item(i))
						i := i + 1
					end
				else
					from
					until
						not Result or else i > other.count
					loop
						Result := not has(other.item(i))
						i := i + 1
					end
				end
			end
		ensure
			Result = (Current ^ other).is_empty
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is the `Current' set equal to `other'?
		local
			i: INTEGER
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
					Result := other.has(item(i))
					i := i + 1
				end
			end
		ensure then
			double_inclusion: Result = (is_subset_of(other) and other.is_subset_of(Current))
		end

feature {ANY}
	copy (other: like Current) is
			-- Copy 'other' into the current set
		local
			i: INTEGER
		do
			-- Note: this naive implementation is OK because node
			-- recycling is implemented.
			from
				make
				i := 1
			until
				i > other.count
			loop
				add(other.item(i))
				i := i + 1
			end
		end

	from_collection (model: COLLECTION[like item]) is
			-- Add all items of `model'.
		require
			model /= Void
		local
			i, up: INTEGER
		do
			from
				make
				up := model.upper
				i := model.lower
			until
				i > up
			loop
				add(model.item(i))
				i := i + 1
			end
		end

feature {}
	make is
			-- Creation of an empty SET.
		deferred
		ensure
			is_empty
		end

feature {} -- Implement manifest generic creation:
	manifest_make (needed_capacity: INTEGER) is
			-- Manifest creation of a SET.
		do
			make
		end

	manifest_put (index: INTEGER; element: like item) is
		do
			add(element)
		end

	manifest_semicolon_check: BOOLEAN is False

end -- class SET
