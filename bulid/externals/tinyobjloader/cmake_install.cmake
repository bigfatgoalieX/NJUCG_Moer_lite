# Install script for directory: /mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/externals/tinyobjloader

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/target/lib/libtinyobjloader.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake/tinyobjloader-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake/tinyobjloader-targets.cmake"
         "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/CMakeFiles/Export/lib/tinyobjloader/cmake/tinyobjloader-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake/tinyobjloader-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake/tinyobjloader-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake" TYPE FILE FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/CMakeFiles/Export/lib/tinyobjloader/cmake/tinyobjloader-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake" TYPE FILE FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/CMakeFiles/Export/lib/tinyobjloader/cmake/tinyobjloader-targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/externals/tinyobjloader/tiny_obj_loader.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/tinyobjloader" TYPE FILE FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/externals/tinyobjloader/LICENSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/tinyobjloader/cmake" TYPE FILE FILES
    "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/tinyobjloader-config.cmake"
    "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/tinyobjloader-config-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/mnt/d/NJU_undergraduate/大三下/图形绘制技术/CG_project/NJUCG_Moer_lite/bulid/externals/tinyobjloader/tinyobjloader.pc")
endif()

