require ('./monsooned')

exports.log = log = (args) ->
  console.log(args.toString())

exports.assert = 
  equal: (expected, actual) ->
    if expected.toString() == actual.toString()
      UnitTest::passed = UnitTest::passed + 1   
    else
      log("assertFail expected:#{expected} actual: #{actual}")
      UnitTest::failed = UnitTest::failed + 1
  #    throw new AssertError("message") 
    #  throw "aaaaaaaaa" 
  false: (condition) -> @true(!condition)
  true: (condition) ->
    if condition
      UnitTest::passed += 1
    else 
      log("assertFail ")
      UnitTest::failed += 1
            

exports.UnitTest = class UnitTest
  passed : 0
  failed : 0
  run: (tests) ->
    
    for key,value of tests
      if key.indexOf("test") == 0 or key.indexOf("should") == 0
        # try 
          if tests.setup
            tests.setup()[key]() 
          else 
            value()
        # catch err
          # log "#{err} in #{key}"
    log("passed:"+UnitTest::passed + " failed:" +UnitTest::failed)
    UnitTest::passed = 0; UnitTest::failed = 0
    
