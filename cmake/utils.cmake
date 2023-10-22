


macro(get_system_includes output_list)
  set(${output_list})
  foreach(dir ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})
    message(STATUS ${dir})
    list(APPEND ${output_list} -isystem ${dir})
  endforeach()
endmacro()


macro(add_sources_and_assemble target)
  get_system_includes(system_includes)

  set(SOURCE_FILES ${ARGN})
  foreach(src_file ${SOURCE_FILES})
    get_filename_component(src_name ${src_file} NAME_WE)

    add_custom_command(
      OUTPUT ${src_name}.s
      COMMAND ${CLANG} ${CMAKE_C_FLAGS} ${CLANG_FLAGS} ${system_includes}
                ${CMAKE_CURRENT_SOURCE_DIR}/${src_file}
      COMMAND ${LLC} ${CMAKE_C_FLAGS} ${LLC_FLAGS} ${src_name}.ll
                -o ${src_name}.s
      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${src_file}
    )

    target_sources(${target} PRIVATE ${src_name}.s)
  endforeach()
endmacro()
