import QtQuick 2.0

Item {
    id: configure_head
    property real __scale: 1.0
    property alias headText: head_text.text
    width: 1354 * __scale
    height:  40 * __scale
    Rectangle {
        id: head
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        width: 384 * configure_head.__scale
        height: 40 * configure_head.__scale
        radius: 20
        color: "#BED4E4"
        Text {
            id: head_text
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: 24 * configure_head.__scale
            font.family: "Arial"
            font.weight: Font.Bold
        }
    }
    Rectangle {
        id: decorator_line
        anchors {
            left: head.right
            right: parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: 7 * configure_head.__scale
        }
        radius: 5
        height: 5 * configure_head.__scale
        color: head.color
    }
}
