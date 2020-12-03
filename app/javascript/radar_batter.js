const radarChartData = {
  labels: ["打撃", "パワー", "走力", "肩力", "守備力"],
  datasets: [
    {
      fillColor : /*"#f2dae8"*/"rgba(0,128,0,0.6)",
      strokeColor : /*"#dd9cb4"*/"rgba(144,238,144,0.6)",
      data : [gon.player.batting,
              gon.player.power,
              gon.player.running,
              gon.player.throwing,
              gon.player.fielding
      ]
    }
  ]
  };

  window.onload = function(){
  window.myRadar = new Chart(document.getElementById("radar-chart-batter").getContext("2d")).Radar(radarChartData, {
    responsive: true
  });
  };