import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: configure_compile_component
    property real __scale: 1.0
    width: 1280 * __scale
    height: 268 * __scale
    ConfigureHeadLine {
        id: configure_compile_head
        __scale: configure_compile_component.__scale
        headText: "Compile"
        anchors {
            left: parent.left
            top: parent.top
        }
    }
    // Log record dir
    ConfigureEditTextBrowserButton {
        id: compile_log_dir
        __scale: configure_compile_component.__scale
        title: "Log Record Directory"
        anchors {
            top: configure_compile_head.bottom
            topMargin: 26 * configure_compile_component.__scale
            left: configure_compile_component.left
            leftMargin: 86 * configure_compile_component.__scale
        }
    }

    // Max Console Line
    ConfigureEditText {
        id: compile_console_line_number
        __scale: configure_compile_component.__scale
        title: "Max Console Line"
        anchors {
            top: compile_log_dir.bottom
            topMargin: 26 * configure_compile_component.__scale
            left: configure_compile_component.left
            leftMargin: 86 * configure_compile_component.__scale
        }
    }

    // Docker Env Script
    ConfigureEditTextBrowserButton {
        id: compile_docker_bin
        __scale: configure_compile_component.__scale
        title: "Docker Env Script"
        anchors {
            top: compile_console_line_number.bottom
            topMargin: 26 * configure_compile_component.__scale
            left: configure_compile_component.left
            leftMargin: 86 * configure_compile_component.__scale
        }
    }

    // Export html report
    ConfigureCheckButton {
        id: compile_report_html
        __scale: configure_compile_component.__scale
        title: "Export HTML Report"
        normal_img: "qrc:/ui/assets/configure_check_button_normal.png"
        checked_img: "qrc:/ui/assets/configure_check_button_checked.png"
        anchors {
            top: compile_docker_bin.bottom
            topMargin: 26 * configure_compile_component.__scale
            left: configure_compile_component.left
            leftMargin: 86 * configure_compile_component.__scale
        }
    }
}
