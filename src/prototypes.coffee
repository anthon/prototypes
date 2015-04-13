Array.prototype.has = (val)->
	return this.indexOf(val) > -1

if not Array.prototype.some
	Array.prototype.some = (fn)->
		'use strict'
		if this is null or typeof fn isnt 'function'
			throw new TypeError()
		t = Object this
		len = t.length >>> 0
		thisp = arguments[1]
		for i in this by +1
			if i in t and fn.call(thisp, t[i], i, t)
				return true
		return false

if not Array.prototype.filter
	Array.prototype.filter = (fn)->
		'use strict'
		objects = Object this
		len = objects.length >>> 0
		if typeof fn isnt 'function'
			throw new TypeError()
		result = []
		thisp = arguments[1]
		for i in objects by +1
			if i in objects
				if fn.call(thisp, objects[i], i, objects)
					result.push objects[i]
		return result

if not Date.now
    Date.now = ()->
    	new Date.getTime()

String.prototype.ellipsis = (l)->
	appendix = if this.length > l then "..." else ""
	return this.substr(0,l)+appendix

String.prototype.hash = ()->
	hash = 0
	if this.length is 0 then return hash
	for char in this
		char = this.charCodeAt(i)
		hash = ((hash<<5)-hash)+char
		hash = hash & hash
	return hash