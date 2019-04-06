import QtQuick 2.0
import QtQuick.Window 2.0
import "."

Item {
    id:root

    TopBar{
        id: topbar
        text: qsTr("КАНАЛЫ")
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

        Grid
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            rowSpacing: Screen.pixelDensity*8
            columnSpacing: Screen.pixelDensity*6
            rows: 4
            columns: 3

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "1"
                onKey: {
                    driver.sendCommand("KEY_1");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "2"
                onKey: {
                    driver.sendCommand("KEY_2");
                }
            }

            MenuButton{
                id: up
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "3"
                onKey: {
                    driver.sendCommand("KEY_3");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "4"
                onKey: {
                    driver.sendCommand("KEY_4");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "5"
                onKey: {
                    driver.sendCommand("KEY_5");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "6"
                onKey: {
                    driver.sendCommand("KEY_6");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "7"
                onKey: {
                    driver.sendCommand("KEY_7");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "8"
                onKey: {
                    driver.sendCommand("KEY_8");
                }
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "9"
                onKey: {
                    driver.sendCommand("KEY_9");
                }
            }
            Item{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
            }

            MenuButton{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
                text: "0"
                onKey: {
                    driver.sendCommand("KEY_0");
                }
            }

            Item{
                width : Screen.pixelDensity*14
                height:  Screen.pixelDensity*8
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
