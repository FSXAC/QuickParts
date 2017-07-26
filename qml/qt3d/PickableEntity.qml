import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: root
    signal pressed(var event)
    signal clicked(var event)
    signal released(var event)
    signal entered()
    signal exited()

    property var transform: Transform { translation: Qt.vector3d(0, 0, 0) }
    property var material: PhongMaterial { }
    property GeometryRenderer mesh

    property alias pickEnabled: picker.enabled
    property alias hoverEnabled: picker.hoverEnabled
    property alias dragEnabled: picker.dragEnabled

    readonly property bool containsMouse: picker.containsMouse
    readonly property bool containsPress: picker.pressed

    ObjectPicker {
        id: picker
        enabled: true
        dragEnabled: true
        hoverEnabled: true
        onClicked: root.clicked(pick);
        onPressed: root.pressed(pick);
        onReleased: root.released(pick);
        onEntered: root.entered();
        onExited: root.exited();
    }

    components: [mesh, material, transform, picker]
}