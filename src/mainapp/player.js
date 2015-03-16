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
