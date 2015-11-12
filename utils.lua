--	 ####### INIT FONCTIONS ########

function		initGame()
	love.window.setTitle("Flappy For Kids")
	scoreFont = love.graphics.newFont("Font/Jersey.ttf", 100);
	gameOverFont = love.graphics.newFont("Font/Jersey.ttf", 60);

	love.graphics.setDefaultFilter( "linear", "nearest", 1 )
	screenX = 1600
	screenY = 900
	zoom = 5
	score = 0
	gravity = 800
	love.window.setMode(screenX, screenY, {resizable=false})

	gameover = false
	pause = false
end

function		initBird()
	birdImg = love.graphics.newImage("Sprites/bird.png")
	birdX = screenX / 2
	birdY = screenY / 2
	birdFall = 0
	birdMaxFall = 800
	birdJump = -400
	birdWidth = birdImg:getWidth() * zoom
	birdHeight = birdImg:getHeight() * zoom
end

function		initPipe()
	pipeImg = love.graphics.newImage("Sprites/pipe.png")
	pipeStart = 1700
	pipeEnd = -100
	pipeSpeed = -800
	pipeMinY = 200
	pipeMaxY = 700
	pipeX = pipeStart
	pipeY = screenY / 2
	pipeLastX = pipeX
	pipeWidth = pipeImg:getWidth() * zoom
	pipeHoleHeight = pipeImg:getHeight() * zoom / 4
end

function		initBackground()
	backgroundImg = love.graphics.newImage("Sprites/background.png")
	backgroundWidth = backgroundImg:getWidth() * zoom
	backgroundX = 0
	backgroundSpeed = -200
end

function		initGround()
	groundImg = love.graphics.newImage("Sprites/ground.png")
	groundWidth = groundImg:getWidth() * zoom
	groundHeight = groundImg:getHeight() * zoom
	groundX = 0
	groundY = screenY - groundHeight / 5
	groundSpeed = -800
end


--	 ####### UPDATE FONCTIONS ########

function		birdCollideGround()
	return birdY + birdHeight / 2 > groundY
end

function		birdCollidePipe()
	if birdX + birdWidth / 2 > pipeX - pipeWidth / 2 and birdX - birdWidth / 2 < pipeX + pipeWidth / 2 then
		if birdY - birdHeight / 2 < pipeY - pipeHoleHeight / 2 or birdY + birdHeight / 2 > pipeY + pipeHoleHeight / 2 then
			return true
		end
	end
	return false
end

function		justScored()
	local out = pipeLastX > birdX and pipeX < birdX

	pipeLastX = pipeX
	return out
end

function		moveBird(dt)
	birdFall = birdFall + gravity * dt

	if birdFall > birdMaxFall then
		birdFall = birdMaxFall
	end
	birdY = birdY + birdFall * dt
end

function		movePipe(dt)
		pipeX = pipeX + pipeSpeed * dt

		if pipeX < pipeEnd then
			pipeX = pipeStart
			pipeY = math.random(pipeMinY, pipeMaxY)
		end
end

function		moveBackground(dt)
	backgroundX = backgroundX + backgroundSpeed * dt
	if backgroundX < -backgroundWidth then
		backgroundX = 0
	end
end

function		moveGround(dt)
	groundX = groundX + groundSpeed * dt
	if groundX < -groundWidth then
		groundX = 0
	end
end


--	 ####### DRAW FONCTIONS ########

function		drawBackground()
	for i = 0, 10 do
		love.graphics.draw(backgroundImg, backgroundX + backgroundWidth * i, screenY / 2, 0, zoom, zoom, 0, backgroundImg:getHeight() / 2)
	end
end

function		drawPipe()
	love.graphics.draw(pipeImg, pipeX, pipeY, 0, zoom, zoom, pipeImg:getWidth() / 2, pipeImg:getHeight() / 2)
end

function		drawGround()
	for i = 0, 10 do
		love.graphics.draw(groundImg, groundX + groundWidth * i, groundY, 0, zoom, zoom, 0, 0)
	end
end

function		drawBird()
	local birdRotation = math.pi/2 * (birdFall / birdMaxFall)
	love.graphics.draw(birdImg, birdX, birdY, birdRotation, zoom, zoom, birdImg:getWidth() / 2, birdImg:getHeight() / 2)
end

function		drawScore()
	love.graphics.setFont(scoreFont)
	love.graphics.print(score, screenX / 2 , 50)
end

function		drawGameOver()
	love.graphics.setFont(gameOverFont)
	love.graphics.print("Game Over. Press r to restart or esc to quit.", screenX / 8 , screenY / 2)
end

--	 ####### INPUT FONCTIONS ########

function		doBirdJump()
	if (birdY > -birdJump / 2) then
		birdFall = birdJump
	end
end
