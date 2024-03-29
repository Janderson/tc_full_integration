# -*- coding: utf-8 -*-
### UTILITY METHODS ###

def usuario_normal
  @visitante ||= { :name => "tc_full_integration", :email => "example@example.com",
    :password => "please", :password_confirmation => "please", :confirmed_at=> DateTime.now  }
end

def encontrar_usuario
  @usuario ||= Usuario.first conditions: {:email => @visitante[:email]}
end

def criar_usuario_nao_confirmado
  usuario_normal
  deletar_usuario
  criar_nova_conta
  visit '/users/sign_out'
end

def criar_usuario
  usuario_normal
  deletar_usuario
  @usuario = FactoryGirl.create(:usuario, email: @visitante[:email])
end

def deletar_usuario
  @usuario ||= Usuario.first conditions: {:email => @visitante[:email]}
  @usuario.destroy unless @usuario.nil?
end

def criar_nova_conta
  delete_user
  visit '/usuarios/criar'
  fill_in "Name", :with => @visitante[:name]
  fill_in "Email", :with => @visitante[:email]
  fill_in "Password", :with => @visitante[:password]
  fill_in "Password confirmation", :with => @visitante[:password_confirmation]
  click_button "Sign up"
  find_user
end

def entrar
  visit '/usuarios/entrar'
  fill_in "Email", :with => @visitante[:email]
  fill_in "Password", :with => @visitante[:password]
  click_button "Sign in"
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitante = @visitante.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitante = @visitante.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitante = @visitante.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitante = @visitante.merge(:password_confirmation => "please123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitante = @visitante.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitante = @visitante.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "Current password", :with => @visitante[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end
