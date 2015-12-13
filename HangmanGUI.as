﻿package {	import flash.events.MouseEvent;	import flash.display.MovieClip;	public class HangmanGUI extends MovieClip	{		/*Instance properties*/		var hangmanGame:HangmanGame;		public function HangmanGUI()		{			hangmanGame= new HangmanGame();			// constructor code			initGUI();		}		public function initGUI():void		{			//hide win/lose screens			loseScreen.visible = false;			winScreen.visible = false;			guessButton.addEventListener(MouseEvent.CLICK,userGuessed);			resetButton.addEventListener( MouseEvent.CLICK, resetGame);						//make sure current display is up to date;			refreshDisplay();		}		//function invoked when the user guesses a letter 		public function userGuessed(e:MouseEvent):void		{			//if the game is not over			//invoke function guessLetter and pass value to to parameter - the letter user typed in, update logic			hangmanGame.guessLetter(letter.text);			//invoke refreshDisplay to reflect current state of the game			refreshDisplay();			//if the game is over			if (hangmanGame.gameOver())			{				if (hangmanGame.gameWon())				{					winScreen.visible = true;				}								else 				{					loseScreen.visible = true;				}				//reveal the right answer and remove eventListener				revealAnswer();				guessButton.removeEventListener(MouseEvent.CLICK,userGuessed);			}		}		//Refresh user interface (GUI);		public function refreshDisplay():void		{			//set the letter field to empty			letter.text = "";			//refresh current guess			guessField.text = hangmanGame.getCurrentGuessArray();			//refresh current number of strikes			strikeField.text = hangmanGame.numberOfRemainingStrikes().toString();			drawHangman();		}		//revealAnswer takes in no parameters and has a void return type		public function revealAnswer():void		{			//update GUI to reveal the correct answer in guessField			guessField.text = hangmanGame.getAnswer();		}		//resetGame allows the user to play another round after a win/loss		//refresh the game, reset everything to the beginning and randomly choose a new word		public function resetGame(e:MouseEvent):void		{			hangmanGame.initGame();			initGUI();		}		public function drawHangman():void		{			//error			hangMan.gotoAndStop( hangmanGame.numberOfStrikes()+ 1);		}	}}