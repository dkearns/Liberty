indexing

	description: "The base object type of gobject library"
	long: "[
			 Currently the only wrapped features are those explicitly necessary to wrap GTK+ 2.x
			 GObject is the fundamental type providing the common attributes and methods for all object types in GTK+, Pango and other libraries based on GObject. The GObject class provides methods for object construction and destruction, property access methods, and signal support. Signals are described in detail in Signals(3).
			 ]"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

			-- GObject is the fundamental type providing the common
			-- attributes and methods for all object types in GTK+, Pango
			-- and other libraries based on GObject. The GObject class
			-- provides methods for object construction and destruction,
			-- property access methods, and signal support. Signals are
			-- described in detail in Signals(3).

			-- The initial reference a GObject is created with is flagged
			-- as a floating reference. This means that it is not
			-- specifically claimed to be "owned" by any code
			-- portion. The main motivation for providing floating
			-- references is C convenience. In particular, it allowes
			-- code to be written as:
	
			-- TODO: Eiffelize Example 1.
	
			--    container = create_container();
			--    container_add_child (container, create_child());
	
			-- If container_add_child() will g_object_ref_sink() the
			-- passed in child, no reference of the newly created child
			-- is leaked. Without floating references,
			-- container_add_child() can only g_object_ref() the new
			-- child, so to implement this code without reference leaks,
			-- it would have to be written as:

			-- TODO: Eiffelize Example 2.
	
			--    Child *child;
			--    container = create_container();
			--    child = create_child();
			--    container_add_child (container, child);
			--    g_object_unref (child);
	
			-- The floating reference can be converted into an ordinary
			-- reference by calling g_object_ref_sink(). For already
			-- sunken objects (objects that don't have a floating
			-- reference anymore), g_object_ref_sink() is equivalent to
			-- g_object_ref() and returns a new reference. Since floating
			-- references are useful allmost exclusively for C
			-- convenience, language bindings that provide automated
			-- reference and memory ownership maintenance (such as smart
			-- pointers or garbage collection) therefore don't need to
			-- expose floating references in their API.
	
			-- Some object implementations may need to save an objects
			-- floating state across certain code portions (an example is
			-- GtkMenu), to achive this, the following sequence can be
			-- used:

			--    Example 3.
	
			--    /* save floating state */
			--    gboolean was_floating = g_object_is_floating (object);
			--    g_object_ref_sink (object);
			--    /* protected code portion */
			--    ...;
			--    /* restore floating state */
			--    if (was_floating)
			--      g_object_force_floating (object);
			--    g_obejct_unref (object); /* release previously acquired reference */
		
deferred class G_OBJECT

inherit
	SHARED_C_STRUCT redefine from_external_pointer, dispose end
	ANY

insert
	GLIB_MEMORY_ALLOCATION export {NONE} all end
	G_OBJECT_EXTERNALS
	G_VALUE_EXTERNALS
	SHARED_EIFFEL_KEY

feature
	store_eiffel_wrapper is
			-- Store a pointer to Current into the underlying
			-- gobject. This pointer will be used to retrieve the Eiffel
			-- wrapper object when a C feature returns a generic object
			-- (i.e. the preview widget set in GTK_FILE_CHOOSER). 
		require
			not_stored: not is_eiffel_wrapper_stored
		do
			g_object_set_qdata (handle, eiffel_key.quark, to_pointer)
			-- We do the above direct call instead of using the
			-- Eiffel method "set_qdata (eiffel_key, Current)". This
			-- is to avoid an invariant check when passing Current as
			-- argument.
		ensure
			stored: is_eiffel_wrapper_stored
		end

	is_eiffel_wrapper_stored: BOOLEAN is
			-- Has a pointer to the Current Eiffel wrapper been stored
			-- into the underlying GObject's qdata property with the
			-- GQuark `eiffel_key' (which is currently "eiffel-wrapper")?
		do
			Result := has_qdata (eiffel_key)
		end

feature {WRAPPER} -- GObject type system implementation.
	type: INTEGER is
		do
			Result := g_object_type (handle)
		end
feature -- Creating

	from_external_pointer (a_ptr: POINTER) is
		require
			called_on_creation: is_null
			pointer_not_null: a_ptr.is_not_null
			not (create {G_RETRIEVER [like Current]}).has_eiffel_wrapper_stored (a_ptr)
		do
			Precursor (a_ptr)
			store_eiffel_wrapper
			ref -- Let's add a reference to the underlying g_object
		end

feature -- Disposing
	dispose is
			-- Dispose the g_object, calling unref and setting its handle to default_pointer.
		
			-- TODO: once the iusse explained in the debug tense in the implementation is 
			-- solved put a "require is_a_gobject: g_is_object (handle)" precondition
		do
			-- Note: when Eiffel dispose a G_OBJECT it just unref it and
			-- cleans its handle. The actual reclaiming of the memory
			-- alloca ted on the C side is left to gobject runtime.
			if is_g_object then unref
			else
				debug
					print ("Disposing g_object ") print (generator)
					print (" (at ") print (handle.out) print ("). handle is not a g_object.%N")
					print_notice
					-- Please see the notes in G_OBJECT.dispose
					-- Note: for the above perhaps dispose has been called
					-- after GTK libraries has already shut down. This
					-- could be a "feature" instead of a bug, since it is
					-- possible that this part of dispose won't be called
					-- if the garbage collector is called during
					-- application normal usage. Paolo 2006-04-24
				end
			end
			handle := default_pointer
		end

feature {} -- Disposing helper

	print_notice is
			-- Print once a copy of the note that has been put in 
			-- `dispose' source code.
		once
			print ("[
					  Please see the notes in G_OBJECT.dispose.
					  Perhaps dispose has been called after 
					  GTK libraries has already shut down. This
					  could be the correct behavious and not a bug, since it is
					  possible that this part of dispose  won't be called
					  if  the garbage collector is called during
					  application normal usage. 
					       Paolo 2006-04-24
					  
				  ]")
			end

	is_g_object: BOOLEAN is
			-- Is current handle a pointer to a g_object?
		do
			Result := (g_is_object (handle) /= 0)
		end

