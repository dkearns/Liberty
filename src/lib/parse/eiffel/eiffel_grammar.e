class EIFFEL_GRAMMAR
	--
	-- An extended Eiffel grammar. It supports all the SmartEiffel standard grammar with some extensions:
	-- * the '''indexing''' clause may be used in a feature (somewhat like ECMA's note)
	-- * the '''separate''' keyword is supported
	--

insert
	EIFFEL_NODE_HANDLER

create {ANY}
	make, make_default

feature {ANY}
	end_reached: BOOLEAN

feature {}
	the_table: PARSE_TABLE is
		do
			Result := {PARSE_TABLE << "Class", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Class_Header", "Obsolete", "Inherit", "Insert", "Class_Creation*", "Feature*", "Invariant", "KW end", "KW end of file" >> }, agent build_root >> };
											  "Class_Header", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Indexing", "Class_Marker", "KW class name", "Type_Parameters" >> }, Void >> };
											  "Indexing", {PARSE_NON_TERMINAL << epsilon, Void;
																							 {FAST_ARRAY[STRING] << "KW indexing", "Indexing_Clause*" >> }, Void >> };
											  "Indexing_Clause*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Indexing_Clause*");
																										{FAST_ARRAY[STRING] << "Indexing_Clause" >> }, agent build_new_list("Indexing_Clause", "Indexing_Clause*");
																										{FAST_ARRAY[STRING] << "Indexing_Clause", "Indexing_Clause*" >> }, agent build_continue_list("Indexing_Clause", 0, "Indexing_Clause*");
																										{FAST_ARRAY[STRING] << "Indexing_Clause", "KW ;", "Indexing_Clause*" >> }, agent build_continue_list("Indexing_Clause", 1, "Indexing_Clause*") >> };
											  "Indexing_Clause", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "KW :", "KW string" >> }, Void >> };
											  "Class_Marker", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW deferred", "KW class" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW expanded", "KW class" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW separate", "KW class" >> }, Void >> };
											  "Obsolete", {PARSE_NON_TERMINAL << epsilon, Void;
																							 {FAST_ARRAY[STRING] << "KW obsolete", "KW string" >> }, Void >> };
											  "Inherit", {PARSE_NON_TERMINAL << epsilon, Void;
																							{FAST_ARRAY[STRING] << "KW inherit", "Parent+" >> }, Void >> };
											  "Insert", {PARSE_NON_TERMINAL << epsilon, Void;
																						  {FAST_ARRAY[STRING] << "KW insert", "Parent+" >> }, Void >> };
											  "Parent+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Parent" >> }, agent build_new_list("Parent", "Parent+");
																							{FAST_ARRAY[STRING] << "Parent", "Parent+" >> }, agent build_continue_list("Parent", 0, "Parent+");
																							{FAST_ARRAY[STRING] << "Parent", "KW ;", "Parent+" >> }, agent build_continue_list("Parent", 1, "Parent+") >> };
											  "Parent", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition", "Parent_Clause" >> }, Void >> };
											  "Parent_Clause", {PARSE_NON_TERMINAL << epsilon, Void;
																									{FAST_ARRAY[STRING] << "KW end" >> }, Void;
																									{FAST_ARRAY[STRING] << "Parent_Rename", "Parent_Export", "Parent_Undefine", "Parent_Redefine", "KW end of parent clause" >> }, Void >> };
											  "Parent_Rename", {PARSE_NON_TERMINAL << epsilon, Void;
																									{FAST_ARRAY[STRING] << "KW rename", "Rename+" >> }, Void >> };
											  "Rename+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Rename" >> }, agent build_new_list("Rename", "Rename+");
																							{FAST_ARRAY[STRING] << "Rename", "Rename+" >> }, agent build_continue_list("Rename", 0, "Rename+");
																							{FAST_ARRAY[STRING] << "Rename", "KW ,", "Rename+" >> }, agent build_continue_list("Rename", 1, "Rename+") >> };
											  "Rename", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name", "KW as", "KW entity name" >> }, Void >> };
											  "Parent_Export", {PARSE_NON_TERMINAL << epsilon, Void;
																									{FAST_ARRAY[STRING] << "KW export", "Export+" >> }, Void >> };
											  "Export+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Export" >> }, agent build_new_list("Export", "Export+");
																							{FAST_ARRAY[STRING] << "Export", "Export+" >> }, agent build_continue_list("Export", 0, "Export+");
																							{FAST_ARRAY[STRING] << "Export", "KW ;", "Export+" >> }, agent build_continue_list("Export", 1, "Export+") >> };
											  "Export", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW {", "Clients", "KW }", "Feature_Name+" >> }, Void >> };
											  "Parent_Undefine", {PARSE_NON_TERMINAL << epsilon, Void;
																									  {FAST_ARRAY[STRING] << "KW undefine", "Feature_Name+" >> }, Void >> };
											  "Parent_Redefine", {PARSE_NON_TERMINAL << epsilon, Void;
																									  {FAST_ARRAY[STRING] << "KW redefine", "Feature_Name+" >> }, Void >> };
											  "Class_Creation*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Class_Creation*");
																									  {FAST_ARRAY[STRING] << "Class_Creation", "Class_Creation*" >> }, agent build_continue_list("Class_Creation", 0, "Class_Creation*") >> };
											  "Class_Creation", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW creation", "KW {", "Clients", "KW }", "Feature_Name+" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW create", "KW {", "Clients", "KW }", "Feature_Name+" >> }, Void >> };
											  "Eiffel_Block", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Obsolete", "Require", "Local_Block", "Do_Block", "Rescue_Block", "Ensure", "KW end" >> }, Void;
																								  {FAST_ARRAY[STRING] << "Obsolete", "External", "KW end" >> }, Void >> };
											  "Local_Block", {PARSE_NON_TERMINAL << epsilon, Void;
																								 {FAST_ARRAY[STRING] << "KW local", "Declaration+" >> }, Void >> };
											  "Declaration+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Declaration" >> }, agent build_new_list("Declaration", "Declaration+");
																								  {FAST_ARRAY[STRING] << "Declaration", "Declaration+" >> }, agent build_continue_list("Declaration", 0, "Declaration+");
																								  {FAST_ARRAY[STRING] << "Declaration", "KW ;", "Declaration+" >> }, agent build_continue_list("Declaration", 1, "Declaration+") >> };
											  "Declaration", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Variable+", "KW :", "Type_Definition" >> }, Void >> };
											  "Variable+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Variable" >> }, agent build_new_list("Variable", "Variable+");
																							  {FAST_ARRAY[STRING] << "Variable", "KW ,", "Variable+" >> }, agent build_continue_list("Variable", 1, "Variable+") >> };
											  "Variable", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
											  "Do_Block", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW do", "Instruction*" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW once", "Instruction*" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW deferred" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW attribute" >> }, Void >> };
											  "Rescue_Block", {PARSE_NON_TERMINAL << epsilon, Void;
																								  {FAST_ARRAY[STRING] << "KW rescue", "Instruction*" >> }, Void >> };
											  "Instruction*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Instruction*");
																								  {FAST_ARRAY[STRING] << "Instruction", "Instruction*" >> }, agent build_continue_list("Instruction", 0, "Instruction*");
																								  {FAST_ARRAY[STRING] << "Instruction", "KW ;", "Instruction*" >> }, agent build_continue_list("Instruction", 1, "Instruction*") >> };
											  "Instruction", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Assignment" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Call" >> }, Void;
																								 {FAST_ARRAY[STRING] << "If_Then_Else" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Inspect" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Loop" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Check" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Debug" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Old_Creation" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Creation" >> }, Void;
																								 {FAST_ARRAY[STRING] << "Retry" >> }, Void >> };
											  "Retry", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW retry" >> }, Void >> };
											  "Creation", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "Writable" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW create", "Writable" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW create", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void>> };
											  "Old_Creation", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW !", "KW !", "Writable" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW !", "KW !", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW !", "Type_Definition", "KW !", "Writable" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW !", "Type_Definition", "KW !", "Writable", "KW .", "KW entity name", "Actuals" >> }, Void >> };
											  "Assignment", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Writable", "KW :=", "Expression" >> }, Void;
																								{FAST_ARRAY[STRING] << "Writable", "KW ?=", "Expression" >> }, Void;
																								{FAST_ARRAY[STRING] << "Writable", "KW ::=", "Expression" >> }, Void >> };
											  "Call", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Target", "r10" >> }, Void >> };
											  "Target", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW (", "Expression", "KW )" >> }, Void;
																						  {FAST_ARRAY[STRING] << "KW Precursor", "Precursor_Type_Mark", "Actuals" >> }, Void;
																						  {FAST_ARRAY[STRING] << "KW Current" >> }, Void;
																						  {FAST_ARRAY[STRING] << "KW Result" >> }, Void;
																						  {FAST_ARRAY[STRING] << "KW entity name", "Actuals" >> }, Void >> };
											  "Writable", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW Result" >> }, Void;
																							 {FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
											  "Precursor_Type_Mark", {PARSE_NON_TERMINAL << epsilon, Void;
																											{FAST_ARRAY[STRING] << "KW {", "KW class name", "KW }" >> }, Void >> };
											  "If_Then_Else", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "If", "ElseIf*", "Else", "KW end" >> }, Void >> };
											  "If", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW if", "Expression", "KW then", "Instruction*" >> }, Void >> };
											  "ElseIf*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("ElseIf*");
																							{FAST_ARRAY[STRING] << "ElseIf", "ElseIf*" >> }, agent build_continue_list("ElseIf", 0, "ElseIf*") >> };
											  "ElseIf", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW elseif", "Expression", "KW then", "Instruction*" >> }, Void >> };
											  "Else", {PARSE_NON_TERMINAL << epsilon, Void;
																						{FAST_ARRAY[STRING] << "KW else", "Instruction*" >> }, Void >> };
											  "Inspect", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW inspect", "Expression", "When+", "Else", "KW end" >> }, Void >> };
											  "When+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "When" >> }, agent build_new_list("When", "When+");
																						 {FAST_ARRAY[STRING] << "When", "When+" >> }, agent build_continue_list("When", 0, "When+") >> };
											  "When", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW when", "When_Clause", "KW then", "Instruction*" >> }, Void >> };
											  "When_Clause", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "When_Slice" >> }, agent build_new_list("When_Slice", "When_Clause");
																								 {FAST_ARRAY[STRING] << "When_Slice", "KW ,", "When_Clause" >> }, agent build_continue_list("When_Slice", 1, "When_Clause") >> };
											  "When_Slice", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "When_Value" >> }, Void;
																								{FAST_ARRAY[STRING] << "When_Value", "KW ..", "When_Value" >> }, Void >> };
											  "When_Value", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW number" >> }, Void;
																								{FAST_ARRAY[STRING] << "KW character" >> }, Void;
																								{FAST_ARRAY[STRING] << "KW string" >> }, Void;
																								{FAST_ARRAY[STRING] << "KW entity name" >> }, Void >> };
											  "Loop", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "From", "Invariant", "Variant", "KW until", "Expression", "KW loop", "Instruction*", "KW end" >> }, Void >> };
											  "From", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW from", "Instruction*" >> }, Void >> };
											  "Actuals", {PARSE_NON_TERMINAL << epsilon, Void;
																							{FAST_ARRAY[STRING] << "KW (", "Actual+", "KW )" >> }, Void >> };
											  "Actual+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Actual" >> }, agent build_new_list("Actual", "Actual+");
																							{FAST_ARRAY[STRING] << "Actual", "KW ,", "Actual+" >> }, agent build_continue_list("Actual", 1, "Actual+") >> };
											  "Actual", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Expression" >>}, Void;
																						  {FAST_ARRAY[STRING] << "KW $", "KW entity name" >>}, Void >>};
											  "Expression", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Array" >> }, Void;
																								{FAST_ARRAY[STRING] << "Expression_No_Array" >> }, Void >> };
											  "Expression_No_Array", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e1", "r1" >> }, Void >> };
											  "e1", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e2", "r2" >> }, Void >> };
											  "e2", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e3", "r3" >> }, Void >> };
											  "e3", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e4", "r4" >> }, Void >> };
											  "e4", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e5", "r5" >> }, Void >> };
											  "e5", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e6", "r6" >> }, Void >> };
											  "e6", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e7", "r7" >> }, Void >> };
											  "e7", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e8", "r8" >> }, Void >> };
											  "e8", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW not", "e8" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW +", "e8" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW -", "e8" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW free operator", "e8" >> }, Void;
																					 {FAST_ARRAY[STRING] << "e9" >> }, Void >> };
											  "e9", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "e10" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW old", "e10" >> }, Void >> };
											  "e10", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Call" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW [", "KW ]" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW [", "Actual+", "KW ]" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW ?" >> }, Void;
																					  {FAST_ARRAY[STRING] << "Manifest_Or_Type_Test", "r10" >> }, Void;
																					  {FAST_ARRAY[STRING] << "Agent_Signature", "KW is", "Eiffel_Block", "Actuals" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW agent", "Expression" >> }, Void;
																					  {FAST_ARRAY[STRING] << "Creation_Expression" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW Void" >> }, Void;
																					  {FAST_ARRAY[STRING] << "KW entity name", "KW ?:=", "Expression" >> }, Void >> };
											  "Agent_Signature", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW agent" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW agent", "KW :", "Type_Definition" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW agent", "KW (", "Declaration+", "KW )" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW agent", "KW (", "Declaration+", "KW )", "KW :", "Type_Definition" >> }, Void >> };
											  "Creation_Expression", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW create", "KW {", "Type_Definition", "KW }", "r10" >> }, Void >> };
											  "Manifest_Or_Type_Test", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW number" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW True" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW False" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW character" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW string" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW once", "KW string" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW }" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW }", "KW ?:=", "Expression" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW number", "KW }" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "KW string", "KW }" >> }, Void; -- Liberty extension
																											  {FAST_ARRAY[STRING] << "KW {", "Type_Definition", "Manifest_Parameters", "Array", "KW }" >> }, Void >> };
											  "Manifest_Parameters", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Manifest_Parameters");
																											{FAST_ARRAY[STRING] << "Expression_No_Array" >> }, agent build_new_list("Expression_No_Array", "Manifest_Parameters");
																											{FAST_ARRAY[STRING] << "Expression_No_Array", "KW ,", "Manifest_Parameters" >> }, agent build_continue_list("Expression_No_Array", 1, "Manifest_Parameters") >> };
											  "r1", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW implies", "e1", "r1" >> }, Void >> };
											  "r2", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW or", "KW else", "e2", "r2" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW or", "e2", "r2" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW xor", "e2", "r2" >> }, Void >> };
											  "r3", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW and", "KW then", "e3", "r3" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW and", "e3", "r3" >> }, Void >> };
											  "r4", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW =", "e4", "r4" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW /=", "e4", "r4" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW <=", "e4", "r4" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW <", "e4", "r4" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW >=", "e4", "r4" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW >", "e4", "r4" >> }, Void >> };
											  "r5", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW +", "e5", "r5" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW -", "e5", "r5" >> }, Void >> };
											  "r6", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW *", "e6", "r6" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW /", "e6", "r6" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW //", "e6", "r6" >> }, Void;
																					 {FAST_ARRAY[STRING] << "KW \\", "e6", "r6" >> }, Void >> };
											  "r7", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW ^", "e7", "r7" >> }, Void >> };
											  "r8", {PARSE_NON_TERMINAL << epsilon, Void;
																					 {FAST_ARRAY[STRING] << "KW free operator", "e8", "r8" >> }, Void >> };
											  "r10", {PARSE_NON_TERMINAL << epsilon, Void;
																					  {FAST_ARRAY[STRING] << "KW .", "KW entity name", "Actuals", "r10" >> }, Void >> };
											  "Array", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW <<", "Array_Content", "KW >>" >> }, Void >> };
											  "Array_Content", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Array_Content");
																									{FAST_ARRAY[STRING] << "Expression" >> }, agent build_new_list("Expression", "Array_Content");
																									{FAST_ARRAY[STRING] << "Expression", "KW ,", "Array_Content" >> }, agent build_continue_list("Expression", 1, "Array_Content");
																									{FAST_ARRAY[STRING] << "Expression", "KW ;", "Array_Content" >> }, agent build_continue_list("Expression", 1, "Array_Content") >> };
											  "Feature*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Feature*");
																							 {FAST_ARRAY[STRING] << "Feature", "Feature*" >> }, agent build_continue_list("Feature", 0, "Feature*") >> };
											  "Feature", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW feature", "KW {", "Clients", "KW }", "Feature_Definition*" >> }, Void >> };
											  "Clients", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Clients");
																							{FAST_ARRAY[STRING] << "Client" >> }, agent build_new_list("Client", "Clients");
																							{FAST_ARRAY[STRING] << "Client", "KW ,", "Clients" >> }, agent build_continue_list("Client", 1, "Clients") >> };
											  "Client", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition" >> }, Void; -- Liberty extension
																						  {FAST_ARRAY[STRING] << "KW class name" >> }, Void >> };
											  "Feature_Definition*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Feature_Definition*");
																											{FAST_ARRAY[STRING] << "Feature_Definition", "Feature_Definition*" >> }, agent build_continue_list("Feature_Definition", 0, "Feature_Definition*") >> };
											  "Feature_Definition", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Indexing", "Signature" >> }, Void;
																										  {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW is", "Eiffel_Block" >> }, Void;
																										  {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW is", "Manifest_Or_Type_Test" >> }, Void;
																										  {FAST_ARRAY[STRING] << "Indexing", "Signature", "KW is", "KW unique" >> }, Void >> };
											  "Signature", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name+" >> }, Void;
																							  {FAST_ARRAY[STRING] << "Feature_Name+", "KW :", "Type_Definition" >> }, Void;
																							  {FAST_ARRAY[STRING] << "Feature_Name+", "KW (", "Declaration+", "KW )" >> }, Void;
																							  {FAST_ARRAY[STRING] << "Feature_Name+", "KW (", "Declaration+", "KW )", "KW :", "Type_Definition" >> }, Void >> };
											  "Feature_Name+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Feature_Name" >> }, agent build_new_list("Feature_Name", "Feature_Name+");
																									{FAST_ARRAY[STRING] << "Feature_Name", "KW ,", "Feature_Name+" >> }, agent build_continue_list("Feature_Name", 1, "Feature_Name+") >> };
											  "Feature_Name", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW frozen", "Feature_Name_Or_Alias" >> }, Void;
																								  {FAST_ARRAY[STRING] << "Feature_Name_Or_Alias" >> }, Void >> };
											  "Feature_Name_Or_Alias", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW entity name" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW infix", "KW string" >> }, Void;
																											  {FAST_ARRAY[STRING] << "KW prefix", "KW string" >> }, Void >> };
											  "External", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW external", "KW string", "Alias" >> }, Void >> };
											  "Alias", {PARSE_NON_TERMINAL << epsilon, Void;
																						 {FAST_ARRAY[STRING] << "KW alias", "KW string" >> }, Void >> };
											  "Type_Definition", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name", "Effective_Type_Parameters" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW separate", "KW class name", "Effective_Type_Parameters" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW like", "KW entity name", "r10" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW like", "KW Current", "r10" >> }, Void;
																									  {FAST_ARRAY[STRING] << "KW like", "KW Result", "r10" >> }, Void>> };
											  "Type_Parameters", {PARSE_NON_TERMINAL << epsilon, Void;
																									  {FAST_ARRAY[STRING] << "KW [", "Type_Parameter+", "KW ]" >> }, Void >> };
											  "Type_Parameter+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Parameter" >> }, agent build_new_list("Type_Parameter", "Type_Parameter+");
																									  {FAST_ARRAY[STRING] << "Type_Parameter", "KW ,", "Type_Parameter+" >> }, agent build_continue_list("Type_Parameter", 1, "Type_Parameter+") >> };
											  "Type_Parameter", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW class name" >> }, Void;
																									 {FAST_ARRAY[STRING] << "KW class name", "KW ->", "Type_Definition" >> }, Void >> };
											  "Effective_Type_Parameters", {PARSE_NON_TERMINAL << epsilon, Void;
																									  {FAST_ARRAY[STRING] << "KW [", "Effective_Type_Parameter+", "KW ]" >> }, Void >> };
											  "Effective_Type_Parameter+", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Effective_Type_Parameter" >> }, agent build_new_list("Effective_Type_Parameter", "Effective_Type_Parameter+");
																									  {FAST_ARRAY[STRING] << "Effective_Type_Parameter", "KW ,", "Effective_Type_Parameter+" >> }, agent build_continue_list("Effective_Type_Parameter", 1, "Effective_Type_Parameter+") >> };
											  "Effective_Type_Parameter", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Type_Definition" >> }, Void >> };
											  "Invariant", {PARSE_NON_TERMINAL << epsilon, Void;
																							  {FAST_ARRAY[STRING] << "KW invariant", "Assertion*" >> }, Void >> };
											  "Require", {PARSE_NON_TERMINAL << epsilon, Void;
																							{FAST_ARRAY[STRING] << "Require_Else", "Assertion*" >> }, Void >> };
											  "Require_Else", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW require" >> }, Void;
																								  {FAST_ARRAY[STRING] << "KW require", "KW then" >> }, Void; -- *** Liberty extension
																								  {FAST_ARRAY[STRING] << "KW require", "KW else" >> }, Void >> };
											  "Ensure", {PARSE_NON_TERMINAL << epsilon, Void;
																						  {FAST_ARRAY[STRING] << "Ensure_Then", "Assertion*" >> }, Void >> };
											  "Ensure_Then", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW ensure" >> }, Void;
																								 {FAST_ARRAY[STRING] << "KW ensure", "KW then" >> }, Void >> };
											  "Check", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW check", "Assertion*", "KW end" >> }, Void >> };
											  "Debug", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "KW debug", "Debug_Keys", "Instruction*", "KW end" >> }, Void >> };
											  "Debug_Keys", {PARSE_NON_TERMINAL << epsilon, Void;
																								{FAST_ARRAY[STRING] << "KW (", "Debug_Key*", "KW )" >> }, Void >> };
											  "Debug_Key*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Debug_Key*");
																								{FAST_ARRAY[STRING] << "KW string", "KW ,", "Debug_Key*" >> }, agent build_continue_list("KW string", 1, "Debug_Key*") >> };
											  "Variant", {PARSE_NON_TERMINAL << epsilon, Void;
																							{FAST_ARRAY[STRING] << "KW variant", "Expression" >> }, Void >> };
											  "Assertion*", {PARSE_NON_TERMINAL << epsilon, agent build_empty_list("Assertion*");
																								{FAST_ARRAY[STRING] << "Assertion", "Assertion*" >> }, agent build_continue_list("Assertion", 0, "Assertion*");
																								{FAST_ARRAY[STRING] << "Assertion", "KW ;", "Assertion*" >> }, agent build_continue_list("Assertion", 1, "Assertion*") >> };
											  "Assertion", {PARSE_NON_TERMINAL << {FAST_ARRAY[STRING] << "Assertion_Tag", "Expression" >> }, Void >> };
											  "Assertion_Tag", {PARSE_NON_TERMINAL << epsilon, Void;
																									{FAST_ARRAY[STRING] << "KW entity name", "KW :" >> }, Void >> };
											  "KW as", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "as"), Void);
											  "KW creation", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "creation"), Void);
											  "KW class", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "class"), Void);
											  "KW insert", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "insert"), Void);
											  "KW inherit", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "inherit"), Void);
											  "KW obsolete", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "obsolete"), Void);
											  "KW separate", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "separate"), Void);
											  "KW expanded", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "expanded"), Void);
											  "KW string", create {PARSE_TERMINAL}.make(agent parse_string, Void);
											  "KW entity name", create {PARSE_TERMINAL}.make(agent parse_entity_name, Void);
											  "KW class name", create {PARSE_TERMINAL}.make(agent parse_class_name, Void);
											  "KW number", create {PARSE_TERMINAL}.make(agent parse_number, Void);
											  "KW character", create {PARSE_TERMINAL}.make(agent parse_character, Void);
											  "KW agent", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "agent"), Void);
											  "KW parser", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "parser"), Void);
											  "KW grammar", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "grammar"), Void);
											  "KW feature", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "feature"), Void);
											  "KW indexing", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "indexing"), Void);
											  "KW is", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "is"), Void);
											  "KW external", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "external"), Void);
											  "KW alias", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "alias"), Void);
											  "KW infix", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "infix"), Void);
											  "KW prefix", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "prefix"), Void);
											  "KW unique", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "unique"), Void);
											  "KW frozen", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "frozen"), Void);
											  "KW end", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "end"), Void);
											  "KW rename", create {PARSE_TERMINAL}.make(agent parse_parent_clause(?, "rename"), Void);
											  "KW redefine", create {PARSE_TERMINAL}.make(agent parse_parent_clause(?, "undefine"), Void);
											  "KW undefine", create {PARSE_TERMINAL}.make(agent parse_parent_clause(?, "redefine"), Void);
											  "KW export", create {PARSE_TERMINAL}.make(agent parse_parent_clause(?, "export"), Void);
											  "KW end of parent clause", create {PARSE_TERMINAL}.make(agent parse_end_of_parent_clause, Void);
											  "KW local", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "local"), Void);
											  "KW deferred", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "deferred"), Void);
											  "KW attribute", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "attribute"), Void);
											  "KW do", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "do"), Void);
											  "KW once", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "once"), Void);
											  "KW retry", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "retry"), Void);
											  "KW rescue", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "rescue"), Void);
											  "KW create", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "create"), Void);
											  "KW if", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "if"), Void);
											  "KW then", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "then"), Void);
											  "KW elseif", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "elseif"), Void);
											  "KW else", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "else"), Void);
											  "KW inspect", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "inspect"), Void);
											  "KW when", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "when"), Void);
											  "KW from", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "from"), Void);
											  "KW until", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "until"), Void);
											  "KW loop", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "loop"), Void);
											  "KW not", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "not"), Void);
											  "KW and", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "and"), Void);
											  "KW or", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "or"), Void);
											  "KW xor", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "xor"), Void);
											  "KW implies", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "implies"), Void);
											  "KW old", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "old"), Void);
											  "KW require", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "require"), Void);
											  "KW ensure", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "ensure"), Void);
											  "KW invariant", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "invariant"), Void);
											  "KW variant", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "variant"), Void);
											  "KW check", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "check"), Void);
											  "KW debug", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "debug"), Void);
											  "KW Precursor", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "Precursor"), Void);
											  "KW Current", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "Current"), Void);
											  "KW Result", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "Result"), Void);
											  "KW True", create {PARSE_TERMINAL}.make(agent parse_boolean(?, "True"), Void);
											  "KW False", create {PARSE_TERMINAL}.make(agent parse_boolean(?, "False"), Void);
											  "KW Void", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "Void"), Void);
											  "KW like", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "like"), Void);
											  "KW !", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "!"), Void);
											  "KW ?", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "?"), Void);
											  "KW :", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ":"), Void);
											  "KW :=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ":="), Void);
											  "KW ::=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "::="), Void);
											  "KW ?:=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "?:="), Void);
											  "KW ?=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "?="), Void);
											  "KW |", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "|"), Void);
											  "KW ;", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ";"), Void);
											  "KW (", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "("), Void);
											  "KW )", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")"), Void);
											  "KW )*", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")*"), Void);
											  "KW )+", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")+"), Void);
											  "KW )?", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ")?"), Void);
											  "KW [", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "["), Void);
											  "KW ]", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "]"), Void);
											  "KW {", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "{"), Void);
											  "KW }", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "}"), Void);
											  "KW .", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "."), Void);
											  "KW ,", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ","), Void);
											  "KW =", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "="), Void);
											  "KW /=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "/="), Void);
											  "KW <=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<="), Void);
											  "KW <", create {PARSE_TERMINAL}.make(agent parse_lt, Void);
											  "KW >=", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">="), Void);
											  "KW >", create {PARSE_TERMINAL}.make(agent parse_gt, Void);
											  "KW +", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "+"), Void);
											  "KW -", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "-"), Void);
											  "KW *", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "*"), Void);
											  "KW //", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "//"), Void);
											  "KW \\", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "\\"), Void);
											  "KW /", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "/"), Void);
											  "KW ^", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "^"), Void);
											  "KW <<", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "<<"), Void);
											  "KW >>", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ">>"), Void);
											  "KW ->", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "->"), Void);
											  "KW ..", create {PARSE_TERMINAL}.make(agent parse_keyword(?, ".."), Void);
											  "KW $", create {PARSE_TERMINAL}.make(agent parse_keyword(?, "$"), Void);
											  "KW free operator", create {PARSE_TERMINAL}.make(agent parse_freeop, Void);
											  "KW end of file", create {PARSE_TERMINAL}.make(agent parse_end, Void) >> }
		end

