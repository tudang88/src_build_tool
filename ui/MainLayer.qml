import QtQuick 2.0
import "../ui/component"
Item {
    id: main_layer_root
    property real scale: 0.75
    property var pageWarehouse:
        ["qrc:/ui/home_screen/HomeScreen.qml",
        "qrc:/ui/git_screen/GitScreen.qml",
        "qrc:/ui/compile_screen/CompileScreen.qml",
        "qrc:/ui/remote_control_screen/RemoteControlScreen.qml",
        "qrc:/ui/configure_screen/ConfigureScreen.qml"]

    /* only the MainLayer store the size of windows, others windows will binding to this value */
    width: 1440 * scale
    height: 1024 * scale
    focus: true
    Loader {
        id: main_loader
        anchors.fill: main_layer_root
        source: pageWarehouse[CustomDefineType.GlobalMenuButtonList.Home]
        Connections {
            target: main_loader.item
            onClickedGitButton:  {
                console.log("click git from HomeScreen.qml")
                global_menu.showFlag = true
                main_loader.setSource(pageWarehouse[CustomDefineType.GlobalMenuButtonList.Git])
                global_menu.updateSelectedStorage(CustomDefineType.GlobalMenuButtonList.Git);
            }
            onClickedCompileButton:  {
                console.log("click compile from HomeScreen.qml")
                global_menu.showFlag = true
                main_loader.setSource(pageWarehouse[CustomDefineType.GlobalMenuButtonList.Compile])
                global_menu.updateSelectedStorage(CustomDefineType.GlobalMenuButtonList.Compile);

            }
            onClickedRemoteControlButton: {
                console.log("click remote control from HomeScreen.qml")
                global_menu.showFlag = true
                main_loader.setSource(pageWarehouse[CustomDefineType.GlobalMenuButtonList.RemoteControl])
                global_menu.updateSelectedStorage(CustomDefineType.GlobalMenuButtonList.RemoteControl);

            }
            onClickedConfigureButton: {
                console.log("click configure from HomeScreen.qml")
                global_menu.showFlag = true
                main_loader.setSource(pageWarehouse[CustomDefineType.GlobalMenuButtonList.Configure])
                global_menu.updateSelectedStorage(CustomDefineType.GlobalMenuButtonList.Configure);

            }
        }
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
        // handling user action on global menu
        onSelectedIndexChanged: {
            console.log("onSelectedIndexChanged:", index)
            switch (index) {
            case 0: // clicked on home
            case 1:
            case 2:
            case 3:
            case 4:
                if (index === 0) { showFlag = false;}
                main_loader.setSource(pageWarehouse[index]);
                break;
            default:
                console.log("unknown button")
            }
        }
    }
}