feature -- Reference count
	ref is
			-- Increases the reference count of object.
		local ptr: POINTER
		do
			ptr := g_object_ref (handle)
				check
					ptr_equals_handle: ptr = handle
				end
		end

	unref is
			-- Decreases the reference count if object. When its reference count
			-- drops to 0, the object is finalized (i.e. its memory is freed).
		do
			g_object_unref (handle)
		end

feature -- Properties

	notify (a_property_name: STRING) is
		-- Emits a "notify" signal for the property `a_property_name' on
		-- object.
		do
			g_object_notify (handle, a_property_name.to_external) 
		end

	freeze_notify is
			-- Stops emission of "notify" signals on object. The signals are queued
			-- until thaw_notify is called on object.  This is necessary for
			-- accessors that modify multiple properties to prevent premature
			-- notification while the object is still being modified.
		do
			g_object_freeze_notify (handle)
		end

	thaw_notify (object: POINTER) is
			-- Causes all queued "notify" signals on object to be emitted. Reverts
			-- the effect of a previous call to freeze_notify.
		do
			g_object_thaw_notify (handle)
		end

	get_data (a_key: STRING): ANY is
			-- Gets a named field from the objects table of associations (see
			-- set_data).  `a_key': name of the key for that association; Void if no
			-- `a_key' field is present
		require valid_key: a_key /= Void
		local ptr: POINTER
		do
			-- Note: wrappers that needs to store C pointers and do other low-level
			-- stuff are invited to use g_object_get_data directly
			-- Note: Perhaps it is better to use GQuarks and g_object_get_qdata
			ptr := g_object_get_data (handle, a_key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end
	
	set_data (a_key: STRING; data: ANY) is
			-- Store a reference to `data' under the name `a_key'. Each object
			-- carries around a table of associations from strings to pointers. If
			-- the object already had an association with that name, the old
			-- association will be destroyed.

			-- a_key : 	name of the key
			-- data : 	data to associate with that key
		require
			valid_key: a_key /= Void
			data_not_expanded: not data.is_expanded_type
		do
			-- Note: a_key is not duplicated since g_object_set_data requires a const
			-- gchar *;
			g_object_set_data (handle,a_key.to_external, data.to_pointer)
		end

	steal_data (a_key: STRING): ANY is
			-- Remove a specified datum from the object's data associations, --
			-- without invoking the association's destroy handler. Void if there's
			-- no data with `a_key'
		require valid_key: a_key /= Void
		local ptr: POINTER
		do
			ptr := g_object_steal_data (handle, a_key.to_external)
			if ptr.is_not_null then Result:=ptr.to_any end
		end

feature -- Quark-based data storing and retrieving
	has_qdata (a_key: G_QUARK): BOOLEAN is
			-- Is `a_key' field present in table of associations (see
			-- set_qdata)? `a_key': a GQuark, naming the user data
			-- pointer
		do
			Result := (g_object_get_qdata (handle, a_key.quark).is_not_null)
		end

	get_qdata (a_key: G_QUARK): ANY is
			-- Gets a named field from the objects table of associations
			-- (see set_data). `a_key': a GQuark, naming the user data
			-- pointer; Void if no `a_key' field is present
		local ptr: POINTER
		do
			ptr := g_object_get_qdata (handle, a_key.quark)
			if ptr.is_not_null then Result:=ptr.to_any end
		ensure 
			result_not_expanded: not Result.is_expanded_type
		end
	
	set_qdata (a_key: G_QUARK; data: ANY) is
			-- Store a reference to `data' under the GQuark `a_key'. Each
			-- object carries around a table of associations from strings
			-- to pointers. If the object already had an association with
			-- that name, the old association will be destroyed.

			-- a_key : 	name of the key
			-- data : 	data to associate with that key
		require
			data_not_expanded: not data.is_expanded_type
		do
			g_object_set_qdata (handle,a_key.quark, data.to_pointer)
		end
	
