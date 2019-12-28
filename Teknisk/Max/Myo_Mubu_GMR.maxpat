{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 1697.0, 439.0, 80.0, 81.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 676.5, 407.428558000000066, 60.0, 22.0 ],
					"text" : "route /myo1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 676.5, 375.0, 81.0, 22.0 ],
					"text" : "udpreceive 4000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 646.0, 439.761870999999985, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 26.0, 29.761870999999985, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "gswitch",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 676.5, 482.761870999999985, 41.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 821.0, 459.0, 58.0, 22.0 ],
					"text" : "route /euler"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 814.0, 413.0, 81.0, 22.0 ],
					"text" : "udpreceive 8000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 530.0, 154.0, 843.0, 514.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 72.0, 36.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 72.0, 71.0, 93.0, 22.0 ],
									"text" : "auto_handle $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 320.0, 109.0, 22.0 ],
									"text" : "rotatexyz $1 $2 $3"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-25",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 380.0, 250.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-26",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 321.0, 250.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-27",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 262.0, 250.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 292.0, 70.0, 22.0 ],
									"text" : "pak 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 219.0, 102.0, 22.0 ],
									"text" : "position $1 $2 $3"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-16",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 380.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-17",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 321.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-18",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 262.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 262.0, 191.0, 70.0, 22.0 ],
									"text" : "pak 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-14",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 195.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-13",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 136.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-12",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 77.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-11",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 18.0, 149.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 18.0, 191.0, 83.0, 22.0 ],
									"text" : "pak 0. 0. 0. 0."
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-7",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 34.5, 257.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "jit_matrix", "" ],
									"patching_rect" : [ 18.0, 398.0, 88.0, 22.0 ],
									"text" : "jit.gl.gridshape"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "bang", "" ],
									"patching_rect" : [ 18.0, 109.0, 70.0, 22.0 ],
									"text" : "jit.world 3D"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 18.0, 17.0, 43.0, 43.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "scale",
									"id" : "obj-5",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 34.5, 295.0, 190.0, 22.0 ],
									"text_width" : 54.0
								}

							}
, 							{
								"box" : 								{
									"attr" : "color",
									"id" : "obj-8",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 18.0, 219.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "scale",
									"id" : "obj-29",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.5, 332.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "smooth_shading",
									"id" : "obj-30",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.5, 364.0, 150.0, 22.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 1 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 2 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 3 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 2 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-23", 0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 2 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1025.0, 273.0, 70.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p AnimertAnd"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 856.5, 632.0, 150.0, 34.0 ],
					"text" : "Z: negativ mot venstre, positiv mot høyre"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 895.5, 570.0, 150.0, 34.0 ],
					"text" : "Y: Kobling oppover = positiv 0-90, kobling nedover, 0- -90"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 443.5, 556.0, 150.0, 34.0 ],
					"text" : "X: Rotasjon mot venstre = positiv, mot høyre = negativ"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-74",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 156.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 175.0, 127.0, 66.0, 22.0 ],
					"text" : "route battery"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-71",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 856.5, 533.345215000000053, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 731.0, 599.0, 29.5, 22.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-68",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 804.5, 510.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 800.25, 594.0, 29.5, 22.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-67",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 609.5, 545.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 646.0, 599.0, 29.5, 22.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 672.0, 696.0, 109.0, 22.0 ],
					"text" : "rotatexyz $1 $2 $3"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-20",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 790.0, 638.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-24",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 731.0, 638.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-29",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 672.0, 638.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 672.0, 668.0, 70.0, 22.0 ],
					"text" : "pak 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-53",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 469.5, 630.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "scale",
					"id" : "obj-54",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 469.5, 668.0, 190.0, 22.0 ],
					"text_width" : 54.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 451.0, 703.0, 87.0, 22.0 ],
					"text" : "read duck.dae"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 469.5, 746.0, 68.0, 22.0 ],
					"text" : "jit.gl.model"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-33",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 852.0, 562.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-25",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 748.25, 562.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-23",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 682.0, 556.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 682.0, 525.0, 75.0, 22.0 ],
					"text" : "unpack 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 108.0, 162.916687000000024, 75.0, 22.0 ],
					"text" : "pack 0. 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "" ],
					"patching_rect" : [ 108.0, 186.916687000000024, 67.0, 22.0 ],
					"text" : "jit.quat2euler"
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-51",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 229.0, 482.761870999999985, 100.0, 76.5 ],
					"setminmax" : [ -3.0, 3.0 ],
					"setstyle" : 1,
					"size" : 3
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-50",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 14.0, 594.0, 100.0, 76.5 ],
					"setminmax" : [ -3.0, 3.0 ],
					"setstyle" : 1,
					"size" : 4
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-49",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 108.0, 478.845244999999977, 100.0, 76.5 ],
					"setminmax" : [ -3.0, 3.0 ],
					"setstyle" : 1,
					"size" : 3
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 207.0, 451.0, 134.0, 22.0 ],
					"text" : "route likelihood loglikelihood"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 489.0, 525.0, 50.0, 22.0 ],
					"text" : "ro"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 323.0, 120.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 323.0, 156.0, 42.0, 22.0 ],
					"text" : "play $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 434.0, 422.761870999999985, 151.0, 22.0 ],
					"text" : "mubu.gmr MyoData quaternions"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 380.0, 525.0, 30.0, 22.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 386.25, 446.761870999999985, 30.0, 22.0 ],
					"text" : "train"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 386.25, 482.761870999999985, 156.0, 22.0 ],
					"text" : "mubu.gmm MyoData quaternions"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 94.0, 104.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 11.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.0,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 151.0, 92.0, 21.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 126.0, 26.0, 21.0 ],
									"text" : "iter"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.0,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "clear" ],
									"patching_rect" : [ 50.0, 100.0, 46.0, 21.0 ],
									"text" : "t l clear"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-35",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-36",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 230.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-28", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 910.0, 446.761870999999985, 64.0, 21.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontsize" : 11.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p fill_menu"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"fontface" : 1,
					"id" : "obj-27",
					"items" : [ "opp", ",", "ro", ",", "side" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 914.0, 482.761870999999985, 113.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 910.0, 422.761870999999985, 67.0, 21.0 ],
					"text" : "route labels"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 884.0, 351.0, 119.0, 22.0 ],
					"text" : "mubu.setlabels MyoData"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 884.0, 310.0, 243.0, 22.0 ],
					"text" : "buffer 1 label ro, buffer 2 label side, buffer 3 label opp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "number",
					"maximum" : 4,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 410.5, 89.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 410.5, 127.0, 73.0, 22.0 ],
					"text" : "bufferindex $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 48.0, 52.0, 22.0 ],
					"text" : "addbuffer"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 8.0, 42.0, 22.0 ],
					"text" : "clearall"
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-42",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 269.0, 249.92855800000001, 111.0, 179.5 ],
					"setminmax" : [ -3.0, 3.0 ],
					"setstyle" : 1,
					"size" : 4
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-43",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 146.0, 249.92855800000001, 111.0, 179.5 ],
					"setminmax" : [ -1000.0, 1000.0 ],
					"setstyle" : 1,
					"size" : 3
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 407.0, 314.0, 441.0, 36.0 ],
					"text" : "mubu.record MyoData quaternions @predef yes @timetagged yes @matrixcols 4 @maxsize 120s @samplerate 25"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 449.0, 273.0, 477.0, 22.0 ],
					"text" : "mubu.record MyoData1 gyro @predef yes @timetagged yes @matrixcols 3 samplerate 25 @maxsize 120s"
				}

			}
