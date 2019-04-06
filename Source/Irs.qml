import QtQuick 2.0
import QtQuick.Window 2.0

import "."

Item {
    id: root

    MouseArea{
        anchors.fill: parent
        enabled: true;
    }

    TopBar{
        id: topbar
        text: qsTr("ИРС")
    }

    Rectangle{
        id: rect
        anchors.top: topbar.bottom
        anchors.bottom: downbar.top
        anchors.left: root.left
        anchors.right: root.right
        color: Style.bgcolor

        Column{
            anchors.centerIn:  parent
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: Screen.pixelDensity*2
            spacing: Screen.pixelDensity*4

            property int cellWidth: root.width*0.8 ;
            property int cellHeight: root.height/7;


            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("МОНИТОР\nВКЛ/ВЫКЛ")
                onKey: {
                     driver.sendCommand("KEY_TV","msophex");
                    //if(choosenZone == 3){pageStack.push(comp,{"isKaraoke":"true","header":qsTr("Мультимедиа")})}
                    //pageStack.push(Qt.resolvedUrl("Multimedia.qml"))
                }
            }

            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("АЭРОШОУ")
                onKey: driver.sendCommand("KEY_3");
            }

            MenuButton{
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ВИДЕОКАМЕРА")
                onKey: driver.sendCommand("KEY_2");
            }
        }
    }


    Component{
        id: comp
        Multimedia{

        }
    }

    Component.onCompleted: {
        driver.setVendorName("vista_mce")
    }

    DownBar{
        id: downbar
    }

}
