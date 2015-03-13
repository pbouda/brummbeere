import QtQuick 2.0
import QtMultimedia 5.0

import "player.js" as PlayerCmd

Item {
    property var currentAudio: 0
    property var playlist: []

    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    width: 210
    height: 70
    id: player
    visible: currentFolderModel.hasAudio

    MediaPlayer {
        id: playerMusic
    }

    Row {
        spacing: 10
        Rectangle {
            id: playerBack
            height: 70
            width: 70
            color: "#1fd26a"
            MouseArea {
                anchors.fill: parent
                onClicked: PlayerCmd.prev();
            }
            Image {
                source: "images/prev.png"
                anchors.centerIn: parent
            }
        }
        Rectangle {
            id: playerStartStop
            height: 70
            width: 70
            color: "#1fd26a"
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
        Rectangle {
            id:playerForward
            height: 70
            width: 70
            color: "#1fd26a"
            MouseArea {
                anchors.fill: parent
                onClicked: PlayerCmd.next()
            }
            Image {
                source: "images/next.png"
                anchors.centerIn: parent
            }
        }
    }
}
