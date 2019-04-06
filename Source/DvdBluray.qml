import QtQuick 2.0
import QtQuick.Window 2.0

import "."

Item
{
    id: root
    property string header: qsTr("DVD/BR")

    MouseArea{
        anchors.fill: parent
        enabled: true;
    }

    TopBar{
        id: topbar
        text: qsTr(header)
    }

    Rectangle
    {
        id: window
        anchors.top: topbar.bottom
        anchors.bottom: downbar.top
        anchors.left: root.left
        anchors.right: root.right
        color: Style.bgcolor

        Grid
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            columns: 3
            rows: 3
            spacing: Screen.pixelDensity*15

            PlayerButton
            {
                id: eject
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf131"
                onKey: driver.sendCommand("KEY_EJECT");
            }

            PlayerButton
            {
                id: stop
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text:"\uf24f"
                onKey: driver.sendCommand("KEY_STOP");
            }

            PlayerButton
            {
                id: menuSlide
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf394"
                onKey: {
                    driver.sendCommand("KEY_MENU");
                }
            }

            PlayerButton
            {
                id: leftForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4a1"
                onKey:     {driver.sendCommand("KEY_REWIND");}
                onRelease: {driver.stopSend("KEY_REWIND");}
                onHoldKey: {driver.startSend("KEY_REWIND");}

            }

            PlayerButton
            {
                id: play
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text:"\uf488"//"\uf24f"
                onKey: driver.sendCommand("KEY_PLAY");
            }

            PlayerButton
            {
                id: rightForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf427"

                onKey:     {driver.sendCommand("KEY_FORWARD");}
                onRelease: {driver.stopSend("KEY_FORWARD");}
                onHoldKey: {driver.startSend("KEY_FORWARD");}
            }



            PlayerButton
            {
                id: fastLeftForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4ab"
                onKey:  {driver.sendCommand("KEY_FASTREWIND");}
                onRelease: {driver.stopSend("KEY_FASTREWIND");}
                onHoldKey: {driver.startSend("KEY_FASTREWIND");}
            }

            PlayerButton
            {
                id: pause
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text:"\uf210"
                onKey: driver.sendCommand("KEY_PAUSE");
            }

            PlayerButton
            {
                id: fastRightForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4ad"
                onKey:     {driver.sendCommand("KEY_FASTFORWARD");}
                onRelease: {driver.stopSend("KEY_FASTFORWARD");}
                onHoldKey: {driver.startSend("KEY_FASTFORWARD");}
            }
        }
    }

    DownBar{
        id: downbar
    }

    Component.onCompleted:
    {
        driver.setVendorName("LG_DVDBP450");
    }
}


