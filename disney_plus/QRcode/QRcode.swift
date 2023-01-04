//
//  QRcode.swift
//  disney_plus
//
//  Created by Abby on 2023/1/4.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CoreImage

struct QRcode: View {
    @State private var name=""
    @State private var email=""
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var body: some View {
        ZStack{
            Image("back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.4)
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)

                TextField("Email address", text: $email)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: generateQRCode(from: "\(name)\n\(email)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }.scrollContentBackground(.hidden)
        }
    }
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRcode_Previews: PreviewProvider {
    static var previews: some View {
        QRcode()
    }
}
