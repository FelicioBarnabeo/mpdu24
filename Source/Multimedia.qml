import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id: root
    property bool isKaraoke : false;

    MouseArea{
        anchors.fill: parent
        enabled: true;
    }

    TopBar{
        id: topbar
        text: qsTr("МУЛЬТИМЕДИА")
    }

    Rectangle{
        anchors.top: topbar.bottom
        anchors.bottom: downbar.top
        anchors.left: root.left
        anchors.right: root.right
        color: Style.bgcolor

        Column{
            anchors.centerIn:  parent
            spacing: Screen.pixelDensity*4
            property int cellWidth: root.width*0.8 ;
            property int cellHeight: root.height/7;

            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ММС")
                onKey: {
                    driver.sendCommand("KEY_MMSOPEN", "msophex");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_MMSOPEN", "msophex");
                }
                onRelease:
                {
                    driver.stopSend("KEY_MMSOPEN", "msophex");
                    pageStack.push(Qt.resolvedUrl("MMS.qml"))
                }
            }

            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("DVD-BR")
                onKey: {
                    driver.sendCommand("KEY_DVDBR", "msophex");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_DVDBR", "msophex");
                }
                onRelease:
                {
                    driver.stopSend("KEY_DVDBR", "msophex");
                    pageStack.push(Qt.resolvedUrl("DvdBluray.qml"))
                }

            }

            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ПК")
                onKey: {
                    driver.sendCommand("KEY_PC", "msophex");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_PC", "msophex");
                }
                onRelease:
                {
                    driver.stopSend("KEY_PC", "msophex");
                }
            }
            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("СПУТНИК ТВ")
                onKey: {
                    driver.sendCommand("KEY_KCS", "msophex");
                    //pageStack.push(comp,{"isSlideShow":"true","header":qsTr("АУДИО")})
                }
                onHoldKey:
                {
                    driver.startSend("KEY_KCS", "msophex");
                }
                onRelease:
                {
                    driver.stopSend("KEY_KCS", "msophex");
                    pageStack.push(Qt.resolvedUrl("SputnikTV.qml"))
                }
            }
        }
    }
    DownBar{
        id: downbar
    }

//    Component{
//        id: comp
//        Player{

//        }
//    }
}
