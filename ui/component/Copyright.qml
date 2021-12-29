import QtQuick 2.0

Item {
    property real local_scale: 1.0
    property alias text: copyright.text
    Text {
        id: copyright
        color: "#e0dcdc"
        font.pixelSize: 24 * local_scale
        text: "Copyright 2021-2051 | It is free to use"
    }
}
