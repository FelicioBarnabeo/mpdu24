import QtQuick 2.0
import "."

Item {
    id: root
    signal clicked();
    property alias text: label.text
    property alias fontsize: label.font.pointSize
    property alias radius: button.radius
    property int topmargin: 0
    property int botmargin: 0
    property int leftmargin: 0
    property int rightmargin: 0

    Rectangle{
        id: button
        anchors.fill: parent
        radius: width/2
        color: Style.barColor//"transparent"
        border.width: 2
        border.color: "black"//Style.borderMenuBtnColor
        Text{
            id: label;
            color: "black"//Style.fgColor
            font.family: Style.fontIcon
            font.pointSize: Style.fontSizeH4
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
        }
        MouseArea{
            id: buttonArea;
            anchors.fill: parent;
            anchors.topMargin: topmargin
            anchors.bottomMargin: botmargin
            anchors.leftMargin: leftmargin
            anchors.rightMargin: rightmargin
            onClicked: root.clicked();
            onPressed:  {button.color = Style.activeBtnColor;}
            onReleased: {button.color = Style.barColor;}
        }
    }
}
