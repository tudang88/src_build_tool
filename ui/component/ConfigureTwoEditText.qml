import QtQuick 2.0

Item {
    id: two_edit_text
    property real __scale: 1.0
    property alias title: title_text.text
    property alias adding_info: second_title_label.text
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * two_edit_text.__scale
        height: 30 * two_edit_text.__scale
        anchors {
            top: two_edit_text.top
            left: two_edit_text.left
        }
        Text {
            id: title_text
            anchors.centerIn: parent
            font.pixelSize: 24 * two_edit_text.__scale
            font.family: "Arial"
        }
    }
    //first edit text
    Rectangle {
        id: edit_text_bg
        border.width: 1
        width: 518 * two_edit_text.__scale
        height: 30 * two_edit_text.__scale
        anchors {
            top: two_edit_text.top
            left: title.right
        }
    }
    TextEdit {
        id: main_edit_text
        horizontalAlignment: TextEdit.AlignRight
        width: edit_text_bg.width
        anchors {
            top: edit_text_bg.top
            left: edit_text_bg.left
            topMargin: 2
            rightMargin: 5
        }
        font.pixelSize: 20 * two_edit_text.__scale
        font.family: "Arial"
    }
    // next label
    Rectangle {
        id: second_title
        color: "transparent"
        width: 80 * two_edit_text.__scale
        height: 30 * two_edit_text.__scale
        anchors {
            top: two_edit_text.top
            left: main_edit_text.right
        }
        Text {
            id: second_title_label
            anchors.centerIn: parent
            font.pixelSize: 24 * two_edit_text.__scale
            font.family: "Arial"
        }
    }
    //second edit text
    // border
    Rectangle {
        id: second_edit_text_bg
        border.width: 1
        width: 150 * two_edit_text.__scale
        height: 30 * two_edit_text.__scale
        anchors {
            top: two_edit_text.top
            left: second_title.right
        }
    }
    TextEdit {
        id: second_edit_text
        horizontalAlignment: TextEdit.AlignRight
        width: second_edit_text_bg.width
        anchors {
            top: second_edit_text_bg.top
            left: second_edit_text_bg.left
            topMargin: 2
            rightMargin: 5
        }
        font.pixelSize: 20 * two_edit_text.__scale
        font.family: "Arial"
    }
}
