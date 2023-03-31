#
# For basic cmake file structure see: http://doc.qt.io/qt-5/cmake-manual.html
#
cmake_minimum_required(VERSION 2.8.11)


project({PROJECT_NAME})

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_PREFIX_PATH ${QT_ROOT_DIR})

set(CMAKE_CXX_STANDARD 17)

add_definitions(-DUNICODE)
add_definitions(-D_UNICODE)

# Find the Qt libraries for Qt Quick/QML
find_package(Qt5 COMPONENTS Core Gui Widgets Qml Quick QuickWidgets REQUIRED)

# add source files
set(SOURCE 
	${SOURCE}
	{FILELIST}
)

# Tell CMake to create the helloworld executable
add_executable({PROJECT_NAME} WIN32 ${SOURCE} ${qml_QRC})

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /Zi")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} /DEBUG /OPT:REF /OPT:ICF")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /DEBUG /OPT:REF /OPT:ICF")

# Use the Qml/Quick modules from Qt 5.
target_link_libraries({PROJECT_NAME} Qt5::Qml Qt5::Quick Qt5::Widgets Qt5::QuickWidgets Shlwapi.lib)
