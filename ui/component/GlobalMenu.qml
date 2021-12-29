import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: global_menu_root
    property real local_scale: 1.0
    property bool showFlag: false
    width: gbl_bg_img.width
    height: gbl_bg_img.height
    Image {
        id: gbl_bg_img
        width: implicitWidth * global_menu_root.local_scale
        height: implicitHeight * global_menu_root.local_scale
        source: "qrc:/ui/assets/global_menu_bg.png"
    }
    // home button
    GlobalMenuButton {
        id: glb_home_button
        checked: true
        local_scale: global_menu_root.local_scale
        checked_image: "qrc:/ui/assets/global_menu_home_checked.png"
        normal_image: "qrc:/ui/assets/global_menu_home_nomal.png"
    }
    // git button
    GlobalMenuButton {
        id: glb_git_button
        anchors {
            left: glb_home_button.right
        }
        local_scale: global_menu_root.local_scale
        checked_image: "qrc:/ui/assets/global_menu_git_icon_checked.png"
        normal_image: "qrc:/ui/assets/global_menu_git_icon_normal.png"
    }
    // compile button
    GlobalMenuButton {
        id: glb_compile_button
        anchors {
            left: glb_git_button.right
        }
        local_scale: global_menu_root.local_scale
        checked_image: "qrc:/ui/assets/global_menu_compile_icon_checked.png"
        normal_image: "qrc:/ui/assets/global_menu_compile_icon_normal.png"
    }
    // remote control button
    GlobalMenuButton {
        id: glb_rc_button
        anchors {
            left: glb_compile_button.right
        }
        local_scale: global_menu_root.local_scale
        checked_image: "qrc:/ui/assets/global_menu_rc_icon_checked.png"
        normal_image: "qrc:/ui/assets/global_menu_rc_icon_normal.png"
    }
    // configure button
    GlobalMenuButton {
        id: glb_configure_button
        anchors {
            left: glb_rc_button.right
        }
        local_scale: global_menu_root.local_scale
        checked_image: "qrc:/ui/assets/global_menu_configure_icon_checked.png"
        normal_image: "qrc:/ui/assets/global_menu_configure_icon_normal.png"
    }
    // binding state with visible property
    state: showFlag?"st_show":"st_hide"
    states: [
        State {
            name: "st_show"
            PropertyChanges {
                target: global_menu_root
                scale: 1
            }
        },
        State {
            name: "st_hide"
            PropertyChanges {
                target: global_menu_root
                scale: 0
            }
        }
    ]
    // define transition
    transitions: [
        Transition {
            from: "st_show"
            to: "st_hide"
            NumberAnimation {property: "scale"; from: 1; to: 0; duration: 300}
        },
        Transition {
            from: "st_hide"
            to: "st_show"
            NumberAnimation {property: "scale"; from: 0; to: 1; duration: 300}
        }
    ]
}
