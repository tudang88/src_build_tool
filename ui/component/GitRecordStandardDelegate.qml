import QtQuick 2.0

Item {
    id: git_delegate
    readonly property ListView __lv: ListView.view
    signal clickedSpin(real popup_w)
    signal clickedItem
    property real __scale: 1.0
    property bool expanded: true
    property var __height: 86 * __scale
    height: expanded ? __height:0

    // use for collapse and expanse
    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }

    //background
    Rectangle {
        id: bg
        color: "white"
        border.width: 1
        border.color: "black"
        anchors {
            fill: parent
        }
    }
    // checkbox
    CustomTypicalCheckBox {
        id: git_checkbox
        __scale:git_delegate.__scale
        __expansed: git_delegate.expanded
        __icon: "qrc:/ui/assets/check_icon_only.png"
        anchors {
            verticalCenter: bg.verticalCenter
            left: bg.left
            leftMargin: 13 * git_delegate.__scale
        }
        //binding checked to model
        checked: model.select_status
        onCheckedChanged: {
            // re-biding to model
            model.select_status = git_checkbox.checked
        }
    }
    // AppName
    Text {
        id: git_app_process
        text: model.reposit_name
        visible: git_delegate.expanded
        font.weight: Font.Bold
        font.family: "Arial"
        font.pixelSize: 24 * git_delegate.__scale
        anchors {
            verticalCenter: parent.verticalCenter
            left: git_checkbox.right
            leftMargin: 22 * git_delegate.__scale
        }
    }
    // Branch name box
    Rectangle {
        id: git_branch_name_box
        visible: git_delegate.expanded
        height: 48 * git_delegate.__scale
        width: 344 * git_delegate.__scale
        color: "#F7E7CE"
        anchors {
            left: git_delegate.left
            leftMargin: 259 * git_delegate.__scale
            verticalCenter: parent.verticalCenter
        }
        // Branch name Text
        TextInput {
            id: git_branch_input
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 2
            }
            //binding model
            text: model.select_branch
            font.pixelSize: 28 * git_delegate.__scale
            font.weight: Font.Bold
            horizontalAlignment: TextInput.AlignLeft
        }
        // button
        Rectangle {
            id: spin_button
            width: 44 * git_delegate.__scale
            height: 44 * git_delegate.__scale
            color: "transparent"
            border.width: 1
            border.color: "#364ECE"
            radius: 5
            anchors {
                right: git_branch_name_box.right
                rightMargin: 1
                verticalCenter: parent.verticalCenter
            }
            Image {
                id: spin_icon
                width: implicitWidth * git_delegate.__scale
                height: implicitHeight * git_delegate.__scale
                anchors.centerIn: parent
                source: "qrc:/ui/assets/DropButton.png"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: spin_button.color = "green"
                onReleased: spin_button.color = "transparent"
                onClicked: {
                    var popup_w = git_branch_name_box.width
                    // update index
                    __lv.currentIndex = model.index
                    git_delegate.clickedSpin(popup_w);
                }
            }
        }
    }

    // Hash area
    Rectangle {
        id: git_hash_box
        color: "transparent"
        visible: git_delegate.expanded
        anchors {
            left: git_branch_name_box.right
            right: bg.right
            leftMargin: 51 * git_delegate.__scale
            verticalCenter: parent.verticalCenter
        }
        // label HASH
        Text {
            id: git_hash_label
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            text: qsTr("Hash")
            font.weight: Font.Bold
            font.family: "Arial"
            font.pixelSize: 24 * git_delegate.__scale
        }
        // edit text
        Rectangle {
            id: git_hash_input_bg
            height:  25 * git_delegate.__scale
            border.width: 1
            anchors {
                left: git_hash_label.right
                leftMargin: 19 * git_delegate.__scale
                right: git_hash_box.right
                rightMargin: 19 * git_delegate.__scale
                verticalCenter: parent.verticalCenter
            }
            TextInput {
                id: git_commit_hash
                anchors {
                    right: git_hash_input_bg.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 5
                }
                //commit hash here
                text: model.current_hash
                font.family: "Arial"
                font.pixelSize: 18 * git_delegate.__scale
                horizontalAlignment: TextInput.AlignRight

            }
        }
    }

    // animation on colapse/expand
    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }

}
