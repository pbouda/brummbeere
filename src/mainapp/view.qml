import QtQuick 2.4

ListView {
    signal itemSelected(int index)
    id: currentFolder
    topMargin: 5
    bottomMargin: 5
    anchors.fill: parent
    clip: true
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
                color: "#B3D4FC";
                Image {
                    anchors.centerIn: parent
                    source: {
                        type == "directory" ? "images/folder.png" : "images/musicfile.png"
                    }
                }
            }

            Text {
                text: name
                font.pointSize: 18
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
        }
    }
    model: currentFolderModel
}

