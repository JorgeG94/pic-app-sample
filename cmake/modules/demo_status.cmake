function(print_summary)
  message(STATUS "")
  message(STATUS "========== ${project_name} Configuration Summary ==========")
  message(STATUS "  Fortran compiler      : ${CMAKE_Fortran_COMPILER_ID}")
  message(STATUS "  ENABLE_TESTING    : ${ENABLE_TESTING}")
  message(STATUS "===============================================")
endfunction()
