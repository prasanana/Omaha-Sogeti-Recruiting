/*********************************************************************************************************
 * Name: SendEmail.js
 * Author: Prasanna Shankar
 * Date: 03/30/2015
 * Corresponding JSP: SendEmail.jsp
 *********************************************************************************************************/

//Called on load of SendEmail.jsp
function fnOnload(){
	sortRows();
	searchRows();
}

//collects the subject, mail body and recipients and sends all the information to outlook.
//outlook opens with new email window with all recipients in bcc
function fnSendEmail(){
	var subject = document.getElementById("subject").value;
	var body = encodeURIComponent(document.getElementById("emailBody").value);
	var bcc = $("input[name=candidateEmail]:checked").map(function () {return this.value;}).get().join(";");
	location.href = "mailto:?bcc="+bcc+"&subject="+subject+"&body="+body;
}

//sort rows alphabetically based on <th> tag
function sortRows(){
	//grab all header rows
	$('thead th').each(function(column) {
	  $(this).addClass('sortable').click(function(){
	    var findSortKey = function($cell) {
	      return $cell.find('.sort-key').text().toUpperCase() + ' ' + $cell.text().toUpperCase();
	    };
	    var sortDirection = $(this).is('.sorted-asc') ? -1 : 1;
	 
	    //step back up the tree and get the rows with data
	    //for sorting
	    var $rows = $(this).parent().parent().parent().find('tbody tr').get();
	 
	    //loop through all the rows and find 
	    $.each($rows, function(index, row) {
	      row.sortKey = findSortKey($(row).children('td').eq(column));
	    });
	 
	    //compare and sort the rows alphabetically
	    $rows.sort(function(a, b) {
	        if (a.sortKey < b.sortKey) return -sortDirection;
	        if (a.sortKey > b.sortKey) return sortDirection;
	        return 0;
	    });
	 
	    //add the rows in the correct order to the bottom of the table
	    $.each($rows, function(index, row) {
	        $('tbody').append(row);
	        row.sortKey = null;
	    });
	 
	    //identify the column sort order
	    $('th').removeClass('sorted-asc sorted-desc');
	    var $sortHead = $('th').filter(':nth-child(' + (column + 1) + ')');
	    sortDirection == 1 ? $sortHead.addClass('sorted-asc') : $sortHead.addClass('sorted-desc');
	 
	    //identify the column to be sorted by
	    $('td').removeClass('sorted')
	                .filter(':nth-child(' + (column + 1) + ')')
	                .addClass('sorted');
	 
	    $('.visible td').removeClass('odd');
	    zebraRows('.visible:even td', 'odd');
	  });
	});
}

//Search for a string within the table
function searchRows(){
	var $rows = $('.searchRejectCandidates');
	$('#sendEmailSearch').keyup(function() {
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});
}