//
//  LoginView.swift
//  movieApp
//
//  Created by Cris Messias on 13/04/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    // We are recovering the instance created by MovieApp struct, in the main funcion
    @EnvironmentObject var sessionController: UserSessionController
    
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
                    TextField("myemail@email.com", text: $viewModel.usernameInput,  onEditingChanged: {_ in
                        viewModel.validateInputs()
                    })
                    .frame(height: 54)
                    .padding(.leading)
                    .textInputAutocapitalization(.never)
                    .foregroundColor(Color(.systemGray))
                    .modifier(TextFieldValidationModifier(validationState: viewModel.usernameValidOutput))
                }
                .frame(height: 80)
                .padding()
                
                
                //MARK: - Password Input
                VStack(alignment: .leading){
                    Text("Password")
                        .font(.callout)
                        .foregroundColor(Color("DarkMode"))
                        .padding(.leading)
                    Spacer()
                    SecureField("Tap your password", text: $viewModel.passwordInput)
                        .frame(height: 54)
                        .padding(.leading)
                        .textInputAutocapitalization(.never)
                        .foregroundColor(Color(.systemGray))
                        .modifier(TextFieldValidationModifier(validationState: viewModel.passwordValidOutput))
                }
                .frame(height: 80)
                .padding(.bottom, 24)
                .padding()
                
                
                //MARK: - Login Button
                VStack{
                    Button(action: {
                        // litle swiftui workaround 😅
                        let session = viewModel.login()
                        //Saving user session
                        sessionController.saveUserSession(session)
                        
                    }) {
                        Text("Login")
                            .bold()
                            .font(.title3)
                            .foregroundColor(Color("LightMode"))
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("LightMode"))
                    }
                    //.disabled(!viewModel.isLoginButtonEnabled)
                    .padding()
                    .frame(maxHeight: 93)
                    .background(
                        Color("DarkMode")
                    )
                }
            }//End of the VStack
            .edgesIgnoringSafeArea(.all)
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
