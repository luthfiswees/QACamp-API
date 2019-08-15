Given("I want to get user with in {string}") do |url|
    @url = url
end

And("I want to fetch user data with id {string}") do |id|
    @resp = Faraday.get "#{@url}/#{id}"
    @content = JSON.parse(@resp.body)
end

Then("I should get user with id {string}") do |id|
    expect(@content['id']).to eq id.to_i
end

And("I should get user with name {string}") do |name|
    expect(@content['name']).to eq name
end

And("I should get user with username {string}") do |username|
  expect(@content['username']).to eq username
end

And("I should get user address with street {string}") do |street|
  expect(@content['address']['street']).to eq street
end

And("I should get user address with geo lat {string}") do |lat|
  expect(@content['address']['geo']['lat'].to_f).to eq lat.to_f
end

And("Show me the response") do
  puts @content
end

And("Response status should be {string}") do |status|
  expect(@resp.status).to eq(status.to_i)
end
