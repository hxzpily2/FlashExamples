﻿package 
{

	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.filters.*;


	public class TurretThreeBarrel extends MovieClip
	{
		public var refM:MovieClip;

		public var myColorTransform = new ColorTransform  ;

		public var gravity:Number = .68;

		public var playerCos:Number;
		public var playerSin:Number;

		public var startX:Number;
		public var startY:Number;

		public var bulletSpeed:Number = 3;
		public var bulletMaxDistance:Number = 1000;
		public var maxDistance:Number;

		public var xDistThree:Number = 0;
		public var yDistThree:Number = 0;
		public var getDistanceThree:Number = 0;

		public var isLoaded3:Boolean = true;
		public var isFiring3:Boolean = false;

		public var counttt:Number = 0;
		public var _barrelLength:Number = 40;
		public var _bulletSpread:Number = 3;
		public var _reloadSpeed:Number = 10;//milliseconds

		public var countState:Boolean = false;
		public var tThreeState:Boolean = false;

		public var whereBulletEndsX:Number;
		public var whereBulletEndsY:Number;
		public var bulletXPos:Number;
		public var bulletYPos:Number;


		public function TurretThreeBarrel()
		{
			stage.addEventListener(MouseEvent.CLICK,mClick);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, MouseUp);
			this.addEventListener(Event.ENTER_FRAME,gameLoop);

			refM = MovieClip(this.parent);

			refM.turretsArray.push(this);
			refM.turretThreeArray.push(this);
		}

		function gameLoop(event:Event):void
		{


			turret3Health();
			updateBullets();
			fire();

			refM.text3.text = refM.t3healthNum.toFixed(0);

			if (tThreeState == false)
			{
				refM.frontBoxArray[1].alpha = 0;
				if (isFiring3 == true)
				{
					refM.t3healthNum -=  .1;
				}
			}
			if (tThreeState == true)
			{
				if (isFiring3 == false)
				{
					refM.t3healthNum +=  .01;
				}
				refM.frontBoxArray[1].alpha = .1;
			}

			if ((refM.t3healthNum == 0))
			{
				tThreeState = true;
			}

		}

		public function turret3Health()
		{
			if ((refM.t3healthNum >= 100))
			{
				refM.t3healthNum = 100;
			}
			if ((refM.t3healthNum <= 0))
			{
				refM.t3healthNum = 0;
			}

			for (var i:uint = 0; i < refM.turretThreeArray.length; i += 1)
			{

				if ((refM.t3healthNum <= 20))
				{
					refM.turretThreeArray[i].filters = [refM.filter_glow];
				}
				else
				{
					refM.turretThreeArray[i].filters = [];
				}

				if ((refM.t3healthNum <= 0))
				{
					myColorTransform.color = 0xff0000;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 5))
				{
					myColorTransform.color = 0xff0000;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 10))
				{
					myColorTransform.color = 0xff0000;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 15))
				{
					myColorTransform.color = 0xFF3400;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 20))
				{
					myColorTransform.color = 0xFF5700;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 25))
				{
					myColorTransform.color = 0xFF6900;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 30))
				{
					myColorTransform.color = 0xFF7B00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 35))
				{
					myColorTransform.color = 0xFF8C00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 40))
				{
					myColorTransform.color = 0xFF9E00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 45))
				{
					myColorTransform.color = 0xFFAF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 50))
				{
					myColorTransform.color = 0xFFC100;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 55))
				{
					myColorTransform.color = 0xFFD300;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 60))
				{
					myColorTransform.color = 0xFFE400;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 65))
				{
					myColorTransform.color = 0xFFF600;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 70))
				{
					myColorTransform.color = 0xF7FF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 75))
				{
					myColorTransform.color = 0xE5FF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 80))
				{
					myColorTransform.color = 0xD4FF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 85))
				{
					myColorTransform.color = 0xC2FF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 90))
				{
					myColorTransform.color = 0xB0FF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 95))
				{
					myColorTransform.color = 0x9FFF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
				else if ((refM.t3healthNum <= 100))
				{
					myColorTransform.color = 0x7CFF00;
					refM.turretThreeArray[i].transform.colorTransform = myColorTransform;
				}
			}

		}
		private function createBullet():void
		{

			playerCos = Math.cos(this.rotation * Math.PI / 180);
			playerSin = Math.sin(this.rotation * Math.PI / 180);

			bulletXPos = this.x - _barrelLength * playerCos;
			bulletYPos = this.y - _barrelLength * playerSin;

			whereBulletEndsX = this.x - 50 * playerCos + Math.random() * _bulletSpread - _bulletSpread * .5;
			whereBulletEndsY = this.y - 50 * playerSin + Math.random() * _bulletSpread - _bulletSpread * .5;

			var tempBullet:MovieClip = new BulletThree();

			tempBullet.vx = (whereBulletEndsX - bulletXPos) / bulletSpeed;
			tempBullet.vy = (whereBulletEndsY - bulletYPos) / bulletSpeed;

			tempBullet.x = bulletXPos;
			tempBullet.y = bulletYPos;

			startX = bulletXPos;
			startY = bulletYPos;
			maxDistance = bulletMaxDistance;
			refM.bulletsArray.push(tempBullet);

			stage.addChild(tempBullet);

		}

		public function fire():void
		{
			if (countState == true)
			{
				counttt +=  1;

				if (counttt >= _reloadSpeed)
				{
					counttt = 0;
					reloadWeapon();
					countState = false;
				}
			}

			if (! isFiring3)
			{
				return;
			}

			if (! isLoaded3)
			{
				return;
			}
			if ((refM.shootingState == "Fire" || tThreeState == false))
			{
				createBullet();
			}

			countState = true;

			isLoaded3 = false;
		}
		public function updateBullets():void
		{
			var i:int;
			var tempBullet:MovieClip;

			for (i = 0; i < refM.bulletsArray.length; i++)
			{
				tempBullet = refM.bulletsArray[i];

				tempBullet.x +=  tempBullet.vx;
				tempBullet.y +=  tempBullet.vy;

				xDistThree = startX - tempBullet.x;
				yDistThree = startY - tempBullet.y;

				getDistanceThree = Math.sqrt((xDistThree * xDistThree) + (yDistThree * yDistThree));

				if (getDistanceThree > maxDistance + _barrelLength)
				{
					destroyBullet(tempBullet);
				}
			}
		}
		public function destroyBullet(bullet:MovieClip):void
		{
			var i:int;
			var tempBullet:MovieClip;

			for (i = 0; i < refM.bulletsArray.length; i++)
			{
				tempBullet = refM.bulletsArray[i];

				if (tempBullet == bullet)
				{
					refM.bulletsArray.splice(i, 1);

					bullet.parent.removeChild(bullet);

					return;
				}
			}
		}
		public function reloadWeapon():void
		{
			isLoaded3 = true;
		}

		public function MouseUp(event:MouseEvent):void
		{
			if ((refM.shootingState == "Fire"))
			{
				if (tThreeState == false)
				{
					isFiring3 = false;
				}
			}
		}

		public function MouseDown(event:MouseEvent):void
		{
			if (event.target == refM.mouseTarg)
			{

				if ((refM.shootingState == "Fire"))
				{
					if (tThreeState == false)
					{
						isFiring3 = true;
					}
				}
			}
		}
		public function mClick(event:MouseEvent):void
		{
			if (event.target == refM.frontBoxArray[1])
			{
				tThreeState = ! tThreeState;
			}

		}


	}

}