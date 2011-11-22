/*
 * jQuery UI Progressbar 1.7
 *
 * Copyright (c) 2009 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Progressbar
 *
 * Depends:
 *   ui.core.js
 */
(function(a){a.widget("ui.progressbar",{_init:function(){this.element.addClass("ui-progressbar ui-widget ui-widget-content ui-corner-all").attr({role:"progressbar","aria-valuemin":this._valueMin(),"aria-valuemax":this._valueMax(),"aria-valuenow":this._value()}),this.valueDiv=a('<div class="ui-progressbar-value ui-widget-header ui-corner-left"></div>').appendTo(this.element),this._refreshValue()},destroy:function(){this.element.removeClass("ui-progressbar ui-widget ui-widget-content ui-corner-all").removeAttr("role").removeAttr("aria-valuemin").removeAttr("aria-valuemax").removeAttr("aria-valuenow").removeData("progressbar").unbind(".progressbar"),this.valueDiv.remove(),a.widget.prototype.destroy.apply(this,arguments)},value:function(a){return arguments.length&&this._setData("value",a),this._value()},_setData:function(b,c){switch(b){case"value":this.options.value=c,this._refreshValue(),this._trigger("change",null,{})}a.widget.prototype._setData.apply(this,arguments)},_value:function(){var a=this.options.value;return a<this._valueMin()&&(a=this._valueMin()),a>this._valueMax()&&(a=this._valueMax()),a},_valueMin:function(){var a=0;return a},_valueMax:function(){var a=100;return a},_refreshValue:function(){var a=this.value();this.valueDiv[a==this._valueMax()?"addClass":"removeClass"]("ui-corner-right"),this.valueDiv.width(a+"%"),this.element.attr("aria-valuenow",a)}}),a.extend(a.ui.progressbar,{version:"1.7",defaults:{value:0}})})(jQuery)