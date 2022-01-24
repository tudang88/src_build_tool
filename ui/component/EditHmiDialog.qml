import QtQuick 2.12
import QtQuick.Controls 2.12
Item {
    id: hmi_edit_dialog
    property real __scale: 1.0
    property var __popUpHolder: null
    signal destroyMe
    width: blur_bg.width
    height: blur_bg.height
    // create function create Popup
    function createBranchPopup(target_parent, x, y, w) {
        if (__popUpHolder !== null) {
            destroyPopup();
        }
        var component = Qt.createComponent("qrc:/ui/component/GitBranchPopup.qml");
        __popUpHolder = component.createObject(target_parent, {"x":x, "y":y, "width":w});
        if (__popUpHolder !== null) {
            __popUpHolder.__scale = hmi_edit_dialog.__scale;
            __popUpHolder.destroyMe.connect(destroyPopup);
        }

    }

    // destroy popup
    function destroyPopup() {
        if (__popUpHolder !== null) {
            __popUpHolder.destroy();
            __popUpHolder = null;
        }
    }
    ListModel {
        id: hmi_source_list
        ListElement {select_status: true; reposit_name:"audio0"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio1"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: true; reposit_name:"audio2"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio3"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: true; reposit_name:"audio4"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio5"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: true; reposit_name:"audio6"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio7"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: true; reposit_name:"audio8"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio9"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: true; reposit_name:"audio10"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {select_status: false; reposit_name:"audio11"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
    }
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
        radius: 5
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
            clip: true
            width: 1298 * hmi_edit_dialog.__scale
            height: 765 * hmi_edit_dialog.__scale
            color: "transparent"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: title_text.bottom
            }
            // add lisview
            ListView {
                property real viewRectBottom: contentY + height
                id: main_listview
                clip: true
                focus: true
                spacing: 38 * hmi_edit_dialog.__scale
                //add ScrollBar
                boundsBehavior: Flickable.StopAtBounds
                ScrollBar.vertical: ScrollBar {
                    id: scroll_bar
                    parent: main_listview.parent
                    anchors.top: main_listview.top
                    anchors.right: main_listview.right
                    anchors.bottom: main_listview.bottom
                }
                anchors {
                    top: list_view_box.top
                    bottom: list_view_box.bottom
                    left: list_view_box.left
                    right: list_view_box.right
                    topMargin: 4
                }
                model: hmi_source_list
                delegate: GitRecordStandardDelegate {
                    __scale: hmi_edit_dialog.__scale
                    property int indexOfThisDelegate: index
                    anchors {
                        left: parent.left
                        leftMargin: 10 * hmi_edit_dialog.__scale
                    }
                    onClickedSpin: {
                        var pop_x = main_listview.currentItem.x
                        var pop_y = main_listview.currentItem.y
                        console.log("Current items index:" + indexOfThisDelegate +  " x:" + pop_x + " y:" + pop_y)
                        hmi_edit_dialog.createBranchPopup(list_view_box, pop_x, pop_y, popup_w)
                    }
                }
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
