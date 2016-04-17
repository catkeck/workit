$(document).on('ready', function() {
  var lineData = gon.data

  var vis = d3.select("#visualization"),
      WIDTH = 800,
      HEIGHT = 500,
      MARGINS = {
        top: 20,
        right: 20,
        bottom: 25, // should be 20 or something
        left: 50
      },
      xRange = d3.time.scale().range([MARGINS.left, WIDTH - MARGINS.right]).domain([d3.min(lineData, function(d) {
        return d.date;
      }), d3.max(lineData, function(d) {
        return d.date;
        })]),
      yRange = d3.scale.linear().range([HEIGHT - MARGINS.top, MARGINS.bottom]).domain([d3.min(lineData, function(d) {
       return d.weight;
     }), d3.max(lineData, function(d) {
      return d.weight;
      })]),
    xAxis = d3.svg.axis()
      .scale(xRange)
      .tickSize(10)
      .ticks(Math.min(5, lineData.length))
      .tickFormat(d3.time.format("%m/%d"))
      .tickSubdivide(true),
    yAxis = d3.svg.axis()
      .scale(yRange)
      .tickSize(1)
      .orient('left')
      .tickSubdivide(true);
        
  vis.append('svg:g')
    .attr('class', 'x axis')
    .attr('transform', 'translate(0,' + (HEIGHT - MARGINS.bottom) + ')')
    .call(xAxis);

  vis.append('svg:g')
    .attr('class', 'y axis')
    .attr('transform', 'translate(' + (MARGINS.left) + ',0)')
    .call(yAxis);

  var lineFunc = d3.svg.line()
    .x(function(d) {
      return xRange(d.date);
    })
    .y(function(d) {
      return yRange(d.weight);
    })
    .interpolate('linear');

    vis.append('svg:path')
    .attr('d', lineFunc(lineData))
    .attr('stroke', 'blue')
    .attr('stroke-width', 2)
    .attr('fill', 'none');

});