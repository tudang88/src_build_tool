import QtQuick 2.0

Item {
    property real local_scale: 1.0
    property alias text: copyright.text
    width: copyright.implicitWidth
    height: copyright.implicitHeight
    Text {
        id: copyright
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#e0dcdc"
        font.pixelSize: 18 * local_scale
        text: "         Copyright 2021-2051 | It is free to use"
    }
}
