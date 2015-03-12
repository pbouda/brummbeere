function play() {
    playerMusic.source = player.playlist[player.currentAudio];
    playerMusic.play();
}

function next() {
    playerMusic.stop();
    if (player.currentAudio < (player.playlist.length-1)) {
        player.currentAudio++;
    }
    play();
}

function prev() {
    playerMusic.stop();
    if (player.currentAudio > 0) {
        player.currentAudio--;
    }
    play();
}
