import QtQuick 2.4

ListView {
    id: currentFolder
    anchors.fill: parent
    delegate: Item {
        x: 5
        height: 40
        Row {
            id: row1
            Rectangle {
                width: 40
                height: 40
                color: icon
            }

            Text {
                text: name
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
            }
            spacing: 10
        }
    }
    model: currentFolderModel
}

