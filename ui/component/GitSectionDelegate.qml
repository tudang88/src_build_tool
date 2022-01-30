import QtQuick 2.0

Item {
    id: section_delegate
    property real __scale: 1.0
    signal clickExpanseCollapse
    width: 1267 * __scale
    height: 92 * __scale
    // checkbox
    CustomTypicalCheckBox {
        id: section_checkbox
        __scale:section_delegate.__scale
        __icon: "qrc:/ui/assets/check_icon_only.png"
        anchors {
            verticalCenter: section_delegate.verticalCenter
            left: section_delegate.left
            leftMargin: 13 * section_delegate.__scale
        }
        //binding checked to model
//        checked: model.select_status
//        onCheckedChanged: {
//            // re-biding to model
//            model.select_status = section_checkbox.checked
//        }
    }
    // Section AppName
    Text {
        id: section_app_process
        text: section
        font.weight: Font.Bold
        font.family: "Arial"
        font.pixelSize: 36 * section_delegate.__scale
        anchors {
            verticalCenter: section_delegate.verticalCenter
            left: section_checkbox.right
            leftMargin: 22 * section_delegate.__scale
        }
    }

    // expand-collapse button
    Rectangle {
        id: expand_colapse
        property bool isExpanded: true
        color: "transparent"
        width: icon.width
        height: icon.width
        anchors {
            left: section_checkbox.right
            verticalCenter: section_delegate.verticalCenter
            leftMargin: 280 * section_delegate.__scale
        }
        Image {
            id: icon
            width: implicitWidth * section_delegate.__scale
            height: implicitHeight * section_delegate.__scale
            anchors.centerIn: expand_colapse
            source: expand_colapse.isExpanded?"qrc:/ui/assets/Expanse.png":"qrc:/ui/assets/Colapse.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked:  {
                expand_colapse.isExpanded = !expand_colapse.isExpanded
                section_delegate.clickExpanseCollapse()
            }
        }
    }

    // bottom line
    Rectangle {
        id: bottom_line
        color: "#C4C4C4"
        height: 2
        anchors {
            left: section_app_process.left
            right: section_delegate.right
            top: section_app_process.bottom
            topMargin: 2 * section_delegate.__scale
        }
    }

}
