--Wire graphics tablet  by greenarrow
--http://gmodreviews.googlepages.com/
--http://forums.facepunchstudios.com/greenarrow
--There may be a few bits of code from the wire panel here and there as i used it as a starting point.
--Credit to whoever created the first wire screen, from which all others seem to use the lagacy clientside drawing code (this one included)

WireToolSetup.setCategory( "Input, Output/Mouse Interaction" )
WireToolSetup.open( "graphics_tablet", "Graphics Tablet", "gmod_wire_graphics_tablet", nil, "Graphics Tablet" )

if ( CLIENT ) then
    language.Add( "Tool.wire_graphics_tablet.name", "Graphics Tablet Tool (Wire)" )
    language.Add( "Tool.wire_graphics_tablet.desc", "Spawns a graphics tablet, which outputs cursor coordinates" )
    language.Add( "Tool.wire_graphics_tablet.0", "Primary: Create/Update graphics tablet" )
	language.Add( "Tool_wire_graphics_tablet_mode", "Output mode: -1 to 1 (ticked), 0 to 1 (unticked)" )
	language.Add( "Tool_wire_graphics_tablet_draw_background", "Draw background" )
	language.Add( "Tool_wire_graphics_tablet_createflat", "Create flat to surface" )
end
WireToolSetup.BaseLang()
WireToolSetup.SetupMax( 20 )

if SERVER then
	function TOOL:GetConVars() 
		return self:GetClientNumber("outmode") ~= 0, self:GetClientNumber("draw_background") ~= 0
	end

	-- Uses default WireToolObj:MakeEnt's WireLib.MakeWireEnt function
end

TOOL.ClientConVar = {
	model = "models/kobilica/wiremonitorbig.mdl",
	outmode = 0,
	createflat = 1,
	draw_background = 1,
}

function TOOL.BuildCPanel(panel)
	panel:AddControl("Header", { Text = "#Tool.wire_graphics_tablet.name", Description = "#Tool.wire_graphics_tablet.desc" })

	WireDermaExts.ModelSelect(panel, "wire_graphics_tablet_model", list.Get( "WireScreenModels" ), 5) -- screen with out a GPUlip setup
	panel:CheckBox("#Tool_wire_graphics_tablet_mode", "wire_graphics_tablet_outmode")
	panel:CheckBox("#Tool_wire_graphics_tablet_draw_background", "wire_graphics_tablet_draw_background")
	panel:CheckBox("#Tool_wire_graphics_tablet_createflat", "wire_graphics_tablet_createflat")
end
