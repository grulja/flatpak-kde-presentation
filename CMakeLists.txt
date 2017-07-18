project(flatpak-kde)

cmake_minimum_required(VERSION 2.8.12)

find_package(ECM REQUIRED NO_MODULE)

set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(Qt5 5.7.1 REQUIRED CONFIG COMPONENTS Widgets Test Network Xml Concurrent DBus Quick)
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDEFrameworkCompilerSettings NO_POLICY_SCOPE)
include(ECMInstallIcons)

qt5_add_resources(flatpak_kde_SRCS assets.qrc)
qt5_add_resources(flatpak_kde_SRCS resources.qrc)

add_subdirectory(icons)

add_executable(flatpak-kde ${flatpak_kde_SRCS}
    main.cpp
)

set_target_properties(flatpak-kde PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/flatpak-kde)

target_link_libraries(flatpak-kde LINK_PUBLIC Qt5::Quick)

install(TARGETS flatpak-kde ${INSTALL_TARGETS_DEFAULT_ARGS} )

install(PROGRAMS org.kde.flatpak-kde.desktop  DESTINATION ${KDE_INSTALL_APPDIR})
install( FILES org.kde.flatpak-kde.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR} )
