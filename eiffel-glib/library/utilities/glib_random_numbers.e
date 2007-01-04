   Link: GLib Reference Manual (start)
   Link: GLib Utilities (parent)
   Link: Date and Time Functions (previous)
   Link: Hook Functions (next)
   Link: GLib Overview (chapter)
   Link: GLib Fundamentals (chapter)
   Link: GLib Core Application Support (chapter)
   Link: GLib Utilities (chapter)
   Link: GLib Data Types (chapter)
   Link: GLib Tools (chapter)
   Link: Index (index)
   Link: Index of deprecated symbols (index)
   Link: Index of new symbols in 2.2 (index)
   Link: Index of new symbols in 2.4 (index)
   Link: Index of new symbols in 2.6 (index)
   Link: Index of new symbols in 2.8 (index)
   Link: Index of new symbols in 2.10 (index)
   Link: Index of new symbols in 2.12 (index)

   Prev Up Home                      GLib Reference Manual                      Next
   Top  |  Description

   Random Numbers

   Random Numbers -- pseudo-random number generator.

Synopsis


 #include <glib.h>


             GRand;
 GRand*      g_rand_new_with_seed            (guint32 seed);
 GRand*      g_rand_new_with_seed_array      (const guint32 *seed,
                                              guint seed_length);
 GRand*      g_rand_new                      (void);
 GRand*      g_rand_copy                     (GRand *rand_);
 void        g_rand_free                     (GRand *rand_);
 void        g_rand_set_seed                 (GRand *rand_,
                                              guint32 seed);
 void        g_rand_set_seed_array           (GRand *rand_,
                                              const guint32 *seed,
                                              guint seed_length);
 #define     g_rand_boolean                  (rand_)
 guint32     g_rand_int                      (GRand *rand_);
 gint32      g_rand_int_range                (GRand *rand_,
                                              gint32 begin,
                                              gint32 end);
 gdouble     g_rand_double                   (GRand *rand_);
 gdouble     g_rand_double_range             (GRand *rand_,
                                              gdouble begin,
                                              gdouble end);
 void        g_random_set_seed               (guint32 seed);
 #define     g_random_boolean                ()
 guint32     g_random_int                    (void);
 gint32      g_random_int_range              (gint32 begin,
                                              gint32 end);
 gdouble     g_random_double                 (void);
 gdouble     g_random_double_range           (gdouble begin,
                                              gdouble end);

Description

   The following functions allow you to use a portable, fast and good pseudo-random
   number generator (PRNG). It uses the Mersenne Twister PRNG, which was originally
   developed by Makoto Matsumoto and Takuji Nishimura. Further information can be
   found at www.math.keio.ac.jp/~matumoto/emt.html.

   If you just need a random number, you simply call the g_random_* functions, which
   will create a globally used GRand and use the according g_rand_* functions
   internally. Whenever you need a stream of reproducible random numbers, you better
   create a GRand yourself and use the g_rand_* functions directly, which will also
   be slightly faster. Initializing a GRand with a certain seed will produce exactly
   the same series of random numbers on all platforms. This can thus be used as a
   seed for e.g. games.

   The g_rand*_range functions will return high quality equally distributed random
   numbers, whereas for example the (g_random_int()%max) approach often doesn't
   yield equally distributed numbers.

   GLib changed the seeding algorithm for the pseudo-random number generator
   Mersenne Twister, as used by GRand and GRandom. This was necessary, because some
   seeds would yield very bad pseudo-random streams. Also the pseudo-random integers
   generated by g_rand*_int_range() will have a slightly better equal distribution
   with the new version of GLib.

   The original seeding and generation algorithms, as found in GLib 2.0.x, can be
   used instead of the new ones by setting the environment variable G_RANDOM_VERSION
   to the value of '2.0'. Use the GLib-2.0 algorithms only if you have sequences of
   numbers generated with Glib-2.0 that you need to reproduce exactly.