feature -- Properties query
	find_property (a_property_name: STRING): G_PARAM_SPEC is
			-- Find the parameter's spec for `a_property_name'. Void if
			-- the class doesn't have a property of that name.
		require valid_name: a_property_name /= Void
		local ptr: POINTER
		do
			ptr:=g_object_class_find_property (handle,a_property_name.to_external)
			if ptr.is_not_null then
				create Result.from_external_pointer (ptr)
			end
		end

	has_property (a_property_name: STRING): BOOLEAN is
			-- Does Current has a property named `a_property_name'?
		require valid_name: a_property_name /= Void
		local ptr: POINTER
		do
			Result:= (g_object_class_find_property
						 (g_object_get_class(handle),a_property_name.to_external).is_not_null)
		end
	
	properties: FAST_ARRAY[G_PARAM_SPEC] is
		obsolete "TODO: entirely!"
		do
			-- TODO: using g_object_class_list_properties (oclass,n_properties:
			-- POINTER): POINTER is Returns an array of GParamSpec* for
			-- all properties of a class.  oclass: a GObjectClass
			-- n_properties: return location for the length of the
			-- returned array (i.e. a guint *). Returns: an array of
			-- GParamSpec* (i.e. a GParamSpec**) which should be freed
			-- after use
		ensure implemented: False
		end
	

feature -- Property getter/setter
	set_properties (some_properties: COLLECTION [TUPLE[STRING,G_VALUE]]) is
		require
			no_void_property_names: --TODO
			no_void_property_values: --TODO
		local iter: ITERATOR [TUPLE[STRING,G_VALUE]]
		do
			freeze_notify
			iter := some_properties.get_new_iterator
			from iter.start until iter.is_off
			loop
				-- Note: The original C implementation of this feature
				-- retrieve the G_PARAM_SPEC linked to each property and
				-- then checks:

				-- * if theres a property with that name
				-- * it the property is writable
				-- * if the property is settable only at creation time
				
				-- I'm not sure that an Eiffel implementation should 
				-- implement this, because it should be already checked 
				-- by Gobject. Paolo 2006-07-06
				check
					name_not_void: iter.item.item_1 /= Void
					value_not_void: iter.item.item_2 /= Void
				end
				set_property (iter.item.item_1, iter.item.item_2)
				iter.next
			end
		end
	
	set_property (a_property_name: STRING; a_value: G_VALUE) is
			-- Sets `a_property_name' property on Current object to `a_value'
		require
			valid_name: a_property_name /= Void
			valid_value: a_value /= Void
		do
			g_object_set_property (handle, a_property_name.to_external, a_value.handle)
		end
	
	get_property (a_property_name: STRING): G_VALUE is
			-- Gets the property name `a_property_name' of an object.
		require
			valid_name: a_property_name /= Void
		local ptr: POINTER
		do
			ptr := malloc_g_value
			g_object_get_property (handle,a_property_name.to_external,ptr)
			create Result.from_external_pointer (ptr)
		end

	-- TODO: implement has_property  (a_property_name: STRING): BOOLEAN is
	-- require  valid_name: a_property_name /= Void do	end

	set_string_property (a_property_name, a_value: STRING) is
		require
			valid_name: a_property_name /= Void
			valid_value: a_value /= Void
		do
			g_object_set_string_property (handle,a_property_name.to_external, a_value.to_external)
		end
	
	get_string_property (a_property_name: STRING): STRING is
			-- Gets the property named `a_property_name' of an
			-- object. Can be Void. TODO: this is complemetely untested!
			-- Test it, for example in GTK_CELL_RENDERER_PROGRESS
		require
			valid_name: a_property_name /= Void
			has_property: has_property (a_property_name)
		local ptr: POINTER
		do
			g_object_get_one_property (handle,a_property_name.to_external,address_of (ptr))
			if ptr.is_not_null then
				create Result.from_external (ptr)
			end
		end

	-- TODO: provide get_[string|integer|real|...]_property that does
	-- not allocate a temporary G_VALUE


feature {} -- Unwrapped API
--    ----------------------------------------------------------------------------------------------------------------

--   GObjectClass

--  typedef struct {
--    GTypeClass   g_type_class;

--    /* overridable methods */
--    GObject*   (*constructor)     (GType                  type,
--                                   guint                  n_construct_properties,
--                                   GObjectConstructParam *construct_properties);
--    void       (*set_property)            (GObject        *object,
--                                           guint           property_id,
--                                           const GValue   *value,
--                                           GParamSpec     *pspec);
--    void       (*get_property)            (GObject        *object,
--                                           guint           property_id,
--                                           GValue         *value,
--                                           GParamSpec     *pspec);
--    void       (*dispose)                 (GObject        *object);
--    void       (*finalize)                (GObject        *object);

--    /* seldomly overidden */
--    void       (*dispatch_properties_changed) (GObject      *object,
--                                               guint         n_pspecs,
--                                               GParamSpec  **pspecs);

--    /* signals */
--    void       (*notify)                  (GObject        *object,
--                                           GParamSpec     *pspec);
--  } GObjectClass;

--    The class structure for the GObject type.

--    Example 4. Implementing singletons using a constructor

--  static MySingleton *the_singleton = NULL;

--  static GObject*
--  my_singleton_constructor (GType                  type,
--                            guint                  n_construct_params,
--                            GObjectConstructParam *construct_params)
--  {
--    GObject *object;

--    if (!the_singleton)
--      {
--        object = G_OBJECT_CLASS (parent_class)->constructor (type,
--                                                             n_construct_params,
--                                                             construct_params);
--        the_singleton = MY_SINGLETON (object);
--      }
--    else
--      object = g_object_ref (G_OBJECT (the_singleton));

--    return object;
--  }

--    GTypeClass g_type_class;       the parent class
--    constructor ()                 the constructor function is called by g_object_new() to complete the object
--                                   initialization after all the construction properties are set. The first thing a
--                                   constructor implementation must do is chain up to the constructor of the parent
--                                   class. Overriding constructor should be rarely needed, e.g. to handle construct
--                                   properties, or to implement singletons.
--    set_property ()                the generic setter for all properties of this type. Should be overridden for
--                                   every type with properties. Implementations of set_property don't need to emit
--                                   property change notification explicitly, this is handled by the type system.
--    get_property ()                the generic getter for all properties of this type. Should be overridden for
--                                   every type with properties.
--    dispose ()                     the dispose function is supposed to drop all references to other objects, but
--                                   keep the instance otherwise intact, so that client method invocations still work.
--                                   It may be run multiple times (due to reference loops). Before returning, dispose
--                                   should chain up to the dispose method of the parent class.
--    finalize ()                    instance finalization function, should finish the finalization of the instance
--                                   begun in dispose and chain up to the finalize method of the parent class.
--    dispatch_properties_changed () emits property change notification for a bunch of properties. Overriding
--                                   dispatch_properties_changed should be rarely needed.
--    notify ()                      the class closure for the notify signal

--    ----------------------------------------------------------------------------------------------------------------

--   GObjectConstructParam

--  typedef struct {
--    GParamSpec *pspec;
--    GValue     *value;
--  } GObjectConstructParam;

