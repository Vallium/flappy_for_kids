								FLAPPY FOR KIDS								

Hello, bienvenue dans notre atelier FLAPPY FOR KIDS!
Si vous etes avec nous, c'est que vous faites partit des meilleurs de cette
journee START'UP for KIDS!

Vous connaissez surement le jeux FLAPPY BIRD ?!
	(Si vous ne savez pas https://fr.wikipedia.org/wiki/Flappy_Bird)
C'est ce que nous allons coder aujourd'hui dans un language
de programmation... Le LUA :D

Pour ce faire, vous allez devoir coder:

	* La gestion du jeu:
		- Initialiser le jeu
		- Faire en sorte de quitter quand on appuie sur 'esc'

	* L'oiseau :
		- L'afficher
		- Le faire tomber
		- Le faire sauter lorsqu'on appuie sur la touche espace

	* Le tuyau :
		- L'afficher
		- Le mettre en mouvement

	* Le sol :
		- L'afficher
		- Le mettre en mouvement

	* Le background :
		- L'afficher
		- Le mettre en mouvement

	* La collision :
		- Quand l'oiseau touche un tuyau, arreter le jeu
		- Quand l'oiseau touche le sol, arreter le jeu

	* Le GameOver :
		- Afficher le message de GameOver quand on a perdu
		- Apres avoir perdu, on peut recommencer en appuyant sur 'r'

	* Le score:
		- Afficher le score
		- Marquer des points quand on passe un tuyau

	* La pause:
		- Quand on appuie sur 'p' le jeu se met en pause
		- Si on appuie une nouvelle fois, le jeu reprend son cours

Pour implementer tout ceci, vous disposez des variables et
des fonctions suivantes:

	* Les variables :
		- score : contient le score du joueur
		- pause : le jeu se fige si pause == true, la partie reprend
				quand pause == false
		- gameover : la partie s'arrete si gameover == true

	* Les fonctions:
		- initGame() : initialise le jeu
		- initBird() : initialise l'oiseau
		- initPipe() : initialise le tuyau
		- initGround() : initialise le sol
		- initBackground() : initialise le fond

		- moveBird(dt) : fait chuter l'oiseau (depend du temps ecoule)
		- movePipe(dt) : fait bouger le tuyau (depend du temps ecoule)
		- moveGround(dt) : fait bouger le sol (depend du temps ecoule)
		- moveBackground(dt) : fait bouger le fond (depend du temps)

		- birdCollidePipe() : renvoie true si l'oiseau touche le tuyau
		- birdCollideGround() : renvoie true si l'oiseau touche le sol
		- justScored() : renvoie true si l'oiseau passe le tuyau

		- drawBird() : affiche l'oiseau
		- drawPipe() : affiche le tuyau
		- drawGround() : affiche le sol
		- drawBackground() : affiche le fond
		- drawScore() : affiche le score
		- drawGameOver() : affiche le texte de gameover

		- doBirdJump() : fait sauter l'oiseau

		- love.event.quit() : permet de quitter le programme

Enfin, si vous arrivez a implementer tout ca, on vous frappera pas.... Et
accessoirement, vous pourrez officielement vous proclamer comme "Meilleur"
sans oublier que vous avez toutes vos chances pour integrer l'Ecole 42
plus tard ;)

BONNE CHANCE !!!! (Meme si la chance n'a rien a voir dans tout ca....)
