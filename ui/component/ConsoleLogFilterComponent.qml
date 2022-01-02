import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: log_filter
    property real __scale: 1.0
    implicitWidth: log_filter_group.width
    height: log_filter.height
    Rectangle {
        id: log_filter_group
        width: 200 * __scale
        height: 78 * __scale
        color: "transparent"
        CustomCheckBox {
            id: e_filter
            __scale: log_filter.__scale
            anchors {
                top: log_filter_group.top
                left: log_filter_group.left
            }
            normal_img: "qrc:/ui/assets/err_filter_normal.png"
            checked_img: "qrc:/ui/assets/err_filter_checked.png"
        }

        CustomCheckBox {
            id: w_filter
            __scale: log_filter.__scale
            anchors {
                top: e_filter.bottom
                left: log_filter_group.left
                topMargin: 28 * log_filter.__scale
            }
            normal_img: "qrc:/ui/assets/warning_filter_normal.png"
            checked_img: "qrc:/ui/assets/warning_filter_checked.png"
        }

        CustomCheckBox {
            id: i_filter
            __scale: log_filter.__scale
            anchors {
                top: w_filter.bottom
                left: log_filter_group.left
                topMargin: 28 * log_filter.__scale
            }
            normal_img: "qrc:/ui/assets/info_filter_normal.png"
            checked_img: "qrc:/ui/assets/info_filter_checked.png"
        }
    }

}
