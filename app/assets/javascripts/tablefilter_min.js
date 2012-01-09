(function($){$.extend({tablefilter:new function(){this.columnCount=0;this.waitInterval=0;this.currentElement=null;this.currentTable=null;this.currentValues=Array();this.currentColumnNumber=0;this.defaults={inputID:'table_column_',cssClass:'tablefilter',type:'text',debug:false};this.textFilterClicked=function(e)
{this.focus();return false;}
this.textFilterChanged=function(e)
{clearTimeout($.tablefilter.waitInterval);columnNumber=this.id.substring(this.id.lastIndexOf('_')+1);$.tablefilter.currentValues[columnNumber]=this.value.toLowerCase();$.tablefilter.currentTable=$.tablefilter.tableGet(element);setTimeout('$.tablefilter.runfilter()',1000);}
this.selectFilterClicked=function(e)
{e.preventDefault();e.stopPropagation();return false;}
this.selectFilterChanged=function(e)
{element=$(this);columnNumber=this.id.substring(this.id.lastIndexOf('_')+1);$.tablefilter.currentValues[columnNumber]=element.val().toLowerCase();$.tablefilter.currentTable=$.tablefilter.tableGet(element);$.tablefilter.runfilter();}
this.runfilter=function()
{table=$.tablefilter.currentTable
rows=$.tablefilter.tableGetRows(table);for(i=rows.length-1;i>=0;i--)
{row=$(rows[i]);columns=row.children('td');match=true;for(x=$.tablefilter.currentValues.length-1;x>=0;x--)
{if($.tablefilter.currentValues[x]!=''&&$.tablefilter.currentValues[x]!=undefined)
{if($(columns[x]).text().toLowerCase().indexOf($.tablefilter.currentValues[x])==-1)
{match=false;}}}
if(match==false)
{row.hide();}else{row.show();}}}
this.tableGet=function(element)
{return element.parents('table');}
this.tableGetRows=function(table)
{if($.tablefilter.tableHasTbody(table)==true)
{return table.children('tbody').children('tr');}else{rows=table.children('tr');return $.tablefilter.arrayRemove(rows,0);}}
this.tableGetRowValues=function(table,columnNr)
{rows=$.tablefilter.tableGetRows(table);values=Array('');column=$(rows[0]).children('td:eq('+columnNr+')');for(i=rows.length-1;i>=0;i--)
{column=$(rows[i]).children('td:eq('+columnNr+')');if(jQuery.trim(column.text())!=''&&jQuery.inArray(column.text(),values)==-1)
{values[values.length]=column.text();}}
return values.sort();}
this.arrayRemove=function(array,from,to){var rest=array.slice((to||from)+1||array.length);array.length=from<0?array.length+from:from;return array.push.apply(array,rest);}
this.tableHasTbody=function(table)
{if(table.children('tbody').length==0)
{return false;}
return true;}
this.construct=function(settings){return this.each(function(){element=$(this);element.addClass('tablesorter');this.config={};config=$.extend(this.config,$.tablefilter.defaults,settings);switch(config.type)
{case'text':inputText=document.createElement('input');inputText.type=config.type;inputText.className=config.cssClass;inputText.style.width=element.width()+'px';inputText.id=config.inputID+''+$.tablefilter.columnCount;element.append(inputText);$(element).children('input').click($.tablefilter.textFilterClicked);$(element).children('input').keyup($.tablefilter.textFilterChanged);break;case'select':values=$.tablefilter.tableGetRowValues($.tablefilter.tableGet(element),$.tablefilter.columnCount);select=document.createElement('SELECT');for(i=0;i<values.length;i++)
{select.options[select.options.length]=new Option(values[i],values[i]);}
select.className=config.cssClass;select.style.width=element.width()+'px';select.id=config.inputID+''+$.tablefilter.columnCount;$('div.splitRightS').append(select);element.append(select);$(element).children('select').click($.tablefilter.selectFilterClicked);$(element).children('select').change($.tablefilter.selectFilterChanged);break;}
$.tablefilter.columnCount++;});};}});$.fn.extend({tablefilter:$.tablefilter.construct});})(jQuery);