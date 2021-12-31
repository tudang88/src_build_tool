import QtQuick 2.0

Item {
    id: tab_view
    property real local_scale: 1.0
    enum TabName {
        FIRST,
        SECOND,
        THIRD
    }
    enum TabOrder {
        LAYER_1=1,
        LAYER_2,
        LAYER_3
    }
   implicitWidth: first_tab.width
   implicitHeight: first_tab.height
    property alias first_tab_model: first_tab.listmodel
    property alias second_tab_model: second_tab.listmodel
    property var currentTabOrder: [3, 2, 1] // the z-order of tab is managed by this array
    function moveToFront(tabIndex) {
//        console.log("TAB VIEW size: ", tab_view.width, tab_view.height);
        switch (tabIndex) {
        case GitOperationTabView.TabName.FIRST:
            tab_view.currentTabOrder[GitOperationTabView.TabName.FIRST] = GitOperationTabView.TabOrder.LAYER_3;
            tab_view.currentTabOrder[GitOperationTabView.TabName.SECOND] = GitOperationTabView.TabOrder.LAYER_2;
            tab_view.currentTabOrder[GitOperationTabView.TabName.THIRD] = GitOperationTabView.TabOrder.LAYER_1;
            break;
        case GitOperationTabView.TabName.SECOND:
            tab_view.currentTabOrder[GitOperationTabView.TabName.SECOND] = GitOperationTabView.TabOrder.LAYER_3;
            tab_view.currentTabOrder[GitOperationTabView.TabName.FIRST] = GitOperationTabView.TabOrder.LAYER_2;
            tab_view.currentTabOrder[GitOperationTabView.TabName.THIRD] = GitOperationTabView.TabOrder.LAYER_1;
            break;
        case GitOperationTabView.TabName.THIRD:
            tab_view.currentTabOrder[GitOperationTabView.TabName.THIRD] = GitOperationTabView.TabOrder.LAYER_3;
            tab_view.currentTabOrder[GitOperationTabView.TabName.SECOND] = GitOperationTabView.TabOrder.LAYER_2;
            tab_view.currentTabOrder[GitOperationTabView.TabName.FIRST] = GitOperationTabView.TabOrder.LAYER_1;
            break;
        default:
            console.log("ERROR: Not support tab ", tabIndex)
            break;
        }
        // emit internal signal
        currentTabOrderChanged();
    }
    CustomTabComponent {
        id: second_tab
        z: tab_view.currentTabOrder[GitOperationTabView.TabName.SECOND]
        local_scale: tab_view.local_scale
        rowNum: 3
        columNum: 5
        bg_image_actived: "qrc:/ui/assets/git_app_tab_bg.png"
        bg_image_inactived: "qrc:/ui/assets/git_app_tab_inactive_bg.png"
        headWidth: 172
        headHeight: 28
        headLeftMargin: 116
        gridViewWidth: 1024
        gridViewHeight: 276
        gridViewTopMargin: 20
        gridViewLeftMargin: 76
        gridItemWidth: 152
        gridItemHeight: 44
        tabName: "App"
        listmodel: 20 // temporary test
        onClickTabHead: {
            moveToFront(GitOperationTabView.TabName.SECOND);
        }
    }
    CustomTabComponent {
        id: first_tab
        z: tab_view.currentTabOrder[GitOperationTabView.TabName.FIRST]
        local_scale: tab_view.local_scale
        rowNum: 3
        columNum: 5
        bg_image_actived: "qrc:/ui/assets/git_hmi_tab_bg.png"
        bg_image_inactived: "qrc:/ui/assets/git_hmi_tab_inactived_bg.png"
        headWidth: 172
        headHeight: 28
        headLeftMargin: 0
        gridViewWidth: 1024
        gridViewHeight: 276
        gridViewTopMargin: 20
        gridViewLeftMargin: 76
        gridItemWidth: 152
        gridItemHeight: 44
        tabName: "Hmi"
        listmodel: 20 // temporary test
        onClickTabHead: {
            moveToFront(GitOperationTabView.TabName.FIRST);
        }
    }
}
