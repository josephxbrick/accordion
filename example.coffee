
# create empty accordion
accordion = new Accordion
	width: Screen.width - 20
	x: Align.center
	y: 10
	singleExpand: true
	
# Add 5 items to the accordion. Each item will have button inside to use as the click target.
# (By default, the whole item is the click target)
for i in [0...5]
	layer = new Layer
		width: accordion.width
		height: 50
		backgroundColor: Utils.randomColor()
	button = new Layer
		parent: layer
		size: 30
		x: 10
		backgroundColor: "#222222"
		blending: Blending.overlay
		y: Align.center
	# add each layer to accordion.
	# accordion.addItem layerToAdd, expandedHeight, normalHeight, clickTarget
	accordion.addItem layer, 200, 50, button