--    The GObjectConstructParam struct is an auxiliary structure used to hand GParamSpec/GValue pairs to the
--    constructor of a GObjectClass.

--    GParamSpec *pspec; the GParamSpec of the construct parameter
--    GValue *value;     the value to set the parameter to

--    ----------------------------------------------------------------------------------------------------------------

--   GObjectGetPropertyFunc ()

--  void        (*GObjectGetPropertyFunc)       (GObject *object,
--                                               guint property_id,
--                                               GValue *value,
--                                               GParamSpec *pspec);

--    The type of the get_property function of GObjectClass.

--    object :      a GObject
--    property_id : the numeric id under which the property was registered with g_object_class_install_property().
--    value :       a GValue to return the property value in
--    pspec :       the GParamSpec describing the property

--    ----------------------------------------------------------------------------------------------------------------

--   GObjectSetPropertyFunc ()

--  void        (*GObjectSetPropertyFunc)       (GObject *object,
--                                               guint property_id,
--                                               const GValue *value,
--                                               GParamSpec *pspec);

--    The type of the set_property function of GObjectClass.

--    object :      a GObject
--    property_id : the numeric id under which the property was registered with g_object_class_install_property().
--    value :       the new value for the property
--    pspec :       the GParamSpec describing the property

--    ----------------------------------------------------------------------------------------------------------------

--   GObjectFinalizeFunc ()

--  void        (*GObjectFinalizeFunc)          (GObject *object);

--    The type of the finalize function of GObjectClass.

--    object : the GObject being finalized

--    ----------------------------------------------------------------------------------------------------------------

--   G_TYPE_IS_OBJECT()

--  #define G_TYPE_IS_OBJECT(type)      (G_TYPE_FUNDAMENTAL (type) == G_TYPE_OBJECT)

--    Returns a boolean value of FALSE or TRUE indicating whether the passed in type id is a G_TYPE_OBJECT or derived
--    from it.

--    type :    Type id to check for is a G_TYPE_OBJECT relationship.
--    Returns : FALSE or TRUE, indicating whether type is a G_TYPE_OBJECT.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT()

--  #define G_OBJECT(object)            (G_TYPE_CHECK_INSTANCE_CAST ((object), G_TYPE_OBJECT, GObject))

--    Casts a GObject or derived pointer into a (GObject*) pointer. Depending on the current debugging level, this
--    function may invoke certain runtime checks to identify invalid casts.

--    object : Object which is subject to casting.

--    ----------------------------------------------------------------------------------------------------------------

--   G_IS_OBJECT()

--  #define G_IS_OBJECT(object)         (G_TYPE_CHECK_INSTANCE_TYPE ((object), G_TYPE_OBJECT))

--    Checks whether a valid GTypeInstance pointer is of type G_TYPE_OBJECT.

--    object : Instance to check for being a G_TYPE_OBJECT.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_CLASS()

--  #define G_OBJECT_CLASS(class)       (G_TYPE_CHECK_CLASS_CAST ((class), G_TYPE_OBJECT, GObjectClass))

--    Casts a derived GObjectClass structure into a GObjectClass structure.

--    class : a valid GObjectClass

--    ----------------------------------------------------------------------------------------------------------------

--   G_IS_OBJECT_CLASS()

--  #define G_IS_OBJECT_CLASS(class)    (G_TYPE_CHECK_CLASS_TYPE ((class), G_TYPE_OBJECT))

--    Checks whether class "is a" valid GObjectClass structure of type G_TYPE_OBJECT or derived.

--    class : a GObjectClass

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_GET_CLASS()

--  #define G_OBJECT_GET_CLASS(object)  (G_TYPE_INSTANCE_GET_CLASS ((object), G_TYPE_OBJECT, GObjectClass))

--    Returns the class structure associated to a GObject instance.

--    object : a GObject instance.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_TYPE()

--  #define G_OBJECT_TYPE(object)       (G_TYPE_FROM_INSTANCE (object))

--    Return the type id of an object.

--    object :  Object to return the type id for.
--    Returns : Type id of object.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_TYPE_NAME()

--  #define G_OBJECT_TYPE_NAME(object)  (g_type_name (G_OBJECT_TYPE (object)))

--    Returns the name of an object's type.

--    object :  Object to return the type name for.
--    Returns : Type name of object. The string is owned by the type system and should not be freed.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_CLASS_TYPE()

--  #define G_OBJECT_CLASS_TYPE(class)  (G_TYPE_FROM_CLASS (class))

--    Return the type id of a class structure.

--    class :   a valid GObjectClass
--    Returns : Type id of class.

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_CLASS_NAME()

--  #define G_OBJECT_CLASS_NAME(class)  (g_type_name (G_OBJECT_CLASS_TYPE (class)))

--    Return the name of a class structure's type.

--    class :   a valid GObjectClass
--    Returns : Type name of class. The string is owned by the type system and should not be freed.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_class_install_property ()

--  void        g_object_class_install_property (GObjectClass *oclass,
--                                               guint property_id,
--                                               GParamSpec *pspec);

--    Installs a new property. This is usually done in the class initializer.

--    oclass :      a GObjectClass
--    property_id : the id for the new property
--    pspec :       the GParamSpec for the new property

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_class_list_properties ()

--  GParamSpec** g_object_class_list_properties (GObjectClass *oclass,
--                                               guint *n_properties);

--    Returns an array of GParamSpec* for all properties of a class.

--    oclass :       a GObjectClass
--    n_properties : return location for the length of the returned array
--    Returns :      an array of GParamSpec* which should be freed after use

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_class_override_property ()

--  void        g_object_class_override_property
--                                              (GObjectClass *oclass,
--                                               guint property_id,
--                                               const gchar *name);

--    Registers property_id as referring to a property with the name name in a parent class or in an interface
--    implemented by oclass. This allows this class to override a property implementation in a parent class or to
--    provide the implementation of a property from an interface.

