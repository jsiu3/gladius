var algorithm = function(options) {
  options = options || {};
  var _randomObject = window.Math;
  var _perlinNoise = new ClassicalNoise();
  var _simplexNoise = new SimplexNoise();
  if (options.seed) seedRandom(options.seed);
 
  this.seedRandom = function(seed) {
    seed = seed || Math.random();
    if (typeof seed === Number) {
      _randomObject = { 
        random: function() { 
          return seed; 
        }
      };
      _perlinNoise.Init(_randomObject);
      _simplexNoise.Init(_randomObject);
    } else {
      throw "You must seed with a number.";
    }
  };
  
  this.perlin2 = function(x,y) { 
    return 0.0; 
  };
  
  this.perlin3 = function(x,y,z) { 
    return _perlinNoise.noise(x,y,z); 
  };
  
  this.perlin4 = function(x,y,z,w) { 
    return 0.0; 
  };
  
  this.simplex2 = function(x,y) { 
    return _simplexNoise.noise(x,y); 
  };
  
  this.simplex3 = function(x,y,z) { 
    return _simplexNoise.noise3d(x,y,z);
  };
  
  this.simplex4 = function(x,y,z,w) { 
    return 0.0; 
  };
};