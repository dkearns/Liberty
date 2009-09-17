class EIFFEL_DEFAULT_NODE_FACTORY

inherit
	EIFFEL_NODE_FACTORY

create {ANY}
	make

feature {EIFFEL_GRAMMAR}
	list (name: STRING): EIFFEL_LIST_NODE is
		do
			create {EIFFEL_LIST_NODE_IMPL}Result.make(name)
		end

	non_terminal (name: STRING; names: TRAVERSABLE[STRING]): EIFFEL_NON_TERMINAL_NODE is
		do
			create {EIFFEL_NON_TERMINAL_NODE_IMPL}Result.make(name, names)
		end

	terminal (name: STRING; image: EIFFEL_IMAGE): EIFFEL_TERMINAL_NODE is
		do
			create {EIFFEL_TERMINAL_NODE_IMPL}Result.make(name, image)
		end

feature {}
	make is
		do
		end

end -- class EIFFEL_DEFAULT_NODE_FACTORY
