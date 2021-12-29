import QtQuick 2.0
import "../ui/component"
Item {
    id: main_layer_root
    property real scale: 0.75
    // only the MainLayer store the size of windows, others windows will binding to this value
    width: 1440 * scale
    height: 1024 * scale
    Loader {
        id: main_loader
        anchors.fill: main_layer_root
        source: "qrc:/ui/home_screen/HomeScreen.qml"
    }
    Connections {
        target: main_loader.item
        onClickedGitButton:  {
            console.log("click git from HomeScreen.qml")
            global_menu.showFlag = true
        }
        onClickedCompileButton:  {
            console.log("click compile from HomeScreen.qml")
            global_menu.showFlag = false
        }
        onClickedRemoteControlButton: console.log("click remote control from HomeScreen.qml")
        onClickedConfigureButton: console.log("click configure from HomeScreen.qml")
    }
    // global menu will lay on top
    GlobalMenu {
        id: global_menu
        showFlag: false
        local_scale: main_layer_root.scale
        anchors {
            top: main_layer_root.top
            left: main_layer_root.left
            leftMargin: 455 * main_layer_root.scale
            topMargin: 31 * main_layer_root.scale
        }
    }
}
