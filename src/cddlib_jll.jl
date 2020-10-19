# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule cddlib_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("cddlib")
JLLWrappers.@generate_main_file("cddlib", UUID("f07e07eb-5685-515a-97c8-3014f6152feb"))
end  # module cddlib_jll
