import QtQuick 2.0

Item {
    id: edit_text_browse
    property real __scale: 1.0
    property alias title: title_text.text
    signal clickedBrowse // redirect signal
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * edit_text_browse.__scale
        height: 30 * edit_text_browse.__scale
        anchors {
            top: edit_text_browse.top
            left: edit_text_browse.left
        }
        Text {
            id: title_text
            anchors.centerIn: parent
            font.pixelSize: 24 * edit_text_browse.__scale
            font.family: "Arial"
        }
    }
    //edit text background
    Rectangle {
        id: edit_text_bg
        border.width: 1
        width: 748 * edit_text_browse.__scale
        height: 30 * edit_text_browse.__scale
        anchors {
            top: edit_text_browse.top
            left: title.right
        }
    }

    TextEdit {
        id: main_edit_text
        clip: true
        width: edit_text_bg.width
        anchors {
            top: edit_text_bg.top
            left: edit_text_bg.left
            topMargin: 2
            leftMargin: 2
        }
        font.pixelSize: 20 * edit_text_browse.__scale
        font.family: "Arial"
    }

    // Button Browse
    Rectangle {
        id: edit_browse_button
        property bool isPressed: false
        color: "transparent"
        width: button_bg.width
        height: button_bg.height
        anchors {
            top: edit_text_browse.top
            left: edit_text_bg.right
            leftMargin: 52 * edit_text_browse.__scale
        }
        Image {
            id: button_bg
            width: implicitWidth * edit_text_browse.__scale
            height: implicitHeight * edit_text_browse.__scale
            source: edit_browse_button.isPressed ? "qrc:/ui/assets/cfg_browse_clicked.png" : "qrc:/ui/assets/cfg_browse_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: edit_browse_button.isPressed = true
            onReleased: edit_browse_button.isPressed = false
            onClicked: clickedBrowse() // emit signal
        }
    }
}
