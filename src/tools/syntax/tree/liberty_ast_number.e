class LIBERTY_AST_NUMBER

inherit
	EIFFEL_TERMINAL_NODE_IMPL
		redefine
			accept
		end

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_NUMBER_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_number(Current)
		end

end