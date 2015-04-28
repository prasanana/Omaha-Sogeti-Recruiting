/*********************************************************************************************************
 * Name: FilterCandidates.js
 * Author: Prasanna Shankar
 * Date: 03/30/2015
 * Corresponding JSP: FilterCandidates.jsp
 *********************************************************************************************************/

//called on load of FilterCandidates.jsp
function filterCandidatesLoad(){
 
  var $container = $('#filterCandidatesContainer'),
      $checkboxes = $('#filterCandidatesFilter input');
  
  $container.isotope({
    itemSelector: '.item'
  });
  
  $checkboxes.change(function(){
    var filters = [];
    // get checked checkboxes values
    $checkboxes.filter(':checked').each(function(){
      filters.push( this.value );
    });
    // ['.red', '.blue'] -> '.red, .blue'
    filters = filters.join(', ');
    $container.isotope({ filter: filters });
  });
    
  var $items = $container.children();
  
  //call to accordion function fnAccordion()
  fnAccordion();
}

//used to control accordion within the page
function fnAccordion(){
	$(function() {
	    $( "#filterCandidatesAccordion" ).accordion({
	      collapsible : true,
	      active : false,
	      heightStyle: "content"
	    });
	  });
	  $(function() {
	    $( "#accordion-resizer" ).resizable({
	      minHeight: 90,
	      minWidth: 200,
	      resize: function() {
	        $( "#filterCandidatesAccordion" ).accordion( "refresh" );
	      }
	    });
	  });
}
