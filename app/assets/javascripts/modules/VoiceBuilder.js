angular.module('musicApp').service('VoiceBuilder', ['Voice', function VoiceBuilder(Voice){

  this.getVoice = function(data){
    
    var voice = new Voice();
    voice.id = data.id;
    voice.samplingRate = data.sampling_rate;
    voice.url = data.url;

    return voice;
  };

}]);
