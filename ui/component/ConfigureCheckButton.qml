import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: configure_checkbox
    property real __scale: 1.0
    property alias title: title_text.text
    property alias isChecked: checkbox.checked
    property var normal_img: ""
    property var checked_img: ""
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * configure_checkbox.__scale
        height: 30 * configure_checkbox.__scale
        anchors {
            top: configure_checkbox.top
            left: configure_checkbox.left
        }
        Text {
            id: title_text
            anchors.centerIn: parent
            font.pixelSize: 24 * configure_checkbox.__scale
            font.family: "Arial"
        }
    }
    CheckBox {
        id: checkbox
        width: checkbox_bg.width
        height: checkbox_bg.height
        anchors {
            verticalCenter: title.verticalCenter
            left: title.right
        }
        indicator: Image {
            id: checkbox_bg
            width: implicitWidth * configure_checkbox.__scale
            height: implicitHeight * configure_checkbox.__scale
            source: checkbox.checked ? checked_img: normal_img
        }
    }

}
