import QtQuick 2.0

Item {
    id: cpl_tab_view
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
    property ListModel first_tab_model : ListModel {}
    property ListModel second_tab_model : ListModel {}
    property ListModel third_tab_model : ListModel {}
    property var currentTabOrder: [3, 2, 1] // the z-order of tab is managed by this array
    function moveToFront(tabIndex) {
        switch (tabIndex) {
        case CompileOperationTabView.TabName.FIRST:
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.FIRST] = CompileOperationTabView.TabOrder.LAYER_3;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.SECOND] = CompileOperationTabView.TabOrder.LAYER_2;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.THIRD] = CompileOperationTabView.TabOrder.LAYER_1;
            break;
        case CompileOperationTabView.TabName.SECOND:
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.SECOND] = CompileOperationTabView.TabOrder.LAYER_3;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.FIRST] = CompileOperationTabView.TabOrder.LAYER_2;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.THIRD] = CompileOperationTabView.TabOrder.LAYER_1;
            break;
        case CompileOperationTabView.TabName.THIRD:
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.THIRD] = CompileOperationTabView.TabOrder.LAYER_3;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.SECOND] = CompileOperationTabView.TabOrder.LAYER_2;
            cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.FIRST] = CompileOperationTabView.TabOrder.LAYER_1;
            break;
        default:
            console.log("ERROR: Not support tab ", tabIndex)
            break;
        }
        // emit internal signal
        currentTabOrderChanged();
    }
    CustomTabComponent {
        id: third_tab
        z: cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.THIRD]
        local_scale: cpl_tab_view.local_scale
        rowNum: 3
        columNum: 5
        bg_image_actived: "qrc:/ui/assets/compile_resolution_tab_bg.png"
        bg_image_inactived: "qrc:/ui/assets/compile_resolution_tab_inactive_bg.png"
        headWidth: 172
        headHeight: 28
        headLeftMargin: 233
        gridViewWidth: 1024
        gridViewHeight: 276
        gridViewTopMargin: 20
        gridViewLeftMargin: 76
        gridItemWidth: 152
        gridItemHeight: 44
        tabName: "Model"
        listmodel: 20 // temporary test
        onClickTabHead: {
            moveToFront(CompileOperationTabView.TabName.THIRD);
        }
    }
    CustomTabComponent {
        id: second_tab
        z: cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.SECOND]
        local_scale: cpl_tab_view.local_scale
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
            moveToFront(CompileOperationTabView.TabName.SECOND);
        }
    }
    CustomTabComponent {
        id: first_tab
        z: cpl_tab_view.currentTabOrder[CompileOperationTabView.TabName.FIRST]
        local_scale: cpl_tab_view.local_scale
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
            moveToFront(CompileOperationTabView.TabName.FIRST);
        }
    }
}
