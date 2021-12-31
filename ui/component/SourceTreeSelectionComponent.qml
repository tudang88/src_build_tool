import QtQuick 2.0

Item {
    id: source_tree_component
    property real local_scale: 1.0
    signal clickOnBrowse
    implicitHeight: source_tree_edit_area.height
    Text {
        id: source_tree_label
        text: qsTr("Source Tree")
        font.pixelSize: 24 * source_tree_component.local_scale
        font.family: "Arial"
        anchors {
            top: source_tree_component.top
            left: source_tree_component.left
            topMargin: 2
        }
    }

    // edit text
    Rectangle {
        id: source_tree_edit_area
        color: "transparent"
        width: source_tree_edit_bg.width
        height: source_tree_edit_bg.height
        anchors {
            left: source_tree_label.right
            leftMargin: 14 * source_tree_component.local_scale
        }

        Image {
            id: source_tree_edit_bg
            width: implicitWidth * source_tree_component.local_scale
            height: implicitHeight * source_tree_component.local_scale
            source: "qrc:/ui/assets/source_tree_edit_bg.png"
            anchors {
                top: source_tree_edit_area.top
                left: source_tree_edit_area.left
            }
        }
        TextEdit {
            id: source_tree_edit
            clip: true
            width: source_tree_edit_bg.width
            anchors{
                top: source_tree_edit_area.top
                left: source_tree_edit_area.left
                leftMargin: 5
                topMargin: 5

            }
        }
    }

    // Button Browse
    Rectangle {
        id: source_tree_browse_button
        property bool isPressed: false
        color: "transparent"
        width: source_tree_browse_bg.width
        height: source_tree_browse_bg.height
        anchors {
            top: source_tree_component.top
            left: source_tree_edit_area.right
            leftMargin: 32 * source_tree_component.local_scale
        }
        Image {
            id: source_tree_browse_bg
            source: source_tree_browse_button.isPressed?"qrc:/ui/assets/Browse_source_tree_button_pressed.png":"qrc:/ui/assets/Browse_source_tree_button_normal.png"
            width: implicitWidth * source_tree_component.local_scale
            height: implicitHeight * source_tree_component.local_scale
            anchors {
                top: source_tree_browse_button.top
                left: source_tree_browse_button.left
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed: source_tree_browse_button.isPressed = true
            onReleased: source_tree_browse_button.isPressed = false
            onClicked:  {
                clickOnBrowse(); // emit signal
            }
        }
    }
}
