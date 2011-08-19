{log, assert, UnitTest} = require './assert'

class Range
    arr = []
    insert: (loc, num, char) ->
        #loc = location in array where char needs to be inserted
        #num = Number of times the char needs to be inserted from location 'loc'
        #char = Character that needs to be implemented in array
        num1 = Number loc
        num2 = Number num
        len = num1 + num2
        for i in [num1...len]
            if arr[i]
                arr[i] = arr[i] + char[0]
            else
                arr[i] = char[0]
        result = ''
        for i in [0...len]
            if arr[i] and arr[i].substr(-1) == char[0]
                result =  result + arr[i].substr(-1)
            else
                result = result + ' '
        return result

    range: (from = 0 , times) ->
        num1 = Number from
        result = []
        if times
            num2 = Number times
            len = num1 + num2
            for i in [num1..len]
                if arr[i]
                    str = i + ' ' + arr[i]
                    result.push(str)
        else
            for i in [0...arr.length]
                if arr[i]
                    str = i + ' ' + arr[i]
                    #console.log "output " + str
                    result.push(str)
        return result

class Test_Range
    "test insert and range": ->
        r  = new Range()
        res = r.insert(3, 4, 'a')
        assert.equal('   aaaa', res)
        assert.equal('3 a,4 a,5 a,6 a', r.range())

        res2 = r.insert(4, 6, 'g')
        assert.equal('    gggggg', res2)
        assert.equal('3 a,4 ag,5 ag,6 ag', r.range(2, 4))

UnitTest::run(new Test_Range)

