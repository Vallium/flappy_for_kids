require "utils"


function		love.load()
	love.window.setTitle("Flappy For Kids")
	mainFont = love.graphics.newFont("Font/Jersey.ttf", 100);

	love.graphics.setDefaultFilter( "linear", "nearest", 1 )
	screenX = 1600
	screenY = 900
	zoom = 5

	love.window.setMode(screenX, screenY, {resizable=false})

	gravity = 800

	gameover = false
	pause = false

	birdImg = love.graphics.newImage("Sprites/bird.png")
	birdX = screenX / 2
	birdY = screenY / 2
	birdFall = 0
	birdMaxFall = 800
	birdJump = -400
	birdWidth = birdImg:getWidth() * zoom
	birdHeight = birdImg:getHeight() * zoom

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

	backgroundImg = love.graphics.newImage("Sprites/background.png")
	backgroundWidth = backgroundImg:getWidth() * zoom
	backgroundX = 0
	backgroundSpeed = pipeSpeed * 0.25

	groundImg = love.graphics.newImage("Sprites/ground.png")
	groundWidth = groundImg:getWidth() * zoom
	groundHeight = groundImg:getHeight() * zoom
	groundX = 0
	groundY = screenY - groundHeight / 5
	groundSpeed = pipeSpeed

	score = 0
end

function		love.update(dt)
	if not gameover and not pause then
		birdFall = birdFall + gravity * dt

		if birdFall > birdMaxFall then
			birdFall = birdMaxFall
		end

		birdY = birdY + birdFall * dt

		pipeX = pipeX + pipeSpeed * dt

		if pipeX < pipeEnd then
			pipeX = pipeStart
			pipeY = math.random(pipeMinY, pipeMaxY)
		end

		if birdY + birdHeight / 2 > groundY then
			gameover = true
		end

		if birdX + birdWidth / 2 > pipeX - pipeWidth / 2 and birdX - birdWidth / 2 < pipeX + pipeWidth / 2 then
			if birdY - birdHeight / 2 < pipeY - pipeHoleHeight / 2 or birdY + birdHeight / 2 > pipeY + pipeHoleHeight / 2 then
				gameover = true
			end
		end

		if pipeLastX > birdX and pipeX < birdX then
			score = score + 1
		end

		pipeLastX = pipeX

		backgroundX = backgroundX + backgroundSpeed * dt
		if backgroundX < -backgroundWidth then
			backgroundX = 0
		end

		groundX = groundX + groundSpeed * dt
		if groundX < -groundWidth then
			groundX = 0
		end
	end


end

function		love.draw()
	for i = 0, 10 do
		love.graphics.draw(backgroundImg, backgroundX + backgroundWidth * i, screenY / 2, 0, zoom, zoom, 0, backgroundImg:getHeight() / 2)
	end

	love.graphics.draw(pipeImg, pipeX, pipeY, 0, zoom, zoom, pipeImg:getWidth() / 2, pipeImg:getHeight() / 2)
	for i = 0, 10 do
		love.graphics.draw(groundImg, groundX + groundWidth * i, groundY, 0, zoom, zoom, 0, 0)
	end

	local birdRotation = math.pi/2 * (birdFall / birdMaxFall)
	love.graphics.draw(birdImg, birdX, birdY, birdRotation, zoom, zoom, birdImg:getWidth() / 2, birdImg:getHeight() / 2)

	love.graphics.setFont(mainFont)
	love.graphics.print(score, screenX / 2 , 50)
end

function		love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == " " and not gameover and not pause then
		if (birdY > -birdJump / 2) then
			birdFall = birdJump
		end
	end

	if key == "p" then
		pause = not pause
	end

	if key == "r" and gameover then
		love.load()
	end
end
