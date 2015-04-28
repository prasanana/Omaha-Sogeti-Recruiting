function drawChart() {
	var data = google.visualization.arrayToDataTable([
        ['Stage',          'Number of Days'],
        ['Phone Interview',       3],
        ['Technical Interview',         3],
        ['Face to Face interview',             6],
        ['Sogeti Pipeline',             10],
      ]);

      var options = {
        title: 'Candidate Name',
        width: 1000,
        height: 563,
        hAxis: {
          title: 'Number of Days',
          minValue: 0
        },
        vAxis: {
          title: 'Stage'
        }
      };

      var chart = new google.visualization.BarChart(
        document.getElementById('ex0'));

      chart.draw(data, options);
    }