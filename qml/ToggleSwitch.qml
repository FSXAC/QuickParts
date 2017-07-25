import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Rectangle {
    id: root

    signal toggled(bool checked)

    property bool checked: false
    property int margin: 3

    property color borderColor: "#CCC"
    property color bgColor: "#EEE"
    property color knobColor: "white"
    property color activeColor: "#49F"
    property int knobStroke: 1

    width: 30
    height: 15
    radius: height * 0.5
    border.width: 1
    border.color: root.borderColor
    color: Qt.lighter(checked ? root.activeColor : root.bgColor, mouseArea.containsMouse ? 1.1 : 1.0)
    Behavior on color { PropertyAnimation { easing.type: Easing.OutQuart }}

    Rectangle {
        id: knob
        width: parent.height - root.margin * 2
        height: width
        radius: height * 0.5
        border.color: root.borderColor
        border.width: root.knobStroke
        color: root.knobColor
        anchors.verticalCenter: parent.verticalCenter
        x: root.checked ? parent.width - width - root.margin : root.margin
        Behavior on x { PropertyAnimation { easing.type: Easing.OutQuart }}
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.checked = !root.checked;
            root.toggled(root.checked);
        }
    }
}