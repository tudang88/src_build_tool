import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: console_view
    property real __scale: 1.0
    property alias console_model: console_content.model
    // background
    width: console_bg.width
    height: console_bg.height
    Rectangle {
        id: console_bg
        anchors {
            top: console_view.top
            left: console_view.left
        }
        width: 1294 * console_view.__scale
        height: 486 * console_view.__scale
        color: "#E4EBEC"
    }

    ListModel {
        id: fruitModel

        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }

    ListView {
        id: console_content
        clip: true
        focus: true
        Keys.onUpPressed: scroll_bar.decrease()
        Keys.onDownPressed: scroll_bar.increase()
        ScrollBar.vertical: ScrollBar {
            id: scroll_bar
            parent: console_content.parent
            anchors.top: console_content.top
            anchors.left: console_content.right
            anchors.bottom: console_content.bottom
        }
        width: console_bg.width - scroll_bar.width
        height: console_bg.height
        anchors {
            left: console_bg.left
            top: console_bg.top
        }
        delegate: Rectangle {
            width: log_line.implicitWidth
            height: log_line.implicitHeight
            color: "transparent"
            Text {
                id: log_line
                text: model.index
                color: "red"
                font.pixelSize: 18 * __scale
            }
        }
    }
}
