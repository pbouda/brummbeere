import QtQuick 2.0

ListView {
    id: currentFolder
    anchors.fill: parent
    clip: true
    model: currentFolderModel

    delegate: Item {
        x: 5
        height: 70
        width: currentFolder.width

        MouseArea {
            anchors.fill: parent
            onClicked: itemSelected(model.index)
        }

        Row {
            id: row1
            spacing: 10

            Rectangle {
                width: 60
                height: 60
                color: "#B3D4FC"
                Image {
                    anchors.centerIn: parent
                    source: {
                        type == "directory" ? "images/folder.png" : "images/musicfile.png"
                    }
                }
            }

            Text {
                text: name
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
        }
    }

    Rectangle {
        id: playerStart
        height: 70
        width: 70
        color: "#1fd26a"
        visible: currentFolderModel.hasAudio
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: {
                player.playlist = currentFolderModel.playlist;
                player.currentAudio = 0;
                PlayerCmd.play();
            }
        }
        Image {
            source: "images/play.png"
            anchors.centerIn: parent
        }

    }

}



