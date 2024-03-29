cmake_minimum_required(VERSION 3.16)
project(linux-operating_system)


add_subdirectory(operating_system-linux/node_linux)
add_subdirectory(operating_system-posix/acme_posix)
add_subdirectory(operating_system-linux/acme_linux)
add_subdirectory(operating_system-posix/apex_posix)
add_subdirectory(operating_system-linux/apex_linux)
add_subdirectory(operating_system-posix/aura_posix)
add_subdirectory(operating_system-linux/aura_linux)
if(LXDE_DESKTOP)
    add_subdirectory(operating_system-posix/windowing_x11)
    add_subdirectory(operating_system-posix/node_gtk)
    add_subdirectory(operating_system-posix/node_gnome)
    add_subdirectory(operating_system-linux/desktop_environment_gnome)
endif()
if(XFCE_DESKTOP)
    add_subdirectory(operating_system-posix/windowing_x11)
    add_subdirectory(operating_system-posix/node_gtk3)
    add_subdirectory(operating_system-posix/node_xfce)
    add_subdirectory(operating_system-linux/desktop_environment_xfce)
endif()
if(GNOME_DESKTOP)
    add_subdirectory(operating_system-posix/windowing_x11)
    if(${HAS_WAYLAND})
        add_subdirectory(operating_system-posix/windowing_wayland)
    endif()
    if(${HAS_GTK4})
        add_subdirectory(operating_system-posix/node_gtk4)
    elseif(${HAS_GTK3})
        add_subdirectory(operating_system-posix/node_gtk3)
    endif()
    add_subdirectory(operating_system-posix/node_gnome)
    add_subdirectory(operating_system-linux/desktop_environment_gnome)
endif()
if(KDE_DESKTOP)
    add_subdirectory(operating_system-posix/windowing_x11)
    add_subdirectory(operating_system-posix/windowing_xcb)
    if(${HAS_WAYLAND})
        add_subdirectory(operating_system-posix/windowing_wayland)
    endif()
    add_subdirectory(operating_system-posix/node_kde)
    add_subdirectory(operating_system-linux/desktop_environment_kde)
endif()


add_subdirectory(operating_system-posix/write_text_pango)
add_subdirectory(operating_system-posix/audio_alsa)
#add_subdirectory(operating_system-posix/audio_sndio)
add_subdirectory(operating_system-posix/input_libinput)
add_subdirectory(operating_system-posix/input_xinput)
if(${HAS_AUDIO_SYSTEM})
    add_subdirectory(operating_system-linux/audio_mixer_alsa)
endif()
if(${HAS_APP_VERIWELL})
add_subdirectory(operating_system-posix/music_midi_alsa)
endif()



