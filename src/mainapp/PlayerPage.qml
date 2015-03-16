import QtQuick 2.4
import QtMultimedia 5.0

import "player.js" as PlayerCmd

Rectangle {
    anchors.fill: parent
    color: "black"

    Item {
        id: currentSong
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        height: 150
        width: 150

        Image {
            fillMode: Image.PreserveAspectFit
            source: {
                root.playerMusic.metaData.coverArtUrlSmall ?
                    root.playerMusic.metaData.coverArtUrlSmall :
                    "images/artwork.png"
            }
        }
    }


    Row {
        id: player

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        height: 60
        spacing: 10

        Rectangle {
            id: playerBack
            height: 60
            width: 60
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
            height: 60
            width: 60
            color: "#1fd26a"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (root.playerMusic.playlist.length == 0) return;
                    root.playerMusic.playbackState === MediaPlayer.PlayingState ?
                        root.playerMusic.pause() : root.playerMusic.play();
                }
            }
            Image {
                source: { root.playerMusic.playbackState === MediaPlayer.PlayingState ?
                    "images/pause.png": "images/play.png" }
                anchors.centerIn: parent
            }

        }
        Rectangle {
            id:playerForward
            height: 60
            width: 60
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
