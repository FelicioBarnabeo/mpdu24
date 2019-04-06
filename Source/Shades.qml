import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id:root

    TopBar{
        id: topbar
        text: qsTr("ЖАЛЮЗИ")
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

            Rectangle{
                id: up
                anchors.top: parent.top
                anchors.topMargin: Screen.pixelDensity*9
                anchors.horizontalCenter: parent.horizontalCenter
                height: Screen.pixelDensity*15
                width: Screen.pixelDensity*35
                radius: width/2
                color: Style.inactiveBtnColor
                border.color: Style.borderMenuBtnColor
                border.width: 3
                Column{
                    anchors { fill: parent; leftMargin: 10; rightMargin: 10; topMargin: 10 }
                    spacing: 1
                    Text{
                         anchors.horizontalCenter: parent.horizontalCenter
                        font.family: Style.fontIcon
                        text: "\uf126"
                        //font.pointSize: 18
                        font.bold: true
                        color: Style.fgColor
                    }
                    Text{
                         anchors.horizontalCenter: parent.horizontalCenter
                        //font.family: Style.fontIcon
                        font.family: Style.fontText
                        text: "ОТКРЫТЬ"
                        //font.pointSize: 18
                        font.bold: true
                        color: Style.fgColor
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    anchors.margins: -10
                    onPressed:{
                        parent.color = Style.activeBtnColor
                    }

                    onPressAndHold: {
                        parent.color = Style.activeBtnColor
                        driver.startSend("KEY_JAL_OPEN","msophex");
                    }
                    onReleased: {
                        parent.color = Style.inactiveBtnColor
                        driver.stopSend("KEY_JAL_OPEN","msophex");
                    }
                }
            }
//            Image{
//                //anchors.top: up.bottom
//                //anchors.bottom: down.top
//                source: "images/whiteShades.png"
//                //anchors.centerIn: parent.Center
//                anchors.horizontalCenter: parent.horizontalCenter
//                anchors.verticalCenter: parent.verticalCenter
//                width: 70
//                height: 70
//                antialiasing: true
//            }


            Rectangle{
                id:down
                anchors.bottom: parent.bottom
                anchors.bottomMargin: Screen.pixelDensity*9
                anchors.horizontalCenter: parent.horizontalCenter
                height: Screen.pixelDensity*15
                width: Screen.pixelDensity*35
                color: Style.inactiveBtnColor
                border.color: Style.borderMenuBtnColor
                border.width: 3
                radius: width/2
                Column{
                    anchors { fill: parent; leftMargin: 10; rightMargin: 10; topMargin: 10 }
                    spacing: 1
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: Style.fontText
                        text: "ЗАКРЫТЬ"
                        font.bold: true
                        //font.pointSize: 18
                        color: Style.fgColor
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: Style.fontIcon
                        text: "\uf123"
                        font.bold: true
                        //font.pointSize: 18
                        color: Style.fgColor
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    anchors.margins: -10
                    onPressed:{
                        parent.color = Style.activeBtnColor
                    }
                    onPressAndHold: {
                        parent.color = Style.activeBtnColor
                        driver.startSend("KEY_JAL_CLOSE","msophex");
                    }
                    onReleased: {
                        parent.color = Style.inactiveBtnColor
                        driver.stopSend("KEY_JAL_CLOSE","msophex");
                    }
                }
            }
        }


    DownBar{
        id: downbar
    }
}
