# Autogenerated wrapper script for cddlib_jll for x86_64-unknown-freebsd11.1
export libcddgmp, libcdd

using GMP_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libcddgmp`
const libcddgmp_splitpath = ["lib", "libcddgmp.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcddgmp_path = ""

# libcddgmp-specific global declaration
# This will be filled out by __init__()
libcddgmp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcddgmp = "libcddgmp.so.0"


# Relative path to `libcdd`
const libcdd_splitpath = ["lib", "libcdd.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcdd_path = ""

# libcdd-specific global declaration
# This will be filled out by __init__()
libcdd_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcdd = "libcdd.so.0"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"cddlib")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list,))

    global libcddgmp_path = normpath(joinpath(artifact_dir, libcddgmp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcddgmp_handle = dlopen(libcddgmp_path)
    push!(LIBPATH_list, dirname(libcddgmp_path))

    global libcdd_path = normpath(joinpath(artifact_dir, libcdd_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcdd_handle = dlopen(libcdd_path)
    push!(LIBPATH_list, dirname(libcdd_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