, 			{
				"box" : 				{
					"alignviewbounds" : 0,
					"autobounds" : 2,
					"autoupdate" : 120.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bufferchooser_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bufferchooser_fgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bufferchooser_position" : 1,
					"bufferchooser_shape" : "buttons",
					"bufferchooser_size" : 12,
					"bufferchooser_visible" : 1,
					"content" : [ 2, [ [ "label", "ro", "active", 1 ], [ "label", "side", "active", 1 ], [ "label", "opp", "active", 1 ] ], [ "quaternions", 1, 4, 0, [  ], 1, "none", [ [ 3000, 650, 25.0, 0.0, 1, 4, 0, [ 0.020142000168562, -0.140929996967316, -0.169006004929543, 0.975281000137329, 0.020142000168562, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.020142000168562, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140869006514549, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140808001160622, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.02008100040257, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.020020000636578, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.020020000636578, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.020020000636578, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.01995800063014, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.020020000636578, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.01995800063014, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.01995800063014, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140686005353928, -0.169006004929543, 0.975281000137329, 0.019897000864148, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140746995806694, -0.169006004929543, 0.975281000137329, 0.019835999235511, -0.140686005353928, -0.169006004929543, 0.975281000137329, 0.019774999469519, -0.140686005353928, -0.169006004929543, 0.975281000137329, 0.019774999469519, -0.140686005353928, -0.169006004929543, 0.975281000137329, 0.019713999703526, -0.140869006514549, -0.169249996542931, 0.975220024585724, 0.019592000171542, -0.14105199277401, -0.169433996081352, 0.975158989429474, 0.019347999244928, -0.141174003481865, -0.169556006789207, 0.975158989429474, 0.019286999478936, -0.141174003481865, -0.16949500143528, 0.975158989429474, 0.019225999712944, -0.141174003481865, -0.16949500143528, 0.975158989429474, 0.019164999946952, -0.141174003481865, -0.16949500143528, 0.975158989429474, 0.019409000873566, -0.14105199277401, -0.169373005628586, 0.975220024585724, 0.019835999235511, -0.140929996967316, -0.169249996542931, 0.975220024585724, 0.020447000861168, -0.140746995806694, -0.169066995382309, 0.975281000137329, 0.020996000617743, -0.140686005353928, -0.168883994221687, 0.975281000137329, 0.021484000608325, -0.140563994646072, -0.168700993061066, 0.975341975688934, 0.021973000839353, -0.140563994646072, -0.168578997254372, 0.975341975688934, 0.022461000829935, -0.140625, -0.168457001447678, 0.975341975688934, 0.02288799919188, -0.140808001160622, -0.16839599609375, 0.975341975688934, 0.023132000118494, -0.14105199277401, -0.16839599609375, 0.975281000137329, 0.023253999650478, -0.141357004642487, -0.16839599609375, 0.975220024585724, 0.023253999650478, -0.141357004642487, -0.16839599609375, 0.975220024585724, 0.02301000058651, -0.141417995095253, -0.168578997254372, 0.975220024585724, 0.022522000595927, -0.141479000449181, -0.168823003768921, 0.975158989429474, 0.021850999444723, -0.141479000449181, -0.169006004929543, 0.975158989429474, 0.021118000149727, -0.141541004180908, -0.169189006090164, 0.975098013877869, 0.020324999466538, -0.141784995794296, -0.169433996081352, 0.975036978721619, 0.019347999244928, -0.142029002308846, -0.169678002595901, 0.974976003170013, 0.018494000658393, -0.142212003469467, -0.16992199420929, 0.974976003170013, 0.017699999734759, -0.142395004630089, -0.170044004917145, 0.974915027618408, 0.0170290004462, -0.142638996243477, -0.170104995369911, 0.974853992462158, 0.016541000455618, -0.142883002758026, -0.170104995369911, 0.974853992462158, 0.016112999990582, -0.143066003918648, -0.170104995369911, 0.974853992462158, 0.015625, -0.14300499856472, -0.170044004917145, 0.974853992462158, 0.01519799977541, -0.142821997404099, -0.170044004917145, 0.974915027618408, 0.015137000009418, -0.142821997404099, -0.170044004917145, 0.974915027618408, 0.015258999541402, -0.142700001597404, -0.169982999563217, 0.974915027618408, 0.015502999536693, -0.142638996243477, -0.169982999563217, 0.974915027618408, 0.015746999531984, -0.142638996243477, -0.169861003756523, 0.974915027618408, 0.016112999990582, -0.142700001597404, -0.169799998402596, 0.974915027618408, 0.01660200022161, -0.142700001597404, -0.169678002595901, 0.974976003170013, 0.017272999510169, -0.142638996243477, -0.16949500143528, 0.974976003170013, 0.01812699995935, -0.142455995082855, -0.169312000274658, 0.975036978721619, 0.018982000648975, -0.142212003469467, -0.169066995382309, 0.975098013877869, 0.019897000864148, -0.141907006502151, -0.168823003768921, 0.975158989429474, 0.020812999457121, -0.14172400534153, -0.168640002608299, 0.975220024585724, 0.021545000374317, -0.141541004180908, -0.168457001447678, 0.975220024585724, 0.022277999669313, -0.141357004642487, -0.168212994933128, 0.975281000137329, 0.02301000058651, -0.141417995095253, -0.168090999126434, 0.975281000137329, 0.023621000349522, -0.141541004180908, -0.167907997965813, 0.975281000137329, 0.024109000340104, -0.14172400534153, -0.167846992611885, 0.975281000137329, 0.024475000798702, -0.141784995794296, -0.167786002159119, 0.975220024585724, 0.024475000798702, -0.141784995794296, -0.167786002159119, 0.975220024585724, 0.024536000564694, -0.14172400534153, -0.167846992611885, 0.975220024585724, 0.024230999872088, -0.141662999987602, -0.16796900331974, 0.975220024585724, 0.023742999881506, -0.14172400534153, -0.168090999126434, 0.975220024585724, 0.023132000118494, -0.141784995794296, -0.168212994933128, 0.975220024585724, 0.022522000595927, -0.141784995794296, -0.168457001447678, 0.975158989429474, 0.021850999444723, -0.141907006502151, -0.168640002608299, 0.975158989429474, 0.021178999915719, -0.141907006502151, -0.168823003768921, 0.975098013877869, 0.020447000861168, -0.141967996954918, -0.168944999575615, 0.975098013877869, 0.019713999703526, -0.142029002308846, -0.169066995382309, 0.975098013877869, 0.018982000648975, -0.142089992761612, -0.169189006090164, 0.975098013877869, 0.018310999497771, -0.142272993922234, -0.169312000274658, 0.975036978721619, 0.017883000895381, -0.142455995082855, -0.169433996081352, 0.975036978721619, 0.017517000436783, -0.14257800579071, -0.16949500143528, 0.974976003170013, 0.017272999510169, -0.142638996243477, -0.169556006789207, 0.974976003170013, 0.017272999510169, -0.142638996243477, -0.169556006789207, 0.974976003170013, 0.017211999744177, -0.142638996243477, -0.169556006789207, 0.974976003170013, 0.017150999978185, -0.142638996243477, -0.169556006789207, 0.974976003170013, 0.017272999510169, -0.142638996243477, -0.16949500143528, 0.974976003170013, 0.017517000436783, -0.142638996243477, -0.169433996081352, 0.974976003170013, 0.017883000895381, -0.14257800579071, -0.169373005628586, 0.974976003170013, 0.018187999725342, -0.142517000436783, -0.169312000274658, 0.975036978721619, 0.018616000190377, -0.142517000436783, -0.169249996542931, 0.975036978721619, 0.018921000882983, -0.142455995082855, -0.169189006090164, 0.975036978721619, 0.019164999946952, -0.142333999276161, -0.169128000736237, 0.975036978721619, 0.019347999244928, -0.142272993922234, -0.169006004929543, 0.975098013877869, 0.019713999703526, -0.142395004630089, -0.168883994221687, 0.975098013877869, 0.020202999934554, -0.142455995082855, -0.168823003768921, 0.975036978721619, 0.020690999925137, -0.142333999276161, -0.168823003768921, 0.975098013877869, 0.02093500085175, -0.142272993922234, -0.168700993061066, 0.975098013877869, 0.02093500085175, -0.142272993922234, -0.168700993061066, 0.975098013877869, 0.02093500085175, -0.142272993922234, -0.168700993061066, 0.975098013877869, 0.02093500085175, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.02093500085175, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.020873999223113, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.020873999223113, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.020873999223113, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.020873999223113, -0.142212003469467, -0.168700993061066, 0.975098013877869, 0.020873999223113, -0.14215099811554, -0.168700993061066, 0.975098013877869, 0.020812999457121, -0.14215099811554, -0.168700993061066, 0.975098013877869, 0.020812999457121, -0.14215099811554, -0.168700993061066, 0.975098013877869, 0.020812999457121, -0.14215099811554, -0.168700993061066, 0.975098013877869, 0.020812999457121, -0.142089992761612, -0.168700993061066, 0.975098013877869, 0.020751999691129, -0.142089992761612, -0.168700993061066, 0.975098013877869, 0.020751999691129, -0.142089992761612, -0.168700993061066, 0.975098013877869, 0.020751999691129, -0.142089992761612, -0.168700993061066, 0.975158989429474, 0.020751999691129, -0.142089992761612, -0.168700993061066, 0.975158989429474, 0.020690999925137, -0.142089992761612, -0.168700993061066, 0.975158989429474, 0.020690999925137, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020690999925137, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020630000159144, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020630000159144, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020630000159144, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020630000159144, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020569000393152, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020569000393152, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.020569000393152, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.02050800062716, -0.142029002308846, -0.168700993061066, 0.975158989429474, 0.02050800062716, -0.141967996954918, -0.168700993061066, 0.975158989429474, 0.020447000861168, -0.141967996954918, -0.168700993061066, 0.975158989429474, 0.020569000393152, -0.142029002308846, -0.168640002608299, 0.975158989429474, 0.020751999691129, -0.141967996954918, -0.168578997254372, 0.975158989429474, 0.020751999691129, -0.141967996954918, -0.168578997254372, 0.975158989429474, 0.020690999925137, -0.141967996954918, -0.168578997254372, 0.975158989429474, 0.020812999457121, -0.141907006502151, -0.168518006801605, 0.975158989429474, 0.020996000617743, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.02093500085175, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.02093500085175, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.02093500085175, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.02093500085175, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.02093500085175, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.14172400534153, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020873999223113, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020812999457121, -0.141784995794296, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.168457001447678, 0.975220024585724, 0.020751999691129, -0.141846001148224, -0.16839599609375, 0.975220024585724, 0.020690999925137, -0.141846001148224, -0.16839599609375, 0.975220024585724, 0.020690999925137, -0.141846001148224, -0.16839599609375, 0.975220024585724, 0.020690999925137, -0.141846001148224, -0.16839599609375, 0.975220024585724, 0.020751999691129, -0.141907006502151, -0.16839599609375, 0.975220024585724, 0.020751999691129, -0.141907006502151, -0.16839599609375, 0.975220024585724, 0.020751999691129, -0.141907006502151, -0.16839599609375, 0.975220024585724, 0.020751999691129, -0.141907006502151, -0.16839599609375, 0.975220024585724, 0.020812999457121, -0.141907006502151, -0.16839599609375, 0.975220024585724, 0.02093500085175, -0.141907006502151, -0.168335005640984, 0.975220024585724, 0.021300999447703, -0.141967996954918, -0.168274000287056, 0.975220024585724, 0.021606000140309, -0.142029002308846, -0.168212994933128, 0.975220024585724, 0.021973000839353, -0.142089992761612, -0.168212994933128, 0.975158989429474, 0.022156000137329, -0.142089992761612, -0.168212994933128, 0.975158989429474, 0.022338999435306, -0.142212003469467, -0.168152004480362, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022583000361919, -0.142333999276161, -0.168212994933128, 0.975158989429474, 0.022338999435306, -0.142333999276161, -0.168335005640984, 0.975098013877869, 0.022034000605345, -0.142455995082855, -0.168457001447678, 0.975098013877869, 0.021666999906301, -0.14257800579071, -0.168578997254372, 0.975036978721619, 0.021239999681711, -0.142700001597404, -0.168700993061066, 0.975036978721619, 0.020812999457121, -0.142821997404099, -0.168883994221687, 0.974976003170013, 0.020385999232531, -0.14300499856472, -0.169006004929543, 0.974976003170013, 0.019897000864148, -0.143250003457069, -0.169128000736237, 0.974915027618408, 0.019470000639558, -0.143433004617691, -0.169249996542931, 0.974853992462158, 0.019043000414968, -0.143616005778313, -0.169312000274658, 0.974853992462158, 0.018555000424385, -0.143738001585007, -0.169433996081352, 0.974792003631592, 0.01812699995935, -0.143799006938934, -0.16949500143528, 0.974792003631592, 0.017821999266744, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017760999500751, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017760999500751, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017760999500751, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017699999734759, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017699999734759, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017699999734759, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017638999968767, -0.143921002745628, -0.16949500143528, 0.974792003631592, 0.017760999500751, -0.143859997391701, -0.169433996081352, 0.974792003631592, 0.017944000661373, -0.143921002745628, -0.169373005628586, 0.974792003631592, 0.018249999731779, -0.143981993198395, -0.169249996542931, 0.974792003631592, 0.018494000658393, -0.143921002745628, -0.169189006090164, 0.974792003631592, 0.018798999488354, -0.143799006938934, -0.169189006090164, 0.974853992462158, 0.018798999488354, -0.143799006938934, -0.169189006090164, 0.974853992462158, 0.018798999488354, -0.143738001585007, -0.169189006090164, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143738001585007, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018921000882983, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018859999254346, -0.143676996231079, -0.169128000736237, 0.974853992462158, 0.018798999488354, -0.143676996231079, -0.169066995382309, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169006004929543, 0.974853992462158, 0.018921000882983, -0.143799006938934, -0.169006004929543, 0.974853992462158, 0.018921000882983, -0.143738001585007, -0.169066995382309, 0.974853992462158, 0.018433000892401, -0.143371999263763, -0.169066995382309, 0.974915027618408, 0.018371999263763, -0.143371999263763, -0.169066995382309, 0.974915027618408, 0.018371999263763, -0.143371999263763, -0.169066995382309, 0.974915027618408, 0.018555000424385, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.018921000882983, -0.143493995070457, -0.169128000736237, 0.974915027618408, 0.019225999712944, -0.143433004617691, -0.169128000736237, 0.974853992462158, 0.019409000873566, -0.143433004617691, -0.169128000736237, 0.974915027618408, 0.019652999937534, -0.143433004617691, -0.169189006090164, 0.974853992462158, 0.019592000171542, -0.143433004617691, -0.169128000736237, 0.974853992462158, 0.019592000171542, -0.143433004617691, -0.169128000736237, 0.974853992462158, 0.019652999937534, -0.143493995070457, -0.169128000736237, 0.974853992462158, 0.019897000864148, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019897000864148, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019835999235511, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019835999235511, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019835999235511, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019835999235511, -0.143493995070457, -0.169066995382309, 0.974853992462158, 0.019835999235511, -0.143433004617691, -0.169066995382309, 0.974853992462158, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019774999469519, -0.143433004617691, -0.169066995382309, 0.974915027618408, 0.019713999703526, -0.143371999263763, -0.169066995382309, 0.974915027618408, 0.019713999703526, -0.143371999263763, -0.169066995382309, 0.974915027618408, 0.02008100040257, -0.143250003457069, -0.169189006090164, 0.974915027618408, 0.020690999925137, -0.142883002758026, -0.169312000274658, 0.974915027618408, 0.021728999912739, -0.142517000436783, -0.169616997241974, 0.974915027618408, 0.022522000595927, -0.142089992761612, -0.170104995369911, 0.974853992462158, 0.022949000820518, -0.14172400534153, -0.170532003045082, 0.974792003631592, 0.023375999182463, -0.141357004642487, -0.170898005366325, 0.974792003631592, 0.02386499941349, -0.140991002321243, -0.171082004904747, 0.974792003631592, 0.024048000574112, -0.140746995806694, -0.171387001872063, 0.974792003631592, 0.024230999872088, -0.140503004193306, -0.171691998839378, 0.974731028079987, 0.024109000340104, -0.140441998839378, -0.172179996967316, 0.974669992923737, 0.023803999647498, -0.14019800722599, -0.172484993934631, 0.974669992923737, 0.023499000817537, -0.139954000711441, -0.172667995095253, 0.974669992923737, 0.0234379991889, -0.139892995357513, -0.172667995095253, 0.974669992923737, 0.023132000118494, -0.139892995357513, -0.172484993934631, 0.974731028079987, 0.022949000820518, -0.140075996518135, -0.17230199277401, 0.974731028079987, 0.022826999425888, -0.140441998839378, -0.172119006514549, 0.974731028079987, 0.022826999425888, -0.140686005353928, -0.172058001160622, 0.974731028079987, 0.022826999425888, -0.140808001160622, -0.171936005353928, 0.974731028079987, 0.022461000829935, -0.140929996967316, -0.171691998839378, 0.974731028079987, 0.021911999210715, -0.141112998127937, -0.17144800722599, 0.974792003631592, 0.021484000608325, -0.141295999288559, -0.171082004904747, 0.974792003631592, 0.021239999681711, -0.141479000449181, -0.170837000012398, 0.974853992462158, 0.021057000383735, -0.14172400534153, -0.170592993497849, 0.974853992462158, 0.020996000617743, -0.142029002308846, -0.170410007238388, 0.974853992462158, 0.020996000617743, -0.142212003469467, -0.170227006077766, 0.974853992462158, 0.020873999223113, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020812999457121, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020812999457121, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142395004630089, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020751999691129, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020690999925137, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020690999925137, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020690999925137, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020690999925137, -0.142333999276161, -0.170104995369911, 0.974853992462158, 0.020630000159144, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020630000159144, -0.142395004630089, -0.170044004917145, 0.974853992462158, 0.020630000159144, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020630000159144, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020569000393152, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020569000393152, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020569000393152, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.02050800062716, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.02050800062716, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.02050800062716, -0.142333999276161, -0.170044004917145, 0.974853992462158, 0.020447000861168, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020447000861168, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020324999466538, -0.142272993922234, -0.170044004917145, 0.974853992462158, 0.020385999232531, -0.14215099811554, -0.169982999563217, 0.974915027618408, 0.020569000393152, -0.142212003469467, -0.169861003756523, 0.974915027618408, 0.020873999223113, -0.142272993922234, -0.169799998402596, 0.974915027618408, 0.021178999915719, -0.142212003469467, -0.169738993048668, 0.974915027618408, 0.021178999915719, -0.142212003469467, -0.169738993048668, 0.974915027618408, 0.021178999915719, -0.142212003469467, -0.169738993048668, 0.974915027618408, 0.021178999915719, -0.142212003469467, -0.169738993048668, 0.974915027618408, 0.021178999915719, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021118000149727, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021118000149727, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021300999447703, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021300999447703, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021300999447703, -0.14215099811554, -0.169738993048668, 0.974915027618408, 0.021300999447703, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021239999681711, -0.142089992761612, -0.169738993048668, 0.974915027618408, 0.021484000608325, -0.142212003469467, -0.169799998402596, 0.974915027618408, 0.021666999906301, -0.142212003469467, -0.16992199420929, 0.974853992462158, 0.021911999210715, -0.142212003469467, -0.169982999563217, 0.974853992462158, 0.021911999210715, -0.142212003469467, -0.169982999563217, 0.974853992462158, 0.021973000839353, -0.141967996954918, -0.170166000723839, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.14172400534153, -0.170410007238388, 0.974853992462158, 0.022095000371337, -0.141846001148224, -0.170410007238388, 0.974853992462158, 0.022034000605345, -0.141967996954918, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.14215099811554, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142333999276161, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142333999276161, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142333999276161, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.021973000839353, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.021973000839353, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.022034000605345, -0.142395004630089, -0.170410007238388, 0.974792003631592, 0.021911999210715, -0.142517000436783, -0.170470997691154, 0.974731028079987, 0.021666999906301, -0.142700001597404, -0.170592993497849, 0.974669992923737, 0.021361999213696, -0.142883002758026, -0.170715004205704, 0.974669992923737, 0.021239999681711, -0.143126994371414, -0.17077599465847, 0.974609017372131, 0.021300999447703, -0.143371999263763, -0.170837000012398, 0.974547982215881, 0.021361999213696, -0.143493995070457, -0.170898005366325, 0.974547982215881, 0.021361999213696, -0.143493995070457, -0.170898005366325, 0.974547982215881, 0.021361999213696, -0.143493995070457, -0.170898005366325, 0.974547982215881, 0.021361999213696, -0.143493995070457, -0.170898005366325, 0.974547982215881, 0.021361999213696, -0.143555000424385, -0.170898005366325, 0.974547982215881, 0.021361999213696, -0.143555000424385, -0.170898005366325, 0.974547982215881, 0.021666999906301, -0.143799006938934, -0.170898005366325, 0.974487006664276, 0.022644000127912, -0.143981993198395, -0.170958995819092, 0.974425971508026, 0.023742999881506, -0.143921002745628, -0.171082004904747, 0.974364995956421, 0.024536000564694, -0.143799006938934, -0.171142995357513, 0.974364995956421, 0.024840999394655, -0.143616005778313, -0.171082004904747, 0.974364995956421, 0.024840999394655, -0.143616005778313, -0.171082004904747, 0.974364995956421, 0.025024000555277, -0.143555000424385, -0.171082004904747, 0.974425971508026, 0.025329999625683, -0.143371999263763, -0.171265006065369, 0.974364995956421, 0.02593999914825, -0.14300499856472, -0.17144800722599, 0.974425971508026, 0.02691699936986, -0.14257800579071, -0.171630993485451, 0.974364995956421, 0.027588000521064, -0.142089992761612, -0.171875, 0.974425971508026, 0.028441999107599, -0.141479000449181, -0.172058001160622, 0.974425971508026, 0.029114000499249, -0.14105199277401, -0.172484993934631, 0.974425971508026, 0.029236000031233, -0.140503004193306, -0.173096001148224, 0.974364995956421, 0.028808999806643, -0.139954000711441, -0.17382800579071, 0.974304020404816, 0.028441999107599, -0.139342993497849, -0.174437999725342, 0.974304020404816, 0.028380999341607, -0.138977006077766, -0.174926996231079, 0.974304020404816, 0.027588000521064, -0.138488993048668, -0.175537005066872, 0.974304020404816, 0.02679399959743, -0.137999996542931, -0.176208004355431, 0.974242985248566, 0.026001000776887, -0.137511998414993, -0.176758006215096, 0.974242985248566, 0.025024000555277, -0.136902004480362, -0.177246004343033, 0.974242985248566, 0.024230999872088, -0.136536002159119, -0.177551001310349, 0.974242985248566, 0.023803999647498, -0.136353000998497, -0.177672997117043, 0.974304020404816, 0.0234379991889, -0.136107996106148, -0.17773400247097, 0.974304020404816, 0.023132000118494, -0.135924994945526, -0.17773400247097, 0.974364995956421, 0.023132000118494, -0.135924994945526, -0.17773400247097, 0.974364995956421, 0.023071000352502, -0.13586400449276, -0.17773400247097, 0.974364995956421, 0.023071000352502, -0.135986000299454, -0.177489995956421, 0.974364995956421, 0.023132000118494, -0.135986000299454, -0.177489995956421, 0.974364995956421, 0.02288799919188, -0.135986000299454, -0.177368000149727, 0.974425971508026, 0.022034000605345, -0.135924994945526, -0.177246004343033, 0.974487006664276, 0.021728999912739, -0.136107996106148, -0.176697000861168, 0.974547982215881, 0.021850999444723, -0.136230006814003, -0.176392003893852, 0.974547982215881, 0.022216999903321, -0.136902004480362, -0.176330998539925, 0.974487006664276, 0.023375999182463, -0.136962994933128, -0.176452994346619, 0.974425971508026, 0.025756999850273, -0.136962994933128, -0.176758006215096, 0.974304020404816, 0.026550000533462, -0.137268006801605, -0.17688000202179, 0.974242985248566, 0.02691699936986, -0.137450993061066, -0.176513999700546, 0.974242985248566, 0.02734399959445, -0.137633994221687, -0.176452994346619, 0.974242985248566, 0.02777099981904, -0.137694999575615, -0.176575005054474, 0.97418200969696, 0.027953999117017, -0.137756004929543, -0.176513999700546, 0.97418200969696, 0.027649000287056, -0.137939006090164, -0.176208004355431, 0.974242985248566, 0.02691699936986, -0.137939006090164, -0.175963997840881, 0.974304020404816, 0.026550000533462, -0.137816995382309, -0.175659000873566, 0.974364995956421, 0.026672000065446, -0.137816995382309, -0.175414994359016, 0.974425971508026, 0.026977999135852, -0.138062000274658, -0.175049006938934, 0.974425971508026, 0.027100000530481, -0.138306006789207, -0.174743995070457, 0.974425971508026, 0.026732999831438, -0.138549998402596, -0.174316003918648, 0.974487006664276, 0.026244999840856, -0.138794004917145, -0.17382800579071, 0.974547982215881, 0.025878999382257, -0.138916000723839, -0.173339992761612, 0.974669992923737, 0.025268999859691, -0.13909900188446, -0.172851994633675, 0.974731028079987, 0.024718999862671, -0.13909900188446, -0.172362998127937, 0.974853992462158, 0.024230999872088, -0.139160007238388, -0.171753004193306, 0.974915027618408, 0.024170000106096, -0.139282003045082, -0.171204000711441, 0.975036978721619, 0.02398700080812, -0.13952599465847, -0.17077599465847, 0.975036978721619, 0.023682000115514, -0.139587000012398, -0.170410007238388, 0.975158989429474, 0.023375999182463, -0.13952599465847, -0.170044004917145, 0.975220024585724, 0.023132000118494, -0.13952599465847, -0.169738993048668, 0.975281000137329, 0.02301000058651, -0.139587000012398, -0.169373005628586, 0.975341975688934, 0.02301000058651, -0.139770999550819, -0.169128000736237, 0.975341975688934, 0.023071000352502, -0.139770999550819, -0.169128000736237, 0.975341975688934, 0.023071000352502, -0.139770999550819, -0.169128000736237, 0.975341975688934, 0.022704999893904, -0.139587000012398, -0.169189006090164, 0.975341975688934, 0.021973000839353, -0.139648005366325, -0.169312000274658, 0.975341975688934, 0.021973000839353, -0.139954000711441, -0.168883994221687, 0.975403010845184, 0.022277999669313, -0.140258997678757, -0.168518006801605, 0.975403010845184, 0.022765999659896, -0.140503004193306, -0.168029993772507, 0.975403010845184, 0.023192999884486, -0.140686005353928, -0.167603000998497, 0.97546398639679, 0.023621000349522, -0.140686005353928, -0.167297005653381, 0.97552502155304, 0.02398700080812, -0.140686005353928, -0.167052999138832, 0.97552502155304, 0.024352999404073, -0.140686005353928, -0.166931003332138, 0.97552502155304, 0.024413999170065, -0.140686005353928, -0.166931003332138, 0.97552502155304, 0.024352999404073, -0.140686005353928, -0.166931003332138, 0.97552502155304, 0.024352999404073, -0.140686005353928, -0.166931003332138, 0.97552502155304, 0.024352999404073, -0.140869006514549, -0.166991993784904, 0.97552502155304, 0.024291999638081, -0.140869006514549, -0.166991993784904, 0.97552502155304, 0.024230999872088, -0.140869006514549, -0.166991993784904, 0.97552502155304, 0.024230999872088, -0.140991002321243, -0.16686999797821, 0.97552502155304, 0.024475000798702, -0.14105199277401, -0.166931003332138, 0.97552502155304, 0.024779999628663, -0.141174003481865, -0.166991993784904, 0.97546398639679, 0.025024000555277, -0.141174003481865, -0.167052999138832, 0.97546398639679, 0.025024000555277, -0.141174003481865, -0.167052999138832, 0.97546398639679, 0.025024000555277, -0.141174003481865, -0.167052999138832, 0.97546398639679, 0.025024000555277, -0.141174003481865, -0.167052999138832, 0.97546398639679, 0.025085000321269, -0.141295999288559, -0.166991993784904, 0.975403010845184, 0.025268999859691, -0.141479000449181, -0.166991993784904, 0.975403010845184, 0.025268999859691, -0.141479000449181, -0.166991993784904, 0.975403010845184, 0.025268999859691, -0.141479000449181, -0.166991993784904, 0.975403010845184, 0.024840999394655, -0.141357004642487, -0.166991993784904, 0.97546398639679, 0.024840999394655, -0.141357004642487, -0.166931003332138, 0.97546398639679, 0.024475000798702, -0.141112998127937, -0.166748002171516, 0.97552502155304, 0.024352999404073, -0.140625, -0.166565001010895, 0.97564697265625, 0.024475000798702, -0.139770999550819, -0.166260004043579, 0.975830018520355, 0.025635000318289, -0.139282003045082, -0.165955007076263, 0.97589099407196, 0.027100000530481, -0.139282003045082, -0.165465995669365, 0.97595202922821, 0.027892999351025, -0.139648005366325, -0.165222004055977, 0.97589099407196, 0.027465999126434, -0.13952599465847, -0.165039002895355, 0.97595202922821, 0.027404999360442, -0.139465004205704, -0.165039002895355, 0.97595202922821, 0.027831999585032, -0.139342993497849, -0.16473400592804, 0.976013004779816, 0.028258999809623, -0.139342993497849, -0.16448999941349, 0.976073980331421, 0.028319999575615, -0.139648005366325, -0.164368003606796, 0.976013004779816, 0.028319999575615, -0.140015006065369, -0.164428994059563, 0.97595202922821, 0.028319999575615, -0.140380993485451, -0.164794996380806, 0.975830018520355, 0.028258999809623, -0.140746995806694, -0.165160998702049, 0.975768983364105, 0.027892999351025, -0.141112998127937, -0.165465995669365, 0.97564697265625, 0.02734399959445, -0.141417995095253, -0.165648996829987, 0.975585997104645, 0.027282999828458, -0.141417995095253, -0.165648996829987, 0.975585997104645, 0.02691699936986, -0.141295999288559, -0.165648996829987, 0.975585997104645, 0.026854999363422, -0.141295999288559, -0.165648996829987, 0.97564697265625, 0.027100000530481, -0.141601994633675, -0.165648996829987, 0.975585997104645, 0.027404999360442, -0.141967996954918, -0.165710002183914, 0.97552502155304, 0.027404999360442, -0.141907006502151, -0.165770992636681, 0.97552502155304, 0.027100000530481, -0.142029002308846, -0.166077002882957, 0.975403010845184, 0.026550000533462, -0.142455995082855, -0.166320994496346, 0.975341975688934, 0.026184000074863, -0.143310993909836, -0.166565001010895, 0.975158989429474, 0.02636699937284, -0.144287005066872, -0.166443005204201, 0.975036978721619, 0.026550000533462, -0.144713997840881, -0.166443005204201, 0.974976003170013, 0.02691699936986, -0.144896999001503, -0.166320994496346, 0.974976003170013, 0.027282999828458, -0.145019993185997, -0.166320994496346, 0.974976003170013, 0.027527000755072, -0.145019993185997, -0.166381999850273, 0.974915027618408, 0.027527000755072, -0.145080998539925, -0.166381999850273, 0.974915027618408, 0.027527000755072, -0.145019993185997, -0.166381999850273, 0.974915027618408, 0.027465999126434, -0.145019993185997, -0.166381999850273, 0.974915027618408, 0.027588000521064, -0.144958004355431, -0.166260004043579, 0.974976003170013, 0.028015000745654, -0.144775003194809, -0.166137993335724, 0.974976003170013, 0.028380999341607, -0.14453099668026, -0.16601599752903, 0.975036978721619, 0.028503000736237, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028503000736237, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028503000736237, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028441999107599, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028441999107599, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028441999107599, -0.144225999712944, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144164994359016, -0.165955007076263, 0.975098013877869, 0.028319999575615, -0.14410400390625, -0.165955007076263, 0.975098013877869, 0.028319999575615, -0.14410400390625, -0.165955007076263, 0.975098013877869, 0.028319999575615, -0.14410400390625, -0.165955007076263, 0.975098013877869, 0.028258999809623, -0.14410400390625, -0.165955007076263, 0.975098013877869, 0.028258999809623, -0.14410400390625, -0.165955007076263, 0.975098013877869, 0.028258999809623, -0.144042998552322, -0.165955007076263, 0.975098013877869, 0.028258999809623, -0.144042998552322, -0.165955007076263, 0.975098013877869, 0.028258999809623, -0.144042998552322, -0.165955007076263, 0.975098013877869, 0.028198000043631, -0.144042998552322, -0.165955007076263, 0.975098013877869, 0.028380999341607, -0.144042998552322, -0.16601599752903, 0.975098013877869, 0.028380999341607, -0.144042998552322, -0.16601599752903, 0.975098013877869, 0.028319999575615, -0.143981993198395, -0.16601599752903, 0.975098013877869, 0.028319999575615, -0.143981993198395, -0.16601599752903, 0.975098013877869, 0.028319999575615, -0.143981993198395, -0.16601599752903, 0.975098013877869, 0.02874800004065, -0.143921002745628, -0.166137993335724, 0.975098013877869, 0.029724000021815, -0.143859997391701, -0.166320994496346, 0.975036978721619, 0.029784999787807, -0.143981993198395, -0.166626006364822, 0.974976003170013, 0.029479999095201, -0.143921002745628, -0.16686999797821, 0.974976003170013, 0.029479999095201, -0.143921002745628, -0.16686999797821, 0.974976003170013, 0.029479999095201, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143799006938934, -0.16686999797821, 0.974976003170013, 0.029418999329209, -0.143859997391701, -0.16686999797821, 0.974976003170013, 0.029236000031233, -0.143981993198395, -0.16686999797821, 0.974976003170013, 0.029053000733256, -0.14410400390625, -0.16686999797821, 0.974915027618408, 0.028869999572635, -0.144225999712944, -0.16686999797821, 0.974915027618408, 0.02874800004065, -0.144409000873566, -0.166748002171516, 0.974915027618408, 0.02874800004065, -0.144409000873566, -0.166748002171516, 0.974915027618408, 0.028503000736237, -0.144347995519638, -0.166748002171516, 0.974915027618408, 0.028258999809623, -0.144225999712944, -0.166808992624283, 0.974976003170013, 0.027892999351025, -0.144164994359016, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.144164994359016, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.144164994359016, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027527000755072, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027465999126434, -0.14410400390625, -0.166808992624283, 0.974976003170013, 0.027649000287056, -0.144225999712944, -0.16686999797821, 0.974976003170013, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.027892999351025, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027892999351025, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027892999351025, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027892999351025, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027892999351025, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144470006227493, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.027831999585032, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.02777099981904, -0.144409000873566, -0.16686999797821, 0.974915027618408, 0.027710000053048, -0.144409000873566, -0.166808992624283, 0.974915027618408, 0.027710000053048, -0.144409000873566, -0.166808992624283, 0.974915027618408, 0.027527000755072, -0.144287005066872, -0.166931003332138, 0.974976003170013, 0.027282999828458, -0.144225999712944, -0.166991993784904, 0.974976003170013, 0.027039000764489, -0.144287005066872, -0.166991993784904, 0.974976003170013, 0.027039000764489, -0.144287005066872, -0.166991993784904, 0.974976003170013, 0.027039000764489, -0.144287005066872, -0.166991993784904, 0.974976003170013, 0.026672000065446, -0.144164994359016, -0.166991993784904, 0.974976003170013, 0.026611000299454, -0.14410400390625, -0.166991993784904, 0.974976003170013, 0.026611000299454, -0.14410400390625, -0.166991993784904, 0.974976003170013, 0.02679399959743, -0.144225999712944, -0.166991993784904, 0.974976003170013, 0.02679399959743, -0.144225999712944, -0.166991993784904, 0.974976003170013, 0.02679399959743, -0.144287005066872, -0.166991993784904, 0.974976003170013, 0.02679399959743, -0.144225999712944, -0.166991993784904, 0.974976003170013, 0.026732999831438, -0.144225999712944, -0.166991993784904, 0.974976003170013, 0.02691699936986, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.02691699936986, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.02691699936986, -0.144164994359016, -0.166931003332138, 0.974976003170013, 0.02691699936986, -0.144164994359016, -0.166931003332138, 0.974976003170013, 0.026854999363422, -0.144164994359016, -0.166931003332138, 0.974976003170013, 0.026854999363422, -0.144164994359016, -0.166931003332138, 0.974976003170013, 0.026854999363422, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.02679399959743, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.02679399959743, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.02679399959743, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.026732999831438, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.026732999831438, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.026672000065446, -0.14410400390625, -0.166931003332138, 0.974976003170013, 0.026672000065446, -0.144042998552322, -0.166931003332138, 0.974976003170013, 0.026672000065446, -0.144042998552322, -0.166931003332138, 0.974976003170013, 0.026672000065446, -0.144042998552322, -0.166931003332138, 0.975036978721619, 0.026672000065446, -0.144042998552322, -0.166931003332138, 0.975036978721619, 0.026611000299454, -0.144042998552322, -0.166931003332138, 0.975036978721619, 0.026611000299454, -0.144042998552322, -0.166931003332138, 0.975036978721619, 0.026611000299454, -0.144042998552322, -0.166931003332138, 0.975036978721619, 0.026611000299454, -0.143981993198395, -0.166931003332138, 0.975036978721619, 0.026611000299454, -0.143981993198395, -0.166931003332138, 0.975036978721619, 0.026550000533462, -0.143981993198395, -0.166931003332138, 0.975036978721619, 0.026550000533462, -0.143981993198395, -0.166931003332138, 0.975036978721619, 0.026550000533462, -0.143981993198395, -0.166931003332138, 0.975036978721619, 0.026489000767469, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026489000767469, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026489000767469, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026489000767469, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026489000767469, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026427999138832, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.026427999138832, -0.143921002745628, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.026427999138832, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143859997391701, -0.16686999797821, 0.975036978721619, 0.02636699937284, -0.143799006938934, -0.16686999797821, 0.975036978721619, 0.026305999606848, -0.143799006938934, -0.16686999797821, 0.975036978721619, 0.026305999606848, -0.143799006938934, -0.16686999797821, 0.975036978721619, 0.026244999840856, -0.143799006938934, -0.16686999797821, 0.975036978721619, 0.026489000767469, -0.143859997391701, -0.166931003332138, 0.975036978721619, 0.026489000767469, -0.143859997391701, -0.166931003332138, 0.975036978721619, 0.026550000533462, -0.143859997391701, -0.166931003332138, 0.975036978721619, 0.026305999606848, -0.143799006938934, -0.166931003332138, 0.975036978721619 ], [ 15.629336, 38.804982000000003, 53.063895000000002, 75.587496999999999, 98.835140999999993, 112.977501000000004, 135.679889000000003, 158.672652999999997, 173.101285999999988, 195.648930000000007, 218.800144999999986, 233.129236999999989, 255.564188000000001, 278.840750000000014, 301.241497999999979, 315.642487000000017, 338.928164999999979, 361.478230999999994, 375.554427999999973, 398.701221999999973, 421.21536500000002, 435.597516999999982, 458.10167100000001, 481.478071999999997, 495.632870000000025, 518.158671000000027, 549.570753999999965, 555.577126000000021, 578.33140400000002, 601.33243600000003, 615.776697000000013, 638.182766000000015, 661.485293999999953, 675.860899000000018, 698.113628999999946, 721.300641000000041, 735.675963000000024, 758.10910100000001, 781.319524999999999, 795.529323999999974, 818.104766000000041, 841.259952999999996, 855.602209000000016, 878.055777000000035, 901.363258999999971, 915.695169999999962, 938.17659900000001, 961.307422999999972, 975.509300000000053, 998.329040999999961, 1021.372871000000032, 1035.64678200000003, 1058.40037099999995, 1081.480037999999922, 1095.698217999999997, 1118.090134000000035, 1141.342926999999918, 1155.843969999999899, 1178.114581000000044, 1201.363043000000062, 1215.775304000000006, 1246.976137000000108, 1261.35043399999995, 1275.609752999999955, 1298.448705000000018, 1321.292619999999943, 1335.576321000000007, 1358.422546000000011, 1381.448560000000043, 1395.705439999999953, 1418.209556999999904, 1441.326461000000108, 1455.689241000000038, 1478.117582999999968, 1501.394508999999971, 1524.009686999999985, 1538.195490000000063, 1561.280481999999893, 1583.768399000000045, 1606.481536000000006, 1621.564137999999957, 1643.914297000000033, 1658.173588999999993, 1680.6192759999999, 1703.840048000000024, 1718.268595999999889, 1740.688157000000047, 1763.782662000000073, 1779.5316949999999, 1800.743754000000081, 1823.816988999999921, 1838.130695999999944, 1860.752529000000095, 1883.775579999999991, 1898.102196000000049, 1920.642493000000059, 1943.885066000000052, 1958.063585999999987, 1980.702939000000015, 2004.066254999999956, 2018.205290999999988, 2040.64429599999994, 2064.046898000000056, 2078.156132000000071, 2100.658508999999867, 2123.750360999999884, 2138.078912999999829, 2160.602158000000145, 2183.794708999999784, 2198.10996699999987, 2220.684483, 2243.877382000000125, 2258.184953999999834, 2280.674563000000035, 2303.854366000000027, 2318.171096999999918, 2340.626502000000073, 2363.793416999999863, 2378.084995000000163, 2400.710517999999865, 2423.994698999999855, 2438.244405999999799, 2460.651824000000033, 2483.252919999999904, 2498.160433999999896, 2520.755102000000079, 2543.980110999999852, 2558.120519999999942, 2580.810876000000007, 2603.909771999999975, 2618.186992999999802, 2640.703266999999869, 2663.789369999999963, 2678.206663999999819, 2700.840983000000051, 2723.204392000000098, 2738.199943000000076, 2760.795939000000089, 2783.306638000000021, 2806.38198599999987, 2820.735397999999805, 2843.162456999999904, 2866.35558600000013, 2880.655666999999994, 2912.211037000000033, 2926.369778000000224, 2940.636705999999776, 2963.206717000000026, 2986.399974999999813, 3000.699707000000217, 3023.168183000000226, 3046.565106999999898, 3060.61615699999993, 3083.301886000000195, 3106.408096999999998, 3120.807123999999931, 3143.180374000000029, 3166.35260100000005, 3180.794926999999916, 3203.214574000000084, 3226.326888000000054, 3242.120108000000073, 3263.127128999999968, 3286.509306999999808, 3300.597921000000042, 3323.119772999999896, 3346.344985000000179, 3360.693909000000076, 3383.110135999999784, 3406.593953000000056, 3420.802564999999959, 3443.304573999999775, 3466.405724000000191, 3480.744267000000036, 3503.192368999999871, 3526.401120999999875, 3540.666605999999774, 3563.201750000000175, 3586.39401399999997, 3602.096919000000071, 3623.196998999999778, 3645.957852000000003, 3660.951215000000047, 3683.210368000000017, 3705.76805400000012, 3720.719387000000097, 3744.724092999999812, 3765.832312000000002, 3780.603205999999773, 3803.260514999999941, 3825.932299000000057, 3840.717846999999892, 3863.305212000000211, 3885.678625000000011, 3900.771074000000226, 3923.328156999999919, 3945.607074000000011, 3960.68458499999997, 3983.136101000000053, 4005.746631999999863, 4020.78221399999984, 4043.229557000000113, 4065.962219999999888, 4088.908590000000004, 4103.188992000000326, 4125.831712000000152, 4149.000025000000278, 4163.262864000000263, 4185.827586000000338, 4208.899655999999595, 4223.21716699999979, 4245.843179999999847, 4268.952001999999993, 4283.190768999999818, 4305.774247000000287, 4328.906778999999915, 4343.252873999999792, 4365.763555000000451, 4388.927263999999923, 4403.278279000000111, 4425.602391000000353, 4449.007034000000203, 4463.208849999999984, 4485.776252999999997, 4509.107813999999962, 4523.332609000000048, 4545.820921999999882, 4568.208319000000301, 4583.306757999999718, 4605.854621000000407, 4628.222329000000173, 4643.183766000000105, 4665.915705000000344, 4688.203612000000248, 4703.217405999999755, 4725.964197999999669, 4748.353782000000137, 4763.112904999999955, 4785.710111999999754, 4808.320477999999639, 4823.256575999999768, 4845.771789000000354, 4868.314601000000039, 4883.162615000000187, 4905.746164999999564, 4928.248985000000175, 4951.382091000000401, 4966.016292999999678, 4988.366278999999849, 5003.35001900000043, 5025.771528999999646, 5048.284684999999627, 5063.32632300000023, 5085.803428999999596, 5108.206879000000299, 5131.483997000000272, 5145.687681000000339, 5168.280633000000307, 5183.187144999999873, 5205.942393000000266, 5228.314876999999797, 5243.20702700000038, 5265.651952999999594, 5288.316522000000077, 5310.777208999999857, 5325.766864000000169, 5348.210321999999906, 5371.43729600000006, 5385.802722999999787, 5408.245716999999786, 5431.503552000000127, 5445.890366999999969, 5468.252701000000343, 5491.427738999999747, 5505.978490999999849, 5528.449381000000358, 5550.877951000000394, 5565.688694000000396, 5588.195341999999982, 5610.926354000000174, 5625.884326999999757, 5648.283674000000246, 5670.828034000000116, 5688.767410000000382, 5708.2715019999996, 5730.967768000000433, 5745.695507000000362, 5768.303152000000409, 5790.82926899999984, 5805.814193000000159, 5828.162319000000025, 5850.768578000000161, 5865.793730999999752, 5888.313229999999749, 5910.742363000000296, 5925.716301999999814, 5948.178686999999627, 5970.817866999999751, 5985.662202000000434, 6008.289875000000393, 6030.95360299999993, 6045.775290999999925, 6068.249698999999964, 6090.767815999999584, 6105.967730999999731, 6128.329889999999978, 6150.910171000000446, 6165.709592999999586, 6188.301081999999951, 6210.736413999999968, 6225.684215000000222, 6248.253539999999703, 6270.88159799999994, 6287.456793000000289, 6308.297550999999658, 6330.768340999999964, 6347.233768000000055, 6368.275579000000107, 6390.883888000000297, 6407.153003000000353, 6428.244383000000198, 6450.696264000000156, 6467.1733320000003, 6488.274214000000029, 6510.684524999999667, 6527.208964000000378, 6548.348962000000029, 6572.170785000000251, 6593.250230999999985, 6608.216666000000259, 6630.859644999999546, 6653.272028000000319, 6668.223739000000023, 6690.883756999999605, 6713.439395000000331, 6731.122236999999586, 6750.739728999999897, 6773.327640999999858, 6788.300516000000243, 6810.760333000000173, 6833.253013999999894, 6848.466527999999926, 6870.807832000000417, 6893.375936000000365, 6908.392155999999886, 6930.732073999999557, 6953.376328000000285, 6968.384771000000001, 6990.776246000000356, 7013.41157899999962, 7028.414354999999887, 7050.674259999999776, 7073.329458000000159, 7088.293083999999908, 7110.971794000000045, 7133.449015999999574, 7148.482543000000078, 7170.839485000000423, 7193.244099999999889, 7208.373021000000335, 7230.712059000000409, 7253.409357000000455, 7269.71186200000011, 7290.834270999999717, 7313.343480999999883, 7329.756956000000173, 7352.153806000000259, 7373.308923999999934, 7389.695752999999968, 7410.729204000000209, 7433.287196000000222, 7449.826493999999911, 7470.897291999999652, 7493.437253000000055, 7509.664324000000306, 7530.898060999999871, 7553.31541500000003, 7569.687804000000142, 7590.869469999999637, 7613.28166500000043, 7629.811636999999791, 7650.759844000000157, 7673.278449000000364, 7689.737341000000015, 7710.788641000000098, 7733.422873000000436, 7749.929965000000266, 7770.914950999999746, 7793.378346999999849, 7815.991132000000107, 7830.818309999999656, 7853.33967500000017, 7875.733761000000413, 7890.850067000000308, 7913.5410609999999, 7935.75817300000017, 7950.898138999999901, 7973.379256000000169, 7995.974422000000231, 8010.77213699999993, 8033.388224999999693, 8055.811714000000393, 8070.791051999999581, 8093.413720999999896, 8115.981329000000187, 8130.918982000000142, 8153.324649000000136, 8184.206414999999652, 8192.216429000000062, 8213.317740000000413, 8235.923468999999386, 8252.295530999999755, 8273.535085999999865, 8295.83642399999917, 8312.276244999999108, 8333.235582999999679, 8355.877259000000777, 8372.206511000000319, 8393.320766000000731, 8416.050092999999833, 8432.335027999999511, 8461.483854000000065, 8475.777926999999181, 8492.192576999999801, 8513.383510999999999, 8535.827719000000798, 8552.236844999999448, 8573.377873999999792, 8596.087004999999408, 8612.285540000000765, 8633.492711999999301, 8655.847648000000845, 8672.26168300000063, 8693.385424000000057, 8715.841828000000532, 8732.226391000000149, 8753.341394999999466, 8775.768464999999196, 8792.563802999999098, 8813.442654000000402, 8835.887241000000358, 8852.240610999999262, 8873.423322000000553, 8895.847235999999612, 8912.315558000000237, 8933.388944000000265, 8955.959826000000248, 8972.265676999999414, 8993.421481999999742, 9017.458941000000777, 9032.315780999999333, 9053.390874000000622, 9075.909761000000799, 9098.338410000000295, 9114.899441999999908, 9135.915176000000429, 9158.336905000000115, 9174.816086999999243, 9196.001306000000113, 9218.308135999999649, 9236.289907000000312, 9255.878427999999985, 9278.304024999999456, 9295.032623999999487, 9315.963134999999966, 9338.375878000000739, 9354.813981999999669, 9375.804335000000719, 9398.541976000000432, 9414.999600999999529, 9435.9849549999999, 9458.328799999999319, 9474.868897000000288, 9495.91818400000011, 9518.306235000000015, 9534.816303999999946, 9556.105938999999125, 9578.285783999999694, 9594.82832899999994, 9615.83941600000071, 9638.345477000000756, 9655.038533000000825, 9675.820067000000563, 9698.31571299999996, 9714.747214999999414, 9735.952457999999751, 9758.39479399999982, 9774.822598999999173, 9796.204863000000842, 9818.290236999999252, 9834.774351000000024, 9856.519695999999385, 9878.400354999999763, 9894.825532999999268, 9915.921747000000323, 9938.364236999999775, 9954.767281000000366, 9975.940754999999626, 9998.32191899999998, 10014.942162999999709, 10035.805025999999998, 10058.308580999999322, 10074.783556000000317, 10097.249814999999217, 10118.341645000000426, 10134.821164000000863, 10157.53517599999941, 10178.389381000000867, 10194.772847000000183, 10217.318746000000829, 10238.340057999999772, 10254.804861000000528, 10277.283464000000095, 10298.390653000000384, 10320.851205000000846, 10343.346917999999278, 10358.330429999999978, 10389.12846399999944, 10404.741830999999365, 10418.25408299999981, 10440.912034999999378, 10457.25512499999968, 10478.24064399999952, 10501.123964000000342, 10517.446372000000338, 10538.430736000000252, 10560.854091999999582, 10577.233011000000261, 10600.013229000000138, 10620.995193000000654, 10637.284478999999919, 10658.272573000000193, 10680.797720000000481, 10697.282560999999987, 10718.456104999999297, 10740.956786999999167, 10757.371630999999979, 10778.301401999999143, 10801.051309000000401, 10817.559895000000324, 10838.382086999999956, 10860.968409999999494, 10877.248059999999896, 10898.356432000000495, 10920.924568000000363, 10937.331115999999383, 10958.460347000000183, 10981.083785000000717, 10997.331318000000465, 11019.833212999999887, 11040.874998999999661, 11057.371917000000394, 11079.986730000000534, 11100.905165000000125, 11117.543657000000167, 11139.832571999999345, 11160.925460000000385, 11177.347851000000446, 11199.977355000000898, 11220.991271999999299, 11237.289897000000565, 11259.870114999999714, 11280.938582000000679, 11297.44036799999958, 11319.809572000000117, 11340.971848999999565, 11357.602267000000211, 11379.775706000000355, 11400.889001999999891, 11417.337520999999469, 11439.866954999999507, 11460.823964999999589, 11477.300053999999363, 11500.155743999999686, 11520.917240999999194, 11537.289069000000381, 11559.829476999999315, 11580.964490000000296, 11603.461090000000695, 11619.936698999999862, 11640.929602000000159, 11663.458855999999287, 11679.804307000000335, 11700.900002000000313, 11723.535759000000326, 11739.827370000000883, 11761.1235429999997, 11783.431495000000723, 11799.813846999999441, 11820.909577000000354, 11843.631554999999935, 11859.76457499999924, 11880.837564999999813, 11903.382674000000407, 11919.832339000000502, 11940.998657000000094, 11963.365400000000591, 11979.951440999999249, 12002.700791999999637, 12023.465393000000404, 12039.88022699999965, 12062.404940000000352, 12083.580146000000241, 12099.786895999999615, 12122.551038999999946, 12143.481300999999803, 12159.815683999999237, 12182.363226999999824, 12206.326580999999351, 12219.842978000000585, 12242.358401999999842, 12263.519363999999769, 12279.980799999999363, 12302.416171000000759, 12326.343270999999731, 12339.990766999999323, 12362.408494999999675, 12383.414431999999579, 12399.812846999999238, 12422.388182000000597, 12443.356082000000242, 12459.888361999999688, 12482.536425000000236, 12503.322808999999324, 12519.815345000000889, 12542.413735000000088, 12563.352946999999403, 12579.870394999999917, 12602.376897000000099, 12626.301885999999286, 12639.839108000000124, 12662.360961000000316, 12683.57752199999959, 12700.15802900000017, 12722.387917000000016, 12744.893272999999681, 12759.841186999999991, 12782.517689000000246, 12803.444919999999911, 12826.024922000000515, 12842.351314999999886, 12863.484012999999322, 12885.967107000000397, 12902.399117999999362, 12924.891407999999501, 12946.004779000000781, 12962.584613999999419, 12984.890121000000363, 13006.018575000000055, 13022.375082000000475 ], 0, 0, 0, 0 ], [ 3000, 451, 25.0, 13022.375082000000475, 1, 4, 0, [ -0.155212000012398, 0.027039000764489, 0.499451011419296, 0.851806998252869, -0.151672005653381, 0.030151000246406, 0.500732004642487, 0.851624011993408, -0.148071005940437, 0.033325001597404, 0.501403987407684, 0.851746022701263, -0.145934998989105, 0.036254998296499, 0.501098990440369, 0.85217297077179, -0.145447000861168, 0.038513001054525, 0.50018298625946, 0.852721989154816, -0.144896999001503, 0.040405001491308, 0.498901009559631, 0.853455007076263, -0.144347995519638, 0.042419001460075, 0.497191995382309, 0.854492008686066, -0.144225999712944, 0.04449500143528, 0.495299994945526, 0.855468988418579, -0.145142003893852, 0.045837000012398, 0.493346989154816, 0.856383979320526, -0.146667003631592, 0.046936001628637, 0.491394013166428, 0.857177972793579, -0.147339001297951, 0.047791000455618, 0.48938000202179, 0.858153998851776, -0.148620992898941, 0.04797400161624, 0.487549006938934, 0.859009027481079, -0.149657994508743, 0.047607000917196, 0.486023008823395, 0.859679996967316, -0.150695994496346, 0.047180000692606, 0.484497010707855, 0.860351979732513, -0.151978000998497, 0.046326000243425, 0.483276009559631, 0.86090099811554, -0.153136998414993, 0.045715000480413, 0.482116997241974, 0.861388981342316, -0.154541000723839, 0.045166000723839, 0.481018006801605, 0.861755013465881, -0.15582300722599, 0.043884001672268, 0.480408012866974, 0.861937999725342, -0.156737998127937, 0.043152000755072, 0.479736000299454, 0.862182974815369, -0.157837003469467, 0.042479999363422, 0.47918701171875, 0.862304985523224, -0.159424006938934, 0.041870001703501, 0.478821009397507, 0.862244009971619, -0.160338997840881, 0.041138000786304, 0.478394001722336, 0.862366020679474, -0.161498993635178, 0.040160998702049, 0.478271007537842, 0.862244009971619, -0.162047997117043, 0.039856001734734, 0.478271007537842, 0.862182974815369, -0.162169992923737, 0.039795000106096, 0.478271007537842, 0.862182974815369, -0.163085997104645, 0.0390620008111, 0.478516012430191, 0.861877024173737, -0.163696005940437, 0.038391001522541, 0.478821009397507, 0.861633002758026, -0.163818001747131, 0.038024999201298, 0.479126006364822, 0.861450016498566, -0.163939997553825, 0.037291999906301, 0.479431003332138, 0.86126697063446, -0.163573995232582, 0.036804001778364, 0.479553014039993, 0.86132800579071, -0.163085997104645, 0.036743000149727, 0.479674994945526, 0.86132800579071, -0.162597998976707, 0.036499001085758, 0.479613989591599, 0.861450016498566, -0.162659004330635, 0.036194000393152, 0.479431003332138, 0.861572027206421, -0.163025006651878, 0.035828001797199, 0.47918701171875, 0.861633002758026, -0.163451999425888, 0.035277999937534, 0.478882014751434, 0.861755013465881, -0.164123997092247, 0.034240998327732, 0.478455007076263, 0.861937999725342, -0.164611995220184, 0.033507999032736, 0.477721989154816, 0.862244009971619, -0.164185002446175, 0.033569000661373, 0.477111995220184, 0.86267101764679, -0.163939997553825, 0.032898001372814, 0.476379007101059, 0.863159000873566, -0.165527001023293, 0.031371999531984, 0.475585997104645, 0.863341987133026, -0.166443005204201, 0.030517999082804, 0.474792003631592, 0.863646984100342, -0.165343999862671, 0.030212000012398, 0.47418200969696, 0.864197015762329, -0.164428994059563, 0.029784999787807, 0.473266988992691, 0.864867985248566, -0.164673000574112, 0.029236000031233, 0.472351014614105, 0.865356028079987, -0.165160998702049, 0.028564000502229, 0.471619009971619, 0.865661978721619, -0.165648996829987, 0.027465999126434, 0.470885992050171, 0.866028010845184, -0.166077002882957, 0.02636699937284, 0.469971001148224, 0.866455018520355, -0.16558800637722, 0.025635000318289, 0.46893298625946, 0.867125988006592, -0.164977997541428, 0.025513000786304, 0.467833995819092, 0.86785900592804, -0.164917007088661, 0.025268999859691, 0.466735988855362, 0.868468999862671, -0.165343999862671, 0.024901999160647, 0.465698003768921, 0.868957996368408, -0.165710002183914, 0.024170000106096, 0.464599996805191, 0.869507014751434, -0.164977997541428, 0.024048000574112, 0.463440001010895, 0.870239019393921, -0.164428994059563, 0.023925999179482, 0.462341010570526, 0.870971977710724, -0.165099993348122, 0.023314999416471, 0.461120992898941, 0.871460020542145, -0.16601599752903, 0.02301000058651, 0.460144013166428, 0.871825993061066, -0.166260004043579, 0.022765999659896, 0.459351003170013, 0.872192025184631, -0.166686996817589, 0.022095000371337, 0.458617985248566, 0.872559010982513, -0.167297005653381, 0.021239999681711, 0.458007991313934, 0.872802972793579, -0.167541995644569, 0.02093500085175, 0.457457989454269, 0.87304699420929, -0.167603000998497, 0.020690999925137, 0.457213997840881, 0.87310802936554, -0.167846992611885, 0.020142000168562, 0.457091987133026, 0.873169004917145, -0.167907997965813, 0.019774999469519, 0.456970006227493, 0.87322998046875, -0.167480006814003, 0.019225999712944, 0.456970006227493, 0.873291015625, -0.167357996106148, 0.018859999254346, 0.457091987133026, 0.873291015625, -0.167846992611885, 0.018066000193357, 0.457275003194809, 0.87310802936554, -0.168335005640984, 0.017333999276161, 0.457520008087158, 0.872924983501434, -0.168274000287056, 0.016784999519587, 0.457763999700546, 0.872802972793579, -0.167419001460075, 0.016541000455618, 0.458068996667862, 0.872802972793579, -0.166808992624283, 0.016295999288559, 0.45831298828125, 0.872802972793579, -0.166808992624283, 0.01605200022459, 0.458617985248566, 0.872619986534119, -0.166686996817589, 0.015564000234008, 0.459044992923737, 0.872437000274658, -0.166137993335724, 0.01519799977541, 0.459289997816086, 0.872437000274658, -0.16558800637722, 0.015014999546111, 0.459594994783401, 0.872375011444092, -0.165222004055977, 0.014893000014126, 0.45983898639679, 0.872313976287842, -0.16473400592804, 0.014953999780118, 0.460022002458572, 0.872313976287842, -0.164123997092247, 0.014953999780118, 0.460204988718033, 0.872313976287842, -0.16363500058651, 0.014708999544382, 0.46026599407196, 0.872437000274658, -0.163025006651878, 0.014587000012398, 0.46026599407196, 0.872559010982513, -0.162414997816086, 0.014526000246406, 0.460204988718033, 0.872681021690369, -0.162169992923737, 0.014099000021815, 0.460144013166428, 0.872741997241974, -0.162354007363319, 0.013732999563217, 0.460022002458572, 0.872802972793579, -0.161987006664276, 0.013550000265241, 0.459960997104645, 0.872924983501434, -0.161743000149727, 0.013306000269949, 0.45983898639679, 0.872986018657684, -0.161621004343033, 0.01312300004065, 0.459778010845184, 0.87304699420929, -0.161133006215096, 0.013062000274658, 0.459717005491257, 0.873169004917145, -0.160583004355431, 0.012877999804914, 0.459778010845184, 0.873291015625, -0.160583004355431, 0.012573000043631, 0.459717005491257, 0.873291015625, -0.160400003194809, 0.01214599981904, 0.459778010845184, 0.873291015625, -0.159912005066872, 0.012085000053048, 0.459778010845184, 0.873413026332855, -0.159912005066872, 0.011597000062466, 0.459778010845184, 0.873413026332855, -0.160521999001503, 0.011047000065446, 0.459778010845184, 0.873291015625, -0.160767003893852, 0.010803000070155, 0.459778010845184, 0.873291015625, -0.160705998539925, 0.010803000070155, 0.459778010845184, 0.873291015625, -0.160705998539925, 0.010742000304163, 0.459778010845184, 0.873291015625, -0.160705998539925, 0.010436999611557, 0.459778010845184, 0.873291015625, -0.160705998539925, 0.010375999845564, 0.459778010845184, 0.873291015625, -0.160521999001503, 0.010436999611557, 0.459656000137329, 0.873351991176605, -0.160278007388115, 0.010742000304163, 0.459533989429474, 0.87347400188446, -0.160278007388115, 0.010742000304163, 0.459351003170013, 0.873534977436066, -0.160888999700546, 0.010619999840856, 0.459105998277664, 0.873596012592316, -0.161193996667862, 0.010863999836147, 0.458739995956421, 0.873718023300171, -0.161376997828484, 0.011047000065446, 0.458373993635178, 0.873901009559631, -0.162047997117043, 0.011047000065446, 0.457825005054474, 0.874023020267487, -0.163207992911339, 0.011230000294745, 0.457213997840881, 0.874145984649658, -0.163330003619194, 0.011657999828458, 0.45660400390625, 0.874450981616974, -0.163330003619194, 0.012268000282347, 0.455871999263763, 0.87481701374054, -0.163696005940437, 0.012633999809623, 0.455199986696243, 0.875060975551605, -0.164123997092247, 0.012817000038922, 0.454468011856079, 0.875365972518921, -0.164673000574112, 0.01275600027293, 0.453734993934631, 0.875671029090881, -0.165160998702049, 0.012817000038922, 0.452820003032684, 0.876038014888763, -0.16558800637722, 0.012817000038922, 0.451781988143921, 0.876465022563934, -0.165648996829987, 0.013244999572635, 0.450744986534119, 0.877013981342316, -0.165648996829987, 0.013976999558508, 0.449523985385895, 0.877624988555908, -0.165343999862671, 0.014526000246406, 0.448424994945526, 0.87823498249054, -0.165465995669365, 0.01464799977839, 0.447266012430191, 0.878784000873566, -0.165770992636681, 0.015014999546111, 0.446045011281967, 0.879333019256592, -0.165770992636681, 0.015564000234008, 0.444763004779816, 0.88000500202179, -0.165710002183914, 0.01605200022459, 0.443603992462158, 0.880554020404816, -0.165894001722336, 0.016234999522567, 0.442566007375717, 0.881042003631592, -0.166320994496346, 0.016479000449181, 0.441527992486954, 0.881531000137329, -0.166503995656967, 0.016784999519587, 0.440551996231079, 0.8819580078125, -0.166748002171516, 0.016907000914216, 0.439819008111954, 0.882263004779816, -0.166991993784904, 0.016479000449181, 0.439269989728928, 0.882507026195526, -0.167541995644569, 0.01605200022459, 0.438782006502151, 0.882628977298737, -0.167846992611885, 0.015502999536693, 0.438416004180908, 0.882750988006592, -0.167724996805191, 0.01519799977541, 0.438232004642487, 0.882874011993408, -0.167419001460075, 0.014770999550819, 0.438170999288559, 0.882996022701263, -0.167357996106148, 0.014403999783099, 0.438293009996414, 0.882996022701263, -0.167357996106148, 0.013976999558508, 0.438477009534836, 0.882874011993408, -0.166931003332138, 0.013367000035942, 0.438964992761612, 0.882750988006592, -0.167052999138832, 0.012694999575615, 0.439392000436783, 0.882507026195526, -0.168029993772507, 0.011780000291765, 0.439819008111954, 0.88214099407196, -0.168029993772507, 0.011780000291765, 0.440308004617691, 0.881835997104645, -0.16686999797821, 0.011962999589741, 0.441040009260178, 0.88171398639679, -0.166198998689651, 0.011780000291765, 0.441711008548737, 0.881531000137329, -0.165894001722336, 0.011474999599159, 0.44250500202179, 0.881165027618408, -0.165343999862671, 0.011353000067174, 0.443237006664276, 0.880919992923737, -0.16448999941349, 0.011597000062466, 0.443908989429474, 0.880737006664276, -0.163756996393204, 0.011780000291765, 0.44464099407196, 0.880492985248566, -0.162659004330635, 0.011901999823749, 0.445434987545013, 0.880309998989105, -0.161681994795799, 0.011597000062466, 0.446105986833572, 0.880127012729645, -0.161193996667862, 0.010986000299454, 0.446716010570526, 0.879944026470184, -0.160583004355431, 0.010498000308871, 0.447266012430191, 0.879760980606079, -0.159972995519638, 0.01025400031358, 0.447632014751434, 0.879700005054474, -0.158996999263763, 0.01025400031358, 0.44811999797821, 0.879639029502869, -0.158386006951332, 0.01025400031358, 0.448424994945526, 0.879577994346619, -0.158020004630089, 0.009948999620974, 0.448913991451263, 0.879395008087158, -0.157226994633675, 0.009704999625683, 0.449340999126434, 0.879333019256592, -0.156311005353928, 0.009521000087261, 0.449829012155533, 0.879211008548737, -0.155212000012398, 0.009398999623954, 0.450255990028381, 0.879211008548737, -0.154113993048668, 0.009398999623954, 0.450623005628586, 0.879211008548737, -0.153381004929543, 0.009460000321269, 0.450928002595901, 0.879149973392487, -0.152953997254372, 0.009216000325978, 0.451294004917145, 0.879088997840881, -0.152221992611885, 0.009033000096679, 0.451660007238388, 0.879028022289276, -0.151123002171516, 0.009337999857962, 0.451903998851776, 0.879088997840881, -0.15039099752903, 0.009398999623954, 0.452026009559631, 0.879149973392487, -0.150085002183914, 0.009337999857962, 0.452208995819092, 0.879088997840881, -0.14910900592804, 0.009704999625683, 0.452454000711441, 0.879149973392487, -0.148071005940437, 0.009766000322998, 0.452697992324829, 0.879211008548737, -0.147643998265266, 0.009398999623954, 0.452820003032684, 0.879211008548737, -0.147400006651878, 0.009033000096679, 0.453063994646072, 0.879149973392487, -0.147094994783401, 0.008910999633372, 0.453247010707855, 0.879088997840881, -0.147034004330635, 0.008910999633372, 0.453247010707855, 0.879088997840881, -0.14648400247097, 0.009033000096679, 0.45330798625946, 0.879149973392487, -0.14538599550724, 0.009766000322998, 0.453247010707855, 0.879333019256592, -0.144653007388115, 0.010498000308871, 0.453002989292145, 0.879577994346619, -0.144653007388115, 0.010863999836147, 0.452820003032684, 0.879700005054474, -0.144653007388115, 0.011353000067174, 0.452454000711441, 0.879882991313934, -0.144775003194809, 0.011780000291765, 0.451965004205704, 0.880065977573395, -0.144287005066872, 0.012450999580324, 0.451476991176605, 0.88043200969696, -0.143616005778313, 0.012938999570906, 0.450928002595901, 0.880797982215881, -0.143859997391701, 0.013244999572635, 0.450195014476776, 0.881103992462158, -0.144225999712944, 0.013488999567926, 0.449584990739822, 0.881348013877869, -0.14453099668026, 0.013732999563217, 0.448913991451263, 0.881653010845184, -0.145325005054474, 0.013855000026524, 0.448242008686066, 0.881835997104645, -0.146972998976707, 0.013671999797225, 0.447632014751434, 0.88189697265625, -0.149474993348122, 0.012817000038922, 0.447021007537842, 0.881835997104645, -0.152282997965813, 0.011657999828458, 0.446471989154816, 0.881653010845184, -0.15387000143528, 0.011107999831438, 0.445740014314651, 0.88171398639679, -0.155028998851776, 0.011107999831438, 0.444884985685349, 0.8819580078125, -0.156066998839378, 0.011413999833167, 0.444031000137329, 0.88220202922821, -0.156311005353928, 0.012450999580324, 0.443237006664276, 0.882568001747131, -0.15625, 0.013062000274658, 0.442443996667862, 0.882934987545013, -0.157104000449181, 0.012817000038922, 0.441650003194809, 0.883179008960724, -0.158263996243477, 0.012573000043631, 0.440856993198395, 0.883361995220184, -0.158386006951332, 0.012817000038922, 0.440062999725342, 0.88372802734375, -0.158020004630089, 0.013000000268221, 0.439392000436783, 0.884154975414276, -0.158263996243477, 0.012694999575615, 0.438721001148224, 0.884459972381592, -0.159180000424385, 0.012633999809623, 0.437866002321243, 0.884705007076263, -0.159484997391701, 0.012694999575615, 0.43731701374054, 0.884949028491974, -0.159301996231079, 0.012329000048339, 0.436706990003586, 0.88525402545929, -0.159912005066872, 0.01171899959445, 0.436096012592316, 0.88543701171875, -0.160217002034187, 0.01171899959445, 0.435485988855362, 0.885680973529816, -0.159972995519638, 0.011780000291765, 0.435119986534119, 0.885924994945526, -0.160034000873566, 0.011230000294745, 0.434814006090164, 0.886047005653381, -0.160767003893852, 0.010436999611557, 0.434753000736237, 0.885985970497131, -0.160888999700546, 0.010315000079572, 0.434630990028381, 0.886047005653381, -0.160950005054474, 0.010131999850273, 0.434691995382309, 0.885985970497131, -0.161072000861168, 0.009521000087261, 0.434875011444092, 0.885864019393921, -0.161438003182411, 0.008545000106096, 0.435241997241974, 0.88561999797821, -0.161926001310349, 0.007141000125557, 0.43554699420929, 0.8853759765625, -0.163147002458572, 0.005675999913365, 0.435730010271072, 0.885132014751434, -0.164061993360519, 0.005065999925137, 0.43597400188446, 0.884827017784119, -0.16339099407196, 0.005005000159144, 0.436278998851776, 0.884827017784119, -0.162842005491257, 0.004821999929845, 0.436401009559631, 0.884827017784119, -0.163147002458572, 0.0046999999322, 0.436583995819092, 0.884705007076263, -0.162964001297951, 0.004943999927491, 0.436767995357513, 0.884643971920013, -0.162292003631592, 0.00512700015679, 0.436951011419296, 0.884643971920013, -0.161987006664276, 0.004821999929845, 0.437195003032684, 0.884643971920013, -0.161438003182411, 0.004821999929845, 0.437256008386612, 0.884643971920013, -0.160827994346619, 0.004517000168562, 0.437622010707855, 0.884582996368408, -0.160767003893852, 0.00372299994342, 0.437866002321243, 0.884521007537842, -0.161498993635178, 0.002562999958172, 0.438170999288559, 0.884216010570526, -0.161621004343033, 0.00164799997583, 0.438477009534836, 0.884033024311066, -0.161133006215096, 0.000670999987051, 0.438903987407684, 0.88391101360321, -0.161072000861168, -0.000243999995291, 0.439148008823395, 0.88384997844696, -0.160888999700546, -0.000487999990582, 0.43945300579071, 0.88372802734375, -0.159484997391701, 0.000060999998823, 0.439758002758026, 0.883789002895355, -0.158691003918648, 0.000243999995291, 0.440124988555908, 0.88372802734375, -0.158263996243477, 0.000121999997646, 0.440674006938934, 0.883544981479645, -0.157837003469467, 0.000243999995291, 0.441222995519638, 0.883361995220184, -0.156982004642487, 0.000182999996468, 0.441711008548737, 0.883239984512329, -0.156188994646072, -0.000121999997646, 0.442261010408401, 0.883117973804474, -0.155395999550819, -0.000487999990582, 0.442871004343033, 0.882934987545013, -0.154419004917145, -0.000731999985874, 0.443419992923737, 0.882874011993408, -0.153748005628586, -0.001403999980539, 0.443908989429474, 0.882750988006592, -0.152953997254372, -0.001952999969944, 0.444519013166428, 0.882568001747131, -0.151672005653381, -0.002257999964058, 0.445129007101059, 0.882507026195526, -0.150452002882957, -0.002562999958172, 0.445618003606796, 0.882445991039276, -0.149597004055977, -0.002868999959901, 0.4461669921875, 0.882323980331421, -0.148803994059563, -0.003173999954015, 0.446716010570526, 0.88214099407196, -0.147948995232582, -0.00372299994342, 0.447448998689651, 0.8819580078125, -0.147460997104645, -0.004211000166833, 0.447997987270355, 0.88177502155304, -0.146972998976707, -0.004395000170916, 0.448547005653381, 0.881531000137329, -0.145996004343033, -0.004517000168562, 0.449218988418579, 0.881348013877869, -0.145325005054474, -0.004761000163853, 0.449829012155533, 0.881165027618408, -0.145202994346619, -0.005065999925137, 0.450316995382309, 0.880919992923737, -0.144592002034187, -0.004761000163853, 0.450744986534119, 0.880797982215881, -0.143799006938934, -0.004577999934554, 0.45117199420929, 0.880737006664276, -0.143981993198395, -0.004761000163853, 0.45159900188446, 0.880492985248566, -0.144409000873566, -0.004761000163853, 0.451903998851776, 0.8802490234375, -0.144470006227493, -0.004271999932826, 0.452147990465164, 0.880127012729645, -0.14410400390625, -0.003783999942243, 0.452576011419296, 0.879944026470184, -0.143493995070457, -0.003173999954015, 0.452881008386612, 0.879882991313934, -0.143676996231079, -0.002929999958724, 0.453247010707855, 0.879700005054474, -0.143493995070457, -0.002746999962255, 0.453552007675171, 0.879577994346619, -0.142212003469467, -0.002196999965236, 0.453918009996414, 0.879577994346619, -0.140625, -0.001464999979362, 0.454102009534836, 0.879760980606079, -0.140015006065369, -0.001281999982893, 0.454223990440369, 0.879760980606079, -0.139587000012398, -0.000976999988779, 0.454284995794296, 0.879822015762329, -0.138732999563217, -0.000670999987051, 0.454223990440369, 0.88000500202179, -0.137511998414993, -0.000548999989405, 0.454102009534836, 0.8802490234375, -0.136536002159119, -0.000731999985874, 0.453857004642487, 0.880492985248566, -0.13586400449276, -0.000976999988779, 0.453795999288559, 0.880675971508026, -0.135010004043579, -0.001159999985248, 0.453673988580704, 0.880859017372131, -0.13433800637722, -0.001708999974653, 0.453429996967316, 0.881042003631592, -0.133972004055977, -0.00207499996759, 0.453247010707855, 0.881226003170013, -0.133301004767418, -0.002318999962881, 0.453063994646072, 0.881408989429474, -0.132811993360519, -0.002562999958172, 0.452881008386612, 0.881591975688934, -0.133056998252869, -0.003356999950483, 0.452636986970901, 0.881653010845184, -0.134032994508743, -0.004271999932826, 0.452271014451981, 0.88171398639679, -0.134520992636681, -0.004821999929845, 0.451842993497849, 0.881835997104645, -0.133849993348122, -0.00512700015679, 0.451476991176605, 0.88214099407196, -0.132995992898941, -0.005187999922782, 0.45117199420929, 0.882385015487671, -0.132446005940437, -0.005187999922782, 0.450928002595901, 0.882628977298737, -0.132080003619194, -0.005431999918073, 0.450805991888046, 0.882750988006592, -0.132018998265266, -0.006409000139683, 0.450866997241974, 0.882690012454987, -0.131957992911339, -0.006897000130266, 0.450684010982513, 0.882812023162842, -0.131897002458572, -0.006591999903321, 0.450623005628586, 0.882874011993408, -0.131531000137329, -0.006041999906301, 0.450439006090164, 0.882996022701263, -0.131652995944023, -0.005859000142664, 0.450378000736237, 0.882996022701263, -0.132751002907753, -0.005615000147372, 0.450255990028381, 0.882934987545013, -0.133849993348122, -0.005431999918073, 0.450255990028381, 0.882750988006592, -0.133972004055977, -0.0046999999322, 0.450255990028381, 0.882750988006592, -0.13476599752903, -0.004089000169188, 0.450378000736237, 0.882568001747131, -0.135986000299454, -0.003967000171542, 0.450623005628586, 0.882263004779816, -0.136962994933128, -0.00372299994342, 0.450805991888046, 0.882018983364105, -0.137328997254372, -0.003112999955192, 0.450928002595901, 0.88189697265625, -0.137085005640984, -0.002013999968767, 0.451110988855362, 0.881835997104645, -0.137878000736237, -0.001525999978185, 0.451294004917145, 0.881591975688934, -0.139403998851776, -0.001342999981716, 0.451476991176605, 0.881286978721619, -0.140075996518135, -0.000853999983519, 0.451660007238388, 0.881103992462158, -0.13952599465847, 0.000060999998823, 0.451660007238388, 0.881165027618408, -0.139342993497849, 0.000915999989957, 0.451537996530533, 0.881286978721619, -0.139770999550819, 0.001403999980539, 0.451537996530533, 0.881165027618408, -0.140258997678757, 0.001830999972299, 0.451355010271072, 0.881226003170013, -0.140929996967316, 0.002379999961704, 0.45117199420929, 0.881226003170013, -0.140563994646072, 0.003417999949306, 0.450866997241974, 0.881408989429474, -0.140563994646072, 0.004271999932826, 0.450623005628586, 0.881531000137329, -0.141112998127937, 0.004639000166208, 0.450378000736237, 0.881591975688934, -0.141846001148224, 0.004517000168562, 0.450195014476776, 0.881531000137329, -0.143250003457069, 0.004271999932826, 0.449889987707138, 0.881470024585724, -0.143981993198395, 0.004455999936908, 0.449523985385895, 0.881531000137329, -0.143616005778313, 0.005431999918073, 0.449158012866974, 0.88177502155304, -0.143738001585007, 0.006041999906301, 0.448729991912842, 0.8819580078125, -0.144592002034187, 0.006409000139683, 0.448363989591599, 0.882018983364105, -0.145263999700546, 0.006713999900967, 0.448058992624283, 0.882080018520355, -0.145691007375717, 0.007141000125557, 0.447571009397507, 0.88220202922821, -0.145691007375717, 0.007689999882132, 0.447266012430191, 0.882385015487671, -0.145568996667862, 0.008057000115514, 0.447021007537842, 0.882507026195526, -0.146239995956421, 0.007934999652207, 0.446837991476059, 0.882507026195526, -0.147277995944023, 0.007873999886215, 0.446532994508743, 0.882445991039276, -0.147705003619194, 0.008361999876797, 0.446227997541428, 0.882568001747131, -0.147888004779816, 0.00884999986738, 0.445923000574112, 0.882690012454987, -0.148803994059563, 0.009216000325978, 0.445618003606796, 0.882690012454987, -0.149657994508743, 0.009521000087261, 0.445434987545013, 0.882628977298737, -0.150023996829987, 0.010192999616265, 0.445250988006592, 0.882628977298737, -0.150452002882957, 0.010498000308871, 0.445006996393204, 0.882690012454987, -0.151061996817589, 0.010986000299454, 0.444763004779816, 0.882690012454987, -0.151549994945526, 0.011841000057757, 0.444519013166428, 0.882750988006592, -0.152221992611885, 0.012268000282347, 0.444274991750717, 0.882750988006592, -0.153075993061066, 0.012268000282347, 0.44421398639679, 0.882628977298737, -0.154419004917145, 0.012512000277638, 0.444092005491257, 0.882445991039276, -0.155333995819092, 0.013062000274658, 0.44421398639679, 0.88220202922821, -0.155579000711441, 0.013611000031233, 0.444519013166428, 0.882018983364105, -0.15667699277401, 0.013488999567926, 0.444884985685349, 0.881653010845184, -0.158508002758026, 0.013671999797225, 0.445250988006592, 0.881103992462158, -0.159363001585007, 0.014708999544382, 0.445495992898941, 0.880797982215881, -0.158875003457069, 0.016907000914216, 0.445923000574112, 0.880675971508026, -0.158691003918648, 0.018555000424385, 0.446532994508743, 0.880309998989105, -0.159484997391701, 0.019409000873566, 0.447266012430191, 0.879822015762329, -0.160034000873566, 0.020873999223113, 0.447876006364822, 0.879395008087158, -0.159912005066872, 0.022338999435306, 0.448668986558914, 0.878966987133026, -0.159484997391701, 0.023742999881506, 0.449523985385895, 0.878539979457855, -0.159058004617691, 0.024048000574112, 0.450439006090164, 0.878112971782684, -0.158263996243477, 0.023925999179482, 0.451415985822678, 0.877807974815369, -0.156982004642487, 0.02386499941349, 0.452576011419296, 0.877440989017487, -0.155945003032684, 0.024718999862671, 0.45330798625946, 0.877197027206421, -0.155945003032684, 0.026611000299454, 0.453857004642487, 0.87689197063446, -0.15515099465847, 0.029663000255823, 0.454407006502151, 0.876648008823395, -0.154602006077766, 0.032409999519587, 0.454955995082855, 0.876343011856079, -0.15625, 0.033812999725342, 0.455383002758026, 0.875792980194092, -0.157592996954918, 0.035521999001503, 0.455933004617691, 0.87518298625946, -0.157409995794296, 0.037719998508692, 0.456299006938934, 0.874939024448395, -0.156554996967316, 0.040038999170065, 0.456542998552322, 0.874877989292145, -0.156554996967316, 0.041870001703501, 0.457031011581421, 0.874512016773224, -0.156920999288559, 0.042725000530481, 0.457702994346619, 0.874083995819092, -0.157042995095253, 0.043152000755072, 0.458434998989105, 0.873656988143921, -0.157042995095253, 0.043152000755072, 0.459228992462158, 0.873169004917145, -0.158691003918648, 0.042785998433828, 0.459717005491257, 0.872681021690369, -0.160888999700546, 0.043274000287056, 0.459899991750717, 0.872192025184631, -0.162354007363319, 0.044433999806643, 0.459594994783401, 0.872008979320526, -0.162292003631592, 0.047180000692606, 0.459044992923737, 0.872130990028381, -0.162597998976707, 0.04925499856472, 0.45855700969696, 0.872253000736237, -0.164245992898941, 0.050719998776913, 0.458068996667862, 0.872070014476776, -0.165894001722336, 0.052246000617743, 0.457581013441086, 0.871948003768921, -0.166443005204201, 0.054076999425888, 0.457091987133026, 0.871948003768921, -0.166503995656967, 0.055847000330687, 0.456726014614105, 0.872070014476776, -0.166443005204201, 0.057250998914242, 0.456542998552322, 0.872070014476776, -0.166320994496346, 0.058288998901844, 0.456299006938934, 0.872130990028381, -0.166381999850273, 0.058288998901844, 0.456299006938934, 0.872130990028381, -0.166381999850273, 0.058044001460075, 0.456481993198395, 0.872070014476776, -0.165955007076263, 0.058228000998497, 0.456481993198395, 0.872130990028381, -0.166260004043579, 0.058350000530481, 0.456420987844467, 0.872070014476776, -0.166626006364822, 0.058655001223087, 0.456360012292862, 0.872070014476776, -0.166748002171516, 0.058837998658419, 0.456238001585007, 0.872070014476776, -0.16686999797821, 0.059386998414993, 0.456238001585007, 0.872008979320526, -0.167724996805191, 0.060058999806643, 0.456176996231079, 0.871825993061066, -0.169249996542931, 0.061034999787807, 0.455871999263763, 0.871643006801605, -0.170410007238388, 0.061767999082804, 0.456176996231079, 0.871215999126434, -0.170104995369911, 0.063660003244877, 0.456054985523224, 0.871155023574829, -0.170532003045082, 0.06487999856472, 0.456420987844467, 0.870788991451263, -0.171387001872063, 0.06640599668026, 0.45660400390625, 0.870422005653381, -0.173157006502151, 0.067565999925137, 0.457152992486954, 0.869690001010895, -0.174316003918648, 0.070128999650478, 0.457336008548737, 0.869202017784119, -0.17535400390625, 0.073363997042179, 0.457275003194809, 0.868713021278381, -0.176085993647575, 0.077026002109051, 0.457213997840881, 0.86828601360321, -0.176085993647575, 0.080994002521038, 0.457275003194809, 0.867919981479645, -0.177489995956421, 0.083374001085758, 0.457641988992691, 0.867187976837158, -0.179688006639481, 0.085083000361919, 0.458007991313934, 0.866393983364105, -0.180785998702049, 0.086852997541428, 0.45813000202179, 0.865906000137329, -0.180176004767418, 0.08874499797821, 0.458373993635178, 0.865723013877869, -0.179321005940437, 0.090088002383709, 0.458678990602493, 0.865601003170013, -0.179748997092247, 0.089905001223087, 0.459167003631592, 0.865294992923737, -0.179564997553825, 0.089965999126434, 0.459533989429474, 0.865112006664276, -0.178589001297951, 0.090088002383709, 0.459717005491257, 0.865172982215881, -0.178284004330635, 0.090453997254372, 0.459778010845184, 0.865172982215881, -0.178101003170013, 0.090332001447678, 0.460326999425888, 0.864989995956421, -0.177306994795799, 0.090209998190403, 0.460631996393204, 0.864989995956421, -0.17688000202179, 0.090149000287056, 0.460938006639481, 0.864929020404816, -0.175475999712944, 0.09069799631834, 0.461243003606796, 0.864929020404816, -0.174376994371414, 0.090759001672268, 0.461548000574112, 0.865050971508026, -0.174376994371414, 0.091003000736237, 0.46203601360321, 0.86474597454071, -0.174866005778313, 0.09069799631834, 0.462096989154816, 0.8646240234375, -0.17535400390625, 0.09137000143528, 0.461914002895355, 0.86456298828125, -0.174683004617691, 0.091187000274658, 0.462341010570526, 0.864440977573395, -0.173705995082855, 0.09179700165987, 0.462523996829987, 0.864502012729645, -0.174133002758026, 0.091857999563217, 0.462830007076263, 0.864257991313934, -0.174316003918648, 0.091857999563217, 0.462951987981796, 0.864135980606079, -0.17382800579071, 0.092468000948429, 0.462951987981796, 0.864197015762329, -0.173217996954918, 0.092528998851776, 0.463012993335724, 0.864319026470184, -0.173096001148224, 0.092468000948429, 0.462891012430191, 0.86438000202179, -0.172729000449181, 0.09222400188446, 0.462769001722336, 0.86456298828125, -0.171570003032684, 0.092528998851776, 0.462341010570526, 0.864989995956421, -0.170715004205704, 0.092407003045082, 0.46203601360321, 0.865294992923737, -0.170227006077766, 0.091247998178005, 0.46203601360321, 0.865540027618408, -0.169861003756523, 0.090392999351025, 0.4617919921875, 0.865845024585724, -0.169189006090164, 0.08984400331974, 0.461548000574112, 0.86615002155304, -0.168029993772507, 0.088623002171516, 0.461304008960724, 0.866638004779816, -0.166931003332138, 0.088440001010895, 0.460999011993408, 0.867003977298737, -0.16711400449276, 0.087341003119946, 0.460938006639481, 0.867125988006592, -0.16796900331974, 0.086243003606796, 0.460754007101059, 0.867187976837158, -0.168823003768921, 0.085693001747131, 0.460509985685349, 0.867187976837158, -0.16992199420929, 0.085326999425888, 0.459899991750717, 0.867309987545013, -0.169678002595901, 0.085753999650478, 0.459412008523941, 0.867614984512329, -0.168518006801605, 0.086243003606796, 0.458983987569809, 0.867981016635895, -0.168090999126434, 0.085570998489857, 0.458801001310349, 0.86822497844696, -0.168700993061066, 0.084595002233982, 0.458801001310349, 0.86822497844696, -0.168761998414993, 0.083434998989105, 0.458739995956421, 0.868346989154816, -0.167297005653381, 0.082580998539925, 0.458739995956421, 0.868713021278381, -0.165710002183914, 0.081786997616291, 0.458862006664276, 0.869018971920013, -0.164977997541428, 0.080687999725342, 0.458862006664276, 0.869262993335724, -0.164551004767418, 0.07965099811554, 0.458862006664276, 0.869445979595184, -0.164001002907753, 0.078368999063969, 0.458862006664276, 0.869690001010895, -0.163818001747131, 0.076964996755123, 0.458678990602493, 0.869934022426605, -0.163513004779816, 0.075928002595901, 0.458373993635178, 0.870239019393921, -0.16253699362278, 0.075011998414993, 0.45813000202179, 0.870604991912842, -0.161438003182411, 0.07379200309515, 0.458007991313934, 0.871033012866974, -0.160278007388115, 0.072571001946926, 0.457886010408401, 0.871398985385895, -0.159363001585007, 0.071716003119946, 0.457581013441086, 0.87176501750946, -0.159058004617691, 0.071044996380806, 0.457275003194809, 0.872008979320526, -0.159363001585007, 0.070189997553825, 0.456970006227493, 0.872253000736237, -0.159484997391701, 0.069641001522541, 0.456542998552322, 0.872497975826263, -0.159363001585007, 0.069031000137329, 0.456176996231079, 0.872741997241974, -0.159363001585007, 0.06835900247097, 0.455871999263763, 0.872924983501434, -0.159058004617691, 0.067565999925137, 0.455749988555908, 0.87310802936554, -0.15862999856472, 0.067078001797199, 0.455626994371414, 0.873291015625, -0.158386006951332, 0.06640599668026, 0.455626994371414, 0.873413026332855, -0.158080995082855, 0.065917998552322, 0.455687999725342, 0.87347400188446, -0.157532006502151, 0.065490998327732, 0.455810993909836, 0.873534977436066, -0.157471001148224, 0.064696997404099, 0.455933004617691, 0.873534977436066, -0.157837003469467, 0.063598997890949, 0.456238001585007, 0.873413026332855, -0.157654002308846, 0.062743999063969, 0.456360012292862, 0.873413026332855, -0.15777599811554, 0.062134001404047, 0.456360012292862, 0.873413026332855, -0.157104000449181, 0.061767999082804, 0.456481993198395, 0.873534977436066, -0.156494006514549, 0.061340000480413, 0.45660400390625, 0.873596012592316, -0.156920999288559, 0.060913000255823, 0.456542998552322, 0.873596012592316, -0.157471001148224, 0.060729999095201, 0.456481993198395, 0.873534977436066, -0.156859993934631, 0.061034999787807, 0.456360012292862, 0.873656988143921, -0.156371995806694, 0.06054700165987, 0.456481993198395, 0.873718023300171, -0.156188994646072, 0.059937000274658, 0.456542998552322, 0.873778998851776, -0.155883997678757, 0.059753000736237, 0.456420987844467, 0.873901009559631, -0.155212000012398, 0.059386998414993, 0.456420987844467, 0.874023020267487, -0.154662996530533, 0.059326000511646, 0.456420987844467, 0.874207019805908, -0.155945003032684, 0.058777000755072, 0.456176996231079, 0.874083995819092, -0.156616002321243, 0.058533001691103, 0.455933004617691, 0.874145984649658, -0.155640006065369, 0.059264998883009, 0.455444008111954, 0.874512016773224, -0.155333995819092, 0.059082001447678, 0.455139011144638, 0.87475597858429, -0.156128004193306, 0.058837998658419, 0.454834014177322, 0.87475597858429, -0.157226994633675, 0.05816699936986, 0.454528987407684, 0.87481701374054 ], [ 0.0, 22.621413, 37.604539000000003, 60.178142000000001, 82.607427999999999, 97.630792999999997, 120.161949000000007, 135.888290000000012, 157.668002999999999, 180.124075000000005, 196.164020999999991, 217.862378000000007, 240.193712000000005, 255.878770000000003, 279.084184999999991, 300.445678999999984, 316.13265100000001, 339.294728000000021, 360.169164000000023, 375.873878999999988, 399.045121999999992, 420.15549900000002, 435.91495900000001, 459.268583999999976, 480.186216000000002, 495.852929000000017, 519.036742000000004, 540.117163000000005, 556.154456999999979, 579.301364000000035, 600.138829999999984, 622.572152999999958, 639.016316999999958, 660.257886999999982, 682.676078999999959, 699.077115000000049, 720.250720000000001, 742.691525999999953, 759.001203000000032, 780.524759000000017, 802.936615999999958, 818.618669999999952, 840.235336999999959, 862.799645000000055, 879.027281000000016, 900.200863000000027, 922.613567999999987, 939.062531000000035, 960.187640999999985, 982.738112999999998, 999.112175999999977, 1020.375453999999991, 1042.76953299999991, 1058.389231000000109, 1081.551729999999907, 1102.702946999999995, 1118.539021999999932, 1140.263562999999976, 1162.938329999999951, 1178.412884000000076, 1201.751860000000079, 1222.802292999999963, 1238.490283999999974, 1261.79616800000008, 1282.898910999999998, 1298.4348379999999, 1321.570009000000027, 1342.711847999999918, 1358.42850599999997, 1381.539217000000008, 1402.929437999999891, 1418.6506159999999, 1441.581981000000042, 1462.810339000000113, 1478.421436000000085, 1501.809970000000021, 1522.831820000000107, 1538.624098000000004, 1561.557821000000104, 1582.728342999999995, 1598.426314999999931, 1621.627508000000034, 1642.735705999999936, 1658.516141999999945, 1681.592343999999912, 1702.945326999999907, 1718.406966000000011, 1741.596528000000035, 1762.685834000000114, 1778.435226999999941, 1801.679550999999947, 1822.680503999999928, 1845.195660999999973, 1861.553922000000057, 1882.711109000000079, 1905.31907799999999, 1921.84665700000005, 1942.777626999999939, 1965.178466000000071, 1981.006343999999899, 2002.710863999999901, 2032.733580999999958, 2040.984208000000081, 2070.291458000000148, 2085.168020999999953, 2117.54996600000004, 2122.784510999999839, 2152.749283999999989, 2160.963429999999789, 2184.103685999999925, 2205.222271999999975, 2220.98604400000022, 2244.170380000000023, 2265.271909999999934, 2280.910661999999775, 2304.276790999999776, 2325.208231000000069, 2340.983726999999817, 2363.963416000000052, 2385.363946999999825, 2400.978294000000005, 2431.60861100000011, 2444.969861000000037, 2461.024132999999892, 2484.255745999999817, 2505.529133000000002, 2520.990345000000161, 2544.076126999999815, 2565.26805400000012, 2580.973360999999841, 2604.30104799999981, 2625.413665999999921, 2641.046002999999928, 2664.145074999999906, 2685.262342999999873, 2700.970312999999805, 2724.202296999999817, 2745.404078999999911, 2760.925734999999804, 2784.151104999999916, 2805.255837000000156, 2820.98339900000019, 2844.247241999999915, 2865.281848999999966, 2880.921480999999858, 2903.995656000000054, 2925.290563999999904, 2940.964860999999928, 2963.621246000000156, 2985.282693000000108, 3007.75744399999985, 3023.451258000000053, 3045.197016000000076, 3060.96864000000005, 3083.520582000000104, 3106.655356000000211, 3127.839531000000079, 3143.462261000000126, 3166.672015000000101, 3187.770576999999776, 3203.650463999999829, 3226.646381000000019, 3248.032697000000098, 3263.50881900000013, 3286.675776000000042, 3307.736891999999898, 3323.476084999999784, 3346.706182999999783, 3367.849099999999908, 3383.739317000000028, 3406.603783000000021, 3427.964164999999866, 3443.4679900000001, 3466.642574999999852, 3487.76475100000016, 3503.502554000000146, 3526.663759999999911, 3547.808841999999913, 3563.495981999999913, 3586.619532000000163, 3607.836870999999974, 3623.679373999999825, 3646.64393599999994, 3667.740349000000151, 3683.538102999999865, 3706.674821000000065, 3727.862289000000146, 3743.555933000000095, 3766.718281999999817, 3787.81728800000019, 3803.523917999999867, 3826.899511999999959, 3847.715799999999945, 3863.550725000000057, 3886.006898000000092, 3907.845315000000028, 3923.513737000000219, 3946.149820999999974, 3967.873047000000042, 3983.529194000000189, 4006.085966999999982, 4029.392899999999827, 4051.700558000000001, 4066.013405000000148, 4089.221829999999954, 4103.603857000000062, 4126.203556999999819, 4149.304399999999987, 4163.515328000000409, 4186.079136999999719, 4209.301516999999876, 4223.507915999999568, 4245.969076999999743, 4269.489276000000245, 4283.744069000000309, 4306.342074999999568, 4329.171382999999878, 4350.397549000000254, 4366.015435000000252, 4389.179360000000088, 4410.345134999999573, 4426.035302999999658, 4449.262646000000132, 4470.284190999999737, 4486.022122999999738, 4509.624764000000141, 4530.27696399999968, 4546.21869499999957, 4569.229685000000245, 4590.325579000000289, 4606.111831000000166, 4629.166379000000234, 4650.408410000000003, 4665.969320999999582, 4689.143441999999595, 4710.462389999999687, 4726.098173999999744, 4749.164859999999862, 4770.368913000000248, 4786.164931999999681, 4808.492180000000189, 4830.331576999999925, 4845.995055999999749, 4868.657454999999572, 4890.462177999999767, 4906.351018000000295, 4928.838466000000153, 4950.326994000000013, 4966.037672999999813, 4988.582421000000068, 5011.694187000000056, 5026.032825999999659, 5048.482906000000185, 5071.635177000000112, 5086.041549999999916, 5108.521509000000151, 5131.838173000000097, 5146.036732999999913, 5168.497333999999682, 5191.718499999999949, 5206.100014999999985, 5228.745425000000068, 5251.729943999999705, 5266.366329999999834, 5288.539300000000367, 5311.671503999999914, 5326.168947999999546, 5348.563975000000028, 5371.970392999999603, 5386.33804500000042, 5408.613067000000228, 5431.688132999999652, 5446.040262000000439, 5468.539638000000195, 5491.727066999999806, 5512.865718000000015, 5528.599591000000146, 5551.722609000000375, 5572.79626399999961, 5588.584632000000056, 5611.695600000000013, 5632.788225000000239, 5648.55015800000001, 5671.825198999999884, 5692.868985000000066, 5708.509522999999717, 5731.171207000000322, 5752.736179999999877, 5768.519806999999673, 5791.12879299999986, 5812.735155999999733, 5835.531629000000066, 5851.100521999999728, 5873.085758999999598, 5888.572261999999682, 5911.097601000000395, 5933.99881699999969, 5948.600360000000364, 5971.161616999999751, 5994.450974999999744, 6008.643613999999616, 6031.043251000000055, 6060.352966999999808, 6068.748999999999796, 6091.070727000000261, 6114.276144999999815, 6128.578532999999879, 6151.270762000000104, 6174.303318000000218, 6188.665960000000268, 6211.085332999999991, 6234.22162599999956, 6248.581511999999748, 6271.495855999999549, 6294.261360999999852, 6308.610343999999714, 6331.007867999999689, 6354.223992999999609, 6368.743083000000297, 6391.140666000000238, 6414.486933999999565, 6435.278991000000133, 6451.041357000000062, 6474.186364999999569, 6495.46622699999989, 6519.244138000000021, 6534.216596000000209, 6555.229870999999548, 6571.101434000000154, 6594.413747999999941, 6615.501664999999775, 6631.098651999999674, 6654.201047999999901, 6675.339388000000326, 6691.084716999999728, 6713.638678000000255, 6735.338851000000432, 6751.099911999999676, 6773.653537999999571, 6795.38589200000024, 6811.088447000000087, 6833.603514999999788, 6855.49920899999961, 6871.364548999999897, 6893.624418000000333, 6916.95624399999997, 6931.060986999999841, 6953.695770000000266, 6976.866729999999734, 6991.126454000000194, 7013.633668999999827, 7036.516523999999663, 7051.15687700000035, 7073.61246200000005, 7096.742180000000189, 7111.063400000000001, 7133.802036000000044, 7156.980321000000004, 7171.116525000000365, 7193.616872999999941, 7216.72887400000036, 7231.068369999999959, 7253.582868000000417, 7276.710060999999769, 7291.129982000000382, 7313.663252999999713, 7336.977103999999599, 7358.074413999999706, 7373.553281999999854, 7396.940746999999647, 7417.834926000000451, 7433.645682000000306, 7457.003209999999854, 7477.882101000000148, 7493.582647999999608, 7516.744249999999738, 7537.863599999999678, 7553.68869100000029, 7576.787003000000368, 7597.839890000000196, 7613.801752000000306, 7636.092607999999927, 7657.992516000000251, 7673.724169000000074, 7696.219551999999567, 7725.511155000000144, 7733.619623999999931, 7756.19890899999973, 7777.851171999999679, 7793.697575999999572, 7816.393391999999949, 7839.345374000000447, 7853.575875000000451, 7876.147869000000355, 7899.271257000000332, 7913.58564000000024, 7936.220248999999967, 7959.360021999999844, 7973.715433000000303, 8004.240899000000354, 8019.372147000000041, 8033.620181999999659, 8056.22417299999961, 8079.305215999999746, 8093.619184999999561, 8116.0786420000004, 8139.302846999999929, 8153.699923000000126, 8176.159676999999647, 8199.317920999999842, 8213.880051000000094, 8236.382277000000613, 8259.403410000000804, 8273.670759000000544, 8296.216544999999314, 8319.310814000000391, 8340.49809599999935, 8356.153410000000804, 8379.314069000000018, 8400.421800000000076, 8416.154320999999982, 8439.824586999999156, 8460.425123999999414, 8476.103044999999838, 8499.300676999999268, 8520.357723999999507, 8536.326512999999977, 8558.641696999999112, 8580.512758000000758, 8596.161428999999771, 8618.821066000000428, 8641.832781999999497, 8656.387824999999793, 8678.575726999999461, 8707.90812299999925, 8716.392649999999776, 8738.753228999999919, 8761.73256500000025, 8776.180699000000459, 8798.650389000000359, 8822.755934999999226, 8836.555389999999534, 8866.819648000000598, 8881.811689000000115, 8896.135543000000325, 8918.632220999999845, 8941.820607999999993, 8956.132654999999431, 8978.652442000000519, 9001.856318000000101, 9016.430206000000908 ], 0, 0, 0, 0 ], [ 3000, 339, 25.0, 13022.375082000000475, 1, 4, 0, [ -0.222167998552322, 0.70294201374054, 0.168761998414993, 0.654174983501434, -0.221435993909836, 0.701659977436066, 0.168700993061066, 0.655822992324829, -0.221375003457069, 0.700255990028381, 0.168823003768921, 0.657348990440369, -0.222350999712944, 0.69793701171875, 0.17034900188446, 0.659057974815369, -0.22265599668026, 0.695679008960724, 0.171691998839378, 0.661010980606079, -0.222289994359016, 0.694031000137329, 0.171691998839378, 0.662841975688934, -0.221801996231079, 0.693237006664276, 0.171020999550819, 0.664000988006592, -0.222900003194809, 0.692139029502869, 0.17230199277401, 0.664429008960724, -0.224976003170013, 0.690186023712158, 0.175171002745628, 0.665039002895355, -0.226013004779816, 0.688903987407684, 0.17663599550724, 0.665648996829987, -0.227294996380806, 0.68768298625946, 0.177794992923737, 0.666199028491974, -0.228820994496346, 0.686828970909119, 0.179443001747131, 0.666077017784119, -0.231444999575615, 0.685486018657684, 0.182616993784904, 0.665709972381592, -0.232727006077766, 0.684692025184631, 0.184937000274658, 0.665404975414276, -0.234679996967316, 0.683104991912842, 0.187804996967316, 0.665526986122131, -0.23547400534153, 0.681580007076263, 0.190308004617691, 0.666137993335724, -0.236267000436783, 0.679992973804474, 0.193542003631592, 0.66650402545929, -0.237243995070457, 0.678101003170013, 0.19683800637722, 0.667174994945526, -0.237731993198395, 0.675659000873566, 0.200133994221687, 0.668456971645355, -0.236450001597404, 0.674010992050171, 0.202575996518135, 0.669861018657684, -0.234496995806694, 0.672424018383026, 0.20507800579071, 0.671325981616974, -0.23327599465847, 0.670593023300171, 0.207642003893852, 0.672851979732513, -0.232238993048668, 0.668823003768921, 0.210754007101059, 0.674010992050171, -0.230712994933128, 0.667052984237671, 0.213195994496346, 0.675476014614105, -0.228881999850273, 0.665648996829987, 0.21527099609375, 0.676819026470184, -0.226868003606796, 0.664611995220184, 0.216857999563217, 0.678040027618408, -0.225951999425888, 0.66302502155304, 0.219299003481865, 0.679138004779816, -0.22589099407196, 0.661072015762329, 0.222046002745628, 0.680114984512329, -0.225219994783401, 0.65991199016571, 0.222595006227493, 0.681273996829987, -0.224854007363319, 0.658996999263763, 0.223388999700546, 0.68206799030304, -0.224304005503654, 0.657898008823395, 0.225342005491257, 0.682677984237671, -0.224854007363319, 0.656372010707855, 0.228210002183914, 0.682982981204987, -0.225097998976707, 0.655273020267487, 0.229980006814003, 0.683350026607513, -0.224976003170013, 0.65472400188446, 0.230103000998497, 0.683898985385895, -0.224792003631592, 0.654663026332855, 0.230041995644569, 0.68402099609375, -0.22503699362278, 0.654236018657684, 0.231566995382309, 0.68377697467804, -0.225219994783401, 0.653563976287842, 0.233520999550819, 0.683715999126434, -0.224487006664276, 0.653075993061066, 0.233887001872063, 0.684325993061066, -0.224121004343033, 0.652710020542145, 0.233458995819092, 0.684937000274658, -0.223633006215096, 0.652465999126434, 0.233398005366325, 0.685364007949829, -0.222838997840881, 0.653137028217316, 0.23284900188446, 0.685181021690369, -0.223816007375717, 0.653442025184631, 0.232604995369911, 0.684630990028381, -0.22503699362278, 0.652710020542145, 0.233153998851776, 0.684753000736237, -0.226013004779816, 0.651916980743408, 0.233765006065369, 0.684997975826263, -0.226561993360519, 0.651427984237671, 0.232910007238388, 0.68554699420929, -0.227173000574112, 0.650940001010895, 0.231261998414993, 0.686401009559631, -0.227539002895355, 0.650023996829987, 0.230529993772507, 0.687377989292145, -0.228394001722336, 0.646973013877869, 0.23284900188446, 0.689208984375, -0.228394001722336, 0.64385998249054, 0.234313994646072, 0.691588997840881, -0.228455007076263, 0.641541004180908, 0.233215004205704, 0.694091975688934, -0.228698998689651, 0.639281988143921, 0.232787996530533, 0.69622802734375, -0.228577002882957, 0.637512028217316, 0.233153998851776, 0.69775402545929, -0.228455007076263, 0.634765982627869, 0.235596001148224, 0.69946300983429, -0.228698998689651, 0.632507026195526, 0.236022993922234, 0.701294004917145, -0.229431003332138, 0.63037097454071, 0.235962003469467, 0.703002989292145, -0.229857996106148, 0.628174006938934, 0.236693993210793, 0.704590022563934, -0.22961400449276, 0.62652599811554, 0.237671002745628, 0.705811023712158, -0.230041995644569, 0.62518298625946, 0.237914994359016, 0.70678699016571, -0.230712994933128, 0.623656988143921, 0.238403007388115, 0.707764029502869, -0.230712994933128, 0.622375011444092, 0.238830998539925, 0.708739995956421, -0.23046900331974, 0.62133800983429, 0.239623993635178, 0.709411978721619, -0.230835005640984, 0.620788991451263, 0.240112006664276, 0.709656000137329, -0.231628000736237, 0.61999499797821, 0.240784004330635, 0.70990002155304, -0.233825996518135, 0.618591010570526, 0.242126002907753, 0.70990002155304, -0.236633002758026, 0.616882026195526, 0.243164002895355, 0.7100830078125, -0.239075005054474, 0.615234017372131, 0.243895992636681, 0.710448980331421, -0.240294992923737, 0.61456298828125, 0.243285998702049, 0.710875988006592, -0.241210997104645, 0.614319026470184, 0.242188006639481, 0.711121022701263, -0.242676004767418, 0.614319026470184, 0.241393998265266, 0.710875988006592, -0.244506999850273, 0.61456298828125, 0.24066199362278, 0.71032702922821, -0.245666995644569, 0.6146240234375, 0.239929005503654, 0.710143983364105, -0.245544001460075, 0.615234017372131, 0.238037005066872, 0.710205018520355, -0.244933992624283, 0.616210997104645, 0.235351994633675, 0.710510015487671, -0.244385004043579, 0.616760015487671, 0.23327599465847, 0.710937976837158, -0.24371300637722, 0.616455018520355, 0.232238993048668, 0.711731016635895, -0.242310002446175, 0.616210997104645, 0.231200993061066, 0.712768971920013, -0.240539997816086, 0.616698980331421, 0.228332996368408, 0.713867008686066, -0.240051001310349, 0.617003977298737, 0.225525006651878, 0.714661002159119, -0.240601003170013, 0.615661978721619, 0.225159004330635, 0.715758979320526, -0.240479007363319, 0.613770008087158, 0.225647002458572, 0.71722400188446, -0.239623993635178, 0.611633002758026, 0.225281000137329, 0.719482004642487, -0.240112006664276, 0.60913097858429, 0.224487006664276, 0.721679985523224, -0.241210997104645, 0.606628000736237, 0.223876997828484, 0.723632991313934, -0.243407994508743, 0.603026986122131, 0.225342005491257, 0.72546398639679, -0.244751006364822, 0.599242985248566, 0.22723400592804, 0.727539002895355, -0.24609400331974, 0.596130013465881, 0.227782994508743, 0.729430973529816, -0.247924998402596, 0.593200981616974, 0.228332996368408, 0.73107898235321, -0.249207004904747, 0.590393006801605, 0.229674994945526, 0.73242199420929, -0.249329000711441, 0.58837902545929, 0.23089599609375, 0.733642995357513, -0.247986003756523, 0.58697497844696, 0.231689006090164, 0.734984993934631, -0.246825993061066, 0.586059987545013, 0.231873005628586, 0.736023008823395, -0.246032997965813, 0.585388004779816, 0.23242199420929, 0.736693978309631, -0.244445994496346, 0.585815012454987, 0.232299998402596, 0.736937999725342, -0.243102997541428, 0.586486995220184, 0.232178002595901, 0.736877024173737, -0.242064997553825, 0.587890982627869, 0.230529993772507, 0.736633002758026, -0.243042007088661, 0.588989019393921, 0.230041995644569, 0.735535025596619, -0.243773996829987, 0.590210020542145, 0.229919001460075, 0.734375, -0.243224993348122, 0.59179699420929, 0.229552999138832, 0.733398020267487, -0.243407994508743, 0.593810975551605, 0.228270992636681, 0.732116997241974, -0.244751006364822, 0.596312999725342, 0.226501002907753, 0.730163991451263, -0.247191995382309, 0.598267018795013, 0.22589099407196, 0.727966010570526, -0.248778998851776, 0.600158989429474, 0.225342005491257, 0.726013004779816, -0.250488013029099, 0.601929008960724, 0.224121004343033, 0.724364995956421, -0.252562999725342, 0.603209972381592, 0.223144993185997, 0.722778022289276, -0.253966987133026, 0.604674994945526, 0.22222900390625, 0.721374988555908, -0.255980998277664, 0.606018006801605, 0.221496999263763, 0.719726979732513, -0.258056998252869, 0.607116997241974, 0.220825001597404, 0.718322992324829, -0.259032994508743, 0.608458995819092, 0.219542995095253, 0.71722400188446, -0.260315001010895, 0.60955798625946, 0.218505993485451, 0.716125011444092, -0.261658012866974, 0.609984993934631, 0.218383997678757, 0.715331971645355, -0.262878000736237, 0.609862983226776, 0.218566998839378, 0.714905023574829, -0.264771014451981, 0.60955798625946, 0.218688994646072, 0.714478015899658, -0.266907006502151, 0.609252989292145, 0.21875, 0.713927984237671, -0.268799006938934, 0.609252989292145, 0.218871995806694, 0.713135004043579, -0.269226014614105, 0.610656976699829, 0.217162996530533, 0.712279975414276, -0.269470006227493, 0.613159000873566, 0.214478000998497, 0.710815012454987, -0.270325005054474, 0.614929020404816, 0.213073998689651, 0.709473013877869, -0.272033989429474, 0.614440977573395, 0.21484400331974, 0.708679020404816, -0.272522002458572, 0.61438000202179, 0.215575993061066, 0.70831298828125, -0.274170011281967, 0.614684998989105, 0.215027004480362, 0.707580983638763, -0.276428014039993, 0.6146240234375, 0.214782997965813, 0.70684802532196, -0.277527004480362, 0.614440977573395, 0.215087994933128, 0.706481993198395, -0.276549994945526, 0.615723013877869, 0.214539006352425, 0.705932974815369, -0.275635004043579, 0.616882026195526, 0.213683992624283, 0.705505013465881, -0.275696009397507, 0.617371022701263, 0.213623002171516, 0.70507800579071, -0.274901986122131, 0.617614984512329, 0.21398900449276, 0.70507800579071, -0.273499011993408, 0.61779797077179, 0.214355006814003, 0.705383002758026, -0.272399991750717, 0.617676019668579, 0.21484400331974, 0.705687999725342, -0.272033989429474, 0.617431998252869, 0.214965999126434, 0.706054985523224, -0.271423012018204, 0.617249011993408, 0.215332001447678, 0.706299006938934, -0.269470006227493, 0.617371022701263, 0.215636998414993, 0.70684802532196, -0.267455995082855, 0.617554008960724, 0.215881004929543, 0.707396984100342, -0.266052007675171, 0.617554008960724, 0.216613993048668, 0.707702994346619, -0.264771014451981, 0.617736995220184, 0.216857999563217, 0.707947015762329, -0.262816995382309, 0.617919981479645, 0.21679699420929, 0.70849597454071, -0.260863989591599, 0.617919981479645, 0.216979995369911, 0.709228992462158, -0.258971989154816, 0.61828601360321, 0.21679699420929, 0.709656000137329, -0.257445991039276, 0.619140982627869, 0.216124996542931, 0.709656000137329, -0.255858987569809, 0.620177984237671, 0.214782997965813, 0.709778010845184, -0.254516988992691, 0.620911002159119, 0.214049994945526, 0.709778010845184, -0.252074986696243, 0.622375011444092, 0.212097004055977, 0.709960997104645, -0.249633997678757, 0.624145984649658, 0.209656000137329, 0.71002197265625, -0.247863993048668, 0.626038014888763, 0.207458004355431, 0.709595024585724, -0.246703997254372, 0.62695300579071, 0.205993995070457, 0.709595024585724, -0.245544001460075, 0.627807974815369, 0.204101994633675, 0.709778010845184, -0.245116993784904, 0.628174006938934, 0.201842993497849, 0.71026599407196, -0.244506999850273, 0.627991020679474, 0.199950993061066, 0.711181998252869, -0.24371300637722, 0.628051996231079, 0.197998002171516, 0.71197497844696, -0.243652001023293, 0.627869009971619, 0.196532994508743, 0.712523996829987, -0.244568005204201, 0.627318978309631, 0.195311993360519, 0.713074028491974, -0.245482996106148, 0.62695300579071, 0.193542003631592, 0.71356201171875, -0.245911002159119, 0.626830995082855, 0.191284000873566, 0.714110970497131, -0.247069999575615, 0.626465022563934, 0.190308004617691, 0.714294016361237, -0.248412996530533, 0.626098990440369, 0.189392000436783, 0.714354991912842, -0.250122010707855, 0.625549018383026, 0.188721001148224, 0.714416980743408, -0.252319008111954, 0.624450981616974, 0.188476994633675, 0.714721977710724, -0.254150003194809, 0.623169004917145, 0.18859900534153, 0.715148985385895, -0.254821985960007, 0.622497975826263, 0.18792699277401, 0.715637028217316, -0.255492985248566, 0.622008979320526, 0.187438994646072, 0.715942025184631, -0.256408989429474, 0.62176501750946, 0.187255993485451, 0.715880990028381, -0.257384985685349, 0.621460020542145, 0.187683001160622, 0.715698003768921, -0.257874011993408, 0.621093988418579, 0.188354000449181, 0.715698003768921, -0.257874011993408, 0.621033012866974, 0.188354000449181, 0.715758979320526, -0.257629007101059, 0.620788991451263, 0.188659995794296, 0.715942025184631, -0.256287008523941, 0.62133800983429, 0.188537999987602, 0.716003000736237, -0.255248993635178, 0.622253000736237, 0.188109993934631, 0.715698003768921, -0.25543200969696, 0.622741997241974, 0.188232004642487, 0.715148985385895, -0.255858987569809, 0.623656988143921, 0.187866002321243, 0.714294016361237, -0.256287008523941, 0.624512016773224, 0.187316998839378, 0.71356201171875, -0.256653010845184, 0.625060975551605, 0.186890006065369, 0.713074028491974, -0.256835997104645, 0.625976979732513, 0.186278998851776, 0.712341010570526, -0.257874011993408, 0.627318978309631, 0.185363993048668, 0.711059987545013, -0.259460002183914, 0.628418028354645, 0.184386998414993, 0.709716975688934, -0.261108011007309, 0.628601014614105, 0.184753000736237, 0.708862006664276, -0.260986000299454, 0.628601014614105, 0.18512000143528, 0.708800971508026, -0.261229991912842, 0.628174006938934, 0.185486003756523, 0.708984017372131, -0.260742008686066, 0.627746999263763, 0.185181006789207, 0.709595024585724, -0.258423000574112, 0.628784000873566, 0.18273900449276, 0.710205018520355, -0.256592005491257, 0.629760980606079, 0.181457996368408, 0.71032702922821, -0.255066007375717, 0.630554020404816, 0.180481001734734, 0.710388004779816, -0.254821985960007, 0.630859017372131, 0.180481001734734, 0.710205018520355, -0.255614995956421, 0.63037097454071, 0.18164099752903, 0.7100830078125, -0.25543200969696, 0.629944026470184, 0.181823998689651, 0.710510015487671, -0.254395008087158, 0.629760980606079, 0.181030005216599, 0.711181998252869, -0.253966987133026, 0.629639029502869, 0.180847004055977, 0.71154797077179, -0.254332989454269, 0.629333019256592, 0.181762993335724, 0.711426019668579, -0.255127012729645, 0.628539979457855, 0.183228000998497, 0.711486995220184, -0.255309998989105, 0.628051996231079, 0.183777004480362, 0.711731016635895, -0.255492985248566, 0.627624988555908, 0.183837994933128, 0.71197497844696, -0.255858987569809, 0.627197027206421, 0.184691995382309, 0.71203601360321, -0.256531000137329, 0.626098990440369, 0.186890006065369, 0.712158024311066, -0.255919992923737, 0.62518298625946, 0.188659995794296, 0.712768971920013, -0.255492985248566, 0.624267995357513, 0.190430000424385, 0.713195979595184, -0.254943996667862, 0.624083995819092, 0.191650003194809, 0.713257014751434, -0.254516988992691, 0.623351991176605, 0.19378699362278, 0.713440001010895, -0.254088997840881, 0.622192025184631, 0.196960002183914, 0.71374499797821, -0.252380013465881, 0.62152099609375, 0.199036002159119, 0.714354991912842, -0.250977009534836, 0.620604991912842, 0.200988993048668, 0.715148985385895, -0.249450996518135, 0.619690001010895, 0.203308001160622, 0.715758979320526, -0.247803002595901, 0.618529975414276, 0.206299006938934, 0.716491997241974, -0.24609400331974, 0.617676019668579, 0.208434998989105, 0.71722400188446, -0.244873002171516, 0.617125988006592, 0.210205003619194, 0.717589974403381, -0.245177999138832, 0.616393983364105, 0.213073998689651, 0.717284977436066, -0.244385004043579, 0.615478992462158, 0.21637000143528, 0.717346012592316, -0.242431998252869, 0.615050971508026, 0.218445003032684, 0.717711985111237, -0.240172997117043, 0.614867985248566, 0.21917699277401, 0.718445003032684, -0.238342002034187, 0.6146240234375, 0.219971001148224, 0.71899402141571, -0.237488001585007, 0.613708019256592, 0.221741005778313, 0.719482004642487, -0.236022993922234, 0.61267101764679, 0.22351099550724, 0.720336973667145, -0.234496995806694, 0.612182974815369, 0.22375500202179, 0.721190989017487, -0.233825996518135, 0.611083984375, 0.225097998976707, 0.721924006938934, -0.232970997691154, 0.609802007675171, 0.226928994059563, 0.722716987133026, -0.231689006090164, 0.608582019805908, 0.228455007076263, 0.723632991313934, -0.23046900331974, 0.60784900188446, 0.228881999850273, 0.724547982215881, -0.229857996106148, 0.607177972793579, 0.229431003332138, 0.725098013877869, -0.229431003332138, 0.60614001750946, 0.230590999126434, 0.725768983364105, -0.22851599752903, 0.604857981204987, 0.231873005628586, 0.726684987545013, -0.227660998702049, 0.603820979595184, 0.232299998402596, 0.72766101360321, -0.226685002446175, 0.602783024311066, 0.232544004917145, 0.728760004043579, -0.22613500058651, 0.601500988006592, 0.233520999550819, 0.729735970497131, -0.225097998976707, 0.60046398639679, 0.234070003032684, 0.73065197467804, -0.22375500202179, 0.600036978721619, 0.233582004904747, 0.731628000736237, -0.222838997840881, 0.600341975688934, 0.232544004917145, 0.731994986534119, -0.222900003194809, 0.600403010845184, 0.232544004917145, 0.731934010982513, -0.223021999001503, 0.599976003170013, 0.233704000711441, 0.731872975826263, -0.222595006227493, 0.600036978721619, 0.233153998851776, 0.732116997241974, -0.222595006227493, 0.599915027618408, 0.232116997241974, 0.732544004917145, -0.222838997840881, 0.599976003170013, 0.231078997254372, 0.732726991176605, -0.223327994346619, 0.599731028079987, 0.231018006801605, 0.732788026332855, -0.223572000861168, 0.59918200969696, 0.231261998414993, 0.733093023300171, -0.223938003182411, 0.5989990234375, 0.230286002159119, 0.733458995819092, -0.224669992923737, 0.599059998989105, 0.229065001010895, 0.733582019805908, -0.225585997104645, 0.599487006664276, 0.227599993348122, 0.733398020267487, -0.226561993360519, 0.599792003631592, 0.226685002446175, 0.733093023300171, -0.226868003606796, 0.600341975688934, 0.225402995944023, 0.732971012592316, -0.227356001734734, 0.600585997104645, 0.224059998989105, 0.733031988143921, -0.228210002183914, 0.60089099407196, 0.222595006227493, 0.732971012592316, -0.229674994945526, 0.601013004779816, 0.221618995070457, 0.732666015625, -0.230286002159119, 0.601440012454987, 0.220520004630089, 0.73248302936554, -0.230590999126434, 0.602294981479645, 0.218505993485451, 0.732239007949829, -0.231933996081352, 0.603271007537842, 0.216613993048668, 0.731628000736237, -0.233520999550819, 0.6041259765625, 0.21527099609375, 0.730773985385895, -0.234862998127937, 0.605163991451263, 0.214111000299454, 0.729857981204987, -0.236633002758026, 0.606018006801605, 0.213135004043579, 0.728882014751434, -0.238708004355431, 0.606812000274658, 0.211914002895355, 0.727843999862671, -0.240784004330635, 0.607177972793579, 0.21136499941349, 0.727051019668579, -0.241455003619194, 0.607788026332855, 0.210754007101059, 0.726500988006592, -0.241943001747131, 0.608947992324829, 0.20898400247097, 0.72589099407196, -0.243347004055977, 0.609802007675171, 0.207519993185997, 0.725098013877869, -0.244811996817589, 0.610473990440369, 0.20660400390625, 0.724304020404816, -0.246277004480362, 0.610718011856079, 0.206664994359016, 0.723572015762329, -0.247008994221687, 0.61132800579071, 0.206359997391701, 0.722899973392487, -0.24804699420929, 0.612244009971619, 0.205321997404099, 0.722106993198395, -0.249145999550819, 0.613281011581421, 0.203979000449181, 0.721190989017487, -0.250366002321243, 0.614075005054474, 0.203612998127937, 0.720215022563934, -0.251038014888763, 0.61480700969696, 0.203429996967316, 0.719359993934631, -0.251587003469467, 0.615417003631592, 0.203186005353928, 0.71875, -0.251403987407684, 0.616028010845184, 0.202148005366325, 0.71856701374054, -0.251282006502151, 0.616638004779816, 0.201720997691154, 0.718262016773224, -0.251221001148224, 0.617125988006592, 0.201477006077766, 0.717895984649658, -0.250609993934631, 0.617371022701263, 0.20159900188446, 0.717895984649658, -0.249390006065369, 0.61779797077179, 0.201294004917145, 0.718017995357513, -0.248595997691154, 0.617981016635895, 0.20159900188446, 0.718017995357513, -0.248169004917145, 0.61785900592804, 0.202758997678757, 0.717957019805908, -0.247498005628586, 0.617431998252869, 0.203857004642487, 0.718262016773224, -0.246703997254372, 0.617003977298737, 0.20422400534153, 0.71875, -0.245116993784904, 0.616698980331421, 0.204589992761612, 0.719482004642487, -0.243590995669365, 0.61615002155304, 0.205321997404099, 0.72027599811554, -0.242248997092247, 0.615478992462158, 0.206421002745628, 0.721008002758026, -0.241332992911339, 0.614867985248566, 0.207519993185997, 0.721496999263763, -0.239929005503654, 0.614257991313934, 0.208434998989105, 0.72222900390625, -0.238097995519638, 0.613708019256592, 0.209044992923737, 0.723083019256592, -0.236633002758026, 0.613281011581421, 0.209717005491257, 0.72375500202179, -0.235107004642487, 0.612793028354645, 0.210631996393204, 0.724425971508026, -0.233458995819092, 0.612426996231079, 0.211303994059563, 0.725036978721619, -0.231689006090164, 0.611999988555908, 0.211792007088661, 0.725830018520355, -0.230103000998497, 0.611693978309631, 0.212097004055977, 0.726500988006592, -0.229186996817589, 0.611572027206421, 0.212402001023293, 0.726806998252869, -0.228698998689651, 0.611083984375, 0.213378995656967, 0.727111995220184, -0.227965995669365, 0.610656976699829, 0.214294001460075, 0.7274169921875, -0.22723400592804, 0.610229015350342, 0.214782997965813, 0.727843999862671, -0.226868003606796, 0.609679996967316, 0.21527099609375, 0.728271007537842, -0.226318001747131, 0.608887016773224, 0.215819999575615, 0.72894299030304, -0.225097998976707, 0.608093023300171, 0.216613993048668, 0.729797005653381, -0.223816007375717, 0.607666015625, 0.21637000143528, 0.730590999126434, -0.222717002034187, 0.606812000274658, 0.216613993048668, 0.731567025184631, -0.221741005778313, 0.606262028217316, 0.216674998402596, 0.732239007949829, -0.221435993909836, 0.605225026607513, 0.217773005366325, 0.732909977436066, -0.221068993210793, 0.604430973529816, 0.218688994646072, 0.733398020267487, -0.220337003469467, 0.604247987270355, 0.21832300722599, 0.733887016773224, -0.21984900534153, 0.603820979595184, 0.218262001872063, 0.734435975551605, -0.219359993934631, 0.603515982627869, 0.218262001872063, 0.734802007675171, -0.219237998127937, 0.602966010570526, 0.218994006514549, 0.735046029090881, -0.21917699277401, 0.602294981479645, 0.219420999288559, 0.735473990440369, -0.219420999288559, 0.601746022701263, 0.219604000449181, 0.735840022563934, -0.219237998127937, 0.601440012454987, 0.219054996967316, 0.73632800579071, -0.218628004193306, 0.601440012454987, 0.218688994646072, 0.736572027206421, -0.218628004193306, 0.601318001747131, 0.218688994646072, 0.736693978309631, -0.218628004193306, 0.601195991039276, 0.218628004193306, 0.736815989017487, -0.218871995806694, 0.601013004779816, 0.218628004193306, 0.736877024173737, -0.219359993934631, 0.60095202922821, 0.218262001872063, 0.736877024173737, -0.219726994633675, 0.601195991039276, 0.217528998851776, 0.736815989017487, -0.220214992761612, 0.601257026195526, 0.217590004205704, 0.736633002758026, -0.220214992761612, 0.601624011993408, 0.217041000723839, 0.736450016498566, -0.221068993210793, 0.602356016635895, 0.216187000274658, 0.735840022563934, -0.222289994359016, 0.603026986122131, 0.215332001447678, 0.735229015350342, -0.223450005054474, 0.603393971920013, 0.215149000287056, 0.73461902141571, -0.224121004343033, 0.60400402545929, 0.215027004480362, 0.733947992324829, -0.224730998277664, 0.604430973529816, 0.214416995644569, 0.733520984649658, -0.225525006651878, 0.604674994945526, 0.213866993784904, 0.733276009559631, -0.225768998265266, 0.605286002159119, 0.213318005204201, 0.73284900188446, -0.225647002458572, 0.605835020542145, 0.213073998689651, 0.732544004917145, -0.224976003170013, 0.606567025184631, 0.212218999862671, 0.732361018657684, -0.224121004343033, 0.607299983501434, 0.210876002907753, 0.73242199420929, -0.222900003194809, 0.608031988143921, 0.209534004330635, 0.732544004917145, -0.221618995070457, 0.608887016773224, 0.208191007375717, 0.73260498046875, -0.221191003918648, 0.60913097858429, 0.207642003893852, 0.732726991176605, -0.220886006951332, 0.609375, 0.20660400390625, 0.732909977436066, -0.221435993909836, 0.60913097858429, 0.206542998552322, 0.732909977436066, -0.221863001585007, 0.609375, 0.205871999263763, 0.732788026332855, -0.222778007388115, 0.609070003032684, 0.205993995070457, 0.732788026332855, -0.223144993185997, 0.60913097858429, 0.205321997404099, 0.732726991176605, -0.223876997828484, 0.608887016773224, 0.205138996243477, 0.732788026332855, -0.223938003182411, 0.608336985111237, 0.20507800579071, 0.733214974403381, -0.224121004343033, 0.607909977436066, 0.205200001597404, 0.733520984649658, -0.224304005503654, 0.60760498046875, 0.204772993922234, 0.733825981616974, -0.224487006664276, 0.607116997241974, 0.20465099811554, 0.73419201374054, -0.223876997828484, 0.606812000274658, 0.204589992761612, 0.734679996967316, -0.223693996667862, 0.606262028217316, 0.205321997404099, 0.734924018383026, -0.22351099550724, 0.605956971645355, 0.205321997404099, 0.735291004180908, -0.22351099550724, 0.605773985385895, 0.20507800579071, 0.735473990440369, -0.22351099550724, 0.605468988418579, 0.205383002758026, 0.735656976699829, -0.222960993647575, 0.605103015899658, 0.205810993909836, 0.736023008823395, -0.22265599668026, 0.604492008686066, 0.206787005066872, 0.73632800579071, -0.222350999712944, 0.604492008686066, 0.206542998552322, 0.736450016498566, -0.222412005066872, 0.604492008686066, 0.206542998552322, 0.736450016498566, -0.22222900390625, 0.604430973529816, 0.206787005066872, 0.736510992050171, -0.221741005778313, 0.604247987270355, 0.207519993185997, 0.736633002758026, -0.221496999263763, 0.60400402545929, 0.208191007375717, 0.736693978309631 ], [ 0.0, 24.442625, 39.194707999999999, 61.854044999999999, 84.288914000000005, 99.450430999999995, 121.771852999999993, 144.347949, 159.364028999999988, 181.872047000000009, 204.502186999999992, 227.689794000000006, 241.819105000000008, 264.386051000000009, 287.644390999999985, 301.806166000000019, 324.464713000000017, 347.498874999999998, 361.862082999999984, 384.496276000000023, 407.519087000000013, 421.777348000000018, 444.410383000000024, 467.634974999999997, 481.846771999999987, 504.342389000000026, 527.598986999999966, 541.706991000000016, 564.343189000000052, 587.504323999999997, 601.785028000000011, 624.280472000000032, 647.485078000000044, 661.707997999999975, 684.360556999999972, 707.551723000000038, 721.905934999999999, 744.283105999999975, 767.473302999999987, 781.877348999999981, 812.446985000000041, 827.392887999999971, 841.761734000000047, 864.396862000000056, 887.57964000000004, 901.805281000000036, 924.298419999999965, 946.823136999999974, 961.874558999999977, 984.580593000000022, 1006.995490000000018, 1021.749721000000022, 1044.247022000000015, 1066.94397099999992, 1081.884062000000085, 1104.345878000000084, 1127.03431599999999, 1142.13705200000004, 1164.494961999999987, 1186.811948999999913, 1201.822609000000057, 1224.532431999999972, 1246.863875999999891, 1261.886214000000109, 1284.420648000000028, 1307.027254999999968, 1321.934768000000076, 1344.36587899999995, 1366.99632500000007, 1381.964216000000079, 1404.406938000000082, 1426.892002999999931, 1441.922702000000072, 1464.333482000000004, 1487.128226999999924, 1501.838130000000092, 1524.530408000000079, 1547.047953000000007, 1570.026313000000073, 1584.360003000000006, 1607.052965000000086, 1622.064579000000094, 1644.632534999999962, 1666.875152999999955, 1690.038506000000098, 1704.399822000000086, 1727.014836999999943, 1750.059140999999954, 1764.371636999999964, 1786.801375000000007, 1809.996748000000025, 1824.38440300000002, 1846.869345000000067, 1869.37538799999993, 1887.17795799999999, 1906.894735999999966, 1929.465545999999904, 1944.510976999999912, 1966.915226000000075, 1989.515495000000101, 2004.527618000000075, 2026.84980500000006, 2049.359997999999905, 2064.454929999999877, 2086.775657000000137, 2109.578861999999845, 2124.592886999999791, 2146.88937100000021, 2169.373725999999806, 2184.370066999999835, 2207.053922000000057, 2229.462777000000187, 2244.574528999999984, 2266.909375000000182, 2289.656570000000102, 2304.251385999999911, 2326.864402000000155, 2349.467259999999897, 2364.406320000000051, 2386.825324999999793, 2409.46678699999984, 2424.306005999999797, 2446.863326000000143, 2469.422426000000087, 2484.392648000000008, 2506.959632000000056, 2529.597260000000006, 2544.321103000000221, 2566.892823000000135, 2589.595030999999835, 2604.29707499999995, 2626.959030999999868, 2649.378937999999835, 2665.724843999999848, 2686.884634999999889, 2709.442516000000069, 2725.772409000000152, 2746.844039000000066, 2769.47233499999993, 2785.771026999999776, 2806.979209999999966, 2829.421465999999782, 2851.835382000000209, 2866.894768999999997, 2889.461056000000099, 2911.861957000000075, 2926.895281000000068, 2949.494291999999859, 2971.978626000000077, 2986.906214000000091, 3009.419436000000132, 3032.06345599999986, 3046.84909000000016, 3069.438751000000138, 3091.887000000000171, 3115.050381000000016, 3129.369032999999945, 3151.909756000000016, 3166.963894999999866, 3189.642637999999806, 3212.002465999999913, 3228.404939999999897, 3249.364789000000201, 3272.068972000000031, 3286.775778000000173, 3309.467837000000145, 3331.88376100000005, 3347.0514119999998, 3369.502659000000222, 3391.875527000000147, 3407.07388200000014, 3429.412510000000111, 3451.910577999999987, 3466.989171000000169, 3489.353141000000051, 3511.917257000000063, 3526.794941000000108, 3549.446132000000034, 3571.981112999999823, 3589.825597000000016, 3609.379860000000008, 3631.884756999999809, 3648.223151000000144, 3669.667129999999815, 3691.877973999999995, 3708.52269299999989, 3729.400575000000117, 3754.777023000000099, 3768.289584000000104, 3789.491125000000011, 3811.920243999999911, 3835.762944999999945, 3849.418925999999828, 3872.087927000000036, 3888.310941000000184, 3909.39044899999999, 3931.872789999999895, 3954.361554000000069, 3969.359268000000156, 3991.998305000000073, 4008.280228000000079, 4029.472593999999845, 4051.854423000000224, 4068.319121999999879, 4089.428762000000006, 4111.968875999999909, 4128.305059999999685, 4149.476942999999665, 4171.945681999999579, 4188.362237999999707, 4209.366479999999683, 4231.836661000000277, 4254.641905999999835, 4269.428969999999936, 4291.882725000000391, 4314.576820000000225, 4329.457002000000102, 4351.937213999999585, 4374.651280000000042, 4389.405477000000246, 4411.909746000000268, 4434.425898999999845, 4449.388245000000097, 4472.120269000000008, 4494.606652999999824, 4510.970293000000311, 4531.935061000000132, 4554.469673999999941, 4570.819744999999784, 4591.911006999999699, 4614.429226000000199, 4630.797994999999901, 4652.04095899999993, 4674.651625000000422, 4690.822164000000157, 4711.997362000000066, 4734.49259499999971, 4750.826516000000083, 4771.934949000000415, 4794.499867000000449, 4810.855247999999847, 4831.942543000000114, 4854.429767999999967, 4870.939623000000211, 4891.911420000000362, 4914.34519999999975, 4930.851128999999673, 4951.83521699999983, 4976.026759000000311, 4990.876484000000346, 5011.876422000000275, 5034.477719999999863, 5050.882529000000432, 5072.013966999999866, 5094.377687000000151, 5112.328254000000015, 5131.927434000000176, 5154.448314000000209, 5170.879026999999951, 5191.947699000000284, 5214.582980000000134, 5230.820980000000418, 5251.971528000000035, 5274.507601999999679, 5290.928542999999991, 5312.118824000000131, 5334.50302499999998, 5350.867427000000134, 5373.48570699999982, 5394.584240999999565, 5410.899666000000252, 5432.168196999999964, 5454.393151999999645, 5470.911783999999898, 5493.342822999999953, 5514.44031300000006, 5537.07144100000005, 5553.331640999999763, 5574.432880000000296, 5597.028089000000364, 5613.292064000000209, 5634.512273000000278, 5657.190354000000298, 5673.510522999999921, 5694.571786999999858, 5717.024244000000181, 5733.377166000000216, 5754.515301000000363, 5776.858433999999761, 5793.34795000000031, 5814.558423999999832, 5836.918136000000231, 5853.386588000000302, 5874.666895000000295, 5896.996516999999585, 5913.374555999999757, 5934.523559999999634, 5956.93357399999968, 5973.408629999999903, 5994.676599000000351, 6016.899884000000384, 6033.373351999999613, 6054.436993999999686, 6076.951210999999603, 6093.374329000000216, 6114.503126999999949, 6137.15506699999969, 6153.404974000000038, 6174.431907999999567, 6197.037411999999676, 6213.389646999999968, 6234.670885999999882, 6257.134003000000121, 6273.486042999999881, 6294.482890999999654, 6316.9535249999999, 6333.402071999999862, 6354.371747000000141, 6377.025117000000137, 6393.396851000000424, 6415.902503000000252, 6437.02246600000035, 6460.911614999999983, 6476.130369000000428, 6497.034480999999687, 6513.386601000000155, 6535.88488099999995, 6557.115455000000111, 6573.633432999999968, 6595.976375000000189, 6616.946490999999696, 6633.388769000000138, 6656.180830999999671, 6677.05730500000027, 6693.373402999999598, 6715.875482999999804, 6736.950267999999596, 6759.574359000000186, 6776.161130999999841 ], 0, 0, 0, 0 ] ] ] ],
					"cursor_color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"cursor_followmouse" : 0,
					"cursor_position" : -1.0,
					"cursor_shape" : "bar",
					"cursor_size" : 3,
					"cursor_visible" : 1,
					"domain_bounds" : [ 0.0, 13022.375082000000475 ],
					"domainruler_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"domainruler_fgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"domainruler_grid" : 0,
					"domainruler_position" : 0,
					"domainruler_size" : 15,
					"domainruler_unit" : 0,
					"domainruler_visible" : 0,
					"domainscrollbar_color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"domainscrollbar_size" : 10,
					"domainscrollbar_visible" : 1,
					"embed" : 1,
					"externalfiles" : 1,
					"id" : "obj-18",
					"layout" : 0,
					"maxclass" : "imubu",
					"name" : "MyoData",
					"numinlets" : 1,
					"numoutlets" : 1,
					"opacity" : 0.600000023841858,
					"opacityprogressive" : 0,
					"orientation" : 0,
					"outlettype" : [ "" ],
					"outputkeys" : 0,
					"outputmouse" : 0,
					"outputselection" : 0,
					"outputtimeselection" : 0,
					"outputvalues" : 0,
					"patching_rect" : [ 513.0, 8.0, 385.0, 189.0 ],
					"rangeruler_grid" : 0,
					"rangeruler_size" : 35,
					"rangeruler_visible" : 0,
					"region_bounds" : [ 0.0, 0.0 ],
					"region_color" : [ 0.8, 0.7, 0.7, 1.0 ],
					"region_visible" : 1,
					"split_color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"split_size" : 2,
					"split_visible" : 1,
					"tabs_position" : 0,
					"tabs_size" : 20,
					"tabs_visible" : 1,
					"toolbar_bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"toolbar_position" : 1,
					"toolbar_size" : 30,
					"toolbar_visible" : 1,
					"useplaceholders" : 1,
					"viewconfig" : [ "interface multibpf, , visible 1, autobounds 2, hidenotforemost 0, allbuffersvisible 0, domainalign time" ],
					"windresize" : 0
				}

			}
