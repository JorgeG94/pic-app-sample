# Unit testing
set(tests "base_utils")

set(test-srcs "main_tests.f90")
foreach(t IN LISTS tests)
  string(MAKE_C_IDENTIFIER ${t} t)
  list(APPEND test-srcs "test_${t}.f90")
endforeach()

add_executable("${project_name}-tester" "${test-srcs}")

set_target_properties(
  "${project_name}-tester"
  PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
             Fortran_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/tests/modules")
target_include_directories("${project_name}-tester"
                           PRIVATE "${CMAKE_BINARY_DIR}/modules")
target_link_libraries("${project_name}-tester" PRIVATE "${main_lib}"
                                                       test-drive::test-drive)

message(STATUS "Adding the following tests to ctests...")
foreach(t IN LISTS tests)
  message(STATUS "${project_name}/${t} ${project_name}-tester ${t}")
  add_test("${project_name}/${t}" "${project_name}-tester" "${t}")
endforeach()
