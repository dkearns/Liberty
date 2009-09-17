class PARSE_TABLE
	--
	-- A parsing table (aka Grammar).
	--
	-- The only way to create a parse table is to use SmartEiffel's manifest notation.
	--
	-- The structure of this notation is:
	--
	--    {PARSE_TABLE << name, atom;
	--                    name, atom;
	--                      . . .
	--                    name, atom
	--                 >>}
	--
	-- where each name is a STRING and each atom may be either a PARSE_NON_TERMINAL or a PARSE_TERMINAL.
	--

creation {ANY}
	manifest_creation

feature {ANY}
	is_coherent: BOOLEAN is
			-- True if all the used atoms are defined
		local
			i: INTEGER; atom: PARSE_ATOM
		do
			from
				Result := True
				i := atoms.lower
			until
				not Result or else i > atoms.upper
			loop
				atom := atoms.item(i)
				Result := atom.is_coherent
				if not Result then
					sedb_breakpoint
				end
				i := i + 1
			end
		ensure
			must_be_coherent: Result
		end

	has (atom_name: STRING): BOOLEAN is
		require
			not atom_name.is_empty
		do
			Result := atoms.has(atom_name)
		end

	set_default_tree_builders (non_terminal_builder: PROCEDURE[TUPLE[STRING, TRAVERSABLE[STRING]]]
		terminal_builder: PROCEDURE[TUPLE[STRING, PARSER_IMAGE]]) is
		require
			is_coherent
		local
			i: INTEGER
		do
			from
				i := atoms.lower
			until
				i > atoms.upper
			loop
				atoms.item(i).set_default_tree_builders(non_terminal_builder, terminal_builder)
				i := i + 1
			end
		end

	extend (a_table: PARSE_TABLE) is
			-- Extends Current with a *copy* of the atoms of `a_table'. Any atom with a name already existing in
			-- Current is ignored.
		require
			a_table /= Void
			a_table /= Current
		local
			i: INTEGER; atom: PARSE_ATOM
		do
			from
				i := a_table.atoms.lower
			until
				i > a_table.atoms.upper
			loop
				if not atoms.has(a_table.atoms.key(i)) then
					atom := a_table.atoms.item(i).twin
					atom.set_table(Current)
					atoms.add(atom, a_table.atoms.key(i))
				end
				i := i + 1
			end
		end

	add_or_replace (atom_name: STRING; atom: PARSE_ATOM) is
		require
			atom_name /= Void
			atom /= Void
		do
			atoms.put(atom, atom_name)
		ensure
			item(atom_name) = atom
		end

	item (atom_name: STRING): PARSE_ATOM is
		require
			not atom_name.is_empty
			has(atom_name)
		do
			Result := atoms.reference_at(atom_name)
		end

feature {PARSE_TABLE}
	atoms: HASHED_DICTIONARY[PARSE_ATOM, STRING]

feature {}
	manifest_make (needed_capacity: INTEGER) is
		do
			create atoms.with_capacity(needed_capacity)
		end

	manifest_put (index: INTEGER; name: STRING; atom: PARSE_ATOM) is
		require
			not has(name)
			atom.name = Void
		do
			atoms.add(atom, name)
			atom.set(name, Current)
		ensure
			atom.name = name
		end

	manifest_semicolon_check: INTEGER is 2

end -- class PARSE_TABLE
