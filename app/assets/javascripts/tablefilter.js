
var TblId, SearchFlt, SlcArgs;
TblId = new Array(), SlcArgs = new Array();


function setFilterGrid(id)

{	
	var tbl = grabEBI(id);
	var ref_row, fObj;
	if(tbl != null && tbl.nodeName.toLowerCase() == "table")
	{						
		if(arguments.length>1)
		{
			for(var i=0; i<arguments.length; i++)
			{
				var argtype = typeof arguments[i];
				
				switch(argtype.toLowerCase())
				{
					case "number":
						ref_row = arguments[i];
					break;
					case "object":
						fObj = arguments[i];
					break;
				}
							
			}
		}
		
		ref_row == undefined ? ref_row=2 : ref_row=(ref_row+2);
		var ncells = getCellsNb(id,ref_row);
		tbl.tf_ncells = ncells;
		if(tbl.tf_ref_row==undefined) tbl.tf_ref_row = ref_row;
		tbl.tf_Obj = fObj;
		if( !hasGrid(id) ) AddGrid(id);		
	}
}

function AddGrid(id)

{	
	TblId.push(id);
	var t = grabEBI(id);
	var f = t.tf_Obj, n = t.tf_ncells;	
	var inpclass, fltgrid, displayBtn, btntext, enterkey;
	var modfilter_fn, display_allText, on_slcChange;
	var displaynrows, totrows_text, btnreset, btnreset_text;
	var sort_slc, displayPaging, pagingLength, displayLoader;
	var load_text, exactMatch, alternateBgs, colOperation;
	var rowVisibility, colWidth, bindScript;
	
	f!=undefined && f["grid"]==false ? fltgrid=false : fltgrid=true;
	f!=undefined && f["btn"]==true ? displayBtn=true : displayBtn=false;
	f!=undefined && f["btn_text"]!=undefined ? btntext=f["btn_text"] : btntext="go";
	f!=undefined && f["enter_key"]==false ? enterkey=false : enterkey=true;
	f!=undefined && f["mod_filter_fn"] ? modfilter_fn=true : modfilter_fn=false;
	f!=undefined && f["display_all_text"]!=undefined ? display_allText=f["display_all_text"] : display_allText="";
	f!=undefined && f["on_change"]==false ? on_slcChange=false : on_slcChange=true;
	
	f!=undefined && f["rows_counter"]==true ? displaynrows=true : displaynrows=false;
	f!=undefined && f["rows_counter_text"]!=undefined ? totrows_text=f["rows_counter_text"] : totrows_text="Displayed rows: ";
	f!=undefined && f["btn_reset"]==true ? btnreset=true : btnreset=false;
	f!=undefined && f["btn_reset_text"]!=undefined ? btnreset_text=f["btn_reset_text"] : btnreset_text="Reset";
	f!=undefined && f["sort_select"]==true ? sort_slc=true : sort_slc=false;
	f!=undefined && f["paging"]==true ? displayPaging=true : displayPaging=false;
	f!=undefined && f["paging_length"]!=undefined ? pagingLength=f["paging_length"] : pagingLength=10;
	f!=undefined && f["loader"]==true ? displayLoader=true : displayLoader=false;
	f!=undefined && f["loader_text"]!=undefined ? load_text=f["loader_text"] : load_text="Loading...";
	f!=undefined && f["exact_match"]==true ? exactMatch=true : exactMatch=false;
	f!=undefined && f["alternate_rows"]==true ? alternateBgs=true : alternateBgs=false;
	f!=undefined && f["col_operation"] ? colOperation=true : colOperation=false;
	f!=undefined && f["rows_always_visible"] ? rowVisibility=true : rowVisibility=false;
	f!=undefined && f["col_width"] ? colWidth=true : colWidth=false;
	f!=undefined && f["bind_script"] ? bindScript=true : bindScript=false;
	

	t.tf_fltGrid			=	fltgrid;
	t.tf_displayBtn			= 	displayBtn;
	t.tf_btnText			=	btntext;
	t.tf_enterKey			= 	enterkey;
	t.tf_isModfilter_fn		= 	modfilter_fn;
	t.tf_display_allText 	= 	display_allText;
	t.tf_on_slcChange 		= 	on_slcChange;
	t.tf_rowsCounter 		= 	displaynrows;
	t.tf_rowsCounter_text	= 	totrows_text;
	t.tf_btnReset 			= 	btnreset;
	t.tf_btnReset_text 		= 	btnreset_text;
	t.tf_sortSlc 			=	sort_slc;
	t.tf_displayPaging 		= 	displayPaging;
	t.tf_pagingLength 		= 	pagingLength;
	t.tf_displayLoader		= 	displayLoader;
	t.tf_loadText			= 	load_text;
	t.tf_exactMatch 		= 	exactMatch;
	t.tf_alternateBgs		=	alternateBgs;
	t.tf_startPagingRow		= 	0;
	
	if(modfilter_fn) t.tf_modfilter_fn = f["mod_filter_fn"];

	if(fltgrid)
	{
		var fltrow = t.insertRow(0); 
		fltrow.className = "fltrow";
		for(var i=0; i<n; i++)
		{
			var fltcell = fltrow.insertCell(i);
		
			i==n-1 && displayBtn==true ? inpclass = "flt_s" : inpclass = "flt";
			
			if(f==undefined || f["col_"+i]==undefined || f["col_"+i]=="none") 
			{
				var inptype;
				(f==undefined || f["col_"+i]==undefined) ? inptype="text" : inptype="hidden";
				var inp = createElm( "input",["id","flt"+i+"_"+id],["type",inptype],["class",inpclass] );					
				inp.className = inpclass;
				fltcell.appendChild(inp);
				if(enterkey) inp.onkeypress = DetectKey;
			}
			else if(f["col_"+i]=="select")
			{
				var slc = createElm( "select",["id","flt"+i+"_"+id],["class",inpclass] );
				slc.className = inpclass;
				fltcell.appendChild(slc);
				PopulateOptions(id,i);
				if(displayPaging)
				
				
				{
					var args = new Array();
					args.push(id); args.push(i); args.push(n);
					args.push(display_allText); args.push(sort_slc); args.push(displayPaging);
					SlcArgs.push(args);
				}
				if(enterkey) slc.onkeypress = DetectKey;
				if(on_slcChange) 
				{
					(!modfilter_fn) ? slc.onchange = function(){ Filter(id); } : slc.onchange = f["mod_filter_fn"];
				} 
			}
			
			if(i==n-1 && displayBtn==true)
			{
				var btn = createElm(
										"input",
										["id","btn"+i+"_"+id],["type","button"],
										["value",btntext],["class","btnflt"] 
									);
				btn.className = "btnflt";
				
				fltcell.appendChild(btn);
				(!modfilter_fn) ? btn.onclick = function(){ Filter(id); } : btn.onclick = f["mod_filter_fn"];					
			}
			
		}
	}

	if(displaynrows || btnreset || displayPaging || displayLoader)
	{
	
		var infdiv = createElm( "div",["id","inf_"+id],["class","inf"] );
		infdiv.className = "inf";
		t.parentNode.insertBefore(infdiv, t);
		
		if(displaynrows)
		{
			var totrows;
			var ldiv = createElm( "div",["id","ldiv_"+id] );
			displaynrows ? ldiv.className = "ldiv" : ldiv.style.display = "none";
			displayPaging ? totrows = pagingLength : totrows = getRowsNb(id);
			
			var totrows_span = createElm( "span",["id","totrows_span_"+id],["class","tot"] ); 
			totrows_span.className = "tot";
			totrows_span.appendChild( createText(totrows) );
		
			var totrows_txt = createText(totrows_text);
			ldiv.appendChild(totrows_txt);
			ldiv.appendChild(totrows_span);
			infdiv.appendChild(ldiv);
		}
		
		if(displayLoader)
		{

			var loaddiv = createElm( "div",["id","load_"+id],["class","loader"] );
			loaddiv.className = "loader";
			loaddiv.style.display = "none";
			loaddiv.appendChild( createText(load_text) );	
			infdiv.appendChild(loaddiv);
		}
				
		if(displayPaging)
		{
			
			var mdiv = createElm( "div",["id","mdiv_"+id] );
			displayPaging ? mdiv.className = "mdiv" : mdiv.style.display = "none";						
			infdiv.appendChild(mdiv);
			
			var start_row = t.tf_ref_row;
			var row = grabTag(t,"tr");
			var nrows = row.length;
			var npages = Math.ceil( (nrows - start_row)/pagingLength );
			
			var slcPages = createElm( "select",["id","slcPages_"+id] );
			slcPages.onchange = function(){
				if(displayLoader) showLoader(id,"");
				t.tf_startPagingRow = this.value;
				GroupByPage(id);
				if(displayLoader) showLoader(id,"none");
			}
			
			var pgspan = createElm( "span",["id","pgspan_"+id] );
			grabEBI("mdiv_"+id).appendChild( createText(" Page ") );
			grabEBI("mdiv_"+id).appendChild(slcPages);
			grabEBI("mdiv_"+id).appendChild( createText(" of ") );
			pgspan.appendChild( createText(npages+" ") );
			grabEBI("mdiv_"+id).appendChild(pgspan);	
			
			for(var j=start_row; j<nrows; j++)
			{
				row[j].setAttribute("validRow","true");
			}
			
			setPagingInfo(id);
			if(displayLoader) showLoader(id,"none");
		}
		
		if(btnreset && fltgrid)
		{

			var rdiv = createElm( "div",["id","reset_"+id] );
			btnreset ? rdiv.className = "rdiv" : rdiv.style.display = "none";
			
			var fltreset = createElm( 	"a",
										["href","javascript:clearFilters('"+id+"');Filter('"+id+"');"] );
			fltreset.appendChild(createText(btnreset_text));
			rdiv.appendChild(fltreset);
			infdiv.appendChild(rdiv);
		}
		
	}
	
	if(colWidth)
	{
		t.tf_colWidth = f["col_width"];
		setColWidths(id);
	}
	
	if(alternateBgs && !displayPaging)
		setAlternateRows(id);
	
	if(colOperation)
	{
		t.tf_colOperation = f["col_operation"];
		setColOperation(id);
	}
	
	if(rowVisibility)
	{
		t.tf_rowVisibility = f["rows_always_visible"];
		if(displayPaging) setVisibleRows(id);
	}
	
	if(bindScript)
	{
		t.tf_bindScript = f["bind_script"];
		if(	t.tf_bindScript!=undefined &&
			t.tf_bindScript["target_fn"]!=undefined )
		{
			t.tf_bindScript["target_fn"].call(null,id);
		}
	}
}

