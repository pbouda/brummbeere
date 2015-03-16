import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import "player.js" as PlayerCmd

ColumnLayout {
    anchors.fill: parent
    Layout.minimumWidth: 480
    Layout.minimumHeight: 640
    Layout.preferredWidth: 480
    Layout.preferredHeight: 640

    TableView {

        id: currentFolder
        frameVisible: false
        headerVisible: false
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.top: parent.top
        clip: true
        model: currentFolderModel

        onClicked: {
            root.currentFolderName = currentFolderModel.get(row).path;
            itemSelected(row);
        }

        TableViewColumn {
            id: typeColumn
            title: "Icon"
            role: "type"
            movable: false
            resizable: false
            width: 70
        }

        TableViewColumn {
            id: nameColumn
            title: "Name"
            role: "name"
            movable: false
            resizable: false
            width: currentFolder.viewport.width - typeColumn.width
        }

    }

    Button {
        Layout.fillWidth: true
        anchors.bottom: parent.bottom
        text: "Play folder"
        enabled: currentFolderModel.hasAudio
        onClicked: PlayerCmd.playCurrent()
    }
}
