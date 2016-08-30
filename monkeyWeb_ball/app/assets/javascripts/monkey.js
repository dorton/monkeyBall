// target submit button

// on submit ...
  // get selected feature
  // get selected metric
  // send feature and metric with request to ruby

var qs = function(sel) {
  return document.querySelector(sel)
}
document.onready = function() {
  var plotButtonEl = qs("#plotBtn")

  plotButtonEl.addEventListener('click',function(){
    var feature = qs("#selectIncoming").value
    var metric = qs("#selectOutgoing").value
    var promise = $.getJSON('/plot.json',
      {
        feature: feature,
        metric: metric
      }
    )
    promise.then(
      function(resp){
        console.log(resp)
        qs('#plotContainer').innerHTML = '<img src="/assets/' + resp.filename + '">'
      },
      function(err) {
        console.log(err)
      })

    qs('#plotContainer').innerHTML = '<img src="/assets/loading.gif">'
    })


}
