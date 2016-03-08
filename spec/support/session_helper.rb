module SessionHelper
  def retrieve_headers(user_type)
    user = FactoryGirl.create(user_type)
    post "/api/v1/users/sign_in", user: {email: user.email, password: "1234567890"}
    expect(response.status).to eq 200
    {"X-USER-TOKEN": JSON.parse(response.body)["authentication_token"], "X-USER-EMAIL": user.email}
  end
end