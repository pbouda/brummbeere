import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0
import Qt.labs.settings 1.0

import "helpers.js" as Helpers

RootWindow {
    title: "Hummbeere"

    property string currentPath: "/"

    property var playerMusic:
        MediaPlayer {
            property int currentAudio: 0
            property var currentPlaylist: []
            onStopped: {
                if (status == MediaPlayer.EndOfMedia) Helpers.next();
            }
        }

    property var settings:
        Settings {
            property string url;
            property string user;
            property string password;
        }

    Component.onCompleted: currentPage = "qrc:/BrowserPage.qml"
}