--   Note

--    Internally, overriding is implemented by creating a property of type GParamSpecOverride; generally operations
--    that query the properties of the object class, such as g_object_class_find_property() or
--    g_object_class_list_properties() will return the overridden property. However, in one case, the
--    construct_properties argument of the constructor virtual function, the GParamSpecOverride is passed instead, so
--    that the param_id field of the GParamSpec will be correct. For virtually all uses, this makes no difference. If
--    you need to get the overridden property, you can call g_param_spec_get_redirect_target().

--    oclass :      a GObjectClass
--    property_id : the new property ID
--    name :        the name of a property registered in a parent class or in an interface of this class.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_interface_install_property ()

--  void        g_object_interface_install_property
--                                              (gpointer g_iface,
--                                               GParamSpec *pspec);

--    Add a property to an interface; this is only useful for interfaces that are added to GObject-derived types.
--    Adding a property to an interface forces all objects classes with that interface to have a compatible property.
--    The compatible property could be a newly created GParamSpec, but normally g_object_class_override_property()
--    will be used so that the object class only needs to provide an implementation and inherits the property
--    description, default value, bounds, and so forth from the interface property.

--    This function is meant to be called from the interface's default vtable initialization function (the class_init
--    member of GTypeInfo.) It must not be called after after class_init has been called for any object types
--    implementing this interface.

--    g_iface : any interface vtable for the interface, or the default vtable for the interface.
--    pspec :   the GParamSpec for the new property

--    Since 2.4

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_interface_find_property ()

--  GParamSpec* g_object_interface_find_property
--                                              (gpointer g_iface,
--                                               const gchar *property_name);

--    Find the GParamSpec with the given name for an interface. Generally, the interface vtable passed in as g_iface
--    will be the default vtable from g_type_default_interface_ref(), or, if you know the interface has already been
--    loaded, g_type_default_interface_peek().

--    g_iface :       any interface vtable for the interface, or the default vtable for the interface
--    property_name : name of a property to lookup.
--    Returns :       the GParamSpec for the property of the interface with the name property_name, or NULL if no such
--                    property exists.

--    Since 2.4

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_interface_list_properties ()

--  GParamSpec** g_object_interface_list_properties
--                                              (gpointer g_iface,
--                                               guint *n_properties_p);

--    Lists the properties of an interface.Generally, the interface vtable passed in as g_iface will be the default
--    vtable from g_type_default_interface_ref(), or, if you know the interface has already been loaded,
--    g_type_default_interface_peek().

--    g_iface :        any interface vtable for the interface, or the default vtable for the interface
--    n_properties_p : location to store number of properties returned.
--    Returns :        a pointer to an array of pointers to GParamSpec structures. The paramspecs are owned by GLib,
--                     but the array should be freed with g_free() when you are done with it.

--    Since 2.4

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_new ()

--  gpointer    g_object_new                    (GType object_type,
--                                               const gchar *first_property_name,
--                                               ...);

--    Creates a new instance of a GObject subtype and sets its properties.

--    Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are
--    set to their default values.

--    object_type :         the type id of the GObject subtype to instantiate
--    first_property_name : the name of the first property
--    ... :                 the value of the first property, followed optionally by more name/value pairs, followed by
--                          NULL
--    Returns :             a new instance of object_type

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_newv ()

--  gpointer    g_object_newv                   (GType object_type,
--                                               guint n_parameters,
--                                               GParameter *parameters);

--    Creates a new instance of a GObject subtype and sets its properties.

--    Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are
--    set to their default values.

--    object_type :  the type id of the GObject subtype to instantiate
--    n_parameters : the length of the parameters array
--    parameters :   an array of GParameter
--    Returns :      a new instance of object_type

--    ----------------------------------------------------------------------------------------------------------------

--   GParameter

--  typedef struct {
--    const gchar *name;
--    GValue       value;
--  } GParameter;

--    The GParameter struct is an auxiliary structure used to hand parameter name/value pairs to g_object_newv().

--    const gchar *name; the parameter name
--    GValue value;      the parameter value

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_ref ()

--  gpointer    g_object_ref                    (gpointer object);

--    Increases the reference count of object.

--    object :  a GObject
--    Returns : object

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_unref ()

--  void        g_object_unref                  (gpointer object);

--    Decreases the reference count if object. When its reference count drops to 0, the object is finalized (i.e. its
--    memory is freed).

--    object : a GObject

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_ref_sink ()

--  gpointer    g_object_ref_sink               (gpointer object);

--    Increase the reference count of object, and possibly remove the floating reference, if object has a floating
--    reference.

--    object :  a GObject
--    Returns : object

--    Since 2.10

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_is_floating ()

--  gboolean    g_object_is_floating            (gpointer object);

--    Checks wether object has a floating reference.

--    object :  a GObject
--    Returns : TRUE if object has a floating reference

--    Since 2.10

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_force_floating ()

--  void        g_object_force_floating         (GObject *object);

--    This function is intended for GObject implementations to re-enforce a floating object reference. Doing this is
--    seldomly required, all GObjects are created with a floating reference which usually just needs to be sunken by
--    calling g_object_ref_sink().

--    object : a GObject

--    Since 2.10

--    ----------------------------------------------------------------------------------------------------------------

--   GWeakNotify ()

--  void        (*GWeakNotify)                  (gpointer data,
--                                               GObject *where_the_object_was);

--    A GWeakNotify function can be added to an object as a callback that gets triggered when the object is finalized.
--    Since the object is already being finalized when the GWeakNotify is called, there's not much you could do with
--    the object, apart from e.g. using its adress as hash-index or the like.

--    data :                 data that was provided when the weak reference was established
--    where_the_object_was : the object being finalized

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_weak_ref ()

