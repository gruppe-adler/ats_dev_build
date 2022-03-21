
ATRAIN_Track_Definitions = missionNamespace getVariable ["ATRAIN_Track_Definitions",[]];

// [Class Name, Center Point Offset, Is Split Track, Is End Track,Memory Point Height Offset]
ATRAIN_Track_Definitions append [ 
	// Arma 3 Tracks
	["Land_Track_01_3m_F",0,false,false,0], 
	["Land_Track_01_7deg_F",0.15,false,false,0], 
	["Land_Track_01_10m_F",0,false,false,0], 
	["Land_Track_01_15deg_F",0.3,false,false,0], 
	["Land_Track_01_20m_F",0,false,false,0], 
	["Land_Track_01_30deg_F",0.6,false,false,0], 
	["Land_Track_01_bridge_F",0,false,false,0], 
	["Land_Track_01_bumper_F",0,false,true,0], 
	["Land_Track_01_turnout_left_F",0.55,true,false,0], 
	["Land_Track_01_turnout_right_F",-0.55,true,false,0], 
	// Cable Car Tracks
	["ATS_Tracks_Cable_Wire",0,false,false,0], 
	["ATS_Tracks_Cable_Wire_50",0,false,false,0], 
	["ATS_Tracks_Cable_Wire_Stop",0,false,true,0],
	["ATS_Tracks_Cable_Pole",0,false,false,0],
	// Arma 3 Wrapper Tracks
	["ATS_Tracks_A3_Straight_3",0,false,false,0], 
	["ATS_Tracks_A3_Curve_7",0.15,false,false,0], 
	["ATS_Tracks_A3_Straight_10",0,false,false,0], 
	["ATS_Tracks_A3_Curve_15",0.3,false,false,0], 
	["ATS_Tracks_A3_Straight_20",0,false,false,0], 
	["ATS_Tracks_A3_Curve_30",0.6,false,false,0], 
	["ATS_Tracks_A3_Bridge",0,false,false,0], 
	["ATS_Tracks_A3_End",0,false,true,0], 
	["ATS_Tracks_A3_Split_Left",0.55,true,false,0], 
	["ATS_Tracks_A3_Split_Right",-0.55,true,false,0], 
	// Arma 2 Tracks
	["ATS_Tracks_A2_Bridge",0,false,false,--0.06],  
	["ATS_Tracks_A2_Bridge_Rail",0,false,false,-0.06], 
	["ATS_Tracks_A2_Concrete_End",0,false,true,-0.06], 
	["ATS_Tracks_A2_Iron_End",0,false,true,-0.06], 
	["ATS_Tracks_A2_Elev_Straight_40",0,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Straight_25",0,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Split_Right",-1,true,false,-0.06], 
	["ATS_Tracks_A2_Elev_Split_Left",1,true,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Right_1",-0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Right_2",-0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Right_3",-0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Left_1",0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Left_2",0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Curve_Left_3",0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Incline_Up_40",0,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Incline_Up_25",0,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Incline_Down_40",0,false,false,-0.06], 
	["ATS_Tracks_A2_Elev_Incline_Down_25",0,false,false,-0.06], 
	["ATS_Tracks_A2_Split_Right",-1,true,false,-0.06], 
	["ATS_Tracks_A2_Split_Left",1,true,false,-0.06], 
	["ATS_Tracks_A2_Crossing_25",0,false,false,-0.06], 
	["ATS_Tracks_A2_Crossing_10",0,false,false,-0.06], 
	["ATS_Tracks_A2_Curve_Right_1",-0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Curve_Left_1",0.3,false,false,-0.06], 
	["ATS_Tracks_A2_Straight_25",0,false,false,-0.06],
	["ATS_Tracks_A2_Bridge_Stone",0,false,false,-0.06],
	["CUP_Railway_rails_v_LB_RE",-1,true,false,0.1], 
	["CUP_Railway_rails_v_LE_RB",1,true,false,0.1], 
	// Aussie Tracks
	["Land_straight40",0,false,false,0.06],
	["Land_left_turn",1,true,false,0.06],
	["Land_right_turn",-1,true,false,0.06],
	["Land_straight25",0,false,false,0.06],
	["Land_Bridge",0,false,false,0.06],
	["Land_terminator_concrete",0,false,true,0.06],
	["Land_straight_down40",0,false,false,0.06],
	["Land_stonebridge",0,false,false,0.06],
	["Land_Bridgehalf",0,false,false,0.06],
	["Land_road_xing_25",0,false,false,0.06],
	["Land_xroad_10",0,false,false,0.06],
	["Land_xroad_25",0,false,false,0.06],
	["Land_curveR25_5",0.3,false,false,0.06],
	["Land_curveL30_20",0.3,false,false,0.06],
	["Land_curveL25_10",0.3,false,false,0.06],
	["Land_curveL25_5",0.3,false,false,0.06],
	// Livonia/Enoch Tracks
	// [Class Name, Center Point Offset, Is Split Track, Is End Track,Memory Point Height Offset]
	["Land_Rail_Track_TurnOutR_F",-1,true,false,1], 
	["Land_Rail_Track_TurnOutL_F",1,true,false,1], 
	["Land_Rail_TrackE_TurnOutR_F",-1,true,false,1], 
	["Land_Rail_TrackE_TurnOutL_F",1,true,false,1], 
	["Land_Rail_Track_Passing_25NOLC_F",0,false,false,1], 
	["Land_Rail_Track_Passing_25_F",0,false,false,1], 
	["Land_Rail_Track_Passing_10_F",0,false,false,1], 
	["Land_Rail_Track_SP_F",0,false,false,1], 
	["Land_Rail_Track_LE1_RB_F",-0.3,false,false,1], 
	["Land_Rail_Track_LE_RB_F",-0.3,false,false,1], 
	["Land_Rail_Track_LB1_RE_F",0.3,false,false,1], 
	["Land_Rail_Track_LB_RE_F",0.3,false,false,1], 
	["Land_Rail_TrackE_8NOLC_F",0,false,false,1], 
	["Land_Rail_TrackE_8_F",0,false,false,1], 
	["Land_Rail_TrackE_4_F",0,false,false,1], 
	["Land_Rail_Track_Up_40_F",0,false,false,1], 
	["Land_Rail_TrackE_40NOLC_F",0,false,false,1], 
	["Land_Rail_TrackE_40_F",0,false,false,1], 
	["Land_Rail_Track_Down_40_F",0,false,false,1], 
	["Land_Rail_TrackE_R30_20_F",0,false,false,1], 
	["Land_Rail_TrackE_2_F",0,false,false,1], 
	["Land_Rail_Track_Up_25_F",0,false,false,1], 
	["Land_Rail_TrackE_25NOLC_F",0,false,false,1], 
	["Land_Rail_TrackE_R25_5_F",-0.3,false,false,1], 
	["Land_Rail_TrackE_L25_5_F",0.3,false,false,1], 
	["Land_Rail_TrackE_R25_10_F",-0.3,false,false,1], 
	["Land_Rail_TrackE_L25_10_F",0.3,false,false,1], 
	["Land_Rail_TrackE_25_F",0,false,false,1], 
	["Land_Rail_Track_Down_25_F",0,false,false,1], 
	["Land_Rail_Track_R25_10_F",-0.3,false,false,1], 
	["Land_Rail_Track_L25_10_F",0.3,false,false,1], 
	["Land_Rail_Track_25_F",0,false,false,1], 
	["Land_Rail_Bridge_40_F",0,false,false,1]
];

ATRAIN_Object_Model_To_Type_Map = missionNamespace getVariable ["ATRAIN_Object_Model_To_Type_Map",[]];

ATRAIN_Object_Model_To_Type_Map append [
	// Arma 3 Tracks
	["track_01_3m_f.p3d",["ATS_Tracks_A3_Straight_3",true]],
	["track_01_7deg_f.p3d",["ATS_Tracks_A3_Curve_7",true]],
	["track_01_10m_f.p3d",["ATS_Tracks_A3_Straight_10",true]],
	["track_01_15deg_f.p3d",["ATS_Tracks_A3_Curve_15",true]],
	["track_01_20m_f.p3d",["ATS_Tracks_A3_Straight_20",true]],
	["track_01_30deg_f.p3d",["ATS_Tracks_A3_Curve_30",true]],
	["track_01_bridge_f.p3d",["ATS_Tracks_A3_Bridge",true]],
	["track_01_bumper_f.p3d",["ATS_Tracks_A3_End",true]],
	["track_01_turnout_left_f.p3d",["ATS_Tracks_A3_Split_Left",true]],
	["track_01_turnout_right_f.p3d",["ATS_Tracks_A3_Split_Right",true]],		
	// CUP Tracks
	["railsn_25.p3d",["ATS_Tracks_A2_Elev_Straight_25",true]],
	["railsn_40.p3d",["ATS_Tracks_A2_Elev_Straight_40",true]],
	["railsn_curve_l25_10.p3d",["ATS_Tracks_A2_Elev_Curve_Left_2",true]],
	["railsn_curve_l25_5.p3d",["ATS_Tracks_A2_Elev_Curve_Left_3",true]],
	["railsn_curve_l30_20.p3d",["ATS_Tracks_A2_Elev_Curve_Left_1",true]],
	["railsn_curve_r25_10.p3d",["ATS_Tracks_A2_Elev_Curve_Right_2",true]],
	["railsn_curve_r25_5.p3d",["ATS_Tracks_A2_Elev_Curve_Right_3",true]],
	["railsn_curve_r30_20.p3d",["ATS_Tracks_A2_Elev_Curve_Right_1",true]],
	["railsn_turnout_l.p3d",["ATS_Tracks_A2_Elev_Split_Left",true]],
	["railsn_turnout_r.p3d",["ATS_Tracks_A2_Elev_Split_Right",true]],
	["rails_25.p3d",["ATS_Tracks_A2_Straight_25",true]],
	["rails_curve_l25_10.p3d",["ATS_Tracks_A2_Curve_Left_1",true]],
	["rails_curve_r25_10.p3d",["ATS_Tracks_A2_Curve_Right_1",true]],
	["rails_down_25.p3d",["ATS_Tracks_A2_Elev_Incline_Down_25",true]],
	["rails_down_40.p3d",["ATS_Tracks_A2_Elev_Incline_Down_40",true]],
	["rails_linebreak_concrete.p3d",["ATS_Tracks_A2_Concrete_End",true]],
	["rails_linebreak_iron.p3d",["ATS_Tracks_A2_Iron_End",true]],
	["rails_passing_10.p3d",["ATS_Tracks_A2_Crossing_10",true]],
	["rails_passing_25.p3d",["ATS_Tracks_A2_Crossing_25",true]],
	["rails_turnout_l.p3d",["ATS_Tracks_A2_Split_Left",true]],
	["rails_turnout_r.p3d",["ATS_Tracks_A2_Split_Right",true]],
	["rails_up_25.p3d",["ATS_Tracks_A2_Elev_Incline_Up_25",true]],
	["rails_up_40.p3d",["ATS_Tracks_A2_Elev_Incline_Up_40",true]],
	["rails_v_sp.p3d",["ATS_Tracks_A2_Crossing_10",true]],
	["rails_bridge_rail.p3d",["ATS_Tracks_A2_Bridge_Rail",true]],
	["rails_bridge_40.p3d",["ATS_Tracks_A2_Elev_Straight_40",true]],
	//["rails_v1_lb_re.p3d",["CUP_Railway_rails_v1_LB_RE",true]],
	//["rails_v1_le_rb.p3d",["CUP_Railway_rails_v1_LE_RB",true]],
	["rails_v_lb_re.p3d",["CUP_Railway_rails_v_LB_RE",true]],
	["rails_v_le_rb.p3d",["CUP_Railway_rails_v_LE_RB",true]],
	// Arma 2 Tracks
	["ats_tracks_cable_pole.p3d",["ATS_Tracks_Cable_Pole",true]],
	["ats_tracks_cable_wire.p3d",["ATS_Tracks_Cable_Wire",true]],
	["ats_tracks_cable_wire_50.p3d",["ATS_Tracks_Cable_Wire_50",true]],
	["ats_tracks_cable_wire_stop.p3d",["ATS_Tracks_Cable_Wire_Stop",true]],
	["ats_tracks_a2_bridge_40.p3d",["ATS_Tracks_A2_Bridge",true]],
	["ats_tracks_a2_bridge_rail.p3d",["ATS_Tracks_A2_Bridge_Rail",true]],
	["ats_tracks_a2_linebreak_concrete.p3d",["ATS_Tracks_A2_Concrete_End",true]],
	["ats_tracks_a2_linebreak_iron.p3d",["ATS_Tracks_A2_Iron_End",true]],
	["ats_tracks_a2_elev_40.p3d",["ATS_Tracks_A2_Elev_Straight_40",true]],
	["ats_tracks_a2_elev_25.p3d",["ATS_Tracks_A2_Elev_Straight_25",true]],
	["ats_tracks_a2_elev_turnout_R.p3d",["ATS_Tracks_A2_Elev_Split_Right",true]],
	["ats_tracks_a2_elev_turnout_L.p3d",["ATS_Tracks_A2_Elev_Split_Left",true]],
	["ats_tracks_a2_elev_curve_R30_20.p3d",["ATS_Tracks_A2_Elev_Curve_Right_1",true]],
	["ats_tracks_a2_elev_curve_R25_10.p3d",["ATS_Tracks_A2_Elev_Curve_Right_2",true]],
	["ats_tracks_a2_elev_curve_R25_5.p3d",["ATS_Tracks_A2_Elev_Curve_Right_3",true]],
	["ats_tracks_a2_elev_curve_L30_20.p3d",["ATS_Tracks_A2_Elev_Curve_Left_1",true]],
	["ats_tracks_a2_elev_curve_L25_10.p3d",["ATS_Tracks_A2_Elev_Curve_Left_2",true]],
	["ats_tracks_a2_elev_curve_L25_5.p3d",["ATS_Tracks_A2_Elev_Curve_Left_3",true]],
	["ats_tracks_a2_up_40.p3d",["ATS_Tracks_A2_Elev_Incline_Up_40",true]],
	["ats_tracks_a2_up_25.p3d",["ATS_Tracks_A2_Elev_Incline_Up_25",true]],
	["ats_tracks_a2_down_40.p3d",["ATS_Tracks_A2_Elev_Incline_Down_40",true]],
	["ats_tracks_a2_down_25.p3d",["ATS_Tracks_A2_Elev_Incline_Down_25",true]],
	["ats_tracks_a2_turnout_R.p3d",["ATS_Tracks_A2_Split_Right",true]],
	["ats_tracks_a2_turnout_L.p3d",["ATS_Tracks_A2_Split_Left",true]],
	["ats_tracks_a2_passing_25.p3d",["ATS_Tracks_A2_Crossing_25",true]],
	["ats_tracks_a2_passing_10.p3d",["ATS_Tracks_A2_Crossing_10",true]],
	["ats_tracks_a2_curve_R25_10.p3d",["ATS_Tracks_A2_Curve_Right_1",true]],
	["ats_tracks_a2_curve_L25_10.p3d",["ATS_Tracks_A2_Curve_Left_1",true]],
	["ats_tracks_a2_25.p3d",["ATS_Tracks_A2_Straight_25",true]],
	["ats_tracks_a2_stonebridge.p3d",["ATS_Tracks_A2_Bridge_Stone",true]],
	// Cable Car Tracks
	["ats_tracks_cable_wire.p3d",["ATS_Tracks_Cable_Wire",true]],
	["ats_tracks_cable_wire_50.p3d",["ATS_Tracks_Cable_Wire_50",true]], 
	["ats_tracks_cable_wire_stop.p3d",["ATS_Tracks_Cable_Wire_Stop",true]],
	["ats_tracks_cable_pole.p3d",["ATS_Tracks_Cable_Pole",true]],
	// Aussie Tracks
	["straight40.p3d",["Land_straight40",true]],
	["left_turn.p3d",["Land_left_turn",true]],
	["right_turn.p3d",["Land_right_turn",true]],
	["straight25.p3d",["Land_straight25",true]],
	["Bridge.p3d",["Land_Bridge",true]],
	["straight_down40.p3d",["Land_straight_down40",true]],
	["terminator_concrete.p3d",["Land_terminator_concrete",true]],
	["stonebridge.p3d",["Land_stonebridge",true]],
	["Bridgehalf.p3d",["Land_Bridgehalf",true]],
	["road_xing_25.p3d",["Land_road_xing_25",true]],
	["xroad_10.p3d",["Land_xroad_10",true]],
	["xroad_25.p3d",["Land_xroad_25",true]],
	["curveR25_5.p3d",["Land_curveR25_5",true]],
	["curveL30_20.p3d",["Land_curveL30_20",true]],
	["curveL25_10.p3d",["Land_curveL25_10",true]],
	["curveL25_5.p3d",["Land_curveL25_5",true]],
	// Livonia/Enoch Tracks
	["rail_track_turnoutr_f.p3d",["Land_Rail_Track_TurnOutR_F",true]],
	["rail_track_turnoutl_f.p3d",["Land_Rail_Track_TurnOutL_F",true]],
	["rail_tracke_turnoutr_f.p3d",["Land_Rail_TrackE_TurnOutR_F",true]],
	["rail_tracke_turnoutl_f.p3d",["Land_Rail_TrackE_TurnOutL_F",true]],
	["rail_track_passing_25nolc_f.p3d",["Land_Rail_Track_Passing_25NOLC_F",true]],
	["rail_track_passing_25_f.p3d",["Land_Rail_Track_Passing_25_F",true]],
	["rail_track_passing_10_f.p3d",["Land_Rail_Track_Passing_10_F",true]],
	["rail_track_sp_f.p3d",["Land_Rail_Track_SP_F",true]],
	["rail_track_le1_rb_f.p3d",["Land_Rail_Track_LE1_RB_F",true]],
	["rail_track_le_rb_f.p3d",["Land_Rail_Track_LE_RB_F",true]],
	["rail_track_lb1_re_f.p3d",["Land_Rail_Track_LB1_RE_F",true]],
	["rail_track_lb_re_f.p3d",["Land_Rail_Track_LB_RE_F",true]],
	["rail_tracke_8nolc_f.p3d",["Land_Rail_TrackE_8NOLC_F",true]],
	["rail_tracke_8_f.p3d",["Land_Rail_TrackE_8_F",true]],
	["rail_tracke_4_f.p3d",["Land_Rail_TrackE_4_F",true]],
	["rail_track_up_40_f.p3d",["Land_Rail_Track_Up_40_F",true]],
	["rail_tracke_40nolc_f.p3d",["Land_Rail_TrackE_40NOLC_F",true]],
	["rail_tracke_40_f.p3d",["Land_Rail_TrackE_40_F",true]],
	["rail_track_down_40_f.p3d",["Land_Rail_Track_Down_40_F",true]],
	["rail_tracke_r30_20_f.p3d",["Land_Rail_TrackE_R30_20_F",true]],
	["rail_tracke_2_f.p3d",["Land_Rail_TrackE_2_F",true]],
	["rail_track_up_25_f.p3d",["Land_Rail_Track_Up_25_F",true]],
	["rail_tracke_25nolc_f.p3d",["Land_Rail_TrackE_25NOLC_F",true]],
	["rail_tracke_r25_5_f.p3d",["Land_Rail_TrackE_R25_5_F",true]],
	["rail_tracke_l25_5_f.p3d",["Land_Rail_TrackE_L25_5_F",true]],
	["rail_tracke_r25_10_f.p3d",["Land_Rail_TrackE_R25_10_F",true]],
	["rail_tracke_l25_10_f.p3d",["Land_Rail_TrackE_L25_10_F",true]],
	["rail_tracke_25_f.p3d",["Land_Rail_TrackE_25_F",true]],
	["rail_track_down_25_f.p3d",["Land_Rail_Track_Down_25_F",true]],
	["rail_track_r25_10_f.p3d",["Land_Rail_Track_R25_10_F",true]],
	["rail_track_l25_10_f.p3d",["Land_Rail_Track_L25_10_F",true]],
	["rail_track_25_f.p3d",["Land_Rail_Track_25_F",true]],
	["rail_bridge_40_f.p3d",["Land_Rail_Bridge_40_F",true]]
];

[] call ATRAIN_fnc_rebuildArrayLookupIndexes;

[] call ATRAIN_fnc_preloadAllTracksNearEditorPlacedConnections;

/*
[
	[Track, Track Vector Dir, Start Node Track, End Node Track],
	...
]
*/
ATRAIN_Track_Node_Lookup = missionNamespace getVariable ["ATRAIN_Track_Node_Lookup",[]];


/*
[
	Track Object,
	...
]
*/
ATRAIN_Nodes = missionNamespace getVariable ["ATRAIN_Nodes",[]];

/*
Map: [
	Node: [
		Connection: [
			Node Index, 
			Distance,
			Path: [   
 				Point: [Pos, Dir, Up], ...
			]
		],
		...
	],
	...
]
*/
ATRAIN_Map = missionNamespace getVariable ["ATRAIN_Map",[]];
