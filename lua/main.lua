function love.load()
    love.window.setTitle("Tetris at home")
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(255,255,255)

    size = 20
    boardX = 10
    boardY = 20
    xpos = 4
    ypos = 0
    timer = 0

    maxposy = 20
    minposx = 1
    maxposx = 10

    grid = {}
    for y = 1, boardY do
       grid[y] = {}  
       --free blocks as empty spaces
       for x = 1, boardX do
        grid [y][x] = '0'
       end
    end
 
    --tetris pieces table
    pieces = {
        {
            {
                {'0', '0', '0', '0'},
                {'b1', 'b1', 'b1', 'b1'},
                {'0', '0', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'b1', '0', '0', '0'},
                {'b1', '0', '0', '0'},
                {'b1', '0', '0', '0'},
                {'b1', '0', '0', '0'},
            }
        },
        {
            {
                {'0', '0', '0', '0'},
                {'b2', 'b2', 'b2', '0'},
                {'0', 'b2', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', 'b2', '0', '0'},
                {'0', 'b2', 'b2', '0'},
                {'0', 'b2', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', 'b2', '0', '0'},
                {'b2', 'b2', 'b2', '0'},
                {'0', '0', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', 'b2', '0', '0'},
                {'b2', 'b2', '0', '0'},
                {'0', 'b2', '0', '0'},
                {'0', '0', '0', '0'},
            }
        },
        {
            {
                {'0', '0', '0', '0'},
                {'0', 'b3', 'b3', '0'},
                {'0', 'b3', 'b3', '0'},
                {'0', '0', '0', '0'},
            }
        },
        {
            {
                {'0', 'b4', '0', '0'},
                {'0', 'b4', '0', '0'},
                {'0', 'b4', '0', '0'},
                {'0', 'b4', 'b4', '0'},
            },
            {
                {'0', '0', '0', 'b4'},
                {'b4', 'b4', 'b4', 'b4'},
                {'0', '0', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'b4', 'b4', '0', '0'},
                {'0', 'b4', '0', '0'},
                {'0', 'b4', '0', '0'},
                {'0', 'b4', '0', '0'},
            },
            {
                {'0', '0', '0', '0'},
                {'b4', 'b4', 'b4', 'b4'},
                {'b4', '0', '0', '0'},
                {'0', '0', '0', '0'},
            }
        },
        {
            {
                {'0', 'b5', '0', '0'},
                {'0', 'b5', 'b5', '0'},
                {'0', 'b5', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', 'b5', '0', '0'},
                {'b5', 'b5', 'b5', '0'},
                {'0', '0', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', 'b5', '0', '0'},
                {'b5', 'b5', '0', '0'},
                {'0', 'b5', '0', '0'},
                {'0', '0', '0', '0'},
            },
            {
                {'0', '0', '0', '0'},
                {'b5', 'b5', 'b5', '0'},
                {'0', 'b5', '0', '0'},
                {'0', '0', '0', '0'},
            }
        }
    } --end of tetris pieces table

    blockType = 1
    blockRotation = 1

     blockColors ={
                ['0'] = {.87,.87,.87},
                ['b1'] = {.23, .54, .98},
                ['b2'] = {.56, .54, .76},
                ['b3'] = {.67, .23, .44},
                ['b4'] = {.75, .3, .5},
                ['b5'] = {.9, .4, .77}
            }


    function validMove(testX, testY, testRotation)
        return true
    end

--testing colors
--[[
    grid[20][1] = 'b1'
    grid[19][2] = 'b2'
    grid[18][3] = 'b3'
    grid[17][4] = 'b4'
    grid[16][5] = 'b5'
]]--
   --[[ board = {}
    for y=1, boardH do
        board[y] = {}

        for x = 1, boardW do
            board[y][x] = 0
        end
    end
    ]]--
end

function love.update(dt)
    timer = timer + dt
    if timer > 0.5 then
        timer = 0
        ypos = ypos + 1

        --checking if pieces can move
        local checkY = ypos + 1
        if validMove(xpos, checkY, blockRotation) then
            ypos = checkY
        end
    end
end

function love.draw()
    --drawing board
    for y = 1, boardY do
        for x = 1, boardX do
            --colors of blocks

            --[[local blockColors ={
                ['0'] = {.87,.87,.87},
                ['b1'] = {.23, .54, .98},
                ['b2'] = {.56, .54, .76},
                ['b3'] = {.67, .23, .44},
                ['b4'] = {.75, .3, .5},
                ['b5'] = {.9, .4, .77}
            }
            ]]--
            local gridBlock = grid[y][x]
            local color = blockColors[gridBlock] or {1,0,0} --red if clor not found for debugging
            love.graphics.setColor(color)
            local block = 20
            local drawBlock = block - 1
            love.graphics.rectangle('fill', (x-1) * block, (y-1) * block, drawBlock, drawBlock)
            end
    end

    --drawing pieces
    for y = 1, 4 do
        for x = 1, 4 do
            local block = pieces[blockType][blockRotation][y][x]
            --[[local blockColors ={
                ['0'] = {.87,.87,.87},
                ['b1'] = {.23, .54, .98},
                ['b2'] = {.56, .54, .76},
                ['b3'] = {.67, .23, .44},
                ['b4'] = {.75, .3, .5},
                ['b5'] = {.9, .4, .77}
            }
            ]]--
                if block ~= '0' then
                        local color = blockColors[block] or {1,0,0} --red if color not found -for debugging
                        love.graphics.setColor(color)
                        local blocksize = 20
                        --local drawBlock = blocksize - 1
                        love.graphics.rectangle('fill', (xpos + x - 1) * blocksize, (ypos + y - 1) * blocksize, blocksize - 1, blocksize - 1)    
                end
        end
    end

    --[[
    colors = {c = {.26,.65,.45}}
    local block = grid[x],[y]
    local color = colors[block]
    love.graphics.setColor(color)
    ]]--
end

function love.keypressed(key)
    if key =='e' then
        local testRotation = blockRotation + 1
        if testRotation > #pieces[blockType] then
            testRotation = 1
        end

        if validMove(xpos, ypos, testRotation) then
            blockRotation = testRotation
        end
    end

    if key =='q' then
        local testRotation = blockRotation - 1
        if testRotation < 1 then
            testRotation = #pieces[blockType]
        end

        if validMove(xpos, ypos, testRotation) then
            blockRotation = testRotation
        end
    end

    if key == 'right' then
        local testX = pieceX + 1
        if validMove(testX, ypos, blockRotation) then
            xpos = testX
        end
        
    elseif key == 'right' then
        local testX = pieceX - 1
        if validMove(testX, ypos, blockRotation) then
            xpos = testX
        end
end