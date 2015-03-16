function play() {
    root.playerMusic.stop();
    root.playerMusic.source = root.playerMusic.playlist[root.playerMusic.currentAudio];
    root.playerMusic.play();
}

function next() {
    root.playerMusic.stop();
    if (root.playerMusic.currentAudio < (root.playerMusic.playlist.length-1)) {
        root.playerMusic.currentAudio++;
    }
    play();
}

function prev() {
    root.playerMusic.stop();
    if (root.playerMusic.currentAudio > 0) {
        root.playerMusic.currentAudio--;
    }
    play();
}

function playCurrent() {
    root.playerMusic.stop()
    root.playerMusic.playlist = currentFolderModel.playlist;
    root.playerMusic.currentAudio = 0;
    play();
}