Details

  GRand

 typedef struct _GRand GRand;

   The GRand struct is an opaque data structure. It should only be accessed through
   the g_rand_* functions.

   ---------------------------------------------------------------------------------

  g_rand_new_with_seed ()

 GRand*      g_rand_new_with_seed            (guint32 seed);

   Creates a new random number generator initialized with seed.

   seed :    a value to initialize the random number generator.
   Returns : the new GRand.

   ---------------------------------------------------------------------------------

  g_rand_new_with_seed_array ()

 GRand*      g_rand_new_with_seed_array      (const guint32 *seed,
                                              guint seed_length);

   Creates a new random number generator initialized with seed.

   seed :        an array of seeds to initialize the random number generator.
   seed_length : an array of seeds to initialize the random number generator.
   Returns :     the new GRand.

   Since 2.4

   ---------------------------------------------------------------------------------

  g_rand_new ()

 GRand*      g_rand_new                      (void);

   Creates a new random number generator initialized with a seed taken either from
   /dev/urandom (if existing) or from the current time (as a fallback).

   Returns : the new GRand.

   ---------------------------------------------------------------------------------

  g_rand_copy ()

 GRand*      g_rand_copy                     (GRand *rand_);

   Copies a GRand into a new one with the same exact state as before. This way you
   can take a snapshot of the random number generator for replaying later.

   rand_ :   a GRand.
   Returns : the new GRand.

   Since 2.4

   ---------------------------------------------------------------------------------

  g_rand_free ()

 void        g_rand_free                     (GRand *rand_);

   Frees the memory allocated for the GRand.

   rand_ : a GRand.

   ---------------------------------------------------------------------------------

  g_rand_set_seed ()

 void        g_rand_set_seed                 (GRand *rand_,
                                              guint32 seed);

   Sets the seed for the random number generator GRand to seed.

   rand_ : a GRand.
   seed :  a value to reinitialize the random number generator.

   ---------------------------------------------------------------------------------

  g_rand_set_seed_array ()

 void        g_rand_set_seed_array           (GRand *rand_,
                                              const guint32 *seed,
                                              guint seed_length);

   Initializes the random number generator by an array of longs. Array can be of
   arbitrary size, though only the first 624 values are taken. This function is
   useful if you have many low entropy seeds, or if you require more then 32bits of
   actual entropy for your application.

   rand_ :       a GRand.
   seed :        array to initialize with
   seed_length : length of array

   Since 2.4

   ---------------------------------------------------------------------------------

  g_rand_boolean()

 #define     g_rand_boolean(rand_)

   Returns a random gboolean from rand_. This corresponds to a unbiased coin toss.

   rand_ :   a GRand.
   Returns : a random gboolean.

   ---------------------------------------------------------------------------------

  g_rand_int ()

 guint32     g_rand_int                      (GRand *rand_);

   Returns the next random guint32 from rand_ equally distributed over the range
   [0..2^32-1].

   rand_ :   a GRand.
   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_rand_int_range ()

 gint32      g_rand_int_range                (GRand *rand_,
                                              gint32 begin,
                                              gint32 end);

   Returns the next random gint32 from rand_ equally distributed over the range
   [begin..end-1].

   rand_ :   a GRand.
   begin :   lower closed bound of the interval.
   end :     upper open bound of the interval.
   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_rand_double ()

 gdouble     g_rand_double                   (GRand *rand_);

   Returns the next random gdouble from rand_ equally distributed over the range
   [0..1).

   rand_ :   a GRand.
   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_rand_double_range ()

 gdouble     g_rand_double_range             (GRand *rand_,
                                              gdouble begin,
                                              gdouble end);

   Returns the next random gdouble from rand_ equally distributed over the range
   [begin..end).

   rand_ :   a GRand.
   begin :   lower closed bound of the interval.
   end :     upper open bound of the interval.
   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_random_set_seed ()

 void        g_random_set_seed               (guint32 seed);

   Sets the seed for the global random number generator, which is used by the
   g_random_* functions, to seed.

   seed : a value to reinitialize the global random number generator.

   ---------------------------------------------------------------------------------

  g_random_boolean()

 #define     g_random_boolean()

   Returns a random gboolean. This corresponds to a unbiased coin toss.

   Returns : a random gboolean.

   ---------------------------------------------------------------------------------

  g_random_int ()

 guint32     g_random_int                    (void);

   Return a random guint32 equally distributed over the range [0..2^32-1].

   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_random_int_range ()

 gint32      g_random_int_range              (gint32 begin,
                                              gint32 end);

   Returns a random gint32 equally distributed over the range [begin..end-1].

   begin :   lower closed bound of the interval.
   end :     upper open bound of the interval.
   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_random_double ()

 gdouble     g_random_double                 (void);

   Returns a random gdouble equally distributed over the range [0..1).

   Returns : A random number.

   ---------------------------------------------------------------------------------

  g_random_double_range ()

 gdouble     g_random_double_range           (gdouble begin,
                                              gdouble end);

   Returns a random gdouble equally distributed over the range [begin..end).

   begin :   lower closed bound of the interval.
   end :     upper open bound of the interval.
   Returns : A random number.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Date-and-Time-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Hook-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-fundamentals.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-core.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-data-types.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/tools.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix01.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix02.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix03.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix04.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix05.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix06.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix07.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/ix08.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Date-and-Time-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-utilities.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/index.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Hook-Functions.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#id2984070
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#id2984528
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-new-with-seed
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-new-with-seed-array
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-new
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-copy
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-free
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-set-seed
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-set-seed-array
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-boolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-int
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-int-range
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-double
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-rand-double-range
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-set-seed
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-boolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-int
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-int-range
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-double
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-double-range
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . http://www.math.keio.ac.jp/~matumoto/emt.html
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#g-random-int
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Random-Numbers.html#GRand
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gboolean
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#guint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gint32
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
   . file:///usr/share/doc/libgtk2.0-doc/glib/glib-Basic-Types.html#gdouble
