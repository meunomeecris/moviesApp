//
//  LoginView.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import SwiftUI

struct LoginView: View {
    var viewModel: LoginViewModel = LoginViewModel()
    
    
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            
            //MARK: - Email Input
            VStack{
                Spacer()
                Image("LogoTheMovieDB")
                Spacer()
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.callout)
                        .foregroundColor(Color("DarkMode"))
                        .padding(.leading)
                    Spacer()
                    TextField("myemail@email.com", text: $username)
                        .frame(height: 54)
                        .padding(.leading)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(.systemGray))
                }
                .frame(width: .infinity, height: 80)
                
                //MARK: - Password Input
                VStack(alignment: .leading){
                    Text("Password")
                        .font(.callout)
                        .foregroundColor(Color("DarkMode"))
                        .padding(.leading)
                    Spacer()
                    SecureField("Tap your password", text: $password)
                        .frame(width: .infinity, height: 54)
                        .padding(.leading)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(.systemGray))
                }
                .frame(width: .infinity, height: 80)
                .padding(.top, 24)
                .padding(.bottom, 24)
                
                
                //MARK: - Login Button
                VStack{
                    Button(action: {}) {
                        Text("Login")
                            .bold()
                            .font(.title3)
                            .foregroundColor(Color("LightMode"))
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("LightMode"))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 93)
                    .background(
                        Color("DarkMode")
                    )
                }
                
            }
            .edgesIgnoringSafeArea(.all)//End of the VStack
        } //End of the ZStack
    } //End of the body
} //End of the view

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
        LoginView()
            .preferredColorScheme(.light)
    }
}