--  void        g_object_weak_ref               (GObject *object,
--                                               GWeakNotify notify,
--                                               gpointer data);

--    Adds a weak reference callback to an object. Weak references are used for notification when an object is
--    finalized. They are called "weak references" because they allow you to safely hold a pointer to an object
--    without calling g_object_ref() (g_object_ref() adds a strong reference, that is, forces the object to stay
--    alive).

--    object : GObject to reference weakly
--    notify : callback to invoke before the object is freed
--    data :   extra data to pass to notify

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_weak_unref ()

--  void        g_object_weak_unref             (GObject *object,
--                                               GWeakNotify notify,
--                                               gpointer data);

--    Removes a weak reference callback to an object.

--    object : GObject to remove a weak reference from
--    notify : callback to search for
--    data :   data to search for

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_add_weak_pointer ()

--  void        g_object_add_weak_pointer       (GObject *object,
--                                               gpointer *weak_pointer_location);

--    Adds a weak reference from weak_pointer to object to indicate that the pointer located at weak_pointer_location
--    is only valid during the lifetime of object. When the object is finalized, weak_pointer will be set to NULL.

--    object :                The object that should be weak referenced.
--    weak_pointer_location : The memory address of a pointer.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_remove_weak_pointer ()

--  void        g_object_remove_weak_pointer    (GObject *object,
--                                               gpointer *weak_pointer_location);

--    Removes a weak reference from object that was previously added using g_object_add_weak_pointer(). The
--    weak_pointer_location has to match the one used with g_object_add_weak_pointer().

--    object :                The object that is weak referenced.
--    weak_pointer_location : The memory address of a pointer.

--    ----------------------------------------------------------------------------------------------------------------

--   GToggleNotify ()

--  void        (*GToggleNotify)                (gpointer data,
--                                               GObject *object,
--                                               gboolean is_last_ref);

--    A callback function used for notification when the state of a toggle reference changes. See
--    g_object_add_toggle_ref().

--    data :        Callback data passed to g_object_add_toggle_ref()
--    object :      The object on which g_object_add_toggle_ref() was called.
--    is_last_ref : TRUE if the toggle reference is now the last reference to the object. FALSE if the toggle
--                  reference was the last reference and there are now other references.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_add_toggle_ref ()

--  void        g_object_add_toggle_ref         (GObject *object,
--                                               GToggleNotify notify,
--                                               gpointer data);

--    Increases the reference count of the object by one and sets a callback to be called when all other references to
--    the object are dropped, or when this is already the last reference to the object and another reference is
--    established.

--    This functionality is intended for binding object to a proxy object managed by another memory manager. This is
--    done with two paired references: the strong reference added by g_object_add_toggle_ref() and a reverse reference
--    to the proxy object which is either a strong reference or weak reference.

--    The setup is that when there are no other references to object, only a weak reference is held in the reverse
--    direction from object to the proxy object, but when there are other references held to object, a strong
--    reference is held. The notify callback is called when the reference from object to the proxy object should be
--    toggled from strong to weak (is_last_ref true) or weak to strong (is_last_ref false).

--    Since a (normal) reference must be held to the object before calling g_object_toggle_ref(), the initial state of
--    the reverse link is always strong.

--    Multiple toggle references may be added to the same gobject, however if there are multiple toggle references to
--    an object, none of them will ever be notified until all but one are removed. For this reason, you should only
--    ever use a toggle reference if there is important state in the proxy object.

--    object : a GObject
--    notify : a function to call when this reference is the last reference to the object, or is no longer the last
--             reference.
--    data :   data to pass to notify

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_remove_toggle_ref ()

--  void        g_object_remove_toggle_ref      (GObject *object,
--                                               GToggleNotify notify,
--                                               gpointer data);

--    Removes a reference added with g_object_add_toggle_ref(). The reference count of the object is decreased by one.

--    object : a GObject
--    notify : a function to call when this reference is the last reference to the object, or is no longer the last
--             reference.
--    data :   data to pass to notify

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_connect ()

--  gpointer    g_object_connect                (gpointer object,
--                                               const gchar *signal_spec,
--                                               ...);

--    A convenience function to connect multiple signals at once.

--    The signal specs expected by this function have the form "modifier::signal_name", where modifier can be one of
--    the following:

--    signal                                       equivalent to g_signal_connect_data (...)
--    object_signal, object-signal                 equivalent to g_signal_connect_object (...)
--    swapped_signal, swapped-signal               equivalent to g_signal_connect_data (..., G_CONNECT_SWAPPED)
--    swapped_object_signal, swapped-object-signal equivalent to g_signal_connect_object (..., G_CONNECT_SWAPPED)
--    signal_after, signal-after                   equivalent to g_signal_connect_data (..., G_CONNECT_AFTER)
--    object_signal_after, object-signal-after     equivalent to g_signal_connect_object (..., G_CONNECT_AFTER)
--    swapped_signal_after, swapped-signal-after   equivalent to g_signal_connect_data (..., G_CONNECT_SWAPPED |
--                                                 G_CONNECT_AFTER)
--    swapped_object_signal_after,                 equivalent to g_signal_connect_object (..., G_CONNECT_SWAPPED |
--    swapped-object-signal-after                  G_CONNECT_AFTER)

--    menu->toplevel = g_object_connect (g_object_new (GTK_TYPE_WINDOW,
--                                                     "type", GTK_WINDOW_POPUP,
--                                                     "child", menu,
--                                                     NULL),
--                                       "signal::event", gtk_menu_window_event, menu,
--                                       "signal::size_request", gtk_menu_window_size_request, menu,
--                                       "signal::destroy", gtk_widget_destroyed, &menu->toplevel,
--                                       NULL);

