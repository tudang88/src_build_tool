import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: git_root
    property real local_scale: 0.75
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton
    clip: true
    Rectangle {
        id : git_backgroud
        anchors.fill: parent
        color: "white"
    }
    ListModel {
        id: git_hmi_list_model
        ListElement {
            appName: "Application 1"
        }
        ListElement {
            appName: "Application 2"
        }
        ListElement {
            appName: "Application 3"
        }
        ListElement {
            appName: "Application 4"
        }
        ListElement {
            appName: "Application 5"
        }
        ListElement {
            appName: "Application 7"
        }
        ListElement {
            appName: "Application 8"
        }
        ListElement {
            appName: "Application 1"
        }
        ListElement {
            appName: "Application 2"
        }
        ListElement {
            appName: "Application 3"
        }
        ListElement {
            appName: "Application 4"
        }
        ListElement {
            appName: "Application 5"
        }
        ListElement {
            appName: "Application 7"
        }
        ListElement {
            appName: "Application 8"
        }
        ListElement {
            appName: "Application 1"
        }
        ListElement {
            appName: "Application 2"
        }
        ListElement {
            appName: "Application 3"
        }
        ListElement {
            appName: "Application 4"
        }
        ListElement {
            appName: "Application 5"
        }
        ListElement {
            appName: "Application 7"
        }
        ListElement {
            appName: "Application 8"
        }
        ListElement {
            appName: "Application 1"
        }
        ListElement {
            appName: "Application 2"
        }
        ListElement {
            appName: "Application 3"
        }
        ListElement {
            appName: "Application 4"
        }
        ListElement {
            appName: "Application 5"
        }
        ListElement {
            appName: "Application 7"
        }
        ListElement {
            appName: "Application 8"
        }
        ListElement {
            appName: "Application 1"
        }
        ListElement {
            appName: "Application 2"
        }
        ListElement {
            appName: "Application 3"
        }
        ListElement {
            appName: "Application 4"
        }
        ListElement {
            appName: "Application 5"
        }
        ListElement {
            appName: "Application 7"
        }
        ListElement {
            appName: "Application 8"
        }
    }
    ListModel {
        id: git_app_list_model
        ListElement {
            appName: "App 1"
        }
        ListElement {
            appName: "App 2"
        }
        ListElement {
            appName: "App 3"
        }
        ListElement {
            appName: "App 4"
        }
        ListElement {
            appName: "App 5"
        }
        ListElement {
            appName: "App 7"
        }
        ListElement {
            appName: "App 8"
        }
        ListElement {
            appName: "App 1"
        }
        ListElement {
            appName: "App 2"
        }
        ListElement {
            appName: "App 3"
        }
        ListElement {
            appName: "App 4"
        }
        ListElement {
            appName: "App 5"
        }
        ListElement {
            appName: "App 7"
        }
        ListElement {
            appName: "App 8"
        }
        ListElement {
            appName: "App 1"
        }
        ListElement {
            appName: "App 2"
        }
        ListElement {
            appName: "App 3"
        }
        ListElement {
            appName: "App 4"
        }
        ListElement {
            appName: "App 5"
        }
        ListElement {
            appName: "App 7"
        }
        ListElement {
            appName: "App 8"
        }
        ListElement {
            appName: "App 1"
        }
        ListElement {
            appName: "App 2"
        }
        ListElement {
            appName: "App 3"
        }
        ListElement {
            appName: "App 4"
        }
        ListElement {
            appName: "App 5"
        }
        ListElement {
            appName: "App 7"
        }
        ListElement {
            appName: "App 8"
        }
        ListElement {
            appName: "App 1"
        }
        ListElement {
            appName: "App 2"
        }
        ListElement {
            appName: "App 3"
        }
        ListElement {
            appName: "App 4"
        }
        ListElement {
            appName: "App 5"
        }
        ListElement {
            appName: "App 7"
        }
        ListElement {
            appName: "App 8"
        }
    }

    Rectangle {
        id: git_hmi_area
        z:1
        width: 1176 * git_root.local_scale
        height: 350 * git_root.local_scale
        anchors {
            top: git_root.top
            left: git_root.left
            leftMargin: 40 * git_root.local_scale
            topMargin: 100 * git_root.local_scale
        }
        color: "#d7f9fb"
        GridView {
            id: git_hmi_tab
            anchors.horizontalCenter: git_hmi_area.horizontalCenter
            clip: true
            cellHeight: 350/3 * git_root.local_scale
            cellWidth: 1176/5 * git_root.local_scale
            width: 1176 * git_root.local_scale
            height: 350 * git_root.local_scale
            model: git_hmi_list_model
            delegate: Rectangle {
                width: GridView.view.cellWidth
                height: GridView.view.cellHeight
                color: "transparent"
                Rectangle {
                    width: 152 * git_root.local_scale
                    height: 44 * git_root.local_scale
                    anchors.centerIn: parent
                    color: "#c4c4c4"
                    radius: 20
                    Text {
                        id: app_name
                        anchors.centerIn: parent
                        text:appName
                    }
                }
            }
        }
    }
    Rectangle {
        id: git_app_area
        z:2
        width: 1176 * git_root.local_scale
        height: 350 * git_root.local_scale
        anchors {
            top: git_root.top
            left: git_root.left
            leftMargin: 40 * git_root.local_scale
            topMargin: 100 * git_root.local_scale
        }
        color: "red"
        GridView {
            id: git_app_tab
            anchors.horizontalCenter: git_app_area.horizontalCenter
            clip: true
            cellHeight: 350/3 * git_root.local_scale
            cellWidth: 1176/5 * git_root.local_scale
            width: 1176 * git_root.local_scale
            height: 350 * git_root.local_scale
            model: git_app_list_model
            delegate: Rectangle {
                width: GridView.view.cellWidth
                height: GridView.view.cellHeight
                color: "transparent"
                Rectangle {
                    width: 152 * git_root.local_scale
                    height: 44 * git_root.local_scale
                    anchors.centerIn: parent
                    color: "#c4c4c4"
                    radius: 20
                    Text {
                        anchors.centerIn: parent
                        text:appName
                    }
                }
            }
        }
    }

    Button {
        id: git_check_zoder_button
        Text {
            id: button_context
            anchors.centerIn: parent
            text: qsTr("ChangeZorder")
        }

        onClicked: {
//            console.log("change Z order")
            var curZorder = git_hmi_area.z;
            git_hmi_area.z = git_app_area.z
            git_app_area.z = curZorder

        }
    }
}
