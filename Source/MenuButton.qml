import QtQuick 2.0
import QtQuick.Window 2.2
import "."

Item {
    id: root
    signal key();
    signal release();
    signal holdKey();
    property alias text: label.text
    property color color: Style.inactiveBtnColor;
    property font currentFont: Style.fontText
    property alias fontsize: label.font.pointSize

//    Rectangle{
//        id: botLine
//        color: Style.lineColor
//        height: 1
//        anchors.left: root.left
//        anchors.right: root.right
//        anchors.bottom: root.bottom
//        anchors.leftMargin: Screen.pixelDensity*5
//        anchors.rightMargin: Screen.pixelDensity*3

//    }
    Rectangle
    {
        id: button
        anchors.fill: parent
        color: root.color//Style.inactiveBtnColor;
        border.color: Style.borderMenuBtnColor
        border.width: 2
        radius: width/6

        Text{
            id: label;
            color: Style.fgColor
            font.pointSize: Style.fontSizeH2
            font.family: currentFont
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
        }
        MouseArea{
            id: buttonArea;
            enabled: !pageStack.busy
            property real lClick : 0
            property real rClick : 0
            anchors.fill: parent;
            anchors.leftMargin: -18
            anchors.rightMargin: -18
            anchors.topMargin: -10
            anchors.bottomMargin: -10
            onClicked:
            {
                //var nc = Date.now();
                button.color = Style.inactiveBtnColor;
                root.key();
//                if((nc - lClick) > 300)
//                {

//                }
                lClick = Date.now();
            }
            onPressed:  {
                var nc = Date.now();
                if((nc - lClick) > 300)
                {
                    button.color = Style.activeBtnColor;
                }
            }
            onReleased: {
                button.color = Style.inactiveBtnColor;
                var nc = Date.now();
                if((nc - rClick) > 300) root.release();
                rClick = nc;
            }
            onPressAndHold: {
                var nc = Date.now();
                if((nc - lClick) > 300)  {button.color = Style.activeBtnColor;}
                lClick = nc;
                root.holdKey();
            }
            onDoubleClicked: {}
        }
    }
    Component.onCompleted: {

    }
}
