   Link: GObject Introspection Reference Manual (start)
   Link: GIRepository structs (parent)
   Link: GIVFuncInfo (previous)
   Link: GIEnumInfo (next)

   Prev Up Home                                GObject Introspection Reference Manual                                 Next
   Top  |  Description

   GISignalInfo

   GISignalInfo — Struct representing a signal

Synopsis

 #define             GI_IS_SIGNAL_INFO                   (info)
 typedef             GISignalInfo;
 GSignalFlags        g_signal_info_get_flags             (GISignalInfo *info);
 GIVFuncInfo *       g_signal_info_get_class_closure     (GISignalInfo *info);
 gboolean            g_signal_info_true_stops_emit       (GISignalInfo *info);

Description

   GISignalInfo represents a signal. It's a sub-struct of GICallableInfo and contains a set of flags and a class closure.

   See GICallableInfo for information on how to retreive arguments and other metadata from the signal.

Struct hierarchy

   GIBaseInfo
    +----GICallableInfo
          +----GIFunctionInfo
          +----GISignalInfo
          +----GIVFuncInfo

Details

  GI_IS_SIGNAL_INFO()

 #define             GI_IS_SIGNAL_INFO(info)

   -----------------------------------------------------------------------------------------------------------------------

  GISignalInfo

 typedef GIBaseInfo GISignalInfo;

   Represents a signal.

   -----------------------------------------------------------------------------------------------------------------------

  g_signal_info_get_flags ()

 GSignalFlags        g_signal_info_get_flags             (GISignalInfo *info);

   Obtain the flags for this signal info. See GSignalFlags for more information about possible flag values.

   info :    a GISignalInfo
   Returns : the flags

   -----------------------------------------------------------------------------------------------------------------------

  g_signal_info_get_class_closure ()

 GIVFuncInfo *       g_signal_info_get_class_closure     (GISignalInfo *info);

   Obtain the class closure for this signal if one is set. The class closure is a virtual function on the type that the
   signal belongs to. If the signal lacks a closure NULL will be returned.

   info :    a GISignalInfo
   Returns : the class closure or NULL. [transfer full]

   -----------------------------------------------------------------------------------------------------------------------

  g_signal_info_true_stops_emit ()

 gboolean            g_signal_info_true_stops_emit       (GISignalInfo *info);

   Obtain if the returning true in the signal handler will stop the emission of the signal.

   info :    a GISignalInfo
   Returns : TRUE if returning true stops the signal emission

   -----------------------------------------------------------------------------------------------------------------------

                                                Generated by GTK-Doc V1.18.1

References

   Visible links
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIVFuncInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIEnumInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIVFuncInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-repository-structs.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/index.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIEnumInfo.html
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#gi-GISignalInfo.synopsis
   . file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#gi-GISignalInfo.description
   . GI_IS_SIGNAL_INFO()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GI-IS-SIGNAL-INFO:CAPS
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . g_signal_info_get_flags ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#g-signal-info-get-flags
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GIVFuncInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIVFuncInfo.html#GIVFuncInfo
   . g_signal_info_get_class_closure ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#g-signal-info-get-class-closure
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . g_signal_info_true_stops_emit ()
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#g-signal-info-true-stops-emit
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GICallableInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GICallableInfo.html#GICallableInfo
   . GICallableInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GICallableInfo.html#GICallableInfo
   . GIBaseInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIBaseInfo.html
   . GICallableInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GICallableInfo.html
   . GIFunctionInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIFunctionInfo.html
   . GIVFuncInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIVFuncInfo.html
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GIVFuncInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GIVFuncInfo.html#GIVFuncInfo
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
   . GISignalInfo
	file:///media/Liberty/tybor-liberty/src/wrappers/gobject-introspection/library/gi-html-1.35.9/gi-GISignalInfo.html#GISignalInfo