feature {ANY}
	table: PARSE_TABLE is
		once
			Result := the_table
			Result.set_default_tree_builders(agent build_non_terminal, agent build_terminal)
		end

	display (output: OUTPUT_STREAM) is
		do
			if not stack.is_empty then
				stack.first.display(output, 0, Void)
			end
		end

	generate (o: OUTPUT_STREAM) is
		do
			if not stack.is_empty then
				stack.first.generate(o)
			end
		end

	root_node: EIFFEL_NODE is
		do
			if not stack.is_empty then
				Result := stack.first
			end
		end

	reset is
		do
			stack.clear_count
			create position
			end_reached := False
		ensure
			stack.is_empty
			not end_reached
		end

feature {}
	epsilon: FAST_ARRAY[STRING] is
		once
			create Result.with_capacity(0)
		end

	is_a_keyword (id: STRING): BOOLEAN is
		do
			inspect
				id
			when "agent", "feature", "class", "obsolete", "insert", "inherit", "separate", "creation", "redefine", "undefine", "rename", "as", "export", "create", "is", "end", "local", "deferred", "attribute", "do", "once", "retry", "rescue", "if", "then", "elseif", "else", "inspect", "when", "from", "until", "loop", "not", "and", "or", "xor", "implies", "old", "require", "ensure", "invariant", "variant", "check", "debug", "Precursor", "Current", "Result", "True", "False", "Void", "like", "unique", "frozen", "infix", "prefix", "alias", "external", "indexing" then
				Result := True
			else
				check
					not Result
				end
			end
		end

	is_a_free_operator (op: STRING): BOOLEAN is
		require
			op.count > 0
		local
			i: INTEGER
		do
			inspect op
			when "<<", ">>", "=" then
				Result := False
			else
				inspect
					op.first
				when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~' then
					Result := True
					from
						i := 2
					until
						i > op.count
					loop
						inspect
							op.item(i)
						when '.', '?', '{', '}' then
							Result := False
						when '+', '-', '*', '/', '\', '=', '<', '>', '@', '#', '|', '&', '~', '^' then
							Result := True
						else
							Result := False
							i := op.count + 1
						end
						i := i + 1
					end
				else
					check
						not Result
					end
				end
			end
		end

	last_blanks: STRING is ""

	skip_blank (buffer: MINI_PARSER_BUFFER): BOOLEAN is
		local
			old_position: like position
		do
			if not buffer.end_reached then
				old_position := position
				if buffer.current_character.is_separator then
					last_blanks.extend(buffer.current_character)
					next_character(buffer)
					Result := True
				elseif buffer.current_character = '-' then
					next_character(buffer)
					if buffer.current_character /= '-' then
						restore(buffer, old_position)
					else
						Result := True
						last_blanks.extend('-')
						last_blanks.extend('-')
						from
							next_character(buffer)
						until
							buffer.end_reached or else buffer.current_character = '%N'
						loop
							last_blanks.extend(buffer.current_character)
							next_character(buffer)
						end
						if not buffer.end_reached then
							check
								buffer.current_character = '%N'
							end
							last_blanks.extend('%N')
							next_character(buffer) -- skip the '%N'
						end
					end
				end
			end
		ensure
			not Result implies buffer.current_index = old buffer.current_index
		end

	skip_blanks (buffer: MINI_PARSER_BUFFER) is
		do
			from
				last_blanks.clear_count
			until
				not skip_blank(buffer)
			loop
			end
		ensure
			buffer.current_index = last_blanks.count + old buffer.current_index
		end

	parse_string (buffer: MINI_PARSER_BUFFER): TYPED_EIFFEL_IMAGE[STRING] is
			-- the algorithm is a bit less strict than SmartEiffel's
		local
			old_position, start_position: like position; i, t, state, code, scale: INTEGER; c: CHARACTER; image, parsed, end_tag: STRING; unicode: BOOLEAN
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached and then buffer.current_character = 'U' then
				image := once ""
				image.copy(once "U")
				next_character(buffer)
				skip_blanks(buffer)
				if buffer.end_reached or else buffer.current_character /= '"' then
					image := Void
				end
			end
			if not buffer.end_reached and then buffer.current_character = '"' then
				if image = Void then
					image := once ""
					image.clear_count
				end
				parsed := once ""
				parsed.clear_count
				image.extend('"')
				from
					next_character(buffer)
				until
					state < 0 or else buffer.end_reached
				loop
					c := buffer.current_character
					inspect state
					when 0 then
						-- normal simple string state
						inspect
							c
						when '"' then
							image.extend('"')
							state := -1
						when '%%' then
							image.extend('%%')
							state := 1
						when '[' then
							image.extend('[')
							state := 10
						when '{' then
							image.extend('{')
							state := 11
						when '%N', '%R' then
							image := Void
							state := -1
						else
							image.extend(c)
							parsed.extend(c)
						end
					when 1 then
						-- just after a % in a simple string
						inspect
							c
						when '%R' then
							parsed.extend('%R')
							image.extend(c)
							state := 2
						when '%N' then
							parsed.extend('%N')
							image.extend(c)
							state := 2
						when 'A' then
							parsed.extend('%A')
							image.extend(c)
							state := 0
						when 'B' then
							parsed.extend('%B')
							image.extend(c)
							state := 0
						when 'C' then
							parsed.extend('%C')
							image.extend(c)
							state := 0
						when 'D' then
							parsed.extend('%D')
							image.extend(c)
							state := 0
						when 'F' then
							parsed.extend('%F')
							image.extend(c)
							state := 0
						when 'H' then
							parsed.extend('%H')
							image.extend(c)
							state := 0
						when 'L' then
							parsed.extend('%L')
							image.extend(c)
							state := 0
						when 'N' then
							parsed.extend('%N')
							image.extend(c)
							state := 0
						when 'Q' then
							parsed.extend('%Q')
							image.extend(c)
							state := 0
						when 'R' then
							parsed.extend('%R')
							image.extend(c)
							state := 0
						when 'S' then
							parsed.extend('%S')
							image.extend(c)
							state := 0
						when 'T' then
							parsed.extend('%T')
							image.extend(c)
							state := 0
						when 'U' then
							parsed.extend('%U')
							image.extend(c)
							state := 0
						when 'V' then
							parsed.extend('%V')
							image.extend(c)
							state := 0
						when '%%' then
							parsed.extend('%%')
							image.extend(c)
							state := 0
						when '%'' then
							parsed.extend('%'')
							image.extend(c)
							state := 0
						when '%"' then
							parsed.extend('%"')
							image.extend(c)
							state := 0
						when '(' then
							parsed.extend('%(')
							image.extend(c)
							state := 0
						when ')' then
							parsed.extend('%)')
							image.extend(c)
							state := 0
						when '<' then
							parsed.extend('%<')
							image.extend(c)
							state := 0
						when '>' then
							parsed.extend('%>')
							image.extend(c)
							state := 0
						when '/' then
							image.extend(c)
							code := 0
							scale := 10
							unicode := False
							state := 3
						else
							-- unknown escape character
							image := Void
							state := -1
						end
					when 2 then
						inspect
							c
						when '%R', '%N', '%T', ' ' then
							parsed.extend(c)
							image.extend(c)
						when '%%' then
							image.extend(c)
							state := 0
						else
							image := Void
							state := -1
						end
					when 3 then
						inspect c
						when '0'..'9' then
							code := code * scale + (c.code - '0'.code)
						when 'x' then
							scale := 16
							image.extend(c)
						when 'U' then
							scale := 16
							unicode := True
							image.extend(c)
						when '/' then
							if unicode then
								parsed.extend(code.to_character)
							else
								-- parsed.extend(code.to_unicode_character) -- *** TODO unicode
							end
							image.extend('/')
							state := 0
						else
							image := Void
							state := -1
						end
					when 10 then
						-- maybe the start of a multi-line "[...]" string?
						check
							end_tag = Void
							image.count >= 2
						end
						inspect
							c
						when '%N', '%R' then
							end_tag := once ""
							end_tag.copy(image)
							end_tag.put(']', end_tag.lower)
							end_tag.put('"', end_tag.upper)
							image.extend(c)
							state := 12
							t := end_tag.lower
						when '"' then
							image.extend('"')
							state := -1
						else
							image.extend(c)
							state := 0
						end
					when 11 then
						-- maybe the start of a multi-line "{...}" string?
						check
							end_tag = Void
							image.count >= 2
						end
						inspect
							c
						when '%N', '%R' then
							end_tag := once ""
							end_tag.copy(image)
							end_tag.put('}', end_tag.lower)
							end_tag.put('"', end_tag.upper)
							image.extend(c)
							state := 12
							t := end_tag.lower
						when '"' then
							image.extend('"')
							state := -1
						else
							image.extend(c)
							state := 0
						end
					when 12 then
						-- in a multi-line string
						check
							end_tag.count >= 2
							end_tag.valid_index(t)
						end
						inspect
							c
						when '"' then
							image.extend('"')
							if t = end_tag.upper then
								-- check that the beginning of the line contains only spaces
								from
									i := image.upper - end_tag.count
									check
										image.count > 2 * end_tag.count
										i > end_tag.count
									end
								until
									state = -1 or else i < end_tag.count
								loop
									inspect
										image.item(i)
									when '%R', '%N' then
										-- we found the end tag
										state := -1
									when ' ', '%T' then
										-- still checking
										i := i - 1
									else
										-- not the end of the string yet because the end tag is not alone on the line (except for leading spaces)
										i := 0
									end
								end
							end
							t := end_tag.lower
						else
							if c = end_tag.item(t) then
								t := t + 1
							else
								if t > end_tag.lower then
									parsed.append(end_tag.substring(1, t))
								end
								parsed.extend(c)
								t := end_tag.lower
							end
							image.extend(c)
						end
					end
					next_character(buffer)
				end
				if image /= Void then
					create Result.make(image.twin, parsed.twin, last_blanks.twin, start_position)
				else
					restore(buffer, old_position)
				end
			end
		ensure
			Result /= Void implies (
					(Result.image.count >= 2 and then Result.image.first = '"')
						or else
					(Result.image.count >= 3 and then Result.image.first = 'U' and then Result.image.item(2) = '"')
				) and then Result.image.last = '"'
		end

	is_entity_name_start (c: CHARACTER): BOOLEAN is
		do
			inspect
				c
			when 'A' .. 'Z', 'a' .. 'z' then
				Result := True
			else
				check
					not Result
				end
			end
		end

	is_entity_name_part (c: CHARACTER): BOOLEAN is
		do
			inspect
				c
			when 'a' .. 'z', '0' .. '9', '_' then
				Result := True
			else
				check
					not Result
				end
			end
		end

	parse_entity_name (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached and then is_entity_name_start(buffer.current_character) then
				image := once ""
				image.clear_count
				from
					image.extend(buffer.current_character)
					next_character(buffer)
				until
					buffer.end_reached or else not is_entity_name_part(buffer.current_character)
				loop
					image.extend(buffer.current_character)
					next_character(buffer)
				end
			end
			if image = Void or else is_a_keyword(image) then
				restore(buffer, old_position)
			else
				create Result.make(image.twin, last_blanks.twin, start_position)
			end
		end

	is_class_name_start (c: CHARACTER): BOOLEAN is
		do
			inspect
				c
			when 'A' .. 'Z' then
				Result := True
			else
				check
					not Result
				end
			end
		end

	is_class_name_part (c: CHARACTER): BOOLEAN is
		do
			inspect
				c
			when 'A' .. 'Z', '0' .. '9', '_' then
				Result := True
			else
				check
					not Result
				end
			end
		end

	parse_class_name (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached and then is_class_name_start(buffer.current_character) then
				image := once ""
				image.clear_count
				from
					image.extend(buffer.current_character)
					next_character(buffer)
				until
					buffer.end_reached or else not is_class_name_part(buffer.current_character)
				loop
					image.extend(buffer.current_character)
					next_character(buffer)
				end
			end
			if image = Void or else is_a_keyword(image) then
				restore(buffer, old_position)
			else
				create Result.make(image.twin, last_blanks.twin, start_position)
			end
		end

	keyword_image (buffer: MINI_PARSER_BUFFER; keyword: STRING): STRING is
		local
			old_position, start_position: like position; i: INTEGER; c: CHARACTER
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			from
				Result := keyword
				i := keyword.lower
			until
				i > keyword.upper or else Result = Void
			loop
				if buffer.current_character = keyword.item(i) then
					next_character(buffer)
					i := i + 1
				else
					restore(buffer, old_position)
					Result := Void
				end
			end
			if buffer.end_reached  then
				-- note that the end was reached with a completely correct parsing, just incomplete
				end_reached := True
			else
				-- be sure that the keyword is not just the prefix of another word
				c := buffer.current_character
				if not c.is_separator then
					if keyword.first.is_letter_or_digit then
						if c.is_letter_or_digit or else c = '_' then
							Result := Void
							restore(buffer, old_position)
						end
					end
				end
			end
		end

	parse_keyword (buffer: MINI_PARSER_BUFFER; keyword: STRING): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			image := keyword_image(buffer, keyword)
			if image /= Void then
				-- `image' may be shared here
				create Result.make(image, last_blanks.twin, start_position)
			else
				restore(buffer, old_position)
			end
		end

	-- This "in parent clause" features handle the ambiguity of the following construction:
	--   class FOO
	--   inherit
	--      BAR
	--   end

	in_parent_clause: BOOLEAN

	parse_parent_clause (buffer: MINI_PARSER_BUFFER; keyword: STRING): UNTYPED_EIFFEL_IMAGE is
		do
			Result := parse_keyword(buffer, keyword)
			if Result /= Void then
				in_parent_clause := True
			end
		ensure
			Result /= Void implies in_parent_clause
		end

	parse_end_of_parent_clause (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		do
			if in_parent_clause then
				Result := parse_keyword(buffer, once "end")
				in_parent_clause := False
			end
		ensure
			not in_parent_clause
		end

	parse_lt (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if buffer.current_character = '<' then
				next_character(buffer)
				if buffer.current_character /= '<' then
					image := once "<"
				else
					restore(buffer, old_position)
				end
			end
			if image /= Void then
				-- `image' may be shared here
				create Result.make(image, last_blanks.twin, start_position)
			end
		end

	parse_gt (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if buffer.current_character = '>' then
				next_character(buffer)
				if buffer.current_character /= '>' then
					image := once ">"
				else
					restore(buffer, old_position)
				end
			end
			if image /= Void then
				-- `image' may be shared here
				create Result.make(image, last_blanks.twin, start_position)
			end
		end

	parse_freeop (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached and then not buffer.current_character.is_letter_or_digit and then not buffer.current_character.is_separator then
				image := once ""
				image.clear_count
				from
					image.extend(buffer.current_character)
					next_character(buffer)
				until
					buffer.end_reached or else buffer.current_character.is_letter_or_digit or else buffer.current_character.is_separator
				loop
					image.extend(buffer.current_character)
					next_character(buffer)
				end
				if is_a_free_operator(image) then
					create Result.make(image.twin, last_blanks.twin, start_position)
				else
					restore(buffer, old_position)
				end
			end
		end

	parse_boolean (buffer: MINI_PARSER_BUFFER; expected: STRING): TYPED_EIFFEL_IMAGE[BOOLEAN] is
		require
			expected.is_boolean
		local
			old_position, start_position: like position; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			image := keyword_image(buffer, expected)
			if image /= Void then
				-- `image' may be shared here
				create Result.make(image, False, last_blanks.twin, start_position)
			else
				restore(buffer, old_position)
			end
		ensure
			Result /= Void implies Result.decoded = expected.to_boolean
		end

	parse_number (buffer: MINI_PARSER_BUFFER): EIFFEL_IMAGE is
		local
			old_position, start_position: like position; state: INTEGER; c: CHARACTER; image: STRING
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached then
				image := once ""
				image.clear_count
				from
					c := buffer.current_character
					image.extend(c)
					next_character(buffer)
					inspect c
					when '+' then
						c := buffer.current_character
						image.extend(c)
						next_character(buffer)
						if buffer.current_character = '0' then
							state := 1
						end
					when '-' then
						c := buffer.current_character
						image.extend(c)
						next_character(buffer)
						if buffer.current_character = '0' then
							state := 1
						end
					when '0' then
						state := 1
					when '1'..'9', '.' then
						-- nothing; `state' stays 0
					else
						image := Void
						state := -1
					end
				until
					buffer.end_reached or else state < 0
				loop
					c := buffer.current_character
					inspect
						state
					when 0 then
						-- decimal integer
						inspect
							c
						when '0' .. '9', '_' then
							image.extend(c)
						when '.' then
							image.extend(c)
							state := 3
						when 'e', 'E' then
							image.extend(c)
							state := 4
						else
							state := -1
						end
					when 1 then
						-- first character was zero; just read the second.
						inspect
							c
						when 'x', 'X' then
							image.extend(c)
							state := 2
						when '0' .. '9', '_' then
							image.extend(c)
							state := 0
						when '.' then
							image.extend(c)
							state := 3
						else
							state := -1
						end
					when 2 then
						-- hexadecimal integer
						inspect
							c
						when '0' .. '9', '_', 'A' .. 'F', 'a' .. 'f' then
							image.extend(c)
						else
							state := -1
						end
					when 3 then
						-- fractional part
						inspect
							c
						when '0' .. '9', '_' then
							image.extend(c)
						else
							if image.last = '.' then
								image.remove_last
								buffer.set_current_index(buffer.current_index - 1)
							end
							state := -1
						end
					when 4 then
						-- just read the 'e' of the exponential part
						inspect
							c
						when '+', '-', '0' .. '9' then
							image.extend(c)
							state := 5
						else
							image.remove_last
							buffer.set_current_index(buffer.current_index - 1)
							state := -1
						end
					when 5 then
						-- exponential part
						inspect
							c
						when '0' .. '9', '_' then
							image.extend(c)
						else
							state := -1
						end
					end
					if state >= 0 then
						next_character(buffer)
					end
				end
				if not buffer.end_reached and then buffer.current_character.is_letter then
					image := Void
				end
			end
			if image = Void then
				restore(buffer, old_position)
			else
				if image.is_integer_64 then
					create {TYPED_EIFFEL_IMAGE[INTEGER_64]}Result.make(image.twin, image.to_integer_64, last_blanks.twin, start_position)
				elseif image.is_real then
					create {TYPED_EIFFEL_IMAGE[REAL]}Result.make(image.twin, image.to_real, last_blanks.twin, start_position)
				else
					create {UNTYPED_EIFFEL_IMAGE}Result.make(image.twin, last_blanks.twin, start_position)
				end
			end
		end

	parse_character (buffer: MINI_PARSER_BUFFER): TYPED_EIFFEL_IMAGE[CHARACTER] is
		local
			old_position, start_position: like position; c, character: CHARACTER; image: STRING; invalid_character: BOOLEAN
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if not buffer.end_reached and then buffer.current_character = '%'' then
				image := once "...."
				image.clear_count
				image.extend('%'')
				next_character(buffer)
				if buffer.end_reached then
					image := Void
				else
					c := buffer.current_character
					next_character(buffer)
					if c /= '%%' then
						character := c
					else
						image.extend('%%')
						if buffer.end_reached then
							image := Void
						else
							c := buffer.current_character
							inspect c
							when '%R' then
								character := '%R'
							when '%N' then
								character := '%N'
							when 'A' then
								character := '%A'
							when 'B' then
								character := '%B'
							when 'C' then
								character := '%C'
							when 'D' then
								character := '%D'
							when 'F' then
								character := '%F'
							when 'H' then
								character := '%H'
							when 'L' then
								character := '%L'
							when 'N' then
								character := '%N'
							when 'Q' then
								character := '%Q'
							when 'R' then
								character := '%R'
							when 'S' then
								character := '%S'
							when 'T' then
								character := '%T'
							when 'U' then
								character := '%U'
							when 'V' then
								character := '%V'
							when '%%' then
								character := '%%'
							when '%'' then
								character := '%''
							when '%"' then
								character := '%"'
							when '(' then
								character := '%('
							when ')' then
								character := '%)'
							when '<' then
								character := '%<'
							when '>' then
								character := '%>'
							when '/' then
								not_yet_implemented -- need to parse a number
							else
								-- unknown escape character
								invalid_character := True
							end
							next_character(buffer)
						end
					end
					if invalid_character or else buffer.end_reached or else buffer.current_character /= '%'' then
						image := Void
					else
						image.extend(c)
						image.extend('%'')
						next_character(buffer)
					end
				end
			end
			if image = Void then
				restore(buffer, old_position)
			else
				create Result.make(image.twin, character, last_blanks.twin, position)
			end
		end

	parse_end (buffer: MINI_PARSER_BUFFER): UNTYPED_EIFFEL_IMAGE is
		local
			old_position, start_position: like position
		do
			old_position := position
			skip_blanks(buffer)
			start_position := position
			if buffer.end_reached then
				create Result.make(once "", last_blanks.twin, start_position)
			else
				restore(buffer, old_position)
			end
		end

feature {}
	stack: FAST_ARRAY[EIFFEL_NODE]

	show_stack is
		local
			i: INTEGER
		do
			std_error.put_line(once "--8<-------- <start stack>")
			from
				i := stack.lower
			until
				i > stack.upper
			loop
				std_error.put_integer(i)
				std_error.put_string(once ":%T")
				std_error.put_line(stack.item(i).name)
				i := i + 1
			end
			std_error.put_line(once "-------->8-- <end stack>")
		end

	stack_matches (node_content: TRAVERSABLE[STRING]): BOOLEAN is
		local
			i: INTEGER
		do
			Result := node_content /= Void and then stack.count >= node_content.count
			from
				i := 0
			until
				not Result or else i >= node_content.count
			loop
				Result := node_content.item(i + node_content.lower).is_equal(stack.item(stack.upper - node_content.count + 1 + i).name)
				if not Result then
					sedb_breakpoint
				end
				i := i + 1
			end
		ensure
			used_only_in_assertions: Result
		end

	build_root (root_name: STRING; root_content: TRAVERSABLE[STRING]) is
		do
			build_non_terminal(root_name, root_content)
			debug ("parse/eiffel")
				std_error.put_line(once "Final AST:")
				display(std_error)
			end
		end

	build_non_terminal (node_name: STRING; node_content: TRAVERSABLE[STRING]) is
		require
			stack_matches(node_content)
		local
			i: INTEGER; new_node: EIFFEL_NON_TERMINAL_NODE; node: EIFFEL_NODE
		do
			debug ("parse/eiffel")
				std_error.put_string(once "Building non-terminal node: ")
				std_error.put_character('"')
				std_error.put_string(node_name)
				std_error.put_character('"')
				std_error.put_new_line
			end
			new_node := factory.non_terminal(node_name, node_content)
			from
				i := node_content.upper
			until
				i < node_content.lower
			loop
				node := stack.last
				stack.remove_last
				new_node.set(i, node)
				debug ("parse/eiffel")
					std_error.put_string(once "   aggregating: ")
					std_error.put_line(node_content.item(i))
				end
				i := i - 1
			end
			stack.add_last(new_node)
			debug ("parse/eiffel")
				show_stack
			end
		ensure
			node_content.count = old node_content.count
			stack.count = old stack.count - node_content.count + 1
			stack.last.name.is_equal(node_name)
		end

	build_terminal (node_name: STRING; node_image: PARSER_IMAGE) is
		local
			eiffel_image: EIFFEL_IMAGE
		do
			eiffel_image ::= node_image
			debug ("parse/eiffel")
				std_error.put_string(once "Building terminal node: ")
				std_error.put_character('"')
				std_error.put_string(node_name)
				std_error.put_string(once "%": ")
				std_error.put_line(eiffel_image.image)
			end
			stack.add_last(factory.terminal(node_name, eiffel_image))
			debug ("parse/eiffel")
				show_stack
			end
		ensure
			stack.count = old stack.count + 1
			stack.last.name.is_equal(node_name)
		end

	build_empty_list (list_name: STRING) is
		local
			list: EIFFEL_LIST_NODE
		do
			debug ("parse/eiffel")
				std_error.put_string(once "Building new empty list %"")
				std_error.put_string(list_name)
				std_error.put_character('"')
				std_error.put_character('%N')
			end
			list := factory.list(list_name)
			stack.add_last(list)
			debug ("parse/eiffel")
				show_stack
			end
		ensure
			stack.count = old stack.count + 1
			stack.last.name.is_equal(list_name)
		end

	build_new_list (atom_name, list_name: STRING) is
		require
			not stack.is_empty
			stack.last.name.is_equal(atom_name)
		local
			atom: EIFFEL_NODE; list: EIFFEL_LIST_NODE
		do
			atom := stack.last
			stack.remove_last
			debug ("parse/eiffel")
				std_error.put_string(once "Building new list %"")
				std_error.put_string(list_name)
				std_error.put_string(once "%" with one atom: atom should be %"")
				std_error.put_string(atom_name)
				std_error.put_character('"')
				std_error.put_character('%N')
				std_error.put_string(once "   Found atom: ")
				std_error.put_line(atom.name)
			end
			list := factory.list(list_name)
			list.add(atom)
			stack.add_last(list)
			debug ("parse/eiffel")
				show_stack
			end
		ensure
			stack.count = old stack.count
			stack.last.name.is_equal(list_name)
		end

	build_continue_list (atom_name: STRING; forget: INTEGER; list_name: STRING) is
		require
			stack.count >= forget + 2
			stack.item(stack.upper).name.is_equal(list_name)
			stack.item(stack.upper - 1 - forget).name.is_equal(atom_name)
		local
			atom: EIFFEL_NODE; list: EIFFEL_LIST_NODE; i: INTEGER; forgotten_nodes: FAST_ARRAY[EIFFEL_NODE]
		do
			atom := stack.last
			stack.remove_last
			check
				atom.name.is_equal(list_name)
			end
			list ::= atom
			if forget > 0 then
				create forgotten_nodes.make(forget)
				from
					i := forget - 1
				until
					i < 0
				loop
					forgotten_nodes.put(stack.last, i)
					stack.remove_last
					i := i - 1
				end
			end
			atom := stack.last
			stack.remove_last
			atom.set_forgotten(forgotten_nodes)
			check
				atom.name.is_equal(atom_name)
			end
			debug ("parse/eiffel")
				std_error.put_string(once "Building list %"")
				std_error.put_string(list_name)
				std_error.put_string(once "%" (continuation): atom should be %"")
				std_error.put_string(atom_name)
				std_error.put_character('"')
				std_error.put_character('%N')
				std_error.put_string(once "   Found list: ")
				std_error.put_line(list.name)
				std_error.put_string(once "   Found atom: ")
				std_error.put_line(atom.name)
			end
			list.add(atom)
			stack.add_last(list)
			debug ("parse/eiffel")
				show_stack
			end
		ensure
			stack.count = old stack.count - 1 - forget
			stack.last = old stack.last
		end

feature {} -- buffer moves
	next_character (buffer: MINI_PARSER_BUFFER) is
		do
			position := position.next(buffer)
		end

	restore (buffer: MINI_PARSER_BUFFER; a_position: like position) is
		do
			position := a_position
			buffer.set_current_index(position.index)
		end

	position: EIFFEL_POSITION

feature {}
	make (a_factory: like factory) is
		do
			factory := a_factory
			create stack.make(0)
		ensure
			factory = a_factory
			stack.is_empty
		end

	make_default is
		do
			make(create {EIFFEL_DEFAULT_NODE_FACTORY}.make)
		end

	factory: EIFFEL_NODE_FACTORY

end -- class EIFFEL_GRAMMAR
