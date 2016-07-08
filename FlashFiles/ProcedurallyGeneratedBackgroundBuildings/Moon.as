﻿package 
{
	import flash.events.*;
	{
		public var stageW:Number = 1200; //stage width
		public var stageH:Number = 600; //stage height
		
		public var moonArray:Array = new Array();
		public var moonSpeed:Number = 1;
		{
			
			
			var moonBitmap:Bitmap = new Bitmap(bitmapData);
			addChild(moonBitmap);
			
			moonBitmap.x = Math.random()*stageW - moonBitmap.width/2;
			moonBitmap.y = Math.random()*stageH/2 - moonBitmap.height/2;
			
			moonArray.push(moonBitmap);
			moonBitmap.addEventListener(Event.ENTER_FRAME, updateMoon);
			
		
		function updateMoon(e:Event):void
		{
			//trace(moonArray.length+"  "+moonArray[0].width+"   "+moonArray[0].x+"   "+moonSpeed)
			moonArray[0].x += moonSpeed;
			
			if (moonArray[0].x > (stageW + moonArray[0].width))
			{				
				moonArray[0].x = 0 - moonArray[0].width-100;
				moonArray[0].y = Math.random()*stageH/2 - moonArray[0].height/2;
				var scalee:int =  randomRange(100,350);
				moonArray[0].width = scalee;
				moonArray[0].height = scalee;
				moonSpeed = Math.random();
			}
		}
		function randomRange(minNum:int,maxNum:int)
		{
			return Math.floor(Math.random() * ((maxNum - minNum) + 1)) + minNum;
		}