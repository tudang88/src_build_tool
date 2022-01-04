import QtQuick 2.0
import QtQuick.Controls 2.12
Item {
    id: configure_product_component
    property real __scale: 1.0
    signal selectedItem(int index)
    width: 1280 * __scale
    height: 110 * __scale
    ConfigureHeadLine {
        id: configure_product_head
        __scale: configure_product_component.__scale
        headText: "Target Product"
        anchors {
            left: parent.left
            top: parent.top
        }
    }

    ConfigureTargetProduct {
        id: configure_title
        __scale: configure_product_component.__scale
        anchors {
            top: configure_product_head.bottom
            left: configure_product_component.left
            topMargin: 26 * configure_product_component.__scale
            leftMargin: 86 * configure_product_component.__scale
        }
        onSelectedItem: configure_product_component.selectedItem(index) // redirection signal to configure screen
    }

}
