//
//  UserDetailView.swift
//  CodingTestApp
//
//  Created by Nilay on 25/08/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @StateObject var viewModel = UserDetailViewModel()
    
    var body: some View {
        
        GeometryReader { _ in
            if viewModel.isLoading{
                ZStack(alignment: .center){
                    ProgressView()

                }
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
              
            }else{
                MainView(viewModel: viewModel)
            }
            
        }.onAppear(){
            viewModel.initFetch()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
            UserDetailView()
        
      
      
    }
}


 struct MainView: View {
     @StateObject var viewModel: UserDetailViewModel

    var body: some View {
        
        ZStack {
            ZStack(alignment: .leading){
                   
                        Rectangle()
                            .fill(Color.gray)
                    
                    VStack(alignment: .leading) {
                        Text(viewModel.userDetail?.name ?? "")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .padding(.top, 100)
                            .padding(.leading, 16)
                            .padding(.bottom, 2)
                        Text(viewModel.userDetail?.email ?? "")
                            .foregroundColor(.white)
                            .font(.headline)
                            //.bold()
                            .padding(.top,0)
                            .padding(.leading, 16)
                        Text(viewModel.userDetail?.phone ?? "")
                            .foregroundColor(.white)
                            .font(.headline)
                            //.bold()
                            .padding(.top,0)
                            .padding(.leading, 16)
                        Text(viewModel.userDetail?.address?.street ?? "")
                            .foregroundColor(.white)
                            .font(.headline)
                            //.bold()
                            .padding(.top,0)
                            .padding(.leading, 16)
                            
                        Spacer()
                    }
                }
               
            .ignoresSafeArea(.all)
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
                VStack(){
                    Text("Posts")
                        .foregroundColor(.black)
                        .font(.title)
                        .bold()
                        .padding(.top, 6)
                    List(viewModel.userPosts ?? [], id: \.self) { item in
                        Text(item.title ?? "")
                    }.padding(.leading, -10)
                        .padding(.trailing, -10)
                        .padding(.top, 0)
                        .scrollContentBackground(.hidden)
                }
            }
            
            
            .edgesIgnoringSafeArea(.bottom)
            .padding(.top, UIScreen.main.bounds.height * 0.25)
            
        }

    }
}
