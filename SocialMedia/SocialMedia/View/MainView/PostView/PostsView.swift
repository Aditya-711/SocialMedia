//
//  PostsView.swift
//  SocialMedia
//
//  Created by Aditya Inamdar on 17/02/23.
//

import SwiftUI

struct PostsView: View {
    
    @State var recentsPosts:[Post] = []
    
    @State private var createNewPost: Bool = false
    var body: some View {
        NavigationStack {
            ReuseablePostsView(posts: $recentsPosts)
                .hAlign(.center).vAlign(.center)
                .overlay(alignment: .bottomTrailing) {
                    Button{
                        createNewPost.toggle()
                    }label: {
                        Image(systemName: "plus")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(13)
                            .background(.black,in: Circle())
                    }
                    .padding(15)
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink{
                            SearchUserView()
                        }label: {
                            Image(systemName: "magnifyingglass")
                                .tint(.black)
                                .scaleEffect(0.9)
                        }
                    }
                })
                .navigationTitle("Post's")
        }
        .fullScreenCover(isPresented: $createNewPost) {
            CreateNewPost  { post in
                recentsPosts.insert(post, at: 0)
            }
        }
        
        
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
