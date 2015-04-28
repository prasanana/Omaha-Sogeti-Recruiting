/*********************************************************************************************************
 * Name: UpdateCandidateDetail.js
 * Author: Prasanna Shankar
 * Date: 03/30/2015
 * Corresponding JSP: UpdateCandidateDetail.jsp
 *********************************************************************************************************/

//Called onload of UpdateCandidateDetail.jsp
function UpdateCandidateOnLoad(){
	autoCompleteSkills();
	
}
//Auto complete updateCandidateSKill text box with values in hiddenSkills hidden field
function autoCompleteSkills(){
	
	$(function() {
		var tags = document.getElementById("hiddenSkills").value;
		//tags.substring(0, tags.length - 1
		var availableTags = tags.split(",");
		//alert(document.getElementById("hiddenSkills").value);
	    function split( val ) {
	      return val.split( /,\s*/ );
	    }
	    function extractLast( term ) {
	      return split( term ).pop();
	    }
	 
	    $( "#updateCandidateSKill" )
	      // don't navigate away from the field on tab when selecting an item
	      .bind( "keydown", function( event ) {
	        if ( event.keyCode === $.ui.keyCode.TAB &&
	            $( this ).autocomplete( "instance" ).menu.active ) {
	          event.preventDefault();
	        }
	      })
	      .autocomplete({
	        minLength: 0,
	        source: function( request, response ) {
	          // delegate back to autocomplete, but extract the last term
	          response( $.ui.autocomplete.filter(
	            availableTags, extractLast( request.term ) ) );
	        },
	        focus: function() {
	          // prevent value inserted on focus
	          return false;
	        },
	        select: function( event, ui ) {
	          var terms = split( this.value );
	          // remove the current input
	          terms.pop();
	          // add the selected item
	          terms.push( ui.item.value );
	          // add placeholder to get the comma-and-space at the end
	          terms.push( "" );
	          this.value = terms.join( ", " );
	          return false;
	        }
	      });
	  });
	
}