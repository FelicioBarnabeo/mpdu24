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
        text: qsTr("СПУТНИК ТВ")
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
                driver.sendCommand("KEY_MENU");
            }
        }

        Column
        {
            id: navigateBtns
            anchors.centerIn: parent
            spacing: Screen.pixelDensity*4
            width: Screen.pixelDensity*22
            height: Screen.pixelDensity*40

            MenuButton{
                anchors.horizontalCenter: parent.horizontalCenter
                id: up
                width : parent.width
                height:  Screen.pixelDensity*10
                fontsize: 40
                currentFont: Style.fontIcon
                text: "\uf10d"
                onKey: {
                    driver.sendCommand("KEY_CH_UP");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_CH_UP");
                }
                onRelease:
                {
                    driver.stopSend("KEY_CH_UP");
                }
            }

            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "CH"
                color: "white"
                font.pointSize: 18
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
            }

            MenuButton{
                anchors.horizontalCenter: parent.horizontalCenter
                id: down
                width : parent.width
                height: Screen.pixelDensity*10
                text: "\uf104"
                fontsize: 40
                currentFont: Style.fontIcon
                onKey: {
                    driver.sendCommand("KEY_CH_DOWN");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_CH_DOWN");
                }
                onRelease:
                {
                    driver.stopSend("KEY_CH_DOWN");
                }
            }

            MenuButton{
                id: channels
                width: Screen.pixelDensity*22
                height: Screen.pixelDensity*10
                text: "КАНАЛЫ"
                onKey: {pageStack.push(Qt.resolvedUrl("Channels.qml"))}
            }
        }

    }

    DownBar{
        id: downbar
    }

    Component.onCompleted: {
        driver.setVendorName("iptv")
    }
}

