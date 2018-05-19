Clip_41 = new VideoLayer
	width: 1600
	height: 1080 * (1600 / 1920)
	video: "images/Clip_41.mov"
	x: -18

Clip_41.parent = TV
Clip_41.sendToBack()
funFact.width = 0
funFact.height = 0
funFact.x = 32 + (524 / 2)
funFact.y = 32 + (236 / 2)

peopleBreadCrumbs.scale = 0

Bird_Master = new Layer
	parent: TV
	width: 180
	height: 240
	x: 1113
	y: 502
	backgroundColor: null 
	scale: 0.6
	opacity: 0
		
Bird = new Layer
	width: 180
	height: 240
	image: "images/Bitmap.png"
	parent: Bird_Master

Wing_Master = new Layer
	width: 128 * 2
	height: 109 * 2
	backgroundColor: null 
	parent: Bird_Master
	x: 239 - 128 - 194
	y: 215 - 109 - 129
	
Wing = new Layer
	parent: Wing_Master
	width: 128
	height: 109
	image: "images/Bitmap2.png"
	x: 128
	y: 109

bird2_master = new Layer
	y: 467
	x: 32
	height: 227
	width: 198
	backgroundColor: null
	
bird2 = new Layer
	parent: bird2_master
	width: 179
	height: 201
	image: "images/bird2.png"
	y: 0
	x: 115 - 96

Wing_Master2 = new Layer
	width: 144
	height: 310
	backgroundColor: null 
	parent: bird2_master
	x: -72
	y: 227 - 310
	
wing2 = new Layer
	parent: Wing_Master2
	width: 72
	height: 155
	image: "images/wing2.png"
	x: 72
	y: 155

bird2_master.opacity = 0
	
flapping_up = new Animation Wing_Master,
	rotationZ: -20
	options:
		time: 0.6 
flapping_down = new Animation Wing_Master,
	properties:
		rotationZ: 0
	options:
		time: 0.4

flapping_up2 = new Animation Wing_Master2,
	rotationZ: 7
	options:
		time: 0.3 
flapping_down2 = new Animation Wing_Master2,
	properties:
		rotationZ: 0
	options:
		time: 1.2
	

Utils.delay 5, ->
	funFact.animate
		properties:
			width: 524
			x: 32
		time: 0.3
		curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
	Utils.delay 0.1, ->
		funFact.animate
			properties:
				height: 236
				y: 32
			time: 0.3
			curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
		peopleBreadCrumbs.animate
			properties:
				scale: 1
			time: 0.3
			curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
Utils.delay 10, ->
	Bird_Master.animate
		properties:
			opacity: 1
		time: 0.3
		curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
	bird2_master.animate
		properties:
			opacity: 1
		time: 0.3
		curve: "cubic-bezier(0.4, 0.0, 0.2, 1)"
	Utils.delay 0.5, ->
		flapping_up.start()
		flapping_up.onAnimationEnd ->
			flapping_down.start()
		flapping_down.onAnimationEnd ->
			flapping_up.start()
		flapping_up2.start()
		flapping_up2.onAnimationEnd ->
			flapping_down2.start()
		flapping_down2.onAnimationEnd ->
			flapping_up2.start()	

Clip_41.player.play()


