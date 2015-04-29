import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0
import Qt.labs.settings 1.0

import "helpers.js" as Helpers

Window {
    //signal itemSelected(int index)

    property string currentTitle: "Brummbeere"
    property bool menuActive: false
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

    id: root
    visible: true
    color: "black"

    Loader {
        id: main
        anchors.top: titlebar.bottom
        anchors.bottom: taskbar.top
        width: parent.width
        source: "qrc:/BrowserPage.qml"
        visible: !menuActive
    }

    TitleBar {
        id: titlebar
        anchors.top: parent.top
        width: parent.width
        height: 0.12*parent.height

    }

    Menu {
        id: menu
        anchors.top: titlebar.bottom
        anchors.bottom: taskbar.top
        width: parent.width
        visible: menuActive

    }

    Loader {
        id: taskbar
        anchors.bottom: parent.bottom
        width: parent.width
        height: 0.12*parent.height
    }

}
