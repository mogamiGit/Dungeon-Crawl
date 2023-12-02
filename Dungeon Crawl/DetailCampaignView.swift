//
//  DetailCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import SwiftUI
import SwiftData

struct DetailCampaignView: View {
    @State private var campaignEdit: Campaign?
    @State private var selectedTab: Tab?
    @State private var tabProgress: CGFloat = 0
    @Bindable var campaign: Campaign
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 10) {
                    VStack(spacing: 15) {
                        Text(campaign.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        HStack(spacing: Constant.spaceBetweenElements) {
                            HStack {
                                Image("location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(Color.secondaryDungeon)
                                Text(campaign.location)
                            }
                            Text("Lv. \(campaign.level)")
                                .foregroundStyle(Color.secondaryDungeon)
                        }
                        .foregroundStyle(Color.gray)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)
                    CustomTopTabBar()
                        .padding(.top, 10)
                    GeometryReader {
                        let size = $0.size
                        
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 0) {
                                PlayerCampaignListView(campaign: campaign)
                                    .id(Tab.players)
                                    .containerRelativeFrame(.horizontal)
                                EncounterCampaignListView()
                                    .id(Tab.encounters)
                                    .containerRelativeFrame(.horizontal)
                            }
                            .scrollTargetLayout()
                            .offsetX { value in
                                print(value)
                                let progress = -value / (size.width * CGFloat(Tab.allCases.count - 1))
                                tabProgress = max(min(progress, 1), 0)
                            }
                        }
                        .scrollPosition(id: $selectedTab)
                        .scrollIndicators(.hidden)
                        .scrollTargetBehavior(.paging)
                        .scrollClipDisabled()
                    }
                }
            }
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        campaignEdit = campaign
                    }, label: {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(.white)
                    })
                }
            }
            .fullScreenCover(item: $campaignEdit) { campaign in
                UpdateCampaignView(campaign: campaign)
            }
        }
    }
    
    @ViewBuilder
    func CustomTopTabBar() -> some View {
        VStack(alignment: .center) {
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    HStack(spacing: 10) {
                        Image(tab.iconTab)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .foregroundStyle(.white)
                        Text(tab.rawValue)
                            .font(.caption)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedTab = tab
                        }
                    }
                }
            }
            .background {
                GeometryReader {
                    let size = $0.size
                    let capsuleWidth = size.width / CGFloat(Tab.allCases.count)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black)
                        .padding(5)
                        .frame(width: capsuleWidth)
                        .offset(x: tabProgress * (size.width - capsuleWidth))
                }
            }
            .background(Color.secondaryDungeon.opacity(0.5), in: RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 14)
        }
    }
}


#Preview {
    DetailCampaignView(campaign: Campaign.exampleCampaign())
        .modelContainer(PreviewSampleData.container)
}
