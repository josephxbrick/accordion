# Accordion
A Framer.js module for creating vertical accordion controls, with an option to open only one item at a time or any number of items at a time

<img src="/readme_images/accordion_example.gif" width="200">

## Getting Started
Download accordion.coffee an place it in the `/modules` folder of your project.

In your coffeescript file, include the following.

`{Accordion} = require "accordion"`

## Creating an Accordion
The following creates an empty accordion.
```
single = new Accordion
	width: 400
	spacing: 1
	animationOptions: time: 0.35, curve: Bezier.ease
	singleExpand: true
```
* **spacing**: number of pixels between accordion items
* **animationOptions**: the options for animating items
* **singleExpand**: if true, only one accordion item can be opened at a time; if false, any number of items can be opened at a time
## Functions
### accordion.addItem()
Use the addItem() function to add a layer to an accordion. This can be a frame created in Design mode or a layer created in code. 
```
accordion.addItem(layer, expandedHeight, normalHeight, clickTarget)
```
* **layer**: (required) the layer to be added
* **expandedHeight**: (required) the height of the accordion item when expanded
* **normalheight**: (optional if not specifying `clickTarget`) the height of the accordion item when contracted. Default is the height of the provided layer.
* **clickTarget**: (optional): the layer that when clicked expands or contracts the accordion item. The default click target is the provided layer. The click target must be either the provided layer or a descendant of the provided layer.
### accordion.expandItem()
Use the expandItem() function to open an accordion item.
```
expandItem(layer, isAnimated)
```
* **layer**: the layer to expand
* **isAnimated**: (optional) boolean: whether the accordion item animates when it opens

### accordion.contractItem()
Use the contractItem() function to close an accordion item.
```
contractItem(layer, isAnimated)
```
* **layer**: the layer to contract
* **isAnimated**: (optional) boolean: whether the accordion item animates when it closes; default is true.

## Events
### accordion.on "expand", ->
The expand message is fired when an accordion item expands.
```
accordion.on "expand", (layer, newHeight, oldHeight) ->
```
* **layer** The layer that expanded
* **newHeight** The height that the layer expands to
* **oldHeight** The height the layer expands from

### accordion.on "contract", ->
The contract message is fired when an accordion item contracts.
```
accordion.on "contact", (layer, newHeight, oldHeight) ->
```
* **layer** The layer that contracted
* **newHeight** The height that the layer contracts to
* **oldHeight** The height the layer contracts from
## Sample Code
```
{Accordion} = require "accordion"

accordion = new Accordion
	width: 300
	spacing: 1
	singleSelect: true
	
# create 10 layers with normal heights of 60 and expanded heights of 200
for i in [0...10]
	layer = new Layer
		width: accordion.width
		height: 60
		backgroundColor: Utils.randomColor(0.5)
	Utils.labelLayer layer, "#{i+1}"
	accordion.addItem layer, 200
```
## Sample Framer.js Project
* [accordion.framer](https://framer.cloud/tIdTw)
