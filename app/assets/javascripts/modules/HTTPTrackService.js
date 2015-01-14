angular
  .module('HTTPTrackService', ['TrackService'])
  .factory(['HTTPTrackService', ['TrackSefvice', function(TrackService){
    define(['$http', 'TrackService'], function($http, TrackService) {
    function HTTPTrackService(domain) {
      this.domain  = domain;
    }

    HTTPTrackService.prototype = Object.create(TrackService);
    HTTPTrackService.prototype.constructor = HTTPTrackService;

    HTTPTrackService.prototype.loadTracksBySongId = function(songId){
      TrackService.prototype.loadTracksBySongId.call(this, songId);
      return $http.get(domain + '/song/' + songId)
                  .then(function(song){
                    var tracks = [];
                    for (var i = 0; i < song.tracks.length; i ++) {
                      tracks.push(new Track(song.tracks[i]))
                    }
                    var track = new Track(data);
                    return track;
      });
    }
    HTTPTrackService.prototype.loadTrackById = function(trackId){
      TrackService.prototype.loadTrack.call(this, trackId);

      return $http.get(domain + '/track/' + trackId)
                  .then(function(data){
                    var track = new Track(data);
                    return track;
      });
    }
    HTTPTrackService.prototype.saveTrack = function(track){
      TrackService.prototype.saveTrack.call(this, track);

      return $http.post(domain + '/track/', {data: track});
                
    }
    HTTPTrackService.prototype.updateTrack = function(trackId, track){
      TrackService.prototype.updateTrack.call(this, trackId, track);

      return $http.patch(domain + '/track/' + trackId, {data: track});
    }
    HTTPTrackService.prototype.deleteTrack = function(trackId, track){
      TrackService.prototype.deleteTrack.call(this, trackId, track);

      return $http.delete(domain + '/track/' + trackId);
    }
  return HTTPTrackService;
}
]);
  

