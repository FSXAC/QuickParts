import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Rectangle {
    id: root

    signal toggled(bool checked)

    property bool checked: false
    property int margin: 3

    color: "transparent"
    width: 30
    height: 15
    radius: height * 0.5
    border.width: 1
    border.color: "white"
    color: Qt.lighter(checked ? "green" : "black", mouseArea.containsMouse ? 1.1 : 1.0)
    Behavior on color { PropertyAnimation { easing.type: Easing.OutQuart }}

    Rectangle {
        id: knob
        width: parent.height - root.margin * 2
        height: width
        radius: height * 0.5
        color: "white"
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