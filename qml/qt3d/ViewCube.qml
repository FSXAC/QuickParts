// Need to add this .qml file into QRC

// side enums:
// front -> 0
// back -> 1
// left -> 2
// right -> 3
// top -> 4
// bottom -> 5

import "."
import QtQuick 2.8
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Extras 2.0

Entity {
    id: cube

    signal clickedOnSide(int index)

    // ====================[ Properties ]====================
    property real cubeSize: 5
    property color ambient: "white"
    property color diffuse: "#CCC"
    property color specular: "#FFF"
    property color activeColor: "#49F"
    property real shininess: 0.8
    property real inactiveAlpha: 0.65
    property real activeAlpha: 1.0

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
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_right.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(cube.cubeSize * 0.5, 0, 0);
                m.rotate(-90, Qt.vector3d(0, 0, 1));
                m.rotate(-90, Qt.vector3d(0, 1, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(3)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
    PickableEntity {
        id: xNeg
        mesh: sideMesh
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_left.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(-cube.cubeSize * 0.5, 0, 0);
                m.rotate(90, Qt.vector3d(0, 0, 1));
                m.rotate(90, Qt.vector3d(0, 1, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(2)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
    PickableEntity {
        id: yPos
        mesh: sideMesh
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_top.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, cube.cubeSize * 0.5, 0);
                m.rotate(180, Qt.vector3d(0, 1, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(4)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
    PickableEntity {
        id: yNeg
        mesh: sideMesh
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_bottom.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, -cube.cubeSize * 0.5, 0);
                m.rotate(180, Qt.vector3d(0, 0, 1));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(5)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
    PickableEntity {
        id: zPos
        mesh: sideMesh
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_front.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
            matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, 0, cube.cubeSize * 0.5);
                m.rotate(90, Qt.vector3d(1, 0, 0));
                m.rotate(180, Qt.vector3d(0, 1, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(1)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
    PickableEntity {
        id: zNeg
        mesh: sideMesh
        material: DiffuseMapMaterial {
            ambient: cube.ambient
            diffuse:  TextureLoader { source: "viewCube_back.webp" }
            textureScale: 1.0
            shininess: cube.shininess
        }
        transform: Transform {
        matrix: {
                var m = Qt.matrix4x4();
                m.translate(0, 0, -cube.cubeSize * 0.5);
                m.rotate(-90, Qt.vector3d(1, 0, 0));
                return m;
            }
        }
        onClicked: if (event.button === Qt.LeftButton) cube.clickedOnSide(0)
        onEntered: {
            material.ambient = cube.activeColor
        }
        onExited: {
            material.ambient = cube.ambient
        }
    }
}