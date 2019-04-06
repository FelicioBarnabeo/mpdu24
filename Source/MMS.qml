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
        text: qsTr("ММС")
    }

    Rectangle{
        anchors.top: topbar.bottom
        anchors.bottom: downbar.top
        anchors.left: root.left
        anchors.right: root.right
        color: Style.bgcolor

        Column{
            anchors.centerIn:  parent
            spacing: Screen.pixelDensity*3
            property int cellWidth: root.width*0.7 ;
            property int cellHeight: root.height/7;

            MenuButton{
                id: cddvd
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("CD/DVD")
                onKey: {
                    //pageStack.push(comp,{"isDvdMenu":"true","header":qsTr("CD/DVD")})
                    driver.sendCommand("KEY_1");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_1");
                }
                onRelease:
                {
                        pageStack.push(comp,{"isDvdMenu":"true","header":qsTr("CD/DVD")})
                        driver.stopSend("KEY_1");
                }
            }
            MenuButton{
                id: audio
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("АУДИО")

                onKey: {
                    //pageStack.push(comp,{"isSlideShow":"true","header":qsTr("АУДИО")})
                    driver.sendCommand("KEY_4");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_4");
                }
                onRelease:
                {
                        pageStack.push(comp,{"isSlideShow":"true","header":qsTr("АУДИО/ВИДЕО")})
                        driver.stopSend("KEY_4");
                }
            }
            MenuButton{
                id: video
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("ВИДЕО")

                onKey: {
                    //pageStack.push(comp,{"isSlideShow":"true","header":qsTr("ВИДЕО")})
                    driver.sendCommand("KEY_5");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_5");
                }
                onRelease:
                {
                    pageStack.push(comp,{"isSlideShow":"true","header":qsTr("АУДИО/ВИДЕО")})
                    driver.stopSend("KEY_5");
                }
            }
            MenuButton{
                id: usb
                width: parent.cellWidth
                height: parent.cellHeight
                text: qsTr("USB")
                onKey: {
                    //pageStack.push(comp,{"isSlideShow":"true","header":qsTr("USB")})
                    driver.sendCommand("KEY_6");
                }
                onHoldKey:
                {
                    driver.startSend("KEY_6");
                }
                onRelease:
                {
                    pageStack.push(comp,{"isSlideShow":"true","header":qsTr("USB")})
                    driver.stopSend("KEY_6");
                }
            }
        }
    }

    DownBar{
        id: downbar
    }

    Component{
        id: comp
        Player{

        }
    }
    Component.onCompleted: {
        driver.setVendorName("vista_mce")
    }
}
