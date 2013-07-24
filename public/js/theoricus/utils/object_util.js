/*
  Compiled by Polvo, using CoffeeScript
*/

define('theoricus/utils/object_util', ['require', 'exports', 'module'], function(require, exports, module) {
  var ObjectUtil;
  return module.exports = ObjectUtil = (function() {
    function ObjectUtil() {}

    /*
    @param [] str
    @param [] search
    @param [Boolean] strong_typing
    */


    ObjectUtil.find = function(src, search, strong_typing) {
      var k, v;
      if (strong_typing == null) {
        strong_typing = false;
      }
      for (k in search) {
        v = search[k];
        if (v instanceof Object) {
          return ObjectUtil.find(src[k], v);
        } else if (strong_typing) {
          if (src[k] === v) {
            return src;
          }
        } else {
          if (("" + src[k]) === ("" + v)) {
            return src;
          }
        }
      }
      return null;
    };

    return ObjectUtil;

  })();
});
/*
//@ sourceMappingURL=object_util.map
*/