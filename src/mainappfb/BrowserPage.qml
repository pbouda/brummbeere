import QtQuick 2.0

import "helpers.js" as Helpers

ListView {

    model: currentFolderModel

    Component.onCompleted: {
        taskbar.source = "qrc:/BrowserPageTaskBar.qml"
    }

    delegate: Rectangle {
        height: menu.height/10
        width: menu.width
        color: "black"

        Rectangle {
            id: spacer
            color: "black"
            height: parent.height
            width: parent.width*0.05
        }

        Image {
            id: listIcon
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: spacer.right
            source: type == "directory" ? "images/icon_folder.png" : "images/icon_audiofile.png"
            height: parent.height
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: listText
            text: name
            anchors.left: listIcon.right
            anchors.leftMargin: parent.width*0.05
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: parent.height*0.6
            color: "white"
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "white"
            anchors.bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (type === "directory") {
                    //root.currentTitle = path;
                    Helpers.loadFolder(path);
                }
            }
        }

    }
}

