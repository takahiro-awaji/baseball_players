const radarChartData = {
  labels: ["球速", "コントロール", "スタミナ", "変化球", "守備力"],
  datasets: [
    {
      fillColor : /*"#f2dae8"*/"rgba(255,192,203,0.6)",
      strokeColor : /*"#dd9cb4"*/"rgba(255,182,193,0.6)",
      data : [gon.player.speedball,
              gon.player.control,
              gon.player.stamina,
              gon.player.breakingball,
              gon.player.fielding_of_pitcher
      ],
    }
  ]
  };

  const options = {
    scale: {
      ticks: {
        max: 100,
        stepSize: 20
      }
    }
  }
  
  window.addEventListener("load", function(){
  window.myRadar = new Chart(document.getElementById("radar-chart-pitcher").getContext("2d")).Radar(radarChartData, {
    responsive: true,
    stepSize: 10
  });
  });