import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: edit_password
    property real __scale: 1.0
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * edit_password.__scale
        height: 30 * edit_password.__scale
        anchors {
            top: edit_password.top
            left: edit_password.left
        }
        Text {
            id: title_text
            text: "Password"
            anchors.centerIn: parent
            font.pixelSize: 24 * edit_password.__scale
            font.family: "Arial"
        }
    }
    //password input
    Rectangle {
        id: edit_text_bg
        border.width: 1
        width: 748 * edit_password.__scale
        height: 30 * edit_password.__scale
        anchors {
            top: edit_password.top
            left: title.right
        }
    }
    TextInput {
        id: password_input
        horizontalAlignment: TextEdit.AlignRight
        echoMode: TextInput.Password
        width: edit_text_bg.width - 5
        anchors {
            top: edit_text_bg.top
            left: edit_text_bg.left
            topMargin: 2
        }
        font.pixelSize: 20 * edit_password.__scale
        font.family: "Arial"
    }
    // password show/hide button
    CheckBox {
        id: password_show_hide
        width: checkbox_bg.width
        height: checkbox_bg.height
        anchors {
            verticalCenter: edit_text_bg.verticalCenter
            left: title.right
        }
        indicator: Image {
            id: checkbox_bg
            width: implicitWidth * edit_password.__scale
            height: implicitHeight * edit_password.__scale
            source: password_show_hide.checked ? "qrc:/ui/assets/pw_show.png": "qrc:/ui/assets/pw_lock.png"
        }
        onCheckedChanged: {
            if ( password_show_hide.checked ) {
                password_input.echoMode = TextInput.Normal;
            } else {
                password_input.echoMode = TextInput.Password;
            }
        }
    }
}
