import QtQuick 2.0
import "../component"
Item {
    id: h_root
    property real local_scale: 0.75
    signal clickedGitButton
    signal clickedCompileButton
    signal clickedRemoteControlButton
    signal clickedConfigureButton

    clip: true
    Rectangle {
        id : h_backgroud
        anchors.fill: parent
        color: "white"
    }
    Image {
        id: h_left_pane_art
        anchors {
            top: h_root.top
            left: h_root.left
        }
        width: implicitWidth * h_root.local_scale
        height: implicitHeight * h_root.local_scale
        source: "qrc:/ui/assets/H_Left_Pane_Art.png"
    }
    // obtain source code button
    HomeButtonComponent {
        id : h_git_button
        width: 760 * h_root.local_scale
        height: 78 * h_root.local_scale
        local_scale: h_root.local_scale
        h_button_icon: "qrc:/ui/assets/H_git_image.png"
        text:"Obtain source code"
        anchors {
            left: h_left_pane_art.right
            top: h_root.top
            leftMargin: 120 * h_root.local_scale
            topMargin: 235 * h_root.local_scale
        }
        //overloading function on component
        function onClicked() {
            h_root.clickedGitButton();
        }
    }
    // compile button
    HomeButtonComponent {
        id : h_compile_button
        width: 760 * h_root.local_scale
        height: 78 * h_root.local_scale
        local_scale: h_root.local_scale
        h_button_icon: "qrc:/ui/assets/H_compile_image.png"
        text:"Compile"
        anchors {
            left: h_left_pane_art.right
            top: h_git_button.bottom
            leftMargin: 120 * h_root.local_scale
            topMargin: 90 * h_root.local_scale
        }
        //overloading function on component
        function onClicked() {
            h_root.clickedCompileButton();

        }
    }
    // remote control button
    HomeButtonComponent {
        id : h_remote_control_button
        width: 760 * h_root.local_scale
        height: 78 * h_root.local_scale
        local_scale: h_root.local_scale
        h_button_icon: "qrc:/ui/assets/H_remote_image.png"
        text:"Remote Control"
        anchors {
            left: h_left_pane_art.right
            top: h_compile_button.bottom
            leftMargin: 120 * h_root.local_scale
            topMargin: 90 * h_root.local_scale
        }
        //overloading function on component
        function onClicked() {
            h_root.clickedRemoteControlButton();

        }
    }
    // configure button
    HomeButtonComponent {
        id : h_configure_button
        width: 760 * h_root.local_scale
        height: 78 * h_root.local_scale
        local_scale: h_root.local_scale
        h_button_icon: "qrc:/ui/assets/H_configure_image.png"
        text:"Configure"
        anchors {
            left: h_left_pane_art.right
            top: h_remote_control_button.bottom
            leftMargin: 120 * h_root.local_scale
            topMargin: 90 * h_root.local_scale
        }
        //overloading function on component
        function onClicked() {
            h_root.clickedConfigureButton();
        }
    }
    // Copyright Mark
    Copyright {
        local_scale: 0.75
        anchors {
            top: h_root.top
            left: h_left_pane_art.right
            leftMargin: 286 * h_root.local_scale
            topMargin: 996 * h_root.local_scale
        }
    }
}
