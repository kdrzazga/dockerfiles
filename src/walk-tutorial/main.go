package main

import (
	"github.com/lxn/walk"
	. "github.com/lxn/walk/declarative"
	//"strings"
)

func main() {
	var outTE *walk.PushButton
	

	MainWindow{
		Title:   "O",
		MinSize: Size{600, 400},
		Layout:  VBox{},
		Children: []Widget{
			HSplitter{
				Children: []Widget{
					PushButton{
				Text: "",
				OnClicked: func() {
					this.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},
				},
			}, ///end Splitter
			HSplitter{
				Children: []Widget{
					PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},
				},
			}, ///end Splitter			
			HSplitter{
				Children: []Widget{
					PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},			PushButton{
				Text: "",
				OnClicked: func() {
					outTE.SetText("X")
				},
			},
				},
			}, ///end Splitter			

		},
	}.Run()
}
