//
//  CreateCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI

struct CreateCampaignView: View {
    @State var vm = CreateCampaignViewModel()
    @State var user = ""
    @State var isEditing = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            VStack(spacing: 30) {
                mainTextField(titleKey: "Campaign Name", text: $vm.campaignName, prompt: "Enter campaign name")
                mainTextField(titleKey: "Campaign Location", text: $vm.campaignLocation, prompt: "Enter location")
                formSlider()
                VStack(alignment: .leading) {
                    Text("Players")
                        .font(.title2)
                        .fontWeight(.bold)
                    Button() {
                        //
                    } label: {
                        HStack() {
                            Image(systemName: "person.fill.badge.plus")
                            Text("Add new player")
                            Spacer()
                        }
                        .padding()
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white).opacity(0.1).ignoresSafeArea()
                        }
                    }
                }
                Button {
                    vm.campaignsLogic.saveCampaign(vm.newCampaign)
                    dismiss()
                } label: {
                    Text("Create Campaign")
                }
                .padding()
                .background {
                    Color.black
                }
                .cornerRadius(10)
            }
            .padding(30)
            .foregroundStyle(.white)
        }
    }
    
    @ViewBuilder
    func mainTextField(titleKey: String, text:Binding<String>, prompt:String) -> some View {
        TextField(titleKey, text:text, prompt: Text(prompt).foregroundStyle(.gray))
            .disableAutocorrection(true)
            .padding()
            .foregroundStyle(.white)
            .background() {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white).opacity(0.1)
            }
    }
    
    @ViewBuilder
    func formSlider() -> some View {
        VStack {
            Slider(value: .convert(from: $vm.campaignLevel), in: 0...20, onEditingChanged: { editing in
                isEditing = editing
            })
            .tint(.creamDungeon)
            Text("\(vm.campaignLevel) / 20")
                .font(.title3)
                .foregroundStyle(isEditing ? .creamDungeon : .white)
        }
        .padding()
    }
}

#Preview {
    CreateCampaignView()
}
