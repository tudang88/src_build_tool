import QtQuick 2.0

Rectangle {
    id: stream_mode_button
    property real __scale: 1.0
    property var __icons: ["qrc:/ui/assets/interactive_mode.png", "qrc:/ui/assets/video_mode.png", "qrc:/ui/assets/image_mode.png"]
    property int currentMode: 0 // default is interactive mode
    color: "transparent"
    width: button_icon.width
    height: button_icon.height
    Image {
        id: button_icon
        width: implicitWidth * stream_mode_button.__scale
        height: implicitHeight * stream_mode_button.__scale
        source: stream_mode_button.__icons[stream_mode_button.currentMode]
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (stream_mode_button.currentMode == (stream_mode_button.__icons.length - 1)) {
                stream_mode_button.currentMode = 0;
            } else {
                stream_mode_button.currentMode += 1;
            }
        }
    }

}
