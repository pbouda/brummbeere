
function play() {
    root.playerMusic.stop();
    root.playerMusic.source = root.playerMusic.playlist[root.playerMusic.currentAudio];
    root.playerMusic.play();
}

function next() {
    if (root.playerMusic.currentAudio < (root.playerMusic.playlist.length-1)) {
        root.playerMusic.stop();
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
    root.playerMusic.playlist = currentFolderModel.playlist;
    root.playerMusic.currentAudio = 0;
    play();
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

function currentMiddleAction() {

}

function currentLeftAction() {

}

function currentRightAction() {

}

var toType = function(obj) {
  return ({}).toString.call(obj).match(/\s([a-zA-Z]+)/)[1].toLowerCase()
}

function showButtons(buttonMiddle, buttonLeft, buttonRight) {
    root.taskbarActive = true;
    buttonMiddle.icon = "qrc:/images/icon_speaker.png";
    buttonMiddle.width = root.width;
    currentMiddleAction = function () {
        playCurrent();
    }
}
