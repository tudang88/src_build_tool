import QtQuick 2.12
import QtQuick.Controls 2.12
Item {
    id: hmi_edit_dialog
    property real __scale: 1.0
    signal destroyMe
    width: blur_bg.width
    height: blur_bg.height
    function scale_in_anime() {
        scale_in.start()
    }

    // this mouse area use to block event propagation
    MouseArea {
        anchors.fill: parent
        onWheel: wheel.accepted = true // block wheel/trackpad events
    }

    // background
    Image {
        id: blur_bg
        width: implicitWidth * hmi_edit_dialog.__scale
        height: implicitHeight * hmi_edit_dialog.__scale
        source: "qrc:/ui/assets/dialog_bg_blur.png"
        anchors {
            top: hmi_edit_dialog.top
            left: hmi_edit_dialog.left
        }

    }
    // working area
    Rectangle {
        id: working_area
        color: "white"
        width: 1316 * hmi_edit_dialog.__scale
        height: 924 * hmi_edit_dialog.__scale
        anchors.centerIn: parent
        Text {
            id: title_text
            text: qsTr("HMI Source target selection")
            font.pixelSize: 36 * hmi_edit_dialog.__scale
            font.weight: Font.Bold
            font.family: "Arial"
            color: "#2D0EEB"
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 18 * hmi_edit_dialog.__scale
            }
        }
        // ListView area
        Rectangle {
            id: list_view_box
            width: 1298 * hmi_edit_dialog.__scale
            height: 765 * hmi_edit_dialog.__scale
            color: "grey"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: title_text.bottom
            }
        }

        Rectangle {
            id: select_all_button
            property bool isPressed: false
            width: 174 * hmi_edit_dialog.__scale
            height: 35 * hmi_edit_dialog.__scale
            color: "#9DF4DF"
            radius: 15
            anchors {
                bottom: parent.bottom
                bottomMargin: 47 * hmi_edit_dialog.__scale
                left: parent.left
                leftMargin: 15 * hmi_edit_dialog.__scale
            }

            Text {
                id: select_all_button_text
                text: select_all_button.isPressed? qsTr("Clear all"): qsTr("Select all")
                font.weight: Font.Bold
                font.family: "Arial"
                color: "#2F1A1A"
                font.pixelSize: 24 * hmi_edit_dialog.__scale
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  select_all_button.isPressed = !select_all_button.isPressed
            }
        }

        CustomPushButton {
            id: cancel_button
            __scale: hmi_edit_dialog.__scale
            normal_img: "qrc:/ui/assets/dialog_cancel.png"
            pressed_img: "qrc:/ui/assets/dialog_cancel_pressed.png"
            anchors {
                left: working_area.left
                bottom: working_area.bottom
                leftMargin: 873 * hmi_edit_dialog.__scale
                bottomMargin: 30 * hmi_edit_dialog.__scale

            }
            onClicked: scale_out.start()
        }

        CustomPushButton {
            id: ok_button
            __scale: hmi_edit_dialog.__scale
            normal_img: "qrc:/ui/assets/dialog_ok.png"
            pressed_img: "qrc:/ui/assets/dialog_ok_pressed.png"
            anchors {
                left: cancel_button.right
                bottom: working_area.bottom
                leftMargin: 41 * hmi_edit_dialog.__scale
                bottomMargin: 30 * hmi_edit_dialog.__scale
            }
           onClicked: scale_out.start()
        }
    }

    ScaleAnimator {
        id: scale_in
        target: hmi_edit_dialog
        from: 0
        to: 1
        duration: 200
    }

    ScaleAnimator {
        id: scale_out
        target: hmi_edit_dialog
        from: 1
        to: 0
        duration: 200
        onFinished: destroyMe()
    }
}
