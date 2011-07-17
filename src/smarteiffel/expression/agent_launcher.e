-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class AGENT_LAUNCHER
	--
	-- Common tools for AGENT_INSTRUCTION and AGENT_EXPRESSION
	--

inherit
	VISITABLE

insert
	GLOBALS

feature {AGENT_LAUNCHER_VISITOR}
	agent_type: TYPE
			-- It's `canonical_type_mark' is the AGENT_TYPE_MARK associated with agent launcher (`item' or 
			-- `call').

	target: EXPRESSION
			-- Which is actually the agent object itself.

	fake_tuple: FAKE_TUPLE
			-- Which are actual open arguments of `target' .

	agent_args: AGENT_ARGS
			-- Computed using `fake_tuple'.

feature {ANY}
	use_current (type: TYPE): BOOLEAN is
		do
			if target.use_current(type) then
				Result := True
			else
				Result := fake_tuple.use_current(type)
			end
		end

	has_been_specialized: BOOLEAN is
		do
			Result := target.has_been_specialized and then fake_tuple.has_been_specialized
		end

	safety_check (type: TYPE) is
		do
			target.safety_check(type)
			fake_tuple.safety_check(type)
		end

feature {AGENT_LAUNCHER}
	specialize_2_check (type: TYPE) is
		local
			i, count: INTEGER; expression: EXPRESSION; formal, actual: TYPE; open: ARRAY[TYPE]
		do
			open := agent_type.open_arguments
			from
				i := 1
				count := fake_tuple.count
				if open = Void then
					if count > 0 then
						error_handler.add_position(fake_tuple.start_position)
						error_handler.append("To many actual arguments for agent call. %
					%(The agent you are trying to call has no arguments.)")
						error_handler.print_as_fatal_error
					end
				elseif count /= open.count then
					error_handler.add_position(fake_tuple.start_position)
					error_handler.append("Bad number of actual arguments for agent call. (The agent you %
                                    %are trying to call has ")
					error_handler.append_integer(open.count)
					error_handler.append(" argument")
					if open.count > 1 then
						error_handler.extend('s')
					end
					error_handler.append(". Its type is ")
					error_handler.append(agent_type.name.to_string)
					error_handler.append(".)")
					error_handler.print_as_fatal_error
				end
			until
				i > count
			loop
				formal := open.item(i)
				expression := fake_tuple.expression(i)
				if expression.is_void then
					if formal.is_expanded then
						error_handler.add_position(expression.start_position)
						error_handler.append("Incompatible actual argument for agent call. Cannot pass %
													%`Void' into formal argument of type ")
						error_handler.append(formal.name.to_string)
						error_handler.append(" because ")
						error_handler.append(formal.name.to_string)
						error_handler.append(" is expanded. (The whole type of the agent your are trying %
													%to launch is ")
						error_handler.append(agent_type.name.to_string)
						error_handler.append(".)")
						error_handler.print_as_fatal_error
					end
				else
					actual := expression.resolve_in(type)
					if actual = formal then
						-- No problem of conformance.
					elseif not actual.can_be_assigned_to(formal) then
						error_handler.add_position(expression.start_position)
						error_handler.append("Incompatible actual argument for agent call. Cannot pass ")
						error_handler.add_expression(expression)
						error_handler.append(" which is of type ")
						error_handler.append(actual.name.to_string)
						error_handler.append(" into formal argument of type ")
						error_handler.append(formal.name.to_string)
						error_handler.append(". (The whole type of the agent your are trying to launch is ")
						error_handler.append(agent_type.name.to_string)
						error_handler.append(".)")
						error_handler.print_as_fatal_error
					end
				end
				i := i + 1
			end
		end

feature {}
	agent_launcher_collect (type: TYPE) is
		local
			target_type, actual_type: TYPE; formal_types: ARRAY[TYPE]; i: INTEGER
			expression: EXPRESSION
		do
			agent_args := agent_pool.agent_launcher_collect(agent_type)
			target_type := target.collect(type)
			formal_types := target_type.open_arguments
			if formal_types /= Void then
				check
					formal_types.count = fake_tuple.count
					formal_types.lower = 1
				end
				from
					i := fake_tuple.count
				until
					i <= 0
				loop
					expression := fake_tuple.expression(i)
					if not expression.is_void then
						actual_type := expression.collect(type)
						assignment_handler.collect_normal(actual_type, formal_types.item(i))
					end
					i := i - 1
				end
			end
		end

	compile_to_c_void_call (type: TYPE; start_position: POSITION; item_or_call: STRING) is
		require
			not agent_pool.agent_creation_collected_flag
			; (item_or_call = as_item) or (item_or_call = as_call)
		local
			target_type: TYPE; feature_stamp: FEATURE_STAMP; fn: FEATURE_NAME
			void_call: VOID_CALL; void_proc_call: VOID_PROC_CALL
		do
			target_type := target.resolve_in(type)
			create fn.simple_feature_name(item_or_call, start_position)
			feature_stamp := target_type.lookup(fn)
			if item_or_call = as_item then
				create void_call.make(start_position, feature_stamp, target_type)
				void_call.compile_to_c(type)
			else
				create void_proc_call.make(start_position, feature_stamp, target_type)				
				void_proc_call.compile_to_c(type)
			end
		end
	
invariant
	agent_type.is_agent

	target /= Void

	fake_tuple /= Void

end -- class AGENT_LAUNCHER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------