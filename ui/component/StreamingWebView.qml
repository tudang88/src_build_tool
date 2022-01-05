import QtQuick 2.0

Item {
    id: stream_webview
    property real __scale: 1.0
    property alias network_error: error_message.text
    property bool error_visible: true
    width: 1280 * __scale
    height: 720 * __scale
    Rectangle {
        id: main_view
        anchors.fill: parent
        color: "#C4C4C4"
    }
    Text {
        id: error_message
        visible: stream_webview.error_visible
        text: qsTr("Connection Error")
        color: "Red"
        font.pixelSize: 32 * stream_webview.__scale
        font.family: "Arial"
        font.weight: Font.Bold
        anchors.centerIn: parent
    }
    // refresh button
    Rectangle {
        id: refresh
        visible: stream_webview.error_visible
        property bool isPressed: false
        color: "transparent"
        width: refresh_icon.width
        height: refresh_icon.height
        anchors {
            top: error_message.bottom
            horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: refresh_icon
            width: implicitWidth * stream_webview.__scale
            height: implicitHeight * stream_webview.__scale
            source: "qrc:/ui/assets/refresh_icon.png"
            anchors {
                top: parent.top
                left: parent.left
            }
        }
        MouseArea {
            anchors.fill: parent
            onPressed:  {
                refresh.border.width = 2
                refresh.border.color = "blue"
            }
            onReleased: refresh.border.width = 0

        }
    }

}
