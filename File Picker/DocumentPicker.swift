//
//  DocumentPicker.swift
//  File Picker
//
//  Created by Andreas Prang on 10.07.20.
//

import SwiftUI

	final class DocumentPicker: NSObject, UIViewControllerRepresentable, ObservableObject {
		typealias UIViewControllerType = UIDocumentPickerViewController
		@Published var urlsPicked = [URL]()

		lazy var viewController:UIDocumentPickerViewController = {
			// For picked only folder
	//		let vc = UIDocumentPickerViewController(documentTypes: ["public.folder"], in: .open)
			let vc = UIDocumentPickerViewController(documentTypes: ["com.adobe.pdf"], in: .open)
			// For picked every document
	//        let vc = UIDocumentPickerViewController(documentTypes: ["public.data"], in: .open)
			// For picked only images
	//        let vc = UIDocumentPickerViewController(documentTypes: ["public.image"], in: .open)
			vc.allowsMultipleSelection = false
	//        vc.accessibilityElements = [kFolderActionCode]
	//        vc.shouldShowFileExtensions = true
			vc.delegate = self
			return vc
		}()

		func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
			viewController.delegate = self
			return viewController
		}

		func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
		}
	}

	extension DocumentPicker: UIDocumentPickerDelegate {
		func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
			urlsPicked = urls
			print("DocumentPicker geoFolder.geoFolderPath: \(urlsPicked[0].path)")
		}

	//    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
	//        controller.dismiss(animated: true) {
	//        }
	//    }
	}
