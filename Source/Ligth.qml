import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id: root
    //anchors.fill: parent
    property bool isCell: false
    property bool isBort: false
    property bool isBed: false
    property bool isDecor: false
    TopBar{
        id: topbar
        text: qsTr("ОСВЕЩЕНИЕ")
    }

    MouseArea{
        anchors.fill: parent
        enabled: true;
    }

    Rectangle{
        anchors.top: topbar.bottom
        anchors.bottom: downbar.top
        anchors.left: root.left
        anchors.right: root.right

        color: Style.bgcolor
        Column{
            spacing: Screen.pixelDensity*3
            anchors.centerIn:  parent
            property int cellWidth: root.width*0.8 ;
            property int cellHeight: root.height/7;

            MenuButton{
               id: cell
               width: parent.cellWidth
               height: parent.cellHeight
               text: qsTr("ПОЛНОЕ")
               //visible: root.isCell;
               onKey: driver.sendCommand("KEY_FULLLIGHT","msophex");
            }
            MenuButton{
               id: bort
               width: parent.cellWidth
               height: parent.cellHeight
               text: qsTr("МЯГКОЕ")
               //visible: root.isBort;
               onKey: driver.sendCommand("KEY_SOFTLIGHT","msophex");
            }
            MenuButton{
               id:bed
               width: parent.cellWidth
               height: parent.cellHeight
               text: qsTr("НОЧНОЕ")
               //visible: root.isBed;
               onKey: driver.sendCommand("KEY_NIGHTLIGHT","msophex");
            }
            MenuButton{
               id: decor
               width: parent.cellWidth
               height: parent.cellHeight
               text: qsTr("ВЫКЛ")
               //visible: root.isDecor;
               onKey: driver.sendCommand("KEY_OFFLIGHT","msophex");
            }
//            MenuButton{
//                id: decorKoridor
//                width: parent.cellWidth
//                height: parent.cellHeight
//                text: qsTr("КОРИДОР")
//                visible: root.isDecorKoridor;
//                onClicked:{
//                    pageStack.push(Qt.resolvedUrl("DecorLight.qml"))
//                    //Send code koridor
//                }
//            }
        }
    }

    DownBar{
        id: downbar
    }
}