function PopulateOptions(id,cellIndex)

{
	var t = grabEBI(id);
	var ncells = t.tf_ncells, opt0txt = t.tf_display_allText;
	var sort_opts = t.tf_sortSlc, paging = t.tf_displayPaging;
	var start_row = t.tf_ref_row;
	var row = grabTag(t,"tr");
	var OptArray = new Array();
	var optIndex = 0; 
	var currOpt = new Option(opt0txt,"",false,false); 
	grabEBI("flt"+cellIndex+"_"+id).options[optIndex] = currOpt;
	
	for(var k=start_row; k<row.length; k++)
	{
		var cell = getChildElms(row[k]).childNodes;
		var nchilds = cell.length;
		var isPaged = row[k].getAttribute("paging");
		
		if(nchilds == ncells){
			
			for(var j=0; j<nchilds; j++)
			{
				if(cellIndex==j)
				{
					var cell_data = getCellText(cell[j]);

					var isMatched = false;
					for(w in OptArray)
					{
						if( cell_data == OptArray[w] ) isMatched = true;
					}
					if(!isMatched) OptArray.push(cell_data);
				}
			}
		}
	}
	
	if(sort_opts) OptArray.sort();
	for(y in OptArray)
	{
		optIndex++;
		var currOpt = new Option(OptArray[y],OptArray[y],false,false);
		grabEBI("flt"+cellIndex+"_"+id).options[optIndex] = currOpt;		
	}
		
}

