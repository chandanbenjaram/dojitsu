/**
* hoverIntent is similar to jQuery's built-in "hover" function except that
* instead of firing the onMouseOver event immediately, hoverIntent checks
* to see if the user's mouse has slowed down (beneath the sensitivity
* threshold) before firing the onMouseOver event.
* 
* hoverIntent r5 // 2007.03.27 // jQuery 1.1.2
* <http://cherne.net/brian/resources/jquery.hoverIntent.html>
* 
* hoverIntent is currently available for use in all personal or commercial 
* projects under both MIT and GPL licenses. This means that you can choose 
* the license that best suits your project, and use it accordingly.
* 
* // basic usage (just like .hover) receives onMouseOver and onMouseOut functions
* $("ul li").hoverIntent( showNav , hideNav );
* 
* // advanced usage receives configuration object only
* $("ul li").hoverIntent({
*	sensitivity: 2, // number = sensitivity threshold (must be 1 or higher)
*	interval: 50,   // number = milliseconds of polling interval
*	over: showNav,  // function = onMouseOver callback (required)
*	timeout: 100,   // number = milliseconds delay before onMouseOut function call
*	out: hideNav    // function = onMouseOut callback (required)
* });
* 
* @param  f  onMouseOver function || An object with configuration options
* @param  g  onMouseOut function  || Nothing (use configuration options object)
* @return    The object (aka "this") that called hoverIntent, and the event object
* @author    Brian Cherne <brian@cherne.net>
* 
* modified by Karl Swedberg. Namespaced events in order to work better with clueTip plugin
*/
(function(a){a.fn.hoverIntent=function(b,c){var d={sensitivity:7,interval:100,timeout:0};d=a.extend(d,c?{over:b,out:c}:b);var e,f,g,h,i=function(a){e=a.pageX,f=a.pageY},j=function(b,c){c.hoverIntent_t=clearTimeout(c.hoverIntent_t);if(Math.abs(g-e)+Math.abs(h-f)<d.sensitivity)return a(c).unbind("mousemove",i),c.hoverIntent_s=1,d.over.apply(c,[b]);g=e,h=f,c.hoverIntent_t=setTimeout(function(){j(b,c)},d.interval)},k=function(a,b){return b.hoverIntent_t=clearTimeout(b.hoverIntent_t),b.hoverIntent_s=0,d.out.apply(b,[a])},l=function(b){var c=(b.type=="mouseover"?b.fromElement:b.toElement)||b.relatedTarget;while(c&&c!=this)try{c=c.parentNode}catch(b){c=this}if(c==this)return!1;var e=jQuery.extend({},b),f=this;f.hoverIntent_t&&(f.hoverIntent_t=clearTimeout(f.hoverIntent_t)),b.type=="mouseover"?(g=e.pageX,h=e.pageY,a(f).bind("mousemove.cluetip",i),f.hoverIntent_s!=1&&(f.hoverIntent_t=setTimeout(function(){j(e,f)},d.interval))):(a(f).unbind("mousemove.cluetip",i),f.hoverIntent_s==1&&(f.hoverIntent_t=setTimeout(function(){k(e,f)},d.timeout)))};return this.bind("mouseover.cluetip",l).bind("mouseout.cluetip",l)}})(jQuery)