import QtQuick 2.4
import QtMultimedia 5.0

import "player.js" as PlayerCmd

Rectangle {
    anchors.fill: parent
    color: "black"

    Rectangle {
        id: artworkSong
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 10
        height: 160
        width: 160
        color: "white"

        Rectangle {
            width: 150
            height: 150
            color: "black"
            anchors.centerIn: parent

            Image {
                fillMode: Image.PreserveAspectFit
                width: 150
                height: 150
                anchors.centerIn: parent
                source: {
                    root.playerMusic.metaData.coverArtUrlSmall ?
                        root.playerMusic.metaData.coverArtUrlSmall :
                        "images/artwork.png"
                }
            }

        }
    }

    ListView {
        id: playlistView
        model: root.playerMusic.playlist
        width: parent.width
        height: parent.height - (artworkSong.height+player.height)
        anchors.top: artworkSong.bottom
        anchors.topMargin: 10
        currentIndex: root.playerMusic.currentAudio
        highlight: Rectangle {
            width: parent.width
            height: 24
            color: "#ec3f8c"
        }

        delegate: Text {
            color: "white"
            font.pixelSize: 20
            height: 24
            text: {
                var parts = modelData.split("/");
                return "        " + parts[parts.length-1] + "  ";
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
