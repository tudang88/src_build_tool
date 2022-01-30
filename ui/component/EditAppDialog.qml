import QtQuick 2.12
import QtQuick.Controls 2.12
Item {
    id: app_edit_dialog
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
            __popUpHolder.__scale = app_edit_dialog.__scale;
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
        id: app_source_list
        ListElement {group: "connect_app"; select_status: true; reposit_name:"audio0"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "connect_app"; select_status: false; reposit_name:"audio1"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "connect_app"; select_status: true; reposit_name:"audio2"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "connect_app"; select_status: false; reposit_name:"audio3"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "notify_app"; select_status: true; reposit_name:"audio4"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "notify_app"; select_status: false; reposit_name:"audio5"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "vui_app"; select_status: true; reposit_name:"audio6"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "vui_app"; select_status: false; reposit_name:"audio7"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "radio_app"; select_status: true; reposit_name:"audio8"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "radio_app"; select_status: false; reposit_name:"audio9"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "radio_app"; select_status: true; reposit_name:"audio10"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
        ListElement {group: "radio_app"; select_status: false; reposit_name:"audio11"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
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
        width: implicitWidth * app_edit_dialog.__scale
        height: implicitHeight * app_edit_dialog.__scale
        source: "qrc:/ui/assets/dialog_bg_blur.png"
        anchors {
            top: app_edit_dialog.top
            left: app_edit_dialog.left
        }

    }
    // working area
    Rectangle {
        id: working_area
        color: "white"
        radius: 5
        width: 1316 * app_edit_dialog.__scale
        height: 924 * app_edit_dialog.__scale
        anchors.centerIn: parent
        Text {
            id: title_text
            text: qsTr("App Source target selection")
            font.pixelSize: 36 * app_edit_dialog.__scale
            font.weight: Font.Bold
            font.family: "Arial"
            color: "#2D0EEB"
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 18 * app_edit_dialog.__scale
            }
        }
        // ListView area
        Rectangle {
            id: list_view_box
            property var clickPositionX: 0
            property var clickPositionY: 0
            clip: true
            width: 1298 * app_edit_dialog.__scale
            height: 765 * app_edit_dialog.__scale
            color: "transparent"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: title_text.bottom
            }
            // add lisview
            ListView {
                property real viewRectBottom: contentY + height
                property var collapseArray: ({}) // array for managing current colappse groupse
                id: main_listview
                clip: true
                focus: true
                spacing: 5 * app_edit_dialog.__scale
                //add ScrollBar
//                boundsBehavior: Flickable.StopAtBounds
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
                model: app_source_list
                delegate: GitRecordStandardDelegate {
                    __scale: app_edit_dialog.__scale
                    property int indexOfThisDelegate: index
                    anchors {
                        left: parent.left
                        right: parent.right
                        rightMargin: 30 * app_edit_dialog.__scale
                        leftMargin: 100 * app_edit_dialog.__scale
                    }
                    expanded: main_listview.isSectionExpansed(model.group) // binding expanse-collapse
                    onClickedSpin: {
                        var pop_x = list_view_box.clickPositionX
                        var pop_y = list_view_box.clickPositionY
                        console.log("Current items index:" + index +  " x:" + pop_x + " y:" + pop_y)
                        app_edit_dialog.createBranchPopup(list_view_box, pop_x, pop_y, popup_w)
                    }
                }

                // section area
                section {
                    property: "group"
                    delegate: GitSectionDelegate {
                       id: sectionItem
                       __scale: app_edit_dialog.__scale
                       onClickExpanseCollapse: main_listview.toggleSection(section)
                    }
                }
                // define function for colapse and expanse
                function isSectionExpansed(section) {
                    return !(section in collapseArray)
                }
                function toggleSection(section) {
                    if (isSectionExpansed(section)) {
                        hideSection(section);
                    } else {
                        showSection(section);
                    }
                }
                function hideSection(section) {
                    collapseArray[section] = true
                    // emit internal signal
                    collapseArrayChanged()
                }
                function showSection(section) {
                    delete collapseArray[section]
                    // emit internal signal
                    collapseArrayChanged()
                }
            }
            // add mouse area to catch event
            MouseArea {
                anchors.fill: parent
                propagateComposedEvents: true
                onPressed: {
                    list_view_box.clickPositionX = mouseX
                    list_view_box.clickPositionY = mouseY
                    mouse.accepted = false;
                }
                onReleased: { mouse.accepted = false }
            }

        }

        // select all button
        Rectangle {
            id: select_all_button
            property bool isPressed: false
            width: 174 * app_edit_dialog.__scale
            height: 35 * app_edit_dialog.__scale
            color: "#9DF4DF"
            radius: 15
            anchors {
                bottom: parent.bottom
                bottomMargin: 47 * app_edit_dialog.__scale
                left: parent.left
                leftMargin: 15 * app_edit_dialog.__scale
            }

            Text {
                id: select_all_button_text
                text: select_all_button.isPressed? qsTr("Clear all"): qsTr("Select all")
                font.weight: Font.Bold
                font.family: "Arial"
                color: "#2F1A1A"
                font.pixelSize: 24 * app_edit_dialog.__scale
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked:  select_all_button.isPressed = !select_all_button.isPressed
            }
        }

        CustomPushButton {
            id: cancel_button
            __scale: app_edit_dialog.__scale
            normal_img: "qrc:/ui/assets/dialog_cancel.png"
            pressed_img: "qrc:/ui/assets/dialog_cancel_pressed.png"
            anchors {
                left: working_area.left
                bottom: working_area.bottom
                leftMargin: 873 * app_edit_dialog.__scale
                bottomMargin: 30 * app_edit_dialog.__scale

            }
            onClicked: scale_out.start()
        }

        CustomPushButton {
            id: ok_button
            __scale: app_edit_dialog.__scale
            normal_img: "qrc:/ui/assets/dialog_ok.png"
            pressed_img: "qrc:/ui/assets/dialog_ok_pressed.png"
            anchors {
                left: cancel_button.right
                bottom: working_area.bottom
                leftMargin: 41 * app_edit_dialog.__scale
                bottomMargin: 30 * app_edit_dialog.__scale
            }
           onClicked: scale_out.start()
        }
    }

    ScaleAnimator {
        id: scale_in
        target: app_edit_dialog
        from: 0
        to: 1
        duration: 200
    }

    ScaleAnimator {
        id: scale_out
        target: app_edit_dialog
        from: 1
        to: 0
        duration: 200
        onFinished: destroyMe()
    }
}
