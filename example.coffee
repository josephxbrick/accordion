# create empty accordion
accordion = new Accordion
	width: Screen.width - 20
	x: Align.center
	y: 10
	singleExpand: true
	
# Add 5 items to the accordion. Each item will have button inside to use as the expand/contract button
for i in [0...5]
	layer = new Layer
		name: "layer_#{i}"
		width: accordion.width
		height: 50
		backgroundColor: Utils.randomColor()
	expandButton = new Layer
		parent: layer
		size: 30
		x: 10
		backgroundColor: "#222222"
		blending: Blending.overlay
		y: Align.center
	### 
	add layer to accordion, specifying 200 for expandedHeight, 50 for contracted height, and expandButton as the click target
	###	
	accordion.addItem layer, 200, 50, expandButton
	
accordion.onExpand (layer, newHeight, oldHeight) ->
	print "#{layer.name} expanded; new height:#{newHeight}; old height:#{oldHeight}" 
	
accordion.onContract (layer, newHeight, oldHeight) ->
	print "#{layer.name} contracted; new height:#{newHeight}; old height:#{oldHeight}" 
