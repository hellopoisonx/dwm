# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hpxx/dwm_orig

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hpxx/dwm_orig/build

# Include any dependencies generated for this target.
include CMakeFiles/dwm.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/dwm.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/dwm.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dwm.dir/flags.make

CMakeFiles/dwm.dir/codegen:
.PHONY : CMakeFiles/dwm.dir/codegen

CMakeFiles/dwm.dir/drw.c.o: CMakeFiles/dwm.dir/flags.make
CMakeFiles/dwm.dir/drw.c.o: /home/hpxx/dwm_orig/drw.c
CMakeFiles/dwm.dir/drw.c.o: CMakeFiles/dwm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/hpxx/dwm_orig/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/dwm.dir/drw.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/dwm.dir/drw.c.o -MF CMakeFiles/dwm.dir/drw.c.o.d -o CMakeFiles/dwm.dir/drw.c.o -c /home/hpxx/dwm_orig/drw.c

CMakeFiles/dwm.dir/drw.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/dwm.dir/drw.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hpxx/dwm_orig/drw.c > CMakeFiles/dwm.dir/drw.c.i

CMakeFiles/dwm.dir/drw.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/dwm.dir/drw.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hpxx/dwm_orig/drw.c -o CMakeFiles/dwm.dir/drw.c.s

CMakeFiles/dwm.dir/dwm.c.o: CMakeFiles/dwm.dir/flags.make
CMakeFiles/dwm.dir/dwm.c.o: /home/hpxx/dwm_orig/dwm.c
CMakeFiles/dwm.dir/dwm.c.o: CMakeFiles/dwm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/hpxx/dwm_orig/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/dwm.dir/dwm.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/dwm.dir/dwm.c.o -MF CMakeFiles/dwm.dir/dwm.c.o.d -o CMakeFiles/dwm.dir/dwm.c.o -c /home/hpxx/dwm_orig/dwm.c

CMakeFiles/dwm.dir/dwm.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/dwm.dir/dwm.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hpxx/dwm_orig/dwm.c > CMakeFiles/dwm.dir/dwm.c.i

CMakeFiles/dwm.dir/dwm.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/dwm.dir/dwm.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hpxx/dwm_orig/dwm.c -o CMakeFiles/dwm.dir/dwm.c.s

CMakeFiles/dwm.dir/util.c.o: CMakeFiles/dwm.dir/flags.make
CMakeFiles/dwm.dir/util.c.o: /home/hpxx/dwm_orig/util.c
CMakeFiles/dwm.dir/util.c.o: CMakeFiles/dwm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/hpxx/dwm_orig/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/dwm.dir/util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/dwm.dir/util.c.o -MF CMakeFiles/dwm.dir/util.c.o.d -o CMakeFiles/dwm.dir/util.c.o -c /home/hpxx/dwm_orig/util.c

CMakeFiles/dwm.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/dwm.dir/util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/hpxx/dwm_orig/util.c > CMakeFiles/dwm.dir/util.c.i

CMakeFiles/dwm.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/dwm.dir/util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/hpxx/dwm_orig/util.c -o CMakeFiles/dwm.dir/util.c.s

# Object files for target dwm
dwm_OBJECTS = \
"CMakeFiles/dwm.dir/drw.c.o" \
"CMakeFiles/dwm.dir/dwm.c.o" \
"CMakeFiles/dwm.dir/util.c.o"

# External object files for target dwm
dwm_EXTERNAL_OBJECTS =

dwm: CMakeFiles/dwm.dir/drw.c.o
dwm: CMakeFiles/dwm.dir/dwm.c.o
dwm: CMakeFiles/dwm.dir/util.c.o
dwm: CMakeFiles/dwm.dir/build.make
dwm: CMakeFiles/dwm.dir/compiler_depend.ts
dwm: /usr/lib/libfontconfig.so
dwm: /usr/lib/libSM.so
dwm: /usr/lib/libICE.so
dwm: /usr/lib/libX11.so
dwm: /usr/lib/libXext.so
dwm: /usr/lib/libXft.so
dwm: /usr/lib/libfreetype.so
dwm: CMakeFiles/dwm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/hpxx/dwm_orig/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable dwm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dwm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dwm.dir/build: dwm
.PHONY : CMakeFiles/dwm.dir/build

CMakeFiles/dwm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dwm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dwm.dir/clean

CMakeFiles/dwm.dir/depend:
	cd /home/hpxx/dwm_orig/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hpxx/dwm_orig /home/hpxx/dwm_orig /home/hpxx/dwm_orig/build /home/hpxx/dwm_orig/build /home/hpxx/dwm_orig/build/CMakeFiles/dwm.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/dwm.dir/depend

