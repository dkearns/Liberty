class NAMESPACE_ITERATOR
	-- An iterator over the metadata features of a namespace as seen in a
	-- GI_REPOSITORY the GObject Introspection Repository.

inherit
	ITERATOR[GI_BASE_INFO]
	GI_INFO_FACTORY 
	WRAPPER_HANDLER

insert GIREPOSITORY_EXTERNALS

creation {GI_INFO_FACTORY, WRAPPER} from_repository_and_namespace

feature {} -- Creation
	from_repository_and_namespace (a_repository: GI_REPOSITORY; a_namespace: ABSTRACT_STRING) is
		do 
			repo_ptr := a_repository.handle
			-- Since the string `a_namespace' may be changed during lifetime of
			-- the iterator we copy it into a STRING
			create namespace.make_from_string(a_namespace) 
			-- Note: GI_ITERATOR is implemented using and wraps
			-- g_irepository_get_n_infos and g_irepository_get_info
			n_infos := g_irepository_get_n_infos(repo_ptr,namespace.to_external)
			generation := 0 
			iterable_generation := 0
	end

feature {ANY}
	start is
		do
			index := 0
		end

	is_off: BOOLEAN is
		do
			Result := index<n_infos
		end

	item: GI_BASE_INFO is
		do
			Result := wrapper(g_irepository_get_info(repo_ptr,namespace.to_external,index))
		end

	next is
		do
			index:=index+1
		end
feature {} -- Implementation
	repo_ptr: POINTER -- Pointer to the GIRepository
	namespace: STRING
	n_infos: INTEGER -- number of elements for `namespace'
	index: INTEGER -- current index
feature {ANY} 
	generation: INTEGER
	iterable_generation: INTEGER 
end -- class NAMESPACE_ITERATOR

