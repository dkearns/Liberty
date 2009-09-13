class LIBERTY_AST_PARENT_RENAME

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_RENAME]
		export
			{ANY} valid_index, count, lower, upper, item
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {ANY}
	name: STRING is "Parent_Rename"

feature {ANY}
	accept (visitor: VISITOR) is
		local
			v: LIBERTY_AST_PARENT_RENAME_VISITOR
		do
			v ::= visitor
			v.visit_liberty_ast_parent_rename(Current)
		end

end