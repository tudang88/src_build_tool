import QtQuick 2.0
import QtQuick.Controls 2.12
import "../component"
Item {
    id: cfg_root
    property real local_scale: 0.75
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton
    focus: true
    Rectangle {
        id : cfg_backgroud
        anchors.fill: parent
        color: "white"
    }
    Flickable {
        id: cfg_scroll_area
        focus: true
        clip: true
        width: 1385 * cfg_root.local_scale
        height: 708 * cfg_root.local_scale
        contentHeight: (cfg_git.height + cfg_compile.height + cfg_remote_control.height + cfg_theme.height + 5 * 22 * cfg_root.local_scale)
        boundsBehavior: Flickable.StopAtBounds
        Keys.onUpPressed: cfg_scroll_bar.decrease()
        Keys.onDownPressed: cfg_scroll_bar.increase()
        ScrollBar.vertical: ScrollBar {
            id: cfg_scroll_bar
            hoverEnabled: true
            active: hovered || pressed
            parent: cfg_scroll_area.parent
            anchors {
                top: cfg_scroll_area.top
                right: cfg_scroll_area.right
                bottom: cfg_scroll_area.bottom
            }
        }
        anchors {
            top: cfg_root.top
            topMargin: 188 * cfg_root.local_scale
            left: cfg_root.left
            leftMargin: 43 * cfg_root.local_scale
        }
        // Git configure area
        ConfigureGitComponent {
            id: cfg_git
            __scale: cfg_root.local_scale
            // no-need to binding vertical coordinate while attaching scroolbar to flickable
            // y: -cfg_scroll_bar.position * height
        }

        // Compile configure area
        ConfigureCompileComponent {
            id: cfg_compile
            __scale: cfg_root.local_scale
            anchors {
                top: cfg_git.bottom
                topMargin: 22 * cfg_root.local_scale
            }
        }
        // Remote control configure area
        ConfigureRemoteControlComponent {
            id: cfg_remote_control
            __scale: cfg_root.local_scale
            anchors {
                top: cfg_compile.bottom
                topMargin: 22 * cfg_root.local_scale
            }
        }
        // Themes configure area
         ConfigureThemeComponent {
            id: cfg_theme
            __scale: cfg_root.local_scale
            anchors {
                top: cfg_remote_control.bottom
                topMargin: 22 * cfg_root.local_scale
            }
            onSelectedItem: console.log("Select Product:", index)
        }
    }

    // apply button
    Rectangle {
        id: cfg_apply_button
        property bool isPressed: false
        color: "transparent"
        width: cfg_apply_bg.width
        height: cfg_apply_bg.height
        anchors {
            top: cfg_scroll_area.bottom
            left: cfg_root.left
            topMargin: 46 * cfg_root.local_scale
            leftMargin: 998 * cfg_root.local_scale
        }
        Image {
            id: cfg_apply_bg
            width: implicitWidth * cfg_root.local_scale
            height: implicitHeight * cfg_root.local_scale
            source: cfg_apply_button.isPressed?"qrc:/ui/assets/configure_apply_clicked.png":"qrc:/ui/assets/configure_apply_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: console.log("scroll_area height: ", cfg_scroll_area.height)
            onPressed: cfg_apply_button.isPressed = true
            onReleased: cfg_apply_button.isPressed = false
        }
    }
    // cancel button
    Rectangle {
        id: cfg_cancel_button
        property bool isPressed: false
        color: "transparent"
        width: cfg_cancel_bg.width
        height: cfg_cancel_bg.height
        anchors {
            top: cfg_scroll_area.bottom
            left: cfg_apply_button.right
            topMargin: 46 * cfg_root.local_scale
            leftMargin: 36 * cfg_root.local_scale
        }
        Image {
            id: cfg_cancel_bg
            width: implicitWidth * cfg_root.local_scale
            height: implicitHeight * cfg_root.local_scale
            source: cfg_cancel_button.isPressed?"qrc:/ui/assets/configure_cancel_clicked.png":"qrc:/ui/assets/configure_cancel_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: console.log("scroll_area content height: ", cfg_scroll_area.contentHeight)
            onPressed: cfg_cancel_button.isPressed = true
            onReleased: cfg_cancel_button.isPressed = false
        }
    }

    /* Copyright */
    Copyright {
        local_scale: cfg_root.local_scale
        anchors {
            bottom: cfg_root.bottom
            left: cfg_root.left
            leftMargin: 510 * cfg_root.local_scale
        }
    }
}
