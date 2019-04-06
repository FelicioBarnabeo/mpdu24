import QtQuick 2.0
import QtQuick.Window 2.0

import "."

Item {
    id: root
    property bool isBluRay: false
    property bool isDvdMenu: false
    property bool isSlideShow: false
    property string header: qsTr("")
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

        MenuButton{
            visible: isSlideShow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: btngrid.top
            anchors.bottomMargin: - Screen.pixelDensity*10
            width: Screen.pixelDensity*25
            height: Screen.pixelDensity*15
            text: qsTr("ФОТО")
            onKey: driver.sendCommand("KEY_STOP","vista_mce"); //Код открытие слайдшоу по нажатию кнопки стоп с пульта
        }

        Grid
        {
            id: btngrid
            columns: 3
            rows: 3
            spacing: Screen.pixelDensity*15

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter


            Item
            {
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                visible: isSlideShow
            }
            Item
            {
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                visible: isSlideShow
            }
            Item
            {
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                visible: isSlideShow
            }

            PlayerButton
            {
                visible: isDvdMenu
                id: eject
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf131"
                onKey: driver.sendCommand("KEY_BACK","vista_mce");
            }

            Item
            {
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                visible: isDvdMenu
            }

            PlayerButton
            {
                id: menuSlide
                visible: isDvdMenu
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: /*isDvdMenu ?*/ "\uf394" /*:"\uf2d3"*/

                onKey: {
                    /*if(isDvdMenu)*/ driver.sendCommand("KEY_MENU","vista_mce");
                    //else driver.sendCommand("KEY_STOP","vista_mce"); //Код открытие слайдшоу по нажатию кнопки стоп с пульта
                }
            }

            PlayerButton
            {
                id: leftForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4a1"
                onKey:  {if(isDvdMenu) driver.sendCommand("Rwd","vista_mce");
                        else driver.sendCommand("KEY_REWIND","vista_mce");}
                onRelease: {if(isDvdMenu) driver.stopSend("Rwd","vista_mce");
                        else driver.stopSend("KEY_REWIND","vista_mce");}
                onHoldKey: {if(isDvdMenu) driver.startSend("Rwd","vista_mce");
                        else driver.startSend("KEY_REWIND","vista_mce");}

            }

            PlayerButton
            {
                id: playpause
                width: Screen.pixelDensity*7
                height: Screen.pixelDensity*7
                property bool state: true
                Image{
                    anchors.fill: parent
                    source: "images/playpause.png"
                }
                onKey: {
                    driver.sendCommand("KEY_8", "vista_mce");
                    //if(state) driver.sendCommand("KEY_7","vista_mce");
                    //else driver.sendCommand("KEY_8","vista_mce");
                    //state = !state;
                    //if(text=="\uf215") driver.sendCommand("KEY_7","vista_mce");
                    //else driver.sendCommand("KEY_8","vista_mce")
                    //text==="\uf215" ? text="\uf478" : text="\uf215"
                }
            }

            PlayerButton
            {
                id: rightForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf427"

                onKey:  {if(isDvdMenu) driver.sendCommand("KEY_FORWARD","vista_mce");
                        else driver.sendCommand("KEY_FASTFORWARD","vista_mce");}
                onRelease: {if(isDvdMenu) driver.stopSend("KEY_FORWARD","vista_mce");
                        else driver.stopSend("KEY_FASTFORWARD","vista_mce");}
                onHoldKey: {if(isDvdMenu) driver.startSend("KEY_FORWARD","vista_mce");
                        else driver.startSend("KEY_FASTFORWARD","vista_mce");}
            }

            PlayerButton
            {
                id: fastLeftForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4ab"
                onKey:  {if(isDvdMenu) driver.sendCommand("KEY_REWIND","vista_mce");
                        else driver.sendCommand("KEY_REWIND","mypr");}
                onRelease: {if(isDvdMenu) driver.stopSend("KEY_REWIND","vista_mce");
                        else driver.stopSend("KEY_REWIND","mypr");}
                onHoldKey: {if(isDvdMenu) driver.startSend("KEY_REWIND","vista_mce");
                        else driver.startSend("KEY_REWIND","mypr");}
            }

            PlayerButton
            {
                id: stop
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf24f"
                onKey: driver.sendCommand("KEY_9","vista_mce");
            }

            PlayerButton
            {
                id: fastRightForward
                width: Screen.pixelDensity*5
                height: Screen.pixelDensity*5
                text: "\uf4ad"
                onKey:  {if(isDvdMenu) driver.sendCommand("KEY_FASTFORWARD","vista_mce");
                        else driver.sendCommand("KEY_FORWARD","mypr");}
                onRelease: {if(isDvdMenu) driver.stopSend("KEY_FASTFORWARD","vista_mce");
                        else driver.stopSend("KEY_FORWARD","mypr");}
                onHoldKey: {
                    if(isDvdMenu)
                    {
                        driver.startSend("KEY_FASTFORWARD","vista_mce");
                    }
                    else driver.startSend("KEY_FORWARD","mypr");}
            }

        }
    }



    DownBar{
        id: downbar
    }
}
