import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: configure_remote_control_component
    property real __scale: 1.0
    width: 1280 * __scale
    height: 160 * __scale
    ConfigureHeadLine {
        id: configure_remote_control_head
        __scale: configure_remote_control_component.__scale
        headText: "Remote Control"
        anchors {
            left: parent.left
            top: parent.top
        }
    }
    // setting jpeg server
    ConfigureTwoEditText {
        id: configure_jpeg_server
        __scale: configure_remote_control_component.__scale
        title: "Jpeg Server"
        adding_info: "Port"
        anchors {
            top: configure_remote_control_head.bottom
            left: configure_remote_control_component.left
            topMargin: 26 * configure_remote_control_component.__scale
            leftMargin: 86 * configure_remote_control_component.__scale
        }
    }

    // Disable Proxy
    ConfigureCheckButton {
        id: configure_proxy
        __scale: configure_remote_control_component.__scale
        title: "Disable Proxy"
        normal_img: "qrc:/ui/assets/configure_check_button_normal.png"
        checked_img: "qrc:/ui/assets/configure_check_button_checked.png"
        anchors {
            top: configure_jpeg_server.bottom
            left: configure_remote_control_component.left
            topMargin: 26 * configure_remote_control_component.__scale
            leftMargin: 86 * configure_remote_control_component.__scale
        }
    }
}
