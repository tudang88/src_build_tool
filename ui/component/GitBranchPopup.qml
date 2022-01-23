import QtQuick 2.0

Rectangle {
    id: branch_popup
    property real __scale: 1.0
    signal destroyMe
    height: 328 * __scale
    width: 310 * __scale
    color: "#F4FDE0"
    // this mouse area use to block event propagation
    MouseArea {
        anchors.fill: parent
        onWheel: wheel.accepted = true // block wheel/trackpad events
    }
    ListModel {
        id: branch_list_model
        ListElement { branch: "pdv_hi_dev1" }
        ListElement { branch: "pdv_hi_dev2" }
        ListElement { branch: "pdv_hi_dev3" }
        ListElement { branch: "pdv_hi_dev4" }
        ListElement { branch: "pdv_hi_dev5" }
        ListElement { branch: "pdv_hi_dev6" }
        ListElement { branch: "pdv_hi_dev7" }
        ListElement { branch: "pdv_hi_dev8" }
        ListElement { branch: "pdv_hi_dev9" }
        ListElement { branch: "pdv_hi_dev10" }
        ListElement { branch: "pdv_hi_dev11" }
        ListElement { branch: "pdv_hi_dev12" }
        ListElement { branch: "pdv_hi_dev13" }
        ListElement { branch: "pdv_hi_dev14" }
        ListElement { branch: "pdv_hi_dev15" }
        ListElement { branch: "pdv_hi_dev16" }
        ListElement { branch: "pdv_hi_dev17" }
    }
    ListView {
        id: branch_list_view
        clip: true
        anchors.fill: parent
        model: branch_list_model
        delegate: Rectangle {
            width: parent.width
            height: 56 * branch_popup.__scale
            color: "transparent"
            Text {
                id: branch_name
                text: model.branch
                font.pixelSize: 24 * branch_popup.__scale
            }
            MouseArea {
                anchors.fill: parent
                onClicked: branch_popup.destroyMe()
            }
        }
    }
}
