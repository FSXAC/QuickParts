// Need to add this .qml file into QRC

import "."
import QtQuick 2.8
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: cube

    // ====================[ Properties ]====================
    property real cubeSize: 5
    property color ambient: "#555"
    property color diffuse: "#CCC"
    property color specular: "#FFF"
    property color activeColor: "orange"
    property real shininess: 0.8
    property real inactiveAlpha: 0.65
    property real activeAlpha: 0.95

    // ====================[ Geometrys ]====================
    PlaneMesh {
        id: sideMesh
        width: cube.cubeSize
        height: width
        meshResolution: Qt.size(2, 2)
    }

    // ====================[ Entities ]====================
    PickableEntity {
        id: xPos
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(cube.cubeSize * 0.5, 0, 0);
                m.rotate(-90, Qt.vector3d(0, 0, 1));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
    PickableEntity {
        id: xNeg
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(-cube.cubeSize * 0.5, 0, 0);
                m.rotate(90, Qt.vector3d(0, 0, 1));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
    PickableEntity {
        id: yPos
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, cube.cubeSize * 0.5, 0);
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
    PickableEntity {
        id: yNeg
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, -cube.cubeSize * 0.5, 0);
                m.rotate(180, Qt.vector3d(0, 0, 1));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
    PickableEntity {
        id: zPos
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, 0, cube.cubeSize * 0.5);
                m.rotate(90, Qt.vector3d(1, 0, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
    PickableEntity {
        id: zNeg
        mesh: sideMesh
        material: PhongAlphaMaterial {
            ambient: cube.ambient
            diffuse: cube.diffuse
            specular: cube.specular
            shininess: cube.shininess
            alpha: cube.inactiveAlpha
        }
        transform: Transform {
        matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, 0, -cube.cubeSize * 0.5);
                m.rotate(-90, Qt.vector3d(1, 0, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) console.log("hi")
        onEntered: {
            material.diffuse = cube.activeColor
            material.alpha = cube.activeAlpha
        }
        onExited: {
            material.diffuse = cube.diffuse
            material.alpha = cube.inactiveAlpha
        }
    }
}