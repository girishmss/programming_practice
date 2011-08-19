stdin = process.openStdin()
stdin.setEncoding 'utf8'
arr = []
inputCallback = null
stdin.on 'data', (input) -> inputCallback input

insert = (loc, num, char) ->
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
    
    for i in [0...len]
        if arr[i] and arr[i].substr(-1) == char[0]
            process.stdout.write arr[i].substr(-1)
        else
            process.stdout.write ' '

range = (from = 0 , times) ->
    num1 = Number from
    if times
        num2 = Number times
        len = num1 + num2
        for i in [num1...len]
            if arr[i]
                process.stdout.write i + ' ' + arr[i] + '\n'
    else
        for i in [0...arr.length]
            if arr[i]
                process.stdout.write i + ' ' + arr[i] + '\n'
            
promptForInput = ->
    console.log "Enter command (insert or range)\n"
    inputCallback = (input) ->
        command = input.split(' ')
        if command[0] is 'insert' and command.length is 4
            insert(command[1], command[2], command[3])
        else if command[0] is 'range\n' and (command.length is 1 or command.length is 3)
            range(command[1], command[2])
        else
            console.log "\nInvalid command or data\n"


console.log '\nWelcome to RANGE game\n'
promptForInput()
