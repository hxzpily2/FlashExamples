﻿package 
	import com.greensock.easing.*;
			var sstf:SplitTextField = new SplitTextField(sText);
			
			TweenMax.staggerFromTo(sstf.textFields, 0.2, {alpha:0}, {alpha:1}, 0.1 );
			
			//part2
			//TweenMax.allFrom(sstf2.textFields, .5, {rotationX:120, y:"90", alpha:0, delay:.5}, 0.1);
			//TweenMax.staggerFromTo(sstf2.textFields, 0.2, {alpha:0}, {alpha:1}, 0.1 );
			
			
			//part3
			 // var sstf3:SplitTextField = new SplitTextField(sText, "lines");
			//TweenMax.allFrom(sstf3.textFields, .8, {x:"200", alpha:0, delay:1.5, ease:Cubic.easeInOut}, 0.1);
			//TweenMax.staggerFromTo(sstf3.textFields, 0.2, {alpha:0}, {alpha:1}, 0.1 );
			
			
			
			
			//TweenNano.to(sText,2,{alpha:.5});