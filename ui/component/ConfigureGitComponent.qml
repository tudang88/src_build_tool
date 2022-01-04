import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: configure_git_component
    property real __scale: 1.0
    width: 1280 * __scale
    height: 412 * __scale
    ConfigureHeadLine {
        id: configure_git_head
        __scale: configure_git_component.__scale
        headText: "Git"
        anchors {
            left: parent.left
            top: parent.top
        }
    }
    // manifest
    ConfigureEditTextBrowserButton {
        id: git_manifest
        __scale: configure_git_component.__scale
        title: "Manifest"
        anchors {
            top: configure_git_head.bottom
            topMargin: 26 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }

    // Default Branch
    ConfigureEditText {
        id: git_default_branch
        __scale: configure_git_component.__scale
        title: "Default Branch"
        anchors {
            top: git_manifest.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }

    // Max console line number
    ConfigureEditText {
        id: git_console_line_number
        __scale: configure_git_component.__scale
        title: "Max Console line"
        anchors {
            top: git_default_branch.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }

    // Log Record Directory
    ConfigureEditTextBrowserButton {
        id: git_log_dir
        __scale: configure_git_component.__scale
        title: "Log Record Directory"
        anchors {
            top: git_console_line_number.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }
    // Git protocol
    ConfigureCheckButton {
        id: git_protocol
        __scale: configure_git_component.__scale
        title: "Protocol"
        normal_img: "qrc:/ui/assets/git_protocol_ssh.png"
        checked_img: "qrc:/ui/assets/git_protocol_http.png"
        anchors {
            top: git_log_dir.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }
    // Gerrit Server
    ConfigureEditText {
        id: git_server_name
        __scale: configure_git_component.__scale
        title: "Gerrit Server"
        anchors {
            top: git_protocol.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }
    // User Name
    ConfigureEditText {
        id: git_usr_name
        __scale: configure_git_component.__scale
        title: "User Name"
        anchors {
            top: git_server_name.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }
    // Password
    ConfigurePassword {
        id: git_password
        __scale: configure_git_component.__scale
        anchors {
            top: git_usr_name.bottom
            topMargin: 12 * configure_git_component.__scale
            left: configure_git_component.left
            leftMargin: 86 * configure_git_component.__scale
        }
    }

}
