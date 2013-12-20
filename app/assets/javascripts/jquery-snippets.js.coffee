$.fn.nextOrFirst = (selector) ->
  next = this.next selector
  if next.length then next else this.prevAll(selector).last()

$.fn.prevOrLast = (selector) ->
  prev = this.prev(selector);
  if prev.length then prev else this.nextAll(selector).last();
