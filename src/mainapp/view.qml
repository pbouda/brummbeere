import QtQuick 2.4
import QtMultimedia 5.0

import "player.js" as PlayerCmd

Item {
    signal itemSelected(int index)
    anchors.fill: parent

    ListView {
        id: currentFolder
        topMargin: 5
        bottomMargin: 5
        anchors.top: parent.top
        width: parent.width
        height: parent.height-70
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
                    font.pointSize: 24
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }

    }

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

}


