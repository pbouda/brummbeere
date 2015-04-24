import QtQuick 2.0
import QtMultimedia 5.0

import "helpers.js" as Helpers

Rectangle {
    color: "black"

    TaskBarButton {
        id: button1
        width: parent.width/3 - 3
        icon: "qrc:/images/icon_prev.png"

        MouseArea {
            anchors.fill: parent
            onClicked: Helpers.prev()
        }
    }

    TaskBarButton {
        id: button2
        width: parent.width/3 - 2
        anchors.left: button1.right
        anchors.leftMargin: 4
        icon: "qrc:/images/icon_speaker.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (root.playerMusic.currentPlaylist.length === 0) return;
                root.playerMusic.playbackState === MediaPlayer.PlayingState ?
                    root.playerMusic.pause() : root.playerMusic.play();
            }
        }
    }

    TaskBarButton {
        id: button3
        width: parent.width/3 - 3
        anchors.left: button2.right
        anchors.leftMargin: 4
        icon: "qrc:/images/icon_next.png"

        MouseArea {
            anchors.fill: parent
            onClicked: Helpers.next()
        }
    }

}
