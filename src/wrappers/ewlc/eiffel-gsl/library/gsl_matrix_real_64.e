indexing
	description: "real 64 matrix"
	copyright: "(C) 2006 Paolo Redaelli %
				  %    2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class GSL_MATRIX_REAL_64
	
inherit
	COLLECTION2 [REAL_64]
		undefine
			out
		end

insert
	GSL_MATRIX_GENERAL[REAL_64]

create {ANY} make, make_zero, make_identity, from_model, from_collection2, manifest_creation

feature {ANY}
	get_column (i: INTEGER_32): GSL_VECTOR_REAL_64 is
		do
			create Result.make(line_count)
			handle_code(gsl_matrix_get_col (Result.handle, handle, i))
		end

	get_row (i: INTEGER_32): GSL_VECTOR_REAL_64 is
		do
			create Result.make(column_count)
			handle_code(gsl_matrix_get_row (Result.handle, handle, i))
		end

feature {} -- External calls

	gsl_matrix_alloc (a_n1, a_n2: INTEGER_32): POINTER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_alloc"
		}"
		end
	
	gsl_matrix_calloc (n1,n2: INTEGER): POINTER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_calloc"
		}"
		end
	
	gsl_matrix_free (a_gsl_matrix: POINTER) is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_free"
		}" 
		end

	gsl_matrix_get (a_gsl_matrix: POINTER; a_i, a_j: INTEGER): REAL is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_get"
		}"
		end

	gsl_matrix_set (a_gsl_matrix: POINTER; a_i, a_j: INTEGER; an_x: REAL) is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set"
		}" 
		end

	gsl_matrix_ptr (a_gsl_matrix: POINTER; a_i, a_j: INTEGER): POINTER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_ptr"
		}"
		end

	gsl_matrix_set_all (a_gsl_matrix: POINTER; an_x: REAL) is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set_all"
		}"
		end

	gsl_matrix_set_zero (a_gsl_matrix: POINTER)  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set_zero"
		}"
		end

	gsl_matrix_set_identity (a_gsl_matrix: POINTER)  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set_identity"
		}"
		end

	gsl_matrix_fwrite (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_fwrite"
		}"
		end

	gsl_matrix_fread (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_fread"
		}"
		end

	gsl_matrix_fprintf (a_stream, a_gsl_matrix, a_format: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_fprintf"
		}"
		end
	
	gsl_matrix_fscanf (a_stream, a_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_fscanf"
		}"
		end

	gsl_matrix_memcpy (a_dest, a_src: POINTER): INTEGER   is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_memcpy"
		}"
		end

	gsl_matrix_swap (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_swap"
		}"
		end

	gsl_matrix_get_row (a_vector, a_gsl_matrix: POINTER; an_i: INTEGER): INTEGER   is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_get_row"
		}"
		end

	gsl_matrix_get_col (a_gsl_vector, a_gsl_matrix: POINTER; a_j: INTEGER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_get_col"
		}"
		end

	gsl_matrix_set_row (a_gsl_matrix: POINTER; an_i: INTEGER; a_gsl_vector: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set_row"
		}"
		end

	gsl_matrix_set_col (a_gsl_matrix: POINTER; an_j: INTEGER; a_gsl_vector: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_set_col"
		}"
		end

	gsl_matrix_swap_rows (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_swap_rows"
		}"
		end

	gsl_matrix_swap_columns (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_swap_columns"
		}"
		end

	gsl_matrix_swap_rowcol (a_gsl_matrix: POINTER; an_i, a_j: INTEGER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_swap_rowcol"
		}"
		end

	gsl_matrix_transpose_memcpy (a_gsl_matrix_dest, a_gsl_matrix_src: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_transpose_memcpy"
		}"
		end

	gsl_matrix_transpose (a_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_transpose"
		}"
		end


	gsl_matrix_add (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_add"
		}"
		end

	gsl_matrix_sub (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_sub"
		}"
		end

	gsl_matrix_mul_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_mul_elements"
		}"
		end
	
	gsl_matrix_div_elements (a_gsl_matrix, another_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_div_elements"
		}"
		end
	
	gsl_matrix_scale (a_gsl_matrix: POINTER; a_scale: REAL): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_scale"
		}"
		end
	
	gsl_matrix_add_constant (a_gsl_matrix: POINTER; a_constant: REAL): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_add_constant"
		}"
		end

	
	gsl_matrix_max (a_gsl_matrix: POINTER): REAL  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_max"
		}"
		end
	
	gsl_matrix_min (a_gsl_matrix: POINTER): REAL  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_min"
		}"
		end

	gsl_matrix_minmax (a_gsl_matrix, a_min_out, a_max_out: POINTER)  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_minmax"
		}"
		end

	gsl_matrix_max_index (a_gsl_matrix, an_imax_ptr, a_jmax_ptr: POINTER)  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_max_index"
		}"
		end

	gsl_matrix_min_index (a_gsl_matrix, an_imin_ptr, a_jmin_ptr: POINTER)  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_min_index"
		}"
		end

	gsl_matrix_minmax_index (matrix, imin_ptr, jmin_ptr, imax_ptr, jmax_ptr : POINTER) is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_minmax_index"
		}"
		end

	gsl_matrix_isnull (a_gsl_matrix: POINTER): INTEGER  is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_matrix_isnull"
		}"
		end

feature {}-- Accessing gsl_matrix struct

	c_structure_size: INTEGER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_c_struct_size"
			}"
		end

	get_size1 (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_size1"
			}"
		end

	get_size2 (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_size2"
			}"
		end

	get_tda (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_tda"
			}"
		end

	get_data (a_matrix: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_data"
			}"
		end
	
	get_block  (a_matrix: POINTER): POINTER is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_block"
			}"
		end

	get_owner (a_matrix: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "matrix_double_owner"
			}"
		end

	gsl_blas_gemv(trans_a: INTEGER_32; alpha: REAL_64; a_p, x_p:POINTER; beta: REAL_64; y_p: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_blas_dgemv"
			}"
		end
	
	gsl_blas_gemm(trans_a, trans_b: INTEGER_32; alpha: REAL_64; a_p: POINTER; b_p: POINTER; beta: REAL_64; c_p: POINTER): INTEGER_32 is
		external "plug_in"
		alias "{
			location: "${eiffel_libraries}/plugins"
			module_name: "eiffel-gsl"
			feature_name: "gsl_blas_dgemm"
			}"
		end	
end
