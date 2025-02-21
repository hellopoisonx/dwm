cmake_minimum_required(VERSION 3.31)
project(dwm C)
set(CMAKE_C_STANDARD 99)
set(CMAKE_EXPORT_COMPILE_COMMANDS On)
set(DWM_VERSION 6.5)
set(PERMISSIONS_644 OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ)
set(PERMISSIONS_755
    OWNER_READ
    OWNER_EXECUTE
    OWNER_WRITE
    GROUP_EXECUTE
    GROUP_READ
    WORLD_EXECUTE
    WORLD_READ)
add_compile_definitions(VERSION="${DWM_VERSION}")

add_executable(
  dwm
  config.h
  drw.c
  drw.h
  dwm.c
  dwm.h
  util.c
  util.h
  themes/catppuccin.h)

install(
  TARGETS dwm
  PERMISSIONS ${PERMISSIONS_755}
  RUNTIME DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

install(
  FILES dwm.1
  DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man1/
  PERMISSIONS ${PERMISSIONS_644})

install(
  CODE "execute_process(COMMAND sed -i \"s/VERSION/${DWM_VERSION}/g\" ${CMAKE_INSTALL_PREFIX}/share/man/man1/dwm.1)"
)

find_package(X11 REQUIRED)
find_package(Freetype REQUIRED)
find_package(Fontconfig REQUIRED)

target_link_libraries(
  dwm
  PRIVATE ${Fontconfig_LIBRARY}
          ${X11_LIBRARIES}
          ${X11_x11_LIB}
          # ${X11_Xinerama_LIB}
          ${X11_Xft_LIB}
          ${FREETYPE_LIBRARY_RELEASE})

target_include_directories(
  dwm
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}
         ${Fontconfig_INCLUDE_DIR}
         ${X11_INCLUDE_DIR}
         ${X11_X11_INCLUDE_PATH}
         ${X11_Xft_INCLUDE_PATH}
         # ${X11_Xinerama_INCLUDE_PATH}
         ${FREETYPE_INCLUDE_DIR_freetype2})
