class FILE_RESOURCE_LOCATOR
	--
	-- A "file:" URL
	--

inherit
	RESOURCE_LOCATOR

creation {FILE_PROTOCOL}
	set_uri

feature {FILE_PROTOCOL}
	path: STRING is
		local
			bd: BASIC_DIRECTORY; u, p: STRING
		do
			bd.ensure_system_notation

			Result := once ""
			u := normalized_uri(uri)
			if notation.is_absolute_path(u) then
				Result.copy(u)
				bd.system_notation.from_notation(notation, Result)
			else
				Result.copy(bd.current_working_directory)
				p := once ""
				p.copy(u)
				bd.system_notation.from_notation(notation, p)
				bd.system_notation.to_subpath_with(Result, p)
			end
		end

	set_uri (a_uri: STRING) is
		do
			if uri = Void then
				uri := string_pool.new_twin(a_uri)
			else
				uri.copy(a_uri)
			end
		end

feature {}
	normalized_uri (a_uri: STRING): STRING is
		do
			if a_uri.has_prefix(once "//") then
				Result := once ""
				if a_uri.count > 2 then
					Result.copy_substring(a_uri, 3, a_uri.upper)
				else
					Result.clear_count
				end
			else
				Result := a_uri
			end
		end

feature {ANY}
	uri: STRING

feature {URL_VALIDITY}
	valid_uri (a_uri: STRING): BOOLEAN is
		do
			Result := notation.is_valid_path(normalized_uri(a_uri))
		end

feature {URL} -- URL data:
	absolute_uri (a_uri: STRING): BOOLEAN is
		do
			Result := a_uri.has_prefix(once "//") or else notation.is_absolute_path(a_uri)
		end

	set_relative (a_uri: STRING) is
		do
			notation.to_parent_directory(uri)
			if uri.is_empty then
				uri.extend('/')
			end
			notation.to_subpath_with(uri, a_uri)
		end

feature {}
	string_pool: STRING_RECYCLING_POOL is
		once
			create Result.make
		end

	notation: UNIX_DIRECTORY_NOTATION is
		once
			create Result
		end

feature {RECYCLING_POOL}
	recycle is
		do
			if uri /= Void then
				string_pool.recycle(uri)
				uri := Void
			end
		end

end -- class FILE_RESOURCE_LOCATOR