--    object :      a GObject
--    signal_spec : the spec for the first signal
--    ... :         GCallback for the first signal, followed by data for the first signal, followed optionally by more
--                  signal spec/callback/data triples, followed by NULL
--    Returns :     object

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_disconnect ()

--  void        g_object_disconnect             (gpointer object,
--                                               const gchar *signal_spec,
--                                               ...);

--    A convenience function to disconnect multiple signals at once.

--    The signal specs expected by this function have the form "any_signal", which means to disconnect any signal with
--    matching callback and data, or "any_signal::signal_name", which only disconnects the signal named "signal_name".

--    object :      a GObject
--    signal_spec : the spec for the first signal
--    ... :         GCallback for the first signal, followed by data for the first signal, followed optionally by more
--                  signal spec/callback/data triples, followed by NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set ()

--  void        g_object_set                    (gpointer object,
--                                               const gchar *first_property_name,
--                                               ...);

--    Sets properties on an object.

--    object :              a GObject
--    first_property_name : name of the first property to set
--    ... :                 value for the first property, followed optionally by more name/value pairs, followed by
--                          NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_get ()

--  void        g_object_get                    (gpointer object,
--                                               const gchar *first_property_name,
--                                               ...);

--    Gets properties of an object.

--    In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the
--    appropriate manner for the type, for instance by calling g_free() or g_object_unref().

--    Example 5. Using g_object_get()

--    An example of using g_object_get() to get the contents of three properties - one of type G_TYPE_INT, one of type
--    G_TYPE_STRING, and one of type G_TYPE_OBJECT:

--   gint intval;
--   gchar *strval;
--   GObject *objval;

--   g_object_get (my_object,
--                 "intproperty", &intval,
--                 "strproperty", &strval,
--                 "objproperty", &objval,
--                 NULL);

--   /* Do something with intval, strval, objval */

--   g_free (strval);
--   g_object_unref (objval);

--    object :              a GObject
--    first_property_name : name of the first property to get
--    ... :                 return location for the first property, followed optionally by more name/return location
--                          pairs, followed by NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_notify ()

--  void        g_object_notify                 (GObject *object,
--                                               const gchar *property_name);

--    Emits a "notify" signal for the property property_name on object.

--    object :        a GObject
--    property_name : the name of a property installed on the class of object.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_freeze_notify ()

--  void        g_object_freeze_notify          (GObject *object);

--    Stops emission of "notify" signals on object. The signals are queued until g_object_thaw_notify() is called on
--    object.

--    This is necessary for accessors that modify multiple properties to prevent premature notification while the
--    object is still being modified.

--    object : a GObject

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_thaw_notify ()

--  void        g_object_thaw_notify            (GObject *object);

--    Reverts the effect of a previous call to g_object_freeze_notify(). This causes all queued "notify" signals on
--    object to be emitted.

--    object : a GObject

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_get_data ()

--  gpointer    g_object_get_data               (GObject *object,
--                                               const gchar *key);

--    Gets a named field from the objects table of associations (see g_object_set_data()).

--    object :  GObject containing the associations
--    key :     name of the key for that association
--    Returns : the data if found, or NULL if no such data exists.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_data ()

--  void        g_object_set_data               (GObject *object,
--                                               const gchar *key,
--                                               gpointer data);

--    Each object carries around a table of associations from strings to pointers. This function lets you set an
--    association.

--    If the object already had an association with that name, the old association will be destroyed.

--    object : GObject containing the associations.
--    key :    name of the key
--    data :   data to associate with that key

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_data_full ()

--  void        g_object_set_data_full          (GObject *object,
--                                               const gchar *key,
--                                               gpointer data,
--                                               GDestroyNotify destroy);

--    Like g_object_set_data() except it adds notification for when the association is destroyed, either by setting it
--    to a different value or when the object is destroyed.

--    object :  GObject containing the associations
--    key :     name of the key
--    data :    data to associate with that key
--    destroy : function to call when the association is destroyed

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_steal_data ()

--  gpointer    g_object_steal_data             (GObject *object,
--                                               const gchar *key);

--    Remove a specified datum from the object's data associations, without invoking the association's destroy
--    handler.

--    object :  GObject containing the associations
--    key :     name of the key
--    Returns : the data if found, or NULL if no such data exists.

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_get_qdata ()

--  gpointer    g_object_get_qdata              (GObject *object,
--                                               GQuark quark);

--    This function gets back user data pointers stored via g_object_set_qdata().

--    object :  The GObject to get a stored user data pointer from
--    quark :   A GQuark, naming the user data pointer
--    Returns : The user data pointer set, or NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_qdata ()

--  void        g_object_set_qdata              (GObject *object,
--                                               GQuark quark,
--                                               gpointer data);

--    This sets an opaque, named pointer on an object. The name is specified through a GQuark (retrived e.g. via
--    g_quark_from_static_string()), and the pointer can be gotten back from the object with g_object_get_qdata()
--    until the object is finalized. Setting a previously set user data pointer, overrides (frees) the old pointer
--    set, using NULL as pointer essentially removes the data stored.

--    object : The GObject to set store a user data pointer
--    quark :  A GQuark, naming the user data pointer
--    data :   An opaque user data pointer

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_qdata_full ()

--  void        g_object_set_qdata_full         (GObject *object,
--                                               GQuark quark,
--                                               gpointer data,
--                                               GDestroyNotify destroy);

--    This function works like g_object_set_qdata(), but in addition, a void (*destroy) (gpointer) function may be
--    specified which is called with data as argument when the object is finalized, or the data is being overwritten
--    by a call to g_object_set_qdata() with the same quark.

--    object :  The GObject to set store a user data pointer
--    quark :   A GQuark, naming the user data pointer
--    data :    An opaque user data pointer
--    destroy : Function to invoke with data as argument, when data needs to be freed

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_steal_qdata ()

