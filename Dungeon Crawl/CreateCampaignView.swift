//
//  CreateCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI

struct CreateCampaignView: View {
    @State var vm = CreateCampaignViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea().opacity(0.2)
            VStack(spacing: 20) {
                TextField("Campaign name", text: $vm.campaignName, prompt: Text("Elige un nombre"))
                    .padding()
                    .overlay {
                        Capsule()
                            .stroke(Color.blue)
                    }
                Button {
                    vm.campaignsLogic.saveCampaign(vm.newCampaign)
                    dismiss()
                } label: {
                    Text("Create Campaign")
                }
            }
            .padding()
        }
    }
}

#Preview {
    CreateCampaignView()
}
