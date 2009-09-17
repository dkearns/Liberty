class OPENVMS_DIRECTORY_NOTATION
	-- The VMS file path notation looks like:
	--    DISK:[SmartEiffel.sys]system.se
	-- The current working directory notation is:
	--    DISK:[]
	-- The equivalent of Unix .. is :
	--    [-]
	-- The equivalent of Unix ../.. is :
	--    [-.-]
	--

inherit
	DIRECTORY_NOTATION

feature {ANY}
	is_current_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	is_parent_directory (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

	to_parent_directory (some_path: STRING) is
		local
			old_count: INTEGER
		do
			--|*** "-" is not handled correctly <FM-24/03/2005>
			old_count := some_path.count
			if some_path.last = ']' then
				from
					some_path.remove_last
				until
					some_path.is_empty or else some_path.last = '.' or else some_path.last = '['
				loop
					some_path.remove_last
				end
				if some_path.count > 0 then
					inspect
						some_path.last
					when '.' then
						some_path.remove_last
						some_path.extend(']')
					when '[' then
						if some_path.count = old_count - 1 then
							some_path.remove_last
						else
							some_path.extend(']')
						end
					end
				end
			elseif some_path.last = ':' then
				some_path.clear_count
			else
				from
					some_path.remove_last
				until
					some_path.is_empty or else some_path.last = ']'
				loop
					some_path.remove_last
				end
				if some_path.is_empty then
					some_path.clear_count
				end
			end
		end

	to_subdirectory_with (parent_path, entry_name: STRING) is
		do
			if parent_path.count = 1 then
				parent_path.clear_count
			elseif parent_path.last = ']' then
				parent_path.remove_last
				if parent_path.last = '[' then
					parent_path.append(entry_name)
					parent_path.extend(']')
				else
					parent_path.extend('.')
					parent_path.append(entry_name)
					parent_path.extend(']')
				end
			elseif parent_path.last = ':' then
				parent_path.extend('[')
				parent_path.append(entry_name)
				parent_path.extend(']')
			else
				parent_path.clear_count
			end
		end

	to_file_path_with (parent_path, file_name: STRING) is
		do
			inspect
				parent_path.last
			when ']' then
			when '.' then
				parent_path.remove_last
				parent_path.extend(']')
			else
				parent_path.extend(']')
			end
			if file_name.first = ']' then
				parent_path.remove_last
			end
			parent_path.append(file_name)
		end

	to_subpath_with (parent_path, subpath: STRING) is
		do
			not_yet_implemented
		end

	to_directory_path (path: STRING) is
		do
			not_yet_implemented
		end

feature {ANY}
	can_map_drive (source_notation: DIRECTORY_NOTATION; drive: STRING): BOOLEAN is
		do
			--|*** We (c/sh)ould do better than nothing... <24/03/2005>
		end

	to_root (source_notation: DIRECTORY_NOTATION; drive: STRING) is
		do
			check
				False
			end
		end

	to_default_root (directory: STRING) is
		do
			not_yet_implemented
		end

	to_current_directory (directory: STRING) is
		do
			not_yet_implemented
		end

feature {ANY}
	is_case_sensitive: BOOLEAN is False

	is_valid_path (path: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not path.is_empty
		end

	is_valid_directory_path (path: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not path.is_empty
		end

	is_valid_file_name (name: STRING): BOOLEAN is
		do
			--|*** Not nearly strict enough <FM-24/03/2003>
			Result := not name.is_empty
		end

	is_absolute_path (path: STRING): BOOLEAN is
		do
			not_yet_implemented
		end

feature {DIRECTORY_NOTATION}
	to_notation (path: STRING; destination_notation: DIRECTORY_NOTATION): STRING is
		do
			not_yet_implemented
		end

end -- class OPENVMS_DIRECTORY_NOTATION
