import QtQuick 2.0
import "../component"
Item {
    id: rc_root
    property real __scale: 0.75
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton
    Rectangle {
        id : rc_backgroud
        anchors.fill: parent
        color: "white"
    }
    // main web view
    StreamingWebView {
        id: rc_webview
        __scale: rc_root.__scale
        anchors {
            top: rc_root.top
            left: rc_root.left
            topMargin: 209 * rc_root.__scale
            leftMargin: 37 * rc_root.__scale
        }
    }
    //StreamModeButton
    StreamModeButton {
        id: rc_mode
        __scale: rc_root.__scale
        anchors {
            top: rc_root.top
            left: rc_webview.right
            topMargin: 347 * rc_root.__scale
            leftMargin: 37 * rc_root.__scale
        }
    }
    // Screenshot button
    CustomPushButton {
        id: rc_screenshot
        __scale: rc_root.__scale
        normal_img: "qrc:/ui/assets/screenshot_normal.png"
        pressed_img: "qrc:/ui/assets/screenshot_pressed.png"
        anchors {
            top: rc_mode.bottom
            left: rc_webview.right
            topMargin: 70 * rc_root.__scale
            leftMargin: 37 * rc_root.__scale
        }
    }

    /* Copyright */
    Copyright {
        local_scale: rc_root.__scale
        anchors {
            bottom: rc_root.bottom
            left: rc_root.left
            leftMargin: 510 * rc_root.__scale
        }
    }
}
