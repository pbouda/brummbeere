import QtQuick 2.0

ListModel {
    ListElement {
        name: "ownCloud"
        action: "BrowserPage"
        type: "page"
    }
    ListElement {
        name: "Player"
        action: "PlayerPage"
        type: "page"
    }
    ListElement {
        name: "Settings"
        action: "SettingsPage"
        type: "page"
    }
    ListElement {
        name: "Exit"
        action: "exit"
        type: "app"
    }
}
