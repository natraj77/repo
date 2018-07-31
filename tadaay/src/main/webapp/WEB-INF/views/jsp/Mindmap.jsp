<!doctype html>
<html class="no-js" lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Tadaay | Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@ include file='/static/header-include.jsp'%>
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.css"></link>


<style>
	.node {
		cursor: pointer;
	}

	.node circle {
		fill: #fff;
		stroke: steelblue;
		stroke-width: 1.5px;
	}

	.found {
		fill: #ff4136;
		stroke: #ff4136;
	}
	.node text {
		font: 10px sans-serif;
	}

	.link {
		fill: none;
		stroke: #ccc;
		stroke-width: 1.5px;
	}
	/*Just to ensure the select2 box is "glued" to the top*/
	.search {
	  width: 100%;
	}
	
.node {
  cursor: pointer;
}

.node rect {
  fill: #fff;
}

.node text {
  font-size: 20px;
  fill: rgb(0, 104, 112);
  
}

.link {
  fill: none;
  stroke: #ccc;
  stroke-width: 1.5px;
}
.search{
width:50%;
margin:0 auto;
text-align:center;
margin:0 25%;
}
.select2-container .select2-choice{
width:100%;
margin:0 auto;
height:50px;
background-image:none;
font-family: Arial,sans-serif;
    font-size: 15px;
    color: #000;
    background-color: #fff;
    line-height: 46px;
    padding: 0 20px;
    cursor: text;
    border: 0;
    margin-bottom: 0;
    -webkit-transition: background-color .5s;
    -moz-transition: background-color .5s;
    -o-transition: background-color .5s;
    -ms-transition: background-color .5s;
    transition: background-color .5s;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    border: 1px solid #ccc;
}
.select2-container .select2-choice .select2-arrow{
padding-top:10px;
}
.searchcoureinput{
	font-family: Arial,sans-serif;
    font-size: 15px;
    color: #000;
    background-color: #fff;
    line-height: 46px;
    padding: 0 20px;
    cursor: text;
    border: 0;
    width: 400px;
    margin-bottom: 0;
    -webkit-transition: background-color .5s;
    -moz-transition: background-color .5s;
    -o-transition: background-color .5s;
    -ms-transition: background-color .5s;
    transition: background-color .5s;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    border:1px solid #ccc;
}
#searchcoursesubmit{
	font-family: Arial,sans-serif;
    line-height: 46px;
    letter-spacing: 1px;
    text-transform: uppercase;
    font-size: 15px;
    font-weight: 700;
    padding: 0 20px;
    border: 0;
    background: #009aee;
    color: #fff;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
	
}
.info-bar.info-bar-bordered {
    margin: 30px 0;
    border: rgba(0,0,0,0.1) 1px solid;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.info-bar.info-bar-clean {
    background-color: #fff;
    border-bottom: rgba(0,0,0,0.1) 1px solid;
}
.info-bar {
    margin: 0;
    border: 0;
    color: #000;
    background-color: rgba(0,0,0,0.05);
}

.info-bar div.row>div {
    padding-top: 20px;
    padding-bottom: 20px;
    margin: 0 !important;
    border-right: rgba(0,0,0,0.1) 1px solid;
}
.info-bar div.row>div:last-child {
    border: 0;
}
.info-bar h3, .info-bar h4{
	margin:0px;
	text-align:center;
	
	font-size:20px;
}
</style>
  </head>
  <body>
<!--  Include Header  -->
<%@ include file='/static/headertwo.jsp' %>
<%-- <div class="inner-page-banner-area" style="background-image: url('<%=request.getContextPath()%>/resources/images/banners/5.jpg');">
  <div class="container">
    <div class="pagination-area">
      <h2>Partners</h2>
      <ul>
        <li><a href="<%=request.getContextPath()%>">Home</a> - </li>
        <li>Partners</li>
      </ul>
    </div>
  </div>  
</div> --%>
 
<section style="padding:30px;">
<div class="container">
<div id="search"></div>
</div>
</section>

	<div class="info-bar info-bar-clean info-bar-bordered">
				<div class="container">
					<div class="row">
						<div class="col-sm-4">
							<div style="font-size:24px;">
								<span style="margin-right:20px;"><input type="checkbox"> Iam a Fresher</span>
							<input type="checkbox"> Iam a Fresher
							</div>
						</div>
						<div class="col-sm-4">
							<h3 class="coursename">click to show courses</h3>
						</div>
						<div class="col-sm-4">
							<h4><i class="fa fa-briefcase" aria-hidden="true"></i> Jobs : <span>1000+</span></h34>
						</div>
					</div>
				</div>
			</div>
	<!-- <header>
      <h1>Marvel Characters</h1>
      <h2>Click to view their identity</h2>
      <h3>And link to their web page!</h3>
    </header> -->

<div class="container">

	<div id="mindmap"></div>
</div>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/d3/3.4.11/d3.min.js"></script>
<script type="text/javascript">

	//basically a way to get the path to an object
	function searchTree(obj,search,path){
		if(obj.name === search){ //if search is found return, add the object to the path and return it
			path.push(obj);
			return path;
		}
		else if(obj.children || obj._children){ //if children are collapsed d3 object will have them instantiated as _children
			var children = (obj.children) ? obj.children : obj._children;
			for(var i=0;i<children.length;i++){
				path.push(obj);// we assume this path is the right one
				var found = searchTree(children[i],search,path);
				if(found){// we were right, this should return the bubbled-up path from the first if statement
					return found;
				}
				else{//we were wrong, remove this parent from the path and continue iterating
					path.pop();
				}
			}
		}
		else{//not the right object, return false so it will continue to iterate in the loop
			return false;
		}
	}

	function extract_select2_data(node,leaves,index){
	        if (node.children){
	            for(var i = 0;i<node.children.length;i++){
	                index = extract_select2_data(node.children[i],leaves,index)[0];
	            }
	        }
	        else {
	            leaves.push({id:++index,text:node.name});
	        }
	        return [index,leaves];
	}

	var div = d3.select("body")
		.append("div") // declare the tooltip div
		.attr("class", "tooltip")
		.style("opacity", 0);

	var margin = {top: 20, right: 120, bottom: 20, left: 200},
    width = 1170 - margin.right - margin.left,
    height = 1100 - margin.top - margin.bottom;

	var i = 0,
		duration = 750,
		root,
		select2_data;

	var diameter = 960;

	var tree = d3.layout.tree()
		.size([height, width]);

	var diagonal = d3.svg.diagonal()
		.projection(function(d) { return [d.y, d.x]; });

	var svg = d3.select("#mindmap").append("svg")
		.attr("width", width + margin.right + margin.left)
		.attr("height", height + margin.top + margin.bottom)
	  	.append("g")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

	//recursively collapse children
	function collapse(d) {
		if (d.children) {
			d._children = d.children;
			d._children.forEach(collapse);
			d.children = null;
		}
	}

	// Toggle children on click.
	function click(d) {
		if (d.children) {
			d._children = d.children;
			d.children = null;
	  	}
	  	else{
			d.children = d._children;
			d._children = null;
	  	}
		update(d);
	}

	function openPaths(paths){
		for(var i =0;i<paths.length;i++){
			if(paths[i].id !== "1"){//i.e. not root
				paths[i].class = 'found';
				if(paths[i]._children){ //if children are hidden: open them, otherwise: don't do anything
					paths[i].children = paths[i]._children;
	    			paths[i]._children = null;
				}
				update(paths[i]);
			}
		}
	}

	d3.json("static/data3.json", function(error,values){
		root = values;
		select2_data = extract_select2_data(values,[],0)[1];//I know, not the prettiest...
		root.x0 = height / 2;
		root.y0 = 0;
		root.children.forEach(collapse);
		update(root);
		//init search box
		$("#search").select2({
			data: select2_data,
			containerCssClass: "search",
			placeholder: "Search for courses"
		});
	});
	//attach search box listener
	$("#search").on("select2-selecting", function(e) {
		var paths = searchTree(root,e.object.text,[]);
		if(typeof(paths) !== "undefined"){
			openPaths(paths);
		}
		else{
			alert(e.object.text+" not found!");
		}
		
	})

	d3.select(self.frameElement).style("height", "800px");

	function update(source) {
		// Compute the new tree layout.
		var nodes = tree.nodes(root).reverse(),
		links = tree.links(nodes);

		// Normalize for fixed-depth.
		nodes.forEach(function(d) { d.y = d.depth * 180; });

		// Update the nodesâ€¦
		var node = svg.selectAll("g.node")
			.data(nodes, function(d) { return d.id || (d.id = ++i); });

		// Enter any new nodes at the parent's previous position.
		var nodeEnter = node.enter().append("g")
			.attr("class", "node")
			  .attr("style", "outline: thin solid #a09e9e;")
		.attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
		.on("click", click);

		/* nodeEnter.append("circle")
		.attr("r", 1e-6)
		.style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; }); */

		nodeEnter.append("text")
			.attr("x", function(d) { return d.children || d._children ? -40 : 40; })
			.attr("dy", ".35em")
			.attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
			.text(function(d) { return d.name; })
			.style("fill-opacity", 1e-6);
		

		nodeEnter.append("text")
			.attr("x", function(d) { return d.children || d._children ? -40 : 40; })
			.attr("y", function(d) { return d.children || d._children ? 30 : 30; })
			.attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
			.text(function(d) { return d.level; })
			 .attr("style", "font-size: 14px;")
			.style("fill-opacity", 1);

		// Transition nodes to their new position.
		var nodeUpdate = node.transition()
			.duration(duration)
			.attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

		/* nodeUpdate.select("circle")
			.attr("r", 4.5)
			.style("fill", function(d) {
				if(d.class === "found"){
					return "#ff4136"; //red
				}
				else if(d._children){
					return "lightsteelblue";
				}
				else{
					return "#fff";
				}
			})
			.style("stroke", function(d) {
				if(d.class === "found"){
					return "#ff4136"; //red
				}
		}); */
		
		  nodeEnter.append("rect")
	       .attr("x", function(d) { return -25;})
	      .attr("y", function(d) { return -25;})
	                                
	                                .attr("width", 60)
	                                .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; })
	                                .attr("height", 60);
		 var images = nodeEnter.append("svg:image")
         .attr("xlink:href",  function(d) { return d.img;})
         .attr("x", function(d) { return -25;})
         .attr("y", function(d) { return -25;})
         .attr("height", 60)
         .attr("width", 60);
   
   // make the image grow a little on mouse over and add the text details on click
   var setEvents = images
           // Append hero text
           .on( 'click', function (d) {
               d3.select("h4 span").html(d.jobs); 
               d3.select("h2").html(d.name); 
               d3.select("h3").html ( "<a href='" + d.link + "' >"  + d.name + "</a>" ); 
            })

		nodeUpdate.select("text")
			.style("fill-opacity", 1);

		// Transition exiting nodes to the parent's new position.
		var nodeExit = node.exit().transition()
			.duration(duration)
			.attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
			.remove();

		nodeExit.select("circle")
			.attr("r", 1e-6);

		nodeExit.select("text")
			.style("fill-opacity", 1e-6);

		// Update the linksâ€¦
		var link = svg.selectAll("path.link")
			.data(links, function(d) { return d.target.id; });

		// Enter any new links at the parent's previous position.
		link.enter().insert("path", "g")
			.attr("class", "link")
			.attr("d", function(d) {
				var o = {x: source.x0, y: source.y0};
				return diagonal({source: o, target: o});
			});

		// Transition links to their new position.
		link.transition()
			.duration(duration)
			.attr("d", diagonal)
			.style("stroke",function(d){
				if(d.target.class==="found"){
					return "#ff4136";
				}
			});

		// Transition exiting nodes to the parent's new position.
		link.exit().transition()
			.duration(duration)
			.attr("d", function(d) {
				var o = {x: source.x, y: source.y};
				
				return diagonal({source: o, target: o});
			})
			.remove();

		// Stash the old positions for transition.
		nodes.forEach(function(d) {
			d.x0 = d.x;
			d.y0 = d.y;
		  });
	}
</script>
<!-- Main Body Area End Here -->
<%@ include file='/static/footer.jsp' %>
<%@ include file='/static/footer-include.jsp' %>
</body>
</html>

