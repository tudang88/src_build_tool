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
