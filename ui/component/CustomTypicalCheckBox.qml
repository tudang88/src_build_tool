import QtQuick 2.0
import QtQuick.Controls 2.12
CheckBox {
    id: custom_typical_checkbox
    property real __scale: 1.0
    property var __icon: ""
    width: checkbox_indicator.width
    height: checkbox_indicator.height
    indicator: Rectangle {
        id: checkbox_indicator
        width: 54 * __scale
        height: 38 * __scale
        border.width: 1
        Image {
            id: checkbox_bg
            anchors.centerIn: parent
            width: implicitWidth * __scale
            height: implicitHeight * __scale
            source: custom_typical_checkbox.__icon
            visible: checked
        }
    }

}
