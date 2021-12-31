import QtQuick 2.0

Item {
    id: console_view
    property real __scale: 1.0
    // background
    Rectangle {
        id: console_bg
        anchors {
            top: console_view.top
            left: console_view.left
        }
        width: 1294 * console_view.__scale
        height: 476 * console_view.__scale
        color: "#E4EBEC"
    }
}
