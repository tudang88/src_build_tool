import QtQuick 2.0

Rectangle {
    id: custom_push_button
    property real __scale: 1.0
    property bool isPressed: false
    property var normal_img: ""
    property var pressed_img: ""
    signal clicked()
    width: button_icon.width
    height: button_icon.height
    Image {
        id: button_icon
        width: implicitWidth * custom_push_button.__scale
        height: implicitHeight * custom_push_button.__scale
        source: custom_push_button.isPressed ? custom_push_button.pressed_img: custom_push_button.normal_img
        anchors {
            top: custom_push_button.top
            left: custom_push_button.left
        }
    }
    MouseArea {
        anchors.fill: parent
        onPressed: custom_push_button.isPressed = true
        onReleased: custom_push_button.isPressed = false
        onClicked: custom_push_button.clicked()
    }

}
