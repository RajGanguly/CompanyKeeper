function showNewBranchForm(){
	$("div#new-division-form").hide();
	$("div#created-divisions-div").hide();
	$("div#created-branches-div").hide();
	$("div#new-branch-form").fadeToggle('slow'); 
	$("div#new-company-contact-form").hide();

}

function showNewDivisionForm(){
	$("div#new-branch-form").hide();
	$("div#new-division-form").fadeToggle('slow');
	$("div#created-divisions-div").hide();
	$("div#created-branches-div").hide();
	$("div#new-company-contact-form").hide();	
}

function showNewContactForm(){
	$("div#created-divisions-div").hide();
	$("div#created-branches-div").hide();	
	$("div#new-division-form").hide();
	$("div#new-branch-form").hide();
	$("div#new-company-contact-form").fadeToggle('slow');	
}

function branchChanged(element){
	$("input#selected_branch_id").val($(element).val())
}


function divisionChanged(element){
	$("input#selected_division_id").val($(element).val())
}

function beforeContactCreate(){

}

function showAllContacts(){
	$.ajax({
		url: 'getAllContacts',
		type: 'GET',
		data: {'company_id': '<% @company.id %>'},
		success: function(data){
          $("ul#allListItems").html("").html(data);
		}
	})

	
}


function showAllBranches(){
	$.ajax({
		url: 'getAllBranches',
		type: 'GET',
		data: {'company_id': '<% @company.id %>'},
		success: function(data){
          $("ul#allListItems").html("").html(data);
		}
	})

	
}




function showAllDivisions(){
	$.ajax({
		url: 'getAllDivisions',
		type: 'GET',
		data: {'company_id': '<% @company.id %>'},
		success: function(data){
          $("ul#allListItems").html("").html(data);
		}
	})

	
}






