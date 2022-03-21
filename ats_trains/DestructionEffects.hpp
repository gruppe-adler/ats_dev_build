class DestructionEffects
{
	class Light1
	{
		simulation = "light";
		type = "ObjectDestructionLight";
		position = "destructionEffect1";
		intensity = 0.001;
		interval = 1;
		lifeTime = 3;
		enabled = "distToWater";
	};
	class Sound
	{
		simulation = "sound";
		position = "destructionEffect1";
		intensity = 1;
		interval = 1;
		lifeTime = 1;
		type = "Fire";
	};
	class Fire1
	{
		simulation = "particles";
		type = "ObjectDestructionFire1Small";
		position = "destructionEffect1";
		intensity = 0.15;
		interval = 1;
		lifeTime = 3;
	};
	class Refract1
	{
		simulation = "particles";
		type = "ObjectDestructionRefractSmall";
		position = "destructionEffect1";
		intensity = 0.15;
		interval = 1;
		lifeTime = 3;
	};
	class Smoke1
	{
		simulation = "particles";
		type = "ObjectDestructionSmokeSmall";
		position = "destructionEffect1";
		intensity = 0.15;
		interval = 1;
		lifeTime = 3.5;
	};
	class Sparks1
	{
		simulation = "particles";
		type = "ObjectDestructionSparks";
		position = "destructionEffect1";
		intensity = 0;
		interval = 1;
		lifeTime = 0;
	};
	class FireSparks1
	{
		simulation = "particles";
		type = "FireSparks";
		position = "destructionEffect2";
		intensity = 1;
		interval = 1;
		lifeTime = 2.8;
	};
	class Fire2
	{
		simulation = "particles";
		type = "ObjectDestructionFire2Small";
		position = "destructionEffect2";
		intensity = 0.15;
		interval = 1;
		lifeTime = 3;
	};
	class Smoke1_2
	{
		simulation = "particles";
		type = "ObjectDestructionSmoke1_2Small";
		position = "destructionEffect2";
		intensity = 0.15;
		interval = 1;
		lifeTime = 3.5;
	};
	class Smoke2
	{
		simulation = "particles";
		type = "ObjectDestructionSmoke2";
		position = "destructionEffect2";
		intensity = 1;
		interval = 1;
		lifeTime = 3.2;
	};
};