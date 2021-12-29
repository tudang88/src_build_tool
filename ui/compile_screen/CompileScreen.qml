import QtQuick 2.0

Item {
    id: cpl_root
    property real local_scale: 0.75
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton
    clip: true
    Rectangle {
        id : cpl_backgroud
        anchors.fill: parent
        color: "red"
    }
}
