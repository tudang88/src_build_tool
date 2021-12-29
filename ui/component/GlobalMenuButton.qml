import QtQuick.Controls 2.12
import QtQuick 2.0
RadioButton {
    id: control
    property real local_scale: 1.0
    property var normal_image: ""
    property var checked_image: ""
    width: glb_radio_button_image.width
    height: glb_radio_button_image.height
    indicator: Image {
        id: glb_radio_button_image
        width: implicitWidth * local_scale
        height: implicitHeight * local_scale
    }
    // binding state with checked property
    state: checked ? "CHECKED": "NORMAL"
    states: [
        State {
            name: "NORMAL"
            PropertyChanges {
                target: glb_radio_button_image
                source: normal_image
            }
        },
        State {
            name: "CHECKED"
            PropertyChanges {
                target: glb_radio_button_image
                source: checked_image
            }
        }
    ]

}
