function Display(size, offset, openInNewWindow) {
	var display = this;
	
	if(offset) {
		this.offset = offset;
	} else {
		this.offset = new Vector2(0, 0);
	}
	
	this.tileSize = new Vector2(10, 16);
	this.nodes = [];
	this.size = size;
    this.pixelSize = new Vector2(this.size.x*this.tileSize.x + this.offset.x + 10, 
        this.size.y * this.tileSize.y + this.offset.y + 17);
	
    if(openInNewWindow) {
        var paramsString = "width=" + (this.size.x*this.tileSize.x + this.offset.x + 10)
            + ", height=" + (this.size.y * this.tileSize.y + this.offset.y + 17);
        this.window = window.open("", "", paramsString);
    } else {
        this.window = window;
    }
	
	this.init = function(size) {
		// style popup window nicely
		$("body", this.window.document).css({
			"background-color": "black",
			"font-family": "Courier"
		});
		
		$("head", this.window.document).html("<title>Saege</title>");
		
		var $message = $('<div id="message_bar">', this.window.document).css({
			"color": "white",
			"margin-left": "3px"
		});
		
		$("body", this.window.document).html($message);
		this.$message = $("#message_bar", this.window.document);
		
		// create HTML element for the display
		var $display = $('<div id="display">', this.window.document);
		this.$display = $display;
		
		// populate it with <span> elements
		for(var x = 0; x<size.x; x++) {
			this.nodes[x] = [];
			
			for(var y = 0; y<size.y; y++) {
				var $span = $('<span class="tile" id="' + "t_" + x + "_" + y + '">', this.window.document);
				$span.css({
					position: "absolute",
					width: display.tileSize.x,
					height: display.tileSize.y,
					left: display.tileSize.x * x + display.offset.x,
					top: display.tileSize.y * y + display.offset.y
				});
				$span.text(" ");
				$display.append($span);
				
				this.nodes[x][y] = $span[0];
			}
		}

		$("body", this.window.document).append($display);
	}
	
	this.ch = function(character, position, color, opacity, backgroundColor) {
		var tile = this.nodes[position.x][position.y]
		
		if(character) {	
			tile.innerHTML = character;
		}
		
		if(color) {
			tile.style.color = color;
		}
		
		if(opacity) {
			tile.style.opacity = opacity;
		}
		
		if(backgroundColor) {
			tile.style.backgroundColor = backgroundColor;
		}
	}

	this.init(this.size);
}
