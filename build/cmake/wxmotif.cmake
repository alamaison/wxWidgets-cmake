# Set the base flags for the Motif port
add_definitions(-D__WXMOTIF__)

# Motif port uses the configuration system
include("${CMAKE_CURRENT_LIST_DIR}/wxconfigure.cmake")

find_package(Motif REQUIRED)

set(WXBUILD_PORT_INCLUDE_DIRS ${MOTIF_INCLUDE_DIR})
set(WXBUILD_PORT_LIBRARIES ${MOTIF_LIBRARIES} ${X11_LIBRARIES})
