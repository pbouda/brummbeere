import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0

Window {
    //signal itemSelected(int index)

    property string currentTitle: "TwoMusic"
    property bool menuActive: false

    property var playerMusic:
        MediaPlayer {
            property int currentAudio: 0
            property var currentPlaylist: []
            onStopped: {
                if (position > duration) PlayerCmd.next();
            }
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
