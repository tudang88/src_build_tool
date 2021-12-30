import QtQuick 2.0

Rectangle {
    id: tab_component
    property real local_scale: 1.0
    signal clickTabHead
    property int rowNum: 3
    property int columNum: 5
    property var bg_image_actived: ""
    property var bg_image_inactived: ""
    property var headWidth: 0
    property var headHeight: 0
    property var headLeftMargin: 0
    property var gridViewWidth: 0
    property var gridViewHeight: 0
    property var gridViewTopMargin: 0
    property var gridViewLeftMargin: 0
    property var gridItemWidth: 0
    property var gridItemHeight: 0
    property alias tabName: tabText.text
    property alias listmodel: tab_component_grid.model
    width: tab_component_bg.width
    height: tab_component_bg.height
    clip: true
    color: "transparent"
//    z: tab_view.currentTabOrder[GitOperationTabView.TabName.FIRST]
    // background
    Image {
        id: tab_component_bg
        width: implicitWidth * local_scale
        height: implicitHeight * local_scale
        source: (tab_component.z === GitOperationTabView.TabOrder.LAYER_3)?bg_image_actived:bg_image_inactived
    }
    // head ->
    Rectangle {
        id: tab_component_head
        color: "transparent"
        width: headWidth * local_scale
        height: headHeight * local_scale
        anchors {
            top: tab_component.top
            left: tab_component.left
            leftMargin: tab_component.headLeftMargin * local_scale
        }
        Text {
            id: tabText
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: clickTabHead() // emit signal
        }
    }
    // head <-
    // body ->
    Rectangle {
        id: tab_component_body
        color: "transparent"
        anchors {
            top: tab_component_head.bottom
            left: tab_component.left
            topMargin: tab_component.gridViewTopMargin * local_scale
            leftMargin: tab_component.gridViewLeftMargin * local_scale
        }
        width: tab_component.gridViewWidth * local_scale
        height: tab_component.gridViewHeight * local_scale
        GridView {
            id : tab_component_grid
            anchors.fill: parent
            clip: true
            cellHeight: tab_component_body.height/rowNum
            cellWidth: tab_component_body.width/columNum
            delegate: Item {
                width: GridView.view.cellWidth
                height: GridView.view.cellHeight
                Rectangle {
                    id: gridButton
                    property bool selected: false
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }
                    width: gridItemWidth * local_scale
                    height: gridItemHeight * local_scale
                    color: selected ? "blue": "grey"
                    radius: 20
                    Text {
                        text: model.index
                        anchors.centerIn: parent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: gridButton.selected = !gridButton.selected
                    }

                }
            }
        }
    }

    // body <-

}