--  gpointer    g_object_steal_qdata            (GObject *object,
--                                               GQuark quark);

--    This function gets back user data pointers stored via g_object_set_qdata() and removes the data from object
--    without invoking it's destroy() function (if any was set). Usually, calling this function is only required to
--    update user data pointers with a destroy notifier, for example:

--  void
--  object_add_to_user_list (GObject     *object,
--                           const gchar *new_string)
--  {
--    /* the quark, naming the object data */
--    GQuark quark_string_list = g_quark_from_static_string ("my-string-list");
--    /* retrive the old string list */
--    GList *list = g_object_steal_qdata (object, quark_string_list);

--    /* prepend new string */
--    list = g_list_prepend (list, g_strdup (new_string));
--    /* this changed 'list', so we need to set it again */
--    g_object_set_qdata_full (object, quark_string_list, list, free_string_list);
--  }
--  static void
--  free_string_list (gpointer data)
--  {
--    GList *node, *list = data;

--    for (node = list; node; node = node->next)
--      g_free (node->data);
--    g_list_free (list);
--  }

--    Using g_object_get_qdata() in the above example, instead of g_object_steal_qdata() would have left the destroy
--    function set, and thus the partial string list would have been freed upon g_object_set_qdata_full().

--    object :  The GObject to get a stored user data pointer from
--    quark :   A GQuark, naming the user data pointer
--    Returns : The user data pointer set, or NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_property ()

--  void        g_object_set_property           (GObject *object,
--                                               const gchar *property_name,
--                                               const GValue *value);

--    Sets a property on an object.

--    object :        a GObject
--    property_name : the name of the property to set
--    value :         the value

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_get_property ()

--  void        g_object_get_property           (GObject *object,
--                                               const gchar *property_name,
--                                               GValue *value);

--    Gets a property of an object.

--    In general, a copy is made of the property contents and the caller is responsible for freeing the memory by
--    calling g_value_unset().

--    Note that g_object_get_property() is really intended for language bindings, g_object_get() is much more
--    convenient for C programming.

--    object :        a GObject
--    property_name : the name of the property to get
--    value :         return location for the property value

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_new_valist ()

--  GObject*    g_object_new_valist             (GType object_type,
--                                               const gchar *first_property_name,
--                                               va_list var_args);

--    Creates a new instance of a GObject subtype and sets its properties.

--    Construction parameters (see G_PARAM_CONSTRUCT, G_PARAM_CONSTRUCT_ONLY) which are not explicitly specified are
--    set to their default values.

--    object_type :         the type id of the GObject subtype to instantiate
--    first_property_name : the name of the first property
--    var_args :            the value of the first property, followed optionally by more name/value pairs, followed by
--                          NULL
--    Returns :             a new instance of object_type

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_set_valist ()

--  void        g_object_set_valist             (GObject *object,
--                                               const gchar *first_property_name,
--                                               va_list var_args);

--    Sets properties on an object.

--    object :              a GObject
--    first_property_name : name of the first property to set
--    var_args :            value for the first property, followed optionally by more name/value pairs, followed by
--                          NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_get_valist ()

--  void        g_object_get_valist             (GObject *object,
--                                               const gchar *first_property_name,
--                                               va_list var_args);

--    Gets properties of an object.

--    In general, a copy is made of the property contents and the caller is responsible for freeing the memory in the
--    appropriate manner for the type, for instance by calling g_free() or g_object_unref().

--    See g_object_get().

--    object :              a GObject
--    first_property_name : name of the first property to get
--    var_args :            return location for the first property, followed optionally by more name/return location
--                          pairs, followed by NULL

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_watch_closure ()

--  void        g_object_watch_closure          (GObject *object,
--                                               GClosure *closure);

--    This function essentially limits the life time of the closure to the life time of the object. That is, when the
--    object is finalized, the closure is invalidated by calling g_closure_invalidate() on it, in order to prevent
--    invocations of the closure with a finalized (nonexisting) object. Also, g_object_ref() and g_object_unref() are
--    added as marshal guards to the closure, to ensure that an extra reference count is held on object during
--    invocation of the closure. Usually, this function will be called on closures that use this object as closure
--    data.

--    object :  GObject restricting lifetime of closure
--    closure : GClosure to watch

--    ----------------------------------------------------------------------------------------------------------------

--   g_object_run_dispose ()

--  void        g_object_run_dispose            (GObject *object);

--    Releases all references to other objects. This can be used to break reference cycles.

--   Note

--    This functions should only be called from object system implementations.

--    object : a GObject

--    ----------------------------------------------------------------------------------------------------------------

--   G_OBJECT_WARN_INVALID_PROPERTY_ID()

--  #define     G_OBJECT_WARN_INVALID_PROPERTY_ID(object, property_id, pspec)

--    This macros should be used to emit a standard warning about unexpected properties in set_property() and
--    get_property() implementations.

--    object :      the GObject on which set_property() or get_property() was called
--    property_id : the numeric id of the property
--    pspec :       the GParamSpec of the property

-- Signal Details

--   The "notify" signal

--  void        user_function                  (GObject    *gobject,
--                                              GParamSpec *arg1,
--                                              gpointer    user_data)      : Run first / No recursion / Has details / Action / No hooks

--    The notify signal is emitted on an object when one of its properties has been changed. Note that getting this
--    signal doesn't guarantee that the value of the property has actually changed, it may also be emitted when the
--    setter for the property is called to reinstate the previous value.

--    gobject :   the object which received the signal.
--    pspec :     the GParamSpec of the property which changed
--    user_data : user data set when the signal handler was connected.

invariant
	stored_eiffel_wrapper: is_not_null implies is_eiffel_wrapper_stored
end

