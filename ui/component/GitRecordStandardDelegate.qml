import QtQuick 2.0

Item {
    id: git_delegate
    property real __scale: 1.0
    property bool expanded: false
    property var __height: 92 * __scale
    property var __width: 1267 * __scale
    height: expanded ? __height:0
    width: __width
    property ListModel list_model: ListModel {
        ListElement {select_status: true; reposit_name:"audio"; select_branch:"pdv_hi_dev"; current_hash:"6d4e007f000000"}
    } // Item { select_status, reposit_name, select_branch_name , current_hash }
                                               // value:  true/false  , [audio/notify/others] , [pdv_hi_dev/others], [6d4e007f000000/others full hash]
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
    CustomCheckBox {
        id: git_checkbox
        __scale:git_delegate.__scale
        normal_img: "qrc:/ui/assets/git_standard_delegate_checkbox_normal.png"
        checked_img: "qrc:/ui/assets/git_standard_delegate_checkbox_checked.png"
        anchors {
            verticalCenter: bg.verticalCenter
            left: bg.left
            leftMargin: 13 * git_delegate.__scale
        }
        //binding checked to model
        checked: list_model.select_status
        onCheckedChanged: {
            // re-biding to model
            list_model.select_status = git_checkbox.checked
        }
    }
    //
    // animation on colapse/expand
    Behavior on height {
        NumberAnimation {
            duration: 200
        }
    }

}
