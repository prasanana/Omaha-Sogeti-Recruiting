/*********************************************************************************************************
 * Name: CandidateByStage.js
 * Author: Prasanna Shankar
 * Date: 03/30/2015
 * Corresponding JSP: CandidateByStage.jsp
 *********************************************************************************************************/

//Called on load of CandidateByStage.jsp. Used to control the accordion within the page
function candidateByStageOnLoad(){

	$(function() {
	    $( "#candidateByStageAccordion" ).accordion({
	      heightStyle: "fill"
	    });
	  });
	  $(function() {
	    $( "#accordion-resizer" ).resizable({
	      minHeight: 140,
	      minWidth: 200,
	      resize: function() {
	        $( "#candidateByStageAccordion" ).accordion( "refresh" );
	      }
	    });
	  });
}
