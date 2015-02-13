angular.module('musicApp').service('ChunkBuilder', ['Chunk',function ChunkBuilder(Chunk){

  this.getChunk = function(data){
    
    var chunk = new Chunk();
    chunk.id = data.id;
    chunk.position = data.position;
    chunk.length = data.length;

    return chunk;
  };

}]);