import QtQuick 2.0

ListModel {
    ListElement {
        name: "ownCloud"
        action: "BrowserPage"
    }
    ListElement {
        name: "Player"
        action: "PlayerPage"
    }
    ListElement {
        name: "Settings"
        action: "SettingsPage"
    }
    ListElement {
        name: "Exit"
        action: "APP::Exit"
    }
}
