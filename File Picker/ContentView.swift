//
//  ContentView.swift
//  File Picker
//
//  Created by Andreas Prang on 03.07.20.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var picker = DocumentPicker()
	@State private var urlPick = ""
	
	var body: some View {
		HStack {
			urlPickedFoRTextField()
				.textFieldStyle(RoundedBorderTextFieldStyle())
			Spacer()
			Button(action: {
				#if targetEnvironment(macCatalyst)
				let viewController = UIApplication.shared.windows[0].rootViewController!
				viewController.present(self.picker.viewController, animated: true)
				self.picker.objectWillChange.send()
				#endif
				print("Hai premuto il pulsante per determinare il path della GeoFolder")
			}) {
				Image(systemName: "square.and.arrow.up")
			}
		}
		.padding()
	}
	
	private func urlPickedFoRTextField() -> some View {
		if picker.urlsPicked.count > 0 {
			DispatchQueue.main.async {
				self.urlPick = self.picker.urlsPicked[0].path
			}
		}
		return TextField("", text: $urlPick)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
