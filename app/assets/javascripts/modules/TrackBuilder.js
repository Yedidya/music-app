angular.module('musicApp')
.service('TrackBuilder',
  ['Track', 'ChunkBuilder', 'VoiceBuilder', 'ChunkVoiceBuilder', 
  function TrackBuilder(Track, ChunkBuilder, VoiceBuilder, ChunkVoiceBuilder){

  this.getTrack = function(data) {
    
    var track = new Track();

    track.id = data.id;
    track.songId = data.song_id;


    for (var i = 0; i < data.chunks.length; i++) {
      var chunk = chunkBuilder.getChunk(data.chunks[i]);
      chunk.track = track;
      track.chunks.push(chunk);
    }
    //track.chunks: [chunk, chunk, chunk]

    for (var i = 0; i < data.chunks.length; i++) {
      var voice = voiceBuilder.getVoice(data.voices[i]);
      track.voices.push(voice);
    }
    //track.voices: [voice, voice, voice]

    for (var i = 0; i < data.chunks.length; i++) {
      var chunkVoice = chunkVoiceBuilder.getChunkVoice(data.chunk_voices[i]);

      // go though all voices, find the voice with the id equal to chunkVoice.voice_id
      for (var j = 0; j < track.voices.length; j++) {
        if (track.voices[j].id === data.chunk_voices[i].voice_id) {
          chunkVoice.voice = track.voices(j);
          break;
        }
      }

      // go though all voices, find the voice with the id equal to chunkVoice.chunk_id
      for (var j = 0; j < track.chunks.length; j++) {
        if (track.chunks[j].id === data.chunk_voices[i].chunk_id) {
          chunkVoice.chunk = track.chunks(j);
          break;
        }
      }

      track.chunkVoices.push(chunkVoice);

    }

    return track;
  }

}]);