function Filter(id)

{	
	showLoader(id,"");
	SearchFlt = getFilters(id);
	var t = grabEBI(id);
	t.tf_Obj!=undefined ? fprops = t.tf_Obj : fprops = new Array();
	var SearchArgs = new Array();
	var ncells = getCellsNb(id);
	var totrows = getRowsNb(id), hiddenrows = 0;
	var ematch = t.tf_exactMatch;
	var showPaging = t.tf_displayPaging;
	
	for(var i=0; i<SearchFlt.length; i++)
		SearchArgs.push( (grabEBI(SearchFlt[i]).value).toLowerCase() );
	
	var start_row = t.tf_ref_row;
	var row = grabTag(t,"tr");
	
	for(var k=start_row; k<row.length; k++)
	{

		if(row[k].style.display == "none") row[k].style.display = "";
		
		var cell = getChildElms(row[k]).childNodes;
		var nchilds = cell.length;

		if(nchilds == ncells)
		{
			var cell_value = new Array();
			var occurence = new Array();
			var isRowValid = true;
				
			for(var j=0; j<nchilds; j++)
			{
				var cell_data = getCellText(cell[j]).toLowerCase();
				cell_value.push(cell_data);
				
				if(SearchArgs[j]!="")
				{
					var num_cell_data = parseFloat(cell_data);
					
					if(/<=/.test(SearchArgs[j]) && !isNaN(num_cell_data))
					{
						num_cell_data <= parseFloat(SearchArgs[j].replace(/<=/,"")) ? occurence[j] = true : occurence[j] = false;
					}
					
					else if(/>=/.test(SearchArgs[j]) && !isNaN(num_cell_data))
					{
						num_cell_data >= parseFloat(SearchArgs[j].replace(/>=/,"")) ? occurence[j] = true : occurence[j] = false;
					}
					
					else if(/</.test(SearchArgs[j]) && !isNaN(num_cell_data))
					{
						num_cell_data < parseFloat(SearchArgs[j].replace(/</,"")) ? occurence[j] = true : occurence[j] = false;
					}
										
					else if(/>/.test(SearchArgs[j]) && !isNaN(num_cell_data))
					{
						num_cell_data > parseFloat(SearchArgs[j].replace(/>/,"")) ? occurence[j] = true : occurence[j] = false;
					}					
					
					else 
					{						
	
						var regexp;
						if(ematch || fprops["col_"+j]=="select") regexp = new RegExp('(^)'+regexpEscape(SearchArgs[j])+'($)',"gi");
						else regexp = new RegExp(regexpEscape(SearchArgs[j]),"gi");
						occurence[j] = regexp.test(cell_data);
					}
				}
			}
			
			for(var z=0; z<ncells; z++)
			{
				if(SearchArgs[z]!="" && !occurence[z]) isRowValid = false;
			}
			
		}
		
		if(!isRowValid)
		{ 
			row[k].style.display = "none"; hiddenrows++; 
			if( showPaging ) row[k].setAttribute("validRow","false");
		} else {
			row[k].style.display = ""; 
			if( showPaging ) row[k].setAttribute("validRow","true");
		}
		
	}
	
	t.tf_nRows = parseInt( getRowsNb(id) )-hiddenrows;
	if( !showPaging ) applyFilterProps(id);
	if( showPaging ){ t.tf_startPagingRow=0; setPagingInfo(id); }/
function setPagingInfo(id)

{	
	var t = grabEBI(id);
	var start_row = parseInt( t.tf_ref_row );
	var pagelength = t.tf_pagingLength;
	var row = grabTag(t,"tr");	
	var mdiv = grabEBI("mdiv_"+id);
	var slcPages = grabEBI("slcPages_"+id);
	var pgspan = grabEBI("pgspan_"+id);
	var nrows = 0;
	
	for(var j=start_row; j<row.length; j++)
	{
		if(row[j].getAttribute("validRow") == "true") nrows++;
	}
	
	var npg = Math.ceil( nrows/pagelength );
	pgspan.innerHTML = npg; 
	slcPages.innerHTML = "";
	
	if( npg>0 )
	{
		mdiv.style.visibility = "visible";
		for(var z=0; z<npg; z++)
		{
			var currOpt = new Option((z+1),z*pagelength,false,false);
			slcPages.options[z] = currOpt;
		}
	} else {
		mdiv.style.visibility = "hidden";
	}
	
	GroupByPage(id);
}

function GroupByPage(id)

{
	showLoader(id,"");
	var t = grabEBI(id);
	var start_row = parseInt( t.tf_ref_row );
	var pagelength = parseInt( t.tf_pagingLength );
	var paging_start_row = parseInt( t.tf_startPagingRow );
	var paging_end_row = paging_start_row + pagelength;
	var row = grabTag(t,"tr");
	var nrows = 0;
	var validRows = new Array();
	for(var j=start_row; j<row.length; j++)
	
	{
		var isRowValid = row[j].getAttribute("validRow");
		if(isRowValid=="true") validRows.push(j);
	}

	for(h=0; h<validRows.length; h++)
	
	{
		if( h>=paging_start_row && h<paging_end_row )
		{
			nrows++;
			row[ validRows[h] ].style.display = "";
		} else row[ validRows[h] ].style.display = "none";
	}
	
	t.tf_nRows = parseInt(nrows);
	applyFilterProps(id);
}

function applyFilterProps(id)

{
	t = grabEBI(id);
	var rowsCounter = t.tf_rowsCounter;
	var nRows = t.tf_nRows;
	var rowVisibility = t.tf_rowVisibility;
	var alternateRows = t.tf_alternateBgs;
	var colOperation = t.tf_colOperation;
	
	if( rowsCounter ) showRowsCounter( id,parseInt(nRows) );
	if( rowVisibility ) setVisibleRows(id);
	if( alternateRows ) setAlternateRows(id);
	if( colOperation  ) setColOperation(id);
	showLoader(id,"none");
}

function hasGrid(id)

{
	var r = false, t = grabEBI(id);
	if(t != null && t.nodeName.toLowerCase() == "table")
	{
		for(i in TblId)
		{
			if(id == TblId[i]) r = true;
		}
	}
	return r;
}

function getCellsNb(id,nrow)

{
  	var t = grabEBI(id);
	var tr;
	if(nrow == undefined) tr = grabTag(t,"tr")[0];
	else  tr = grabTag(t,"tr")[nrow];
	var n = getChildElms(tr);
	return n.childNodes.length;
}

function getRowsNb(id)

{
	var t = grabEBI(id);
	var s = t.tf_ref_row;
	var ntrs = grabTag(t,"tr").length;
	return parseInt(ntrs-s);
}

function getFilters(id)

{
	var SearchFltId = new Array();
	var t = grabEBI(id);
	var tr = grabTag(t,"tr")[0];
	var enfants = tr.childNodes;
	if(t.tf_fltGrid)
	{
		for(var i=0; i<enfants.length; i++) 
			SearchFltId.push(enfants[i].firstChild.getAttribute("id"));		
	}
	return SearchFltId;
}

function clearFilters(id)

{
	SearchFlt = getFilters(id);
	for(i in SearchFlt) grabEBI(SearchFlt[i]).value = "";
}

function showLoader(id,p)


{
	var loader = grabEBI("load_"+id);
	if(loader != null && p=="none")
		setTimeout("grabEBI('load_"+id+"').style.display = '"+p+"'",150);
	else if(loader != null && p!="none") loader.style.display = p;
}

function showRowsCounter(id,p)

{
	var totrows = grabEBI("totrows_span_"+id);
	if(totrows != null && totrows.nodeName.toLowerCase() == "span" ) 
		totrows.innerHTML = p;
}

function getChildElms(n)

{
	if(n.nodeType == 1)
	{
		var enfants = n.childNodes;
		for(var i=0; i<enfants.length; i++)
		{
			var child = enfants[i];
			if(child.nodeType == 3) n.removeChild(child);
		}
		return n;	
	}
}

function getCellText(n)

{
	var s = "";
	var enfants = n.childNodes;
	for(var i=0; i<enfants.length; i++)
	{
		var child = enfants[i];
		if(child.nodeType == 3) s+= child.data;
		else s+= getCellText(child);
	}
	return s;
}

function getColValues(id,colindex,num)

{
	var t = grabEBI(id);
	var row = grabTag(t,"tr");
	var nrows = row.length;
	var start_row = parseInt( t.tf_ref_row );
	var ncells = getCellsNb( id,start_row );
	var colValues = new Array();
	
	for(var i=start_row; i<nrows; i++)
	{
		var cell = getChildElms(row[i]).childNodes;
		var nchilds = cell.length;
	
		if(nchilds == ncells)
		{
			for(var j=0; j<nchilds; j++)
			{
				if(j==colindex && row[i].style.display=="" )
				{
					var cell_data = getCellText( cell[j] ).toLowerCase();
					(num) ? colValues.push( parseFloat(cell_data) ) : colValues.push( cell_data );
				}
			}
		}
	}/
	return colValues;	
}

function setColWidths(id)

{
	if( hasGrid(id) )
	{
		var t = grabEBI(id);
		t.style.tableLayout = "fixed";
		var colWidth = t.tf_colWidth;
		var start_row = parseInt( t.tf_ref_row );
		var row = grabTag(t,"tr")[0];
		var ncells = getCellsNb(id,start_row);
		for(var i=0; i<colWidth.length; i++)
		{
			for(var k=0; k<ncells; k++)
			{
				cell = row.childNodes[k];
				if(k==i) cell.style.width = colWidth[i];
			}
		}
	}
}

function setVisibleRows(id)

{
	if( hasGrid(id) )
	{
		var t = grabEBI(id);		
		var row = grabTag(t,"tr");
		var nrows = row.length;
		var showPaging = t.tf_displayPaging;
		var visibleRows = t.tf_rowVisibility;
		for(var i=0; i<visibleRows.length; i++)
		{
			if(visibleRows[i]<=nrows)
			{
				if(showPaging)
					row[ visibleRows[i] ].setAttribute("validRow","true");
				row[ visibleRows[i] ].style.display = "";
			}
		}
	}

function setAlternateRows(id)

{
	if( hasGrid(id) )
	{
		var t = grabEBI(id);		
		var row = grabTag(t,"tr");
		var nrows = row.length;
		var start_row = parseInt( t.tf_ref_row );
		var visiblerows = new Array();
		for(var i=start_row; i<nrows; i++)
			if( row[i].style.display=="" ) visiblerows.push(i);
		
		for(var j=0; j<visiblerows.length; j++)
			(j % 2 == 0) ? row[ visiblerows[j] ].className = "even" : row[ visiblerows[j] ].className = "odd";
		
	}
}

function setColOperation(id)

{
	if( hasGrid(id) )
	{
		var t = grabEBI(id);
		var labelId = t.tf_colOperation["id"];
		var colIndex = t.tf_colOperation["col"];
		var operation = t.tf_colOperation["operation"];
		var outputType =  t.tf_colOperation["write_method"];
		var precision = 2;
		
		if( (typeof labelId).toLowerCase()=="object" 
			&& (typeof colIndex).toLowerCase()=="object" 
			&& (typeof operation).toLowerCase()=="object" )
		{
			var row = grabTag(t,"tr");
			var nrows = row.length;
			var start_row = parseInt( t.tf_ref_row );
			var ncells = getCellsNb( id,start_row );
			var colvalues = new Array();
						
			for(var k=0; k<colIndex.length; k++)
			{
				colvalues.push( getColValues(id,colIndex[k],true) );			
			}
			
			for(var i=0; i<colvalues.length; i++)
			{
				var result=0, nbvalues=0;
				for(var j=0; j<colvalues[i].length; j++ )
				{
					var cvalue = colvalues[i][j];
					if( !isNaN(cvalue) )
					{
						switch( operation[i].toLowerCase() )
						{
							case "sum":
								result += parseFloat( cvalue );
							break;
							case "mean":
								nbvalues++;
								result += parseFloat( cvalue );
							break;
		
						}
					}
				}
				
				switch( operation[i].toLowerCase() )
				{
					case "mean":
						result = result/nbvalues;
					break;
				}
				
				if(outputType != undefined && (typeof outputType).toLowerCase()=="object")

				{
					result = result.toFixed( precision );
					if( grabEBI( labelId[i] )!=undefined )
					{
						switch( outputType[i].toLowerCase() )
						{
							case "innerhtml":
								grabEBI( labelId[i] ).innerHTML = result;
							break;
							case "setvalue":
								grabEBI( labelId[i] ).value = result;
							break;
							case "createtextnode":
								var oldnode = grabEBI( labelId[i] ).firstChild;
								var txtnode = createText( result );
								grabEBI( labelId[i] ).replaceChild( txtnode,oldnode );
							break;

						}
					}
				} else {
					try
					{
						grabEBI( labelId[i] ).innerHTML = result.toFixed( precision );
					} catch(e){ }
				}
				
			}

		}
	}
}

function grabEBI(id)

{
	return document.getElementById( id );
}

function grabTag(obj,tagname)

{
	return obj.getElementsByTagName( tagname );
}

function regexpEscape(s)

{


	function escape(e)
	{
		a = new RegExp('\\'+e,'g');
		s = s.replace(a,'\\'+e);
	}

	chars = new Array('\\','[','^','$','.','|','?','*','+','(',')');

	for(e in chars) escape(chars[e]);
	return s;
}

function createElm(elm)

{
	var el = document.createElement( elm );		
	if(arguments.length>1)
	{
		for(var i=0; i<arguments.length; i++)
		{
			var argtype = typeof arguments[i];
			switch( argtype.toLowerCase() )
			{
				case "object":
					if( arguments[i].length==2 )
					{							
						el.setAttribute( arguments[i][0],arguments[i][1] );
					}
				break;
			}
		}
	}
	return el;	
}

function createText(node)

{
	return document.createTextNode( node );
}

function DetectKey(e)

{
	var evt=(e)?e:(window.event)?window.event:null;
	if(evt)
	{
		var key=(evt.charCode)?evt.charCode:
			((evt.keyCode)?evt.keyCode:((evt.which)?evt.which:0));
		if(key=="13")
		{
			var cid, leftstr, tblid, CallFn, Match;		
			cid = this.getAttribute("id");
			leftstr = this.getAttribute("id").split("_")[0];
			tblid = cid.substring(leftstr.length+1,cid.length);
			t = grabEBI(tblid);
			(t.tf_isModfilter_fn) ? t.tf_modfilter_fn.call() : Filter(tblid);
		}
	}
}

function importScript(scriptName,scriptPath)
{
	var isImported = false; 
	var scripts = grabTag(document,"script");

	for (var i=0; i<scripts.length; i++)
	{
		if(scripts[i].src.match(scriptPath))
		{ 
			isImported = true;	
			break;
		}
	}

	if( !isImported )
	{
		var head = grabTag(document,"head")[0];
		var extScript = createElm(	"script",
									["id",scriptName],
									["type","text/javascript"],
									["src",scriptPath]	);
		head.appendChild(extScript);
	}
}



function TF_GetFilterIds()

{
	try{ return TblId }
	catch(e){ alert('TF_GetFilterIds() fn: could not retrieve any ids'); }
}

function TF_HasGrid(id)

{
	return hasGrid(id);
}

function TF_GetFilters(id)

{
	try
	{
		var flts = getFilters(id);
		return flts;
	} catch(e) {
		alert('TF_GetFilters() fn: table id not found');
	}
	
}

function TF_GetStartRow(id)

{
	try
	{
		var t = grabEBI(id);
		return t.tf_ref_row;
	} catch(e) {
		alert('TF_GetStartRow() fn: table id not found');
	}
}

function TF_GetColValues(id,colindex,num)

{
	if( hasGrid(id) )
	{
		return getColValues(id,colindex,num);
	}
	else alert('TF_GetColValues() fn: table id not found');
}

function TF_Filter(id)

{
	var t = grabEBI(id);
	if( TF_HasGrid(id) ) Filter(id);
	else alert('TF_Filter() fn: table id not found');
}

function TF_RemoveFilterGrid(id)

{
	if( TF_HasGrid(id) )
	{
		var t = grabEBI(id);
		clearFilters(id);
				
		if(grabEBI("inf_"+id)!=null)
		{
			t.parentNode.removeChild(t.previousSibling);
		}

		var row = grabTag(t,"tr");
		
		for(var j=0; j<row.length; j++)

		{			
			row[j].style.display = "";
			try
			{ 
				if( row[j].hasAttribute("validRow") ) 
					row[j].removeAttribute("validRow");
			}
			catch(e){
				for( var x = 0; x < row[j].attributes.length; x++ ) 
				{
					if( row[j].attributes[x].nodeName.toLowerCase()=="validrow" ) 
						row[j].removeAttribute("validRow");
				}
			}
		}	
		
		if( t.tf_alternateBgs )
		{
			for(var k=0; k<row.length; k++)

			{
				row[k].className = "";
			}
		}
		
		if(t.tf_fltGrid) t.deleteRow(0);
		for(i in TblId)
			if(id == TblId[i]) TblId.splice(i,1);
		
	}
	else alert('TF_RemoveFilterGrid() fn: table id not found');
}

function TF_ClearFilters(id)

{
	if( TF_HasGrid(id) ) clearFilters(id);
	else alert('TF_ClearFilters() fn: table id not found');
}

function TF_SetFilterValue(id,index,searcharg)

{
	if( TF_HasGrid(id) )
	{
		var flts = getFilters(id);
		for(i in flts)
		{
			if( i==index ) grabEBI(flts[i]).value = searcharg;
		}
	} else {
		alert('TF_SetFilterValue() fn: table id not found');
	}
}



var colValues = new Array();

function setAutoComplete(id)
{
	var t = grabEBI(id);
	var bindScript = t.tf_bindScript;
	var scriptName = bindScript["name"];
	var scriptPath = bindScript["path"];
	initAutoComplete();
	
	function initAutoComplete()
	{
		var filters = TF_GetFilters(id);
		for(var i=0; i<filters.length; i++)
		{
			if( grabEBI(filters[i]).nodeName.toLowerCase()=="input")
			{
				colValues.push( getColValues(id,i) );	
			} else colValues.push( '' );
		}

		try{ actb( grabEBI(filters[0]), colValues[0] ); }
		catch(e){ alert(scriptPath + " script may not be loaded"); }

	}
}