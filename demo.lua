require "utils"

function		love.load()
	initGame()
	initBackground()
	initPipe()
	initGround()
	initBird()
end

function		love.update(dt)
	if not gameover and not pause then
		moveBird(dt)
		movePipe(dt)

		if birdCollideGround() then
			gameover = true
		end

		if birdCollidePipe() then
			gameover = true
		end

		if justScored() then
			score = score + 1
		end

		moveBackground(dt)
		moveGround(dt)
	end
end

function		love.draw()
	drawBackground()
	drawPipe()
	drawGround()
	drawBird()
	drawScore()
	if gameover then
		drawGameOver()
	end
end

function		love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end

	if key == " " and not gameover and not pause then
		doBirdJump()
	end

	if key == "p" then
		pause = not pause
	end

	if key == "r" and gameover then
		love.load()
	end
end
