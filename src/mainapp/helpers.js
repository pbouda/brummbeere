.import "actions.js" as Actions

function play() {
    root.playerMusic.stop();
    root.playerMusic.source = root.playerMusic.currentPlaylist[root.playerMusic.currentAudio];
    root.playerMusic.play();
}

function next() {
    if (root.playerMusic.currentAudio < (root.playerMusic.currentPlaylist.length-1)) {
        //root.playerMusic.stop();
        root.playerMusic.currentAudio++;
        play();
    }
}

function prev() {
    if (root.playerMusic.currentAudio > 0) {
        root.playerMusic.stop();
        root.playerMusic.currentAudio--;
        play();
    }
}

function playCurrent() {
    root.playerMusic.stop()
    root.playerMusic.currentPlaylist = currentFolderModel.playlist;
    root.playerMusic.currentAudio = 0;
    play();
}

function loadFolder(path) {
    root.title = path;
    root.currentPath = path;
    currentFolderModel.loadFromDir(path);
}

function toggleMenu() {
    if (!root.menuActive)
        root.menuActive = true;
    else
        root.menuActive = false;
}

function startAction(name, type) {
    if (type === "app") {
        if (name === "exit") Qt.quit();
    } else if (type === "page") {
        main.source = "qrc:/" + name + ".qml";
    }
    toggleMenu();
}

function saveSettings() {
    root.settings.url = main.item.ocUrl.text;
    root.settings.user = main.item.ocUser.text;
    root.settings.password = main.item.ocPassword.text;
}

function initOwncloud() {
    currentFolderModel.initDav(root.settings.url,
                               root.settings.user,
                               root.settings.password);
    currentFolderModel.loadFromDir("/");
}

