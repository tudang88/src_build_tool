import QtQuick 2.0
import QtQuick.Controls 2.12
CheckBox {
    id: custom_checkbox
    property real __scale: 1.0
    property var normal_img: ""
    property var checked_img: ""
    width: checkbox_bg.width
    height: checkbox_bg.height
    indicator: Image {
        id: checkbox_bg
        width: implicitWidth * __scale
        height: implicitHeight * __scale
        source: custom_checkbox.checked ? checked_img: normal_img
    }
}
