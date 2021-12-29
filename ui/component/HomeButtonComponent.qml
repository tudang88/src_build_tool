import QtQuick 2.0

Item {
    id: h_button_root
    state: "NORMAL"
    property real local_scale: 1.0
    // aliasing for using on screen
    property alias h_button_icon: h_button_icon.source
    function onClicked() {} // function for onClicked event
    // left icon
    Image {
        id: h_button_icon
        width: implicitWidth * local_scale
        height: implicitHeight * local_scale
        anchors {
            left: h_button_root.left
            top: h_button_root.top
        }
    }
    // main background
    Image {
        id: h_button_bg
        width: implicitWidth * local_scale
        height: implicitHeight * local_scale
        anchors {
            top: h_button_root.top
            left: h_button_icon.right
            leftMargin: 16 * local_scale
        }
    }

    // Text
    property alias text: h_button_text.text
    Text {
        id: h_button_text
        anchors{
            horizontalCenter: h_button_bg.horizontalCenter
            top: h_button_bg.top
            topMargin: 14 * local_scale
        }
        font.pixelSize: 36 * local_scale
        font.bold: true
        color: "white"
    }
    MouseArea {
        id: h_button_mouse_area
        hoverEnabled: true
        anchors.fill: parent
        onPressed:  {
            h_button_root.state = "PUSHED"
            h_button_root.onClicked(); //binding function
        }
        onReleased: h_button_root.state = "NORMAL"
        onEntered: h_button_root.state = "HOVER"
        onExited: h_button_root.state = "NORMAL"
    }

    // states of button
    states: [
        State { name: "NORMAL"
            PropertyChanges {
                target: h_button_bg
                source: "qrc:/ui/assets/h_button_bg_normal.png"
            }
        },
        State { name: "HOVER"
            PropertyChanges {
                target: h_button_bg
                source: "qrc:/ui/assets/h_button_bg_hover.png"
            }
        },
        State { name: "PUSHED"
            PropertyChanges {
                target: h_button_bg
                source: "qrc:/ui/assets/h_button_bg_focus.png"
            }
        }
    ]
}
