# Accordion
A Coffeescript module for creating vertical accordion controls, with an option to open only one item at a time or any number of items at a time

## Getting Started
Download accordion.coffee an place it in the `/modules` folder.

In your coffeescript file, include the following.

`{Accordion} = require "accordion"`

### Creating an Accordion
The following creates an empty accordion.
```
single = new Accordion
	width: 400
	spacing: 1 # number of pixels between accordion rows
	animationOptions: time: 0.35, curve: Bezier.ease # animation options
	singleExpand: true # true if only one item opens at a time
```
  
