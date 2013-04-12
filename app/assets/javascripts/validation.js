$(document).on('submit', '#searchForm', function(){
 var x=document.forms["searchForm"]["search[keywords]"].value;
	if (x==null || x=="") {
		return false;
	}
});