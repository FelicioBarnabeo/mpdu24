import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import "."


Window {
    visible: true;
    //width: Screen.pixelDensity*52*1.2;
    //height: Screen.pixelDensity*70*1.2;
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    color: Style.bgcolor
    flags: "FramelessWindowHint"
    Item{
        id: root
        width: Screen.desktopAvailableHeight
        height: Screen.desktopAvailableWidth

        //width: Screen.pixelDensity*52*1.2;
        //height: Screen.pixelDensity*70*1.2;
        FontLoader{id:exofont; source: "qrc:/font/DejaVuSans.ttf"}
        FontLoader{id:ionicons; source: "qrc:/font/ionicons.ttf"}

        StackView{
            id: pageStack
            anchors.fill: parent
            focus: true
            //delegate: StackViewDelegate{}
            Keys.onPressed: {
                if(event.key === Qt.Key_Home)
                {
                    event.accepted = true;
                    pageStack.pop(null)
                }
            }
            Component.onCompleted:  pageStack.push(Qt.resolvedUrl("BaseMenu.qml"))
        }

        x: parent.width
        transform: Rotation { origin.x: 0; origin.y: 0; axis { x: 0; y: 0; z: 1 } angle: 90 }
    }
}