, 			{
				"box" : 				{
					"attr" : "maxsize",
					"id" : "obj-7",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 215.0, 65.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "EM_percentchg",
					"id" : "obj-16",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 486.0, 369.916687000000024, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.38, 0.38, 0.38, 1.0 ],
					"bgcolor2" : [ 0.3, 0.3, 0.3, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.38, 0.38, 0.38, 1.0 ],
					"bgfillcolor_color2" : [ 0.3, 0.3, 0.3, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"gradient" : 1,
					"id" : "obj-35",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 421.0, 359.845244999999977, 32.5, 21.0 ],
					"text" : "train",
					"textcolor" : [ 0.92, 0.92, 0.92, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 374.0, 120.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 374.0, 156.0, 52.0, 22.0 ],
					"text" : "record $1"
				}

			}
, 			{
				"box" : 				{
					"candycane" : 3,
					"id" : "obj-44",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 19.0, 244.17855800000001, 111.0, 179.5 ],
					"setminmax" : [ -3.0, 3.0 ],
					"setstyle" : 1,
					"size" : 3
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 108.0, 16.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 108.0, 48.0, 54.0, 22.0 ],
					"text" : "stream $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 52.0, 48.0, 45.0, 22.0 ],
					"text" : "connect"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 52.0, 89.0, 137.0, 22.0 ],
					"text" : "myo @unlock 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 457.0, 236.0, 490.0, 22.0 ],
					"text" : "mubu.record MyoData2 accel @predef yes @timetagged yes @matrixcols 3 @maxsize 120s @samplerate 25"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 2,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"order" : 1,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-17", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"order" : 2,
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-2", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 2 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"order" : 0,
					"source" : [ "obj-28", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"order" : 1,
					"source" : [ "obj-28", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 1 ],
					"source" : [ "obj-28", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"midpoints" : [ 919.5, 472.761870999999985, 984.5, 472.761870999999985, 984.5, 382.761870999999985, 923.5, 382.761870999999985 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 2 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-48", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 1 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 1 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 1 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 1 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "mubu.setlabels.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/MuBuForMax/patchers",
				"patcherrelativepath" : "../../../../Documents/Max 8/Packages/MuBuForMax/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mubu.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "myo.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.gmm.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "mubu.gmr.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
