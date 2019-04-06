import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id: root
    property alias menuButton: menuButton
    focus: true

    //anchors.fill: parent
//    property bool isLight: false
//    property bool isEntertainment: false
//    property bool isShades: false

    MouseArea{
        anchors.fill: parent
        enabled: true;
    }

    TopBar{
        id: topbar
        text: qsTr("ГЛАВНОЕ МЕНЮ")
    }

    Rectangle{
        anchors.top: topbar.bottom
        anchors.bottom: root.bottom
        anchors.left: root.left
        anchors.right: root.right
        color: Style.bgcolor

        Column{
            spacing: Screen.pixelDensity*4
            anchors.centerIn:  parent
            property int cellWidth: root.width*0.8;
            property int cellHeight: root.height/7;
            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ОСВЕЩЕНИЕ")
                onKey: pageStack.push(Qt.resolvedUrl("Ligth.qml"))
            }
            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ЖАЛЮЗИ")
                onKey: pageStack.push(Qt.resolvedUrl("Shades.qml"))
            }
            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ИРС")
                onKey: pageStack.push(Qt.resolvedUrl("Irs.qml"))
            }
            MenuButton{
                id: menuButton
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("МУЛЬТИМЕДИА")
                onKey: pageStack.push(Qt.resolvedUrl("Multimedia.qml"))
            }
        }
    }

}
