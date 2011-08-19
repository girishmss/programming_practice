var Range, Test_Range, UnitTest, assert, log, _ref;
_ref = require('./assert'), log = _ref.log, assert = _ref.assert, UnitTest = _ref.UnitTest;
Range = (function() {
  var arr;
  function Range() {}
  arr = [];
  Range.prototype.insert = function(loc, num, char) {
    var i, len, num1, num2, result;
    num1 = Number(loc);
    num2 = Number(num);
    len = num1 + num2;
    for (i = num1; num1 <= len ? i < len : i > len; num1 <= len ? i++ : i--) {
      if (arr[i]) {
        arr[i] = arr[i] + char[0];
      } else {
        arr[i] = char[0];
      }
    }
    result = '';
    for (i = 0; 0 <= len ? i < len : i > len; 0 <= len ? i++ : i--) {
      if (arr[i] && arr[i].substr(-1) === char[0]) {
        result = result + arr[i].substr(-1);
      } else {
        result = result + ' ';
      }
    }
    return result;
  };
  Range.prototype.range = function(from, times) {
    var i, len, num1, num2, result, str, _ref2;
    if (from == null) {
      from = 0;
    }
    num1 = Number(from);
    result = [];
    if (times) {
      num2 = Number(times);
      len = num1 + num2;
      for (i = num1; num1 <= len ? i <= len : i >= len; num1 <= len ? i++ : i--) {
        if (arr[i]) {
          str = i + ' ' + arr[i];
          result.push(str);
        }
      }
    } else {
      for (i = 0, _ref2 = arr.length; 0 <= _ref2 ? i < _ref2 : i > _ref2; 0 <= _ref2 ? i++ : i--) {
        if (arr[i]) {
          str = i + ' ' + arr[i];
          result.push(str);
        }
      }
    }
    return result;
  };
  return Range;
})();
Test_Range = (function() {
  function Test_Range() {}
  Test_Range.prototype["test insert and range"] = function() {
    var r, res, res2;
    r = new Range();
    res = r.insert(2, 3, 'a');
    assert.equal('  aaa', res);
    assert.equal('2 a,3 a,4 a', r.range());
    res2 = r.insert(3, 2, 'g');
    assert.equal('   gg', res2);
    return assert.equal('2 a,3 ag,4 ag', r.range(2, 3));
  };
  return Test_Range;
})();
UnitTest.prototype.run(new Test_Range);