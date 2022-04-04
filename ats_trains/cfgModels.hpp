class Default
{
	sectionsInherit = "";
	sections[] = {"damage"};
	skeletonName = "";
	
	htMin = 60;		// Minimum half-cooling time (in seconds)
	htMax = 180;	// Maximum half-cooling time (in seconds)
	afMax = 100;	// Maximum temperature in case the model is alive (in celsius)
	mfMax = 8;		// Maximum temperature when the model is moving (in celsius)
	mFact = 1;		// Metabolism factor - number from interval <0, 1> (0 - metabolism has no influence, 1 - metabolism has full influence (no other temperature source will be considered)).
	tBody = 150;	// Metabolism temperature of the model (in celsius)
	
	class Animations
	{
		//destruct START
		class damageHide
		{
			type="hide";
			source="damage";
			selection="damageHide";
			hideValue=1.0;
		};
		//destruct END
	};
};
