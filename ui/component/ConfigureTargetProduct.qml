import QtQuick 2.0

Item {
    id: target_product
    property real __scale: 1.0
    signal selectedItem(int index)
    height: 30 * __scale
    Rectangle {
        id: title
        color: "transparent"
        width: 250 * target_product.__scale
        height: 30 * target_product.__scale
        anchors {
            top: target_product.top
            left: target_product.left
        }
        Text {
            id: title_text
            text: "Product"
            anchors.centerIn: parent
            font.pixelSize: 24 * target_product.__scale
            font.family: "Arial"
        }
    }
    // 21cy button
    CustomRadioButton {
        id: target_21cy
        checked: true
        __scale: target_product.__scale
        normal_image: "qrc:/ui/assets/configure_vendor_21cy_normal.png"
        checked_image: "qrc:/ui/assets/configure_vendor_21cy_selected.png"
        anchors {
            left: title.right
            verticalCenter: title.verticalCenter
        }
        onCheckedChanged:  {
            if (target_21cy.checked) {
                target_product.selectedItem(0);
            }
        }
    }
    // 21cy button
    CustomRadioButton {
        id: target_m7g
        __scale: target_product.__scale
        normal_image: "qrc:/ui/assets/configure_vendor_m7g_normal.png"
        checked_image: "qrc:/ui/assets/configure_vendor_m7g_selected.png"
        anchors {
            left: target_21cy.right
            leftMargin: 36 * target_product.__scale
            verticalCenter: title.verticalCenter
        }
        onCheckedChanged: {
            if (target_m7g.checked) {
                target_product.selectedItem(1);
            }
        }
    }
}
