-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPE_INTERFACE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

   gtype_interface_struct_set_g_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for g_type field of GTYPE_INTERFACE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_interface_struct_set_g_type"
      }"
      end

   gtype_interface_struct_set_g_instance_type (a_structure: POINTER; a_value: like long_unsigned) 
         -- Setter for g_instance_type field of GTYPE_INTERFACE_STRUCT structure.
         -- TODO: setter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_interface_struct_set_g_instance_type"
      }"
      end

feature {} -- Low-level queries

   gtype_interface_struct_get_g_type (a_structure: POINTER): like long_unsigned 
         -- Query for g_type field of GTYPE_INTERFACE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_interface_struct_get_g_type"
      }"
      end

   gtype_interface_struct_get_g_instance_type (a_structure: POINTER): like long_unsigned 
         -- Query for g_instance_type field of GTYPE_INTERFACE_STRUCT structure.
         -- TODO: getter description

      external "plug_in"
      alias "{
         location: "."
         module_name: "plugin"
         feature_name: "gtype_interface_struct_get_g_instance_type"
      }"
      end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
       struct_size: like size_t 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "sizeof__GTypeInterface"
               }"
               end

end -- class GTYPE_INTERFACE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
