import QtQuick 2.0

Item {
    id: hmi_edit_dialog
    property real __scale: 1.0
    width: blur_bg.width
    height: blur_bg.height
    // background
    Image {
        id: blur_bg
        width: implicitWidth * hmi_edit_dialog.__scale
        height: implicitHeight * hmi_edit_dialog.__scale
        source: "qrc:/ui/assets/dialog_bg_blur.png"
        anchors {
            top: hmi_edit_dialog.top
            left: hmi_edit_dialog.left
        }
    }
    // working area
    Rectangle {
        id: working_area
        color: "white"
        width: 1316 * hmi_edit_dialog.__scale
        height: 924 * hmi_edit_dialog.__scale
        anchors.centerIn: parent


    }
}
