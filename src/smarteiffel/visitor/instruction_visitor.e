-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INSTRUCTION_VISITOR

inherit
	IFTHEN_VISITOR
	CREATE_INSTRUCTION_VISITOR
	REQUIRE_ASSERTION_VISITOR
	LOOP_INSTRUCTION_VISITOR
	ASSERTION_LIST_VISITOR
	ASSIGNMENT_ATTEMPT_VISITOR
	NO_INVARIANT_WRAPPER_VISITOR
	NON_WRITTEN_INSTRUCTION_VISITOR
	PRECURSOR_INSTRUCTION_VISITOR
	C_INLINE_VISITOR
	ASSIGNMENT_VISITOR
	IFTHENELSE_VISITOR
	DEBUG_COMPOUND_VISITOR
	INSPECT_STATEMENT_VISITOR
	PROCEDURE_CALL_VISITOR
	COMMENT_VISITOR
	COMPOUND_VISITOR
	CHECK_COMPOUND_VISITOR
	RETRY_INSTRUCTION_VISITOR
	WHEN_CLAUSE_VISITOR
	AGENT_INSTRUCTION_VISITOR

end -- class INSTRUCTION_VISITOR
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------