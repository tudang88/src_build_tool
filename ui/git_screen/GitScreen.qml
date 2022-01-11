import QtQuick 2.0
import QtQuick.Controls 2.12
import "../component"
Item {
    id: git_root
    property real local_scale: 0.75
    property var dialogHolder: null
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton
    function createDiaglog() {
        var component = Qt.createComponent("qrc:/ui/component/EditHmiDialog.qml");
        dialogHolder = component.createObject(git_root.parent.parent, {"x":0, "y":0});
        if (dialogHolder !== null) {
            dialogHolder.__scale = git_root.local_scale
            dialogHolder.anchors.centerIn = dialogHolder.parent
            dialogHolder.destroyMe.connect(destroyDialog)
            dialogHolder.scale_in_anime()
        }
    }

    function destroyDialog() {
        if (dialogHolder !== null) {
            dialogHolder.destroy()
            dialogHolder = null
        }
    }
    Rectangle {
        id : git_backgroud
        anchors.fill: parent
        color: "white"
    }
    GitOperationTabView {
        id: git_hmi_tab_area
        local_scale: git_root.local_scale
        first_tab_model: 15
        second_tab_model: 20
        anchors {
            top: git_root.top
            left: git_root.left
            leftMargin: 40 * git_root.local_scale
            topMargin: 100 * git_root.local_scale
        }
    }
    // hmi-app link button
    Rectangle {
        id: git_hmi_app_link
        property bool isSelected: false
        color: "transparent"
        width: git_hmi_app_img.width
        height: git_hmi_app_img.height
        anchors {
            top: git_root.top
            right: git_root.right
            topMargin: 137 * git_root.local_scale
            rightMargin: 254 * git_root.local_scale
        }

        Image {
            id: git_hmi_app_img
            width: implicitWidth * git_root.local_scale
            height: implicitHeight * git_root.local_scale
            source: git_hmi_app_link.isSelected?"qrc:/ui/assets/hmi_app_link_status_actived.png":"qrc:/ui/assets/hmi_app_link_status_inactived.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: git_hmi_app_link.isSelected = !git_hmi_app_link.isSelected
        }

    }
    // edit button
    Rectangle {
        id: git_edit_button
        color: "transparent"
        width: git_edit_img.width
        height: git_edit_img.height
        anchors {
            top: git_root.top
            right: git_root.right
            topMargin: 400 * git_root.local_scale
            rightMargin: 257 * git_root.local_scale
        }

        Image {
            id: git_edit_img
            width: implicitWidth * git_root.local_scale
            height: implicitHeight * git_root.local_scale
            source: "qrc:/ui/assets/edit_button_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked:  {
                console.log("open edit page")
                git_root.createDiaglog();
            }
            onEntered: {
                git_edit_button.border.width = 2;
                git_edit_button.border.color = "blue";
            }
            onExited: {
                git_edit_button.border.width = 0;
            }
        }

    }

    // button obtain
    Rectangle {
        id: git_obtain_button
        property bool isPressed: false
        color: "transparent"
        width: git_obtain_img.width
        height: git_obtain_img.height
        anchors {
            top: git_root.top
            right: git_root.right
            topMargin: 126 * git_root.local_scale
            rightMargin: 24 * git_root.local_scale
        }

        Image {
            id: git_obtain_img
            width: implicitWidth * git_root.local_scale
            height: implicitHeight * git_root.local_scale
            source: git_obtain_button.isPressed ? "qrc:/ui/assets/git_obtain_button_pressed.png":"qrc:/ui/assets/git_obtain_button_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!git_obtain_button.isPressed) {
                    console.log("clicked obtain")
                    git_obtain_button.isPressed = true;
                }
            }
        }

    }
    // button cancel
    Rectangle {
        id: git_cancel_button
        property bool isPressed: false
        color: "transparent"
        width: git_cancel_img.width
        height: git_cancel_img.height
        anchors {
            top: git_root.top
            right: git_root.right
            topMargin: 236 * git_root.local_scale
            rightMargin: 24 * git_root.local_scale
        }

        Image {
            id: git_cancel_img
            width: implicitWidth * git_root.local_scale
            height: implicitHeight * git_root.local_scale
            source: git_cancel_button.isPressed ? "qrc:/ui/assets/git_cancel_button_clicked.png":"qrc:/ui/assets/git_cancel_button_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked:  git_obtain_button.isPressed = false // cancel current running progress
            onPressed: {
                git_cancel_button.isPressed = !git_cancel_button.isPressed;
            }
            onReleased: {
                git_cancel_button.isPressed = !git_cancel_button.isPressed;
            }
        }

    }

    /* Source tree area */
    SourceTreeSelectionComponent {
        id: git_source_tree
        local_scale: git_root.local_scale
        anchors {
            top: git_hmi_tab_area.bottom
            left: git_root.left
            leftMargin: 40 * git_root.local_scale
            topMargin: 5 * git_root.local_scale
        }
    }
    /* Git console view */
    CustomConsoleView {
        id: git_console
        __scale: git_root.local_scale
        console_model: 100
        anchors {
            top: git_source_tree.bottom
            left: git_root.left
            topMargin: 6 * git_root.local_scale
            leftMargin: 40 * git_root.local_scale
        }
    }
    /* Log filter area */
    ConsoleLogFilterComponent {
        id: git_log_filter
        __scale: git_root.local_scale
        anchors {
            top: git_source_tree.bottom
            left: git_console.right
            topMargin: 77 * git_root.local_scale
            leftMargin: 11 * git_root.local_scale
        }
    }
    /* Copyright */
    Copyright {
        local_scale: git_root.local_scale
        anchors {
            bottom: git_root.bottom
            left: git_root.left
            leftMargin: 510 * git_root.local_scale
        }
    }
}
