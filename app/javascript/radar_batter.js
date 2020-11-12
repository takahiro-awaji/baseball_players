const radarChartData = {
  labels: ["打撃", "パワー", "走力", "肩力", "守備力"],
  datasets: [
    {
      fillColor : /*"#f2dae8"*/"rgba(242,218,232,0.6)",
      strokeColor : /*"#dd9cb4"*/"rgba(221,156,180,0.6)",
      data : [100,100,100,100,100]
    }
  ]
  };

  window.onload = function(){
  window.myRadar = new Chart(document.getElementById("radar-chart-batter").getContext("2d")).Radar(radarChartData, {
    responsive: true
  });
  };