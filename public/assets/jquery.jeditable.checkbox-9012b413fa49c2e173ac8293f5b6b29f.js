/**********************************************************************
 *	Custom input types for the jquery.jeditable plugin
 * By Richard Davies <Richard__at__richarddavies.us>, 2009
 * By Peter Savichev (proton) <psavichev@gmail.com>, 2011
 *********************************************************************/
// Create a custom input type for checkboxes
$.editable.addInputType("checkbox",{element:function(a,b){var c=$('<input type="checkbox">');return $(this).append(c),$(c).change(function(){var a=$(c).attr("checked")?1:0;$(c).val(a)}),c},content:function(a,b,c){var d=a=="true"?1:0,e=$(":input:first",this);d?$(e).attr("checked","checked"):$(e).removeAttr("checked"),$(e).val(d)}})