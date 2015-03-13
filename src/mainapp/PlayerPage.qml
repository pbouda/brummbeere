import QtQuick 2.4

import "player.js" as PlayerCmd

Item {
    id: player

    anchors.centerIn: parent
    width: 210
    height: 70
    visible: currentFolderModel.hasAudio

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
