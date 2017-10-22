function showNewBranchForm(){
	$("div#new-division-form").hide();
	$("div#created-divisions-div").hide();
	$("div#created-branches-div").hide();
	$("div#new-branch-form").fadeToggle('slow'); 

}

function showNewDivisionForm(){
	$("div#new-branch-form").hide();
	$("div#new-division-form").fadeToggle('slow');
	$("div#created-divisions-div").hide();
	$("div#created-branches-div").hide();	
}

