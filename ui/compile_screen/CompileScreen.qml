import QtQuick 2.0
import "../component"
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
        color: "white"
    }
    CompileOperationTabView {
        id: cpl_tab_area
        local_scale: cpl_root.local_scale
        first_tab_model: 10
        second_tab_model: 15
        third_tab_model: 5
        anchors {
            top: cpl_root.top
            left: cpl_root.left
            leftMargin: 40 * cpl_root.local_scale
            topMargin: 100 * cpl_root.local_scale
        }
    }
    // button compile
    Rectangle {
        id: cpl_button
        property bool isPressed: false
        color: "transparent"
        width: cpl_button_img.width
        height: cpl_button_img.height
        anchors {
            top: cpl_root.top
            right: cpl_root.right
            topMargin: 126 * cpl_root.local_scale
            rightMargin: 24 * cpl_root.local_scale
        }

        Image {
            id: cpl_button_img
            width: implicitWidth * cpl_root.local_scale
            height: implicitHeight * cpl_root.local_scale
            source: cpl_button.isPressed ? "qrc:/ui/assets/compile_button_pressed.png":"qrc:/ui/assets/compile_button_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (!cpl_button.isPressed) {
                    console.log("clicked compile")
                    cpl_button.isPressed = true;
                }
            }
        }

    }
    // button cancel
    Rectangle {
        id: cpl_cancel_button
        property bool isPressed: false
        color: "transparent"
        width: cpl_cancel_img.width
        height: cpl_cancel_img.height
        anchors {
            top: cpl_root.top
            right: cpl_root.right
            topMargin: 236 * cpl_root.local_scale
            rightMargin: 24 * cpl_root.local_scale
        }

        Image {
            id: cpl_cancel_img
            width: implicitWidth * cpl_root.local_scale
            height: implicitHeight * cpl_root.local_scale
            source: cpl_cancel_button.isPressed ?"qrc:/ui/assets/git_cancel_button_clicked.png":"qrc:/ui/assets/git_cancel_button_normal.png"
        }
        MouseArea {
            anchors.fill: parent
            onClicked:  cpl_button.isPressed = false // cancel current running progress
            onPressed: {
                cpl_cancel_button.isPressed = !cpl_cancel_button.isPressed;
            }
            onReleased: {
                cpl_cancel_button.isPressed = !cpl_cancel_button.isPressed;
            }
        }
    }
    // button report
    Rectangle {
        id: cpl_report_button
        property bool isPressed: false
        color: "transparent"
        width: cpl_report_img.width
        height: cpl_report_img.height
        anchors {
            top: cpl_root.top
            right: cpl_root.right
            topMargin: 346 * cpl_root.local_scale
            rightMargin: 24 * cpl_root.local_scale
        }

        Image {
            id: cpl_report_img
            width: implicitWidth * cpl_root.local_scale
            height: implicitHeight * cpl_root.local_scale
            source: cpl_report_button.isPressed ? "qrc:/ui/assets/compile_report_pressed.png":"qrc:/ui/assets/compile_report_normal.png"
        }
        MouseArea {
            anchors.fill: parent

            onPressed: {
                cpl_report_button.isPressed = true;
            }
            onReleased: {
                cpl_report_button.isPressed = false;
            }
        }
    }

    /* Source tree area */
    SourceTreeSelectionComponent {
        id: cpl_source_tree
        local_scale: cpl_root.local_scale
        anchors {
            top: cpl_tab_area.bottom
            left: cpl_root.left
            leftMargin: 40 * cpl_root.local_scale
            topMargin: 14 * cpl_root.local_scale
        }
        onClickOnBrowse: console.log("Click on Compile Browse");
    }
}
