import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtMultimedia 5.0

import "player.js" as PlayerCmd
import "UI.js" as UI

ApplicationWindow {
    signal itemSelected(int index)
    property var currentFolderName: "Connect to ownCloud - please add settings"
    property var playerMusic:
        MediaPlayer {
            property var currentAudio: 0
            property var playlist: []
            onStopped: {
                if (position > duration) PlayerCmd.next();
            }
        }

    id: root
    visible: true
    width: 480
    height: 640
    title: "TwoMusic - ownCloud Music Player"


    MessageDialog {
        id: aboutDialog
        icon: StandardIcon.Information
        title: "About"
        text: "<b>TwoMusic</b> - ownCloud Music Player"
        informativeText: "<p>v0.0.1</p><p>A music player for ownCloud. Just browse to any folder and click play. \
            Developed by <a href=\"http://www.peterbouda.eu\">www.peterbouda.eu</a>. For bug \
            reports and suggestions please use <a href=\"https://github.com/pbouda/twomusic/issues\">the issue tracker</a>.</p>"
    }

    Dialog {
        id: settingsDialog
        width: 400
        height: 200
        title: "ownCloud Settings"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        onAccepted: {
            currentFolderModel.initDav(ownCloudUrl.text, ownCloudUser.text, ownCloudPass.text);
            currentFolderModel.loadFromDir("/");
            root.currentFolderName = "/";
        }

        GridLayout {
            anchors.fill: parent
            columns: 2
            Label { text: "ownCloud Server URL:" }
            TextField { id: ownCloudUrl; Layout.fillWidth: true }
            Label { text: "Username:" }
            TextField { id: ownCloudUser; Layout.fillWidth: true }
            Label { text: "Password:" }
            TextField {
                id: ownCloudPass
                echoMode: TextInput.Password
                Layout.fillWidth: true
            }
            CheckBox {
                id: storePassword
                text: "Store password?"
                Layout.columnSpan: 2
            }
        }
    }

    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem {
                text: "&Settings"
                onTriggered: settingsDialog.open()
            }
            MenuItem {
                text: "E&xit"
                shortcut: StandardKey.Quit
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "&Help"
            MenuItem {
                text: "About..."
                onTriggered: aboutDialog.open()
            }
        }
    }

    TabView {
        id: tabView

        anchors.fill: parent
        anchors.margins: UI.margin
        tabPosition: UI.tabPosition

        Layout.minimumWidth: 480
        Layout.minimumHeight: 640
        Layout.preferredWidth: 480
        Layout.preferredHeight: 640

        Tab {
            title: "Browser"
            BrowserPage {
                //enabled: enabler.checked
            }
        }

        Tab {
            title: "Player"
            PlayerPage {
                //enabled: enabler.checked
            }
        }
    }

    statusBar: StatusBar {
        RowLayout {
            Layout.fillWidth: true
            Label {
                text: currentFolderName
            }
        }
    }
}


