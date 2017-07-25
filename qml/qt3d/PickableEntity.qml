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

	property var transform: Trnasform { translation: Qt.vector3d(0, 0, 0) }
	property var material: PhongMaterial { }
	property GeometryRenderer mesh

	property alias pickingEnabled: picker.enabled

	readonly property bool containsMouse: picker.containsMouse
	readonly property bool containsPress: picker.pressed

	ObjectPicker {
		id: picker
		onClicked: root.clicked(pick);
		onPressed: root.pressed(pick);
		onReleased: root.released(pick);
		onEntered: root.entered();
		onExited: root.exited();
	}

	components: [mesh, material, transform, picker]
}