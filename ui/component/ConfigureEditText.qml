import QtQuick 2.0

Item {
    id: edit_text
    property real __scale: 1.0
    property alias title: title_text.text
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * edit_text.__scale
        height: 30 * edit_text.__scale
        anchors {
            top: edit_text.top
            left: edit_text.left
        }
        Text {
            id: title_text
            anchors.centerIn: parent
            font.pixelSize: 24 * edit_text.__scale
            font.family: "Arial"
        }
    }
    //edit text background
    Rectangle {
        id: edit_text_bg
        border.width: 1
        width: 748 * edit_text.__scale
        height: 30 * edit_text.__scale
        anchors {
            top: edit_text.top
            left: title.right
        }
    }
    TextEdit {
        id: main_edit_text
//        horizontalAlignment: TextEdit.AlignRight
        width: edit_text_bg.width
        anchors {
            top: edit_text_bg.top
            topMargin: 2
            left: edit_text_bg.left
            leftMargin: 2
        }
        font.pixelSize: 20 * edit_text.__scale
        font.family: "Arial"

    }
}
