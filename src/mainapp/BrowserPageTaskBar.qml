import QtQuick 2.0

import "helpers.js" as Helpers

Rectangle {
    color: "black"
    visible: currentFolderModel.hasAudio

    TaskBarButton {
        id: button1
        width: parent.width
        icon: "qrc:/images/icon_speaker.png"

        MouseArea {
            anchors.fill: parent
            onClicked: Helpers.playCurrent()
        }
    }

}

