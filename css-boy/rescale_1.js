importPackage(Packages.org.csstudio.opibuilder.scriptUtil);

// Get the graph widget and turn off autoscale
display.getWidget("TopGraph").setPropertyValue("axis_1_auto_scale", );

// Get the current values as doubles
var cav = PVUtil.getDouble(pvs[0])
var fwd = PVUtil.getDouble(pvs[1])

// Get the larger and smaller of the two current values
if (cav > fwd) 
	{
	var greater = cav
	var lesser = fwd
	}
else 
	{
	var greater = fwd
	var lesser = cav
	}

// Do math and convert to string
var max = greater + 10.0 + ''
var min = lesser - 10.0 + ''

// Set the max value of the y-axis
display.getWidget("TopGraph").setPropertyValue("axis_1_maximum", max);

// Set the min value of the y-axis
display.getWidget("TopGraph").setPropertyValue("axis_1_minimum", min);