define(['HTTPTrackService', 'TrackService'], function(HTTPTrackService, TrackService){
  function TrackServiceFactory(config) {
    var serviceType = config.trackServiceType;
    if (serviceType === 'HTTP') {
      this.service = new HTTPTrackService(config.domain);
    } 
  }
  TrackService.prototype.getTrackService = function() {
    return this.service;
  }
});

var trackService = new TrackServiceFactory(config);
var trackService = TrackServiceFactory.getTrackService();