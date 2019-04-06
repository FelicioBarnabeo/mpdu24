import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id:root

    TopBar{
        id: topbar
        text: qsTr("ВКС")
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

        PlayerButton{
            id: menu
            width: Screen.pixelDensity*5
            height: Screen.pixelDensity*5
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 20
            text: "\uf394"
            onKey: {
                /////////////////////
            }
        }

        Row{
            id: row
            anchors.centerIn: parent
            spacing: Screen.pixelDensity*15
            property int cellWidth: 50;
            property int cellHeight: 50;
            Column
            {
                //anchors.centerIn: parent
                spacing: Screen.pixelDensity*8

                MenuButton{
                    width: row.cellWidth
                    height: row.cellHeight
                    text: "+"
                    onKey: driver.sendCommand();

                }
                MenuButton{
                    width: row.cellWidth
                    height: row.cellHeight
                    text: "-"
                    onKey: driver.sendCommand();

                }
            }

            Column{
                spacing: Screen.pixelDensity*8
                MenuButton{
                    width: row.cellWidth
                    height: row.cellHeight
                    text: "+"
                    onKey: driver.sendCommand();

                }
                MenuButton{
                    width: row.cellWidth
                    height: row.cellHeight
                    text: "-"
                    onKey: driver.sendCommand();

                }
            }
        }
    }

//            PlayerButton{
//                id: up
//                width : parent.width
//                height:  Screen.pixelDensity*5
//                text: "\uf10d"
//                fontsize: 40
//                onKey: {
//                    /////////////////////
//                }
//            }

//            Text{
//                text: "CH"
//                color: "white"
//                font.pointSize: 18
//                horizontalAlignment: Text.AlignHCenter;
//                verticalAlignment: Text.AlignVCenter;
//            }

//            PlayerButton{
//                id: down
//                width : parent.width
//                height: Screen.pixelDensity*5
//                text: "\uf104"
//                fontsize: 40
//                onKey: {
//                    /////////////////////
//                }
//            }


    DownBar
    {
        id: downbar
    }

    Component.onCompleted: {
        driver.setVendorName("vcs")
    }
}
