const radarChartData = {
  labels: ["球速", "スタミナ", "コントロール", "変化球", "守備力"],
  datasets: [
    {
      fillColor : /*"#f2dae8"*/"rgba(242,218,232,0.6)",
      strokeColor : /*"#dd9cb4"*/"rgba(221,156,180,0.6)",
      data : [80,60,40,100,100]
    }
  ]
  };
  
  window.addEventListener("load", function(){
  window.myRadar = new Chart(document.getElementById("radar-chart-pitcher").getContext("2d")).Radar(radarChartData, {
    responsive: true
  });
  });